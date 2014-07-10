package com.baosight.pm.web.project;

import com.baosight.pm.entity.MDocument;
import com.baosight.pm.entity.Project;
import com.baosight.pm.entity.User;
import com.baosight.pm.service.MDocumentService;
import com.baosight.pm.service.account.AccountService;
import com.baosight.pm.service.account.ShiroDbRealm;
import com.baosight.pm.service.project.ProjectService;
import com.baosight.pm.service.task.TaskService;
import org.apache.shiro.SecurityUtils;
import org.pegdown.Extensions;
import org.pegdown.PegDownProcessor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * User: Juchen
 * Date: 14-5-7
 * Time: 13:14
 */
@Controller
@RequestMapping (value = "/documents")
public class DocumentsController {

    private static final int PAGE_SIZE = 12;

    @Autowired
    private ProjectService projectService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private MDocumentService documentService;
    @Autowired
    private TaskService taskService;

    @RequestMapping (value = "list/{projectId}")
    public String list(@RequestParam(value = "page", defaultValue = "1") int pageNumber,
                       @PathVariable (value = "projectId") String projectId,
                       Model model){
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        if (user != null){
            Page<MDocument> documentPage = documentService.documentPage(pageNumber, PAGE_SIZE, projectId);
            model.addAttribute("documentPage", documentPage);
            model.addAttribute("projectId", projectId);
            model.addAttribute("taskList", taskService.listByProject(projectId));
            return "document/documentsList";
        } else{
            return "account/login";
        }
    }

    @RequestMapping (value = "createForm/{projectId}")
    public String createDocument(@PathVariable (value = "projectId") String projectId,
                                 Model model){
        model.addAttribute("projectId", projectId);
        model.addAttribute("taskList", taskService.listByProject(projectId));
        return "document/documentsForm";
    }

    @RequestMapping (value = "createRichText/{projectId}")
    public String createRichText(@PathVariable (value = "projectId") String projectId,
                                 Model model){
        model.addAttribute("projectId", projectId);
        model.addAttribute("taskList", taskService.listByProject(projectId));
        return "document/richTextForm";
    }

    @RequestMapping (value = "create/{projectId}", method = RequestMethod.POST)
    public String create(@Valid MDocument document,
                         @PathVariable (value = "projectId") String projectId,
                         RedirectAttributes redirectAttributes,
                         Model model){
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        if (user != null){
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String createTime = simpleDateFormat.format(date);
            User author = accountService.getUser(user.id);
            Project project = projectService.findWithId(projectId);
            document.setAuthor(author);
            document.setCreateTime(createTime);
            document.setProject(project);
            documentService.save(document);
            redirectAttributes.addFlashAttribute("message", "文档添加成功");

            Page<MDocument> documentPage = documentService.documentPage(1, PAGE_SIZE, projectId);
            model.addAttribute("documentPage", documentPage);
            model.addAttribute("projectId", projectId);
            model.addAttribute("taskList", taskService.listByProject(projectId));
            return "redirect:/documents/list/"+projectId;
        } else{
            return "account/login";
        }
    }

    @RequestMapping (value = "/details/{projectId}/{id}")
    public String details(@PathVariable (value = "projectId") String projectId,
                          @PathVariable (value = "id") String id,
                          Model model, RedirectAttributes redirectAttributes){
        MDocument document = documentService.findOne(id);
        if (document != null){
            model.addAttribute("document", document);
            model.addAttribute("projectId", projectId);
            model.addAttribute("taskList", taskService.listByProject(projectId));
            return "document/documentDetails";
        } else {
            redirectAttributes.addFlashAttribute("message", "文档不存在，可能已被删除。");
            return "error/404";
        }
    }

    @RequestMapping (value = "update/{id}")
    public String updateForm(@PathVariable (value = "id") String id, Model model){
        model.addAttribute("document", documentService.findOne(id));
        return "document/updateForm";
    }

    @RequestMapping (value = "updateRichText/{id}")
    public String updateRichText(@PathVariable (value = "id") String id, Model model){
        model.addAttribute("document", documentService.findOne(id));
        return "document/updateRichTextForm";
    }

    @RequestMapping (value = "update")
    public String update(@Valid @ModelAttribute("document") MDocument document){
        documentService.save(document);
        return "redirect:/documents/details/"+document.getProject().getId()+"/"+document.getId();
    }

    @ModelAttribute
    public void getDocument(@RequestParam (value = "documentId", required = false) String documentId, Model model){
        if (null != documentId){
            model.addAttribute("document", documentService.findOne(documentId));
        }
    }

    public static void main(String[] args){
        PegDownProcessor pegDownProcessor = new PegDownProcessor(Extensions.TABLES);

        String markdownStr = ":-----|-----:|----|:---:\n" +
                "Cool  | Shit | in | here";

        String result = pegDownProcessor.markdownToHtml(markdownStr);
        System.out.println(result);
    }
}

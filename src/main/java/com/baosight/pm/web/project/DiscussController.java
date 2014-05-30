package com.baosight.pm.web.project;

import com.baosight.pm.entity.Attachment;
import com.baosight.pm.entity.Discuss;
import com.baosight.pm.entity.Project;
import com.baosight.pm.entity.User;
import com.baosight.pm.service.account.AccountService;
import com.baosight.pm.service.account.ShiroDbRealm;
import com.baosight.pm.service.attachment.AttachmentService;
import com.baosight.pm.service.discuss.DiscussService;
import com.baosight.pm.service.project.ProjectService;
import com.baosight.pm.utility.HandlerUpload;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

/**
 * User: Juchen
 * Date: 14-5-5
 * Time: 11:31
 */
@Controller
@RequestMapping (value = "/discuss")
public class DiscussController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private DiscussService discussService;
    @Autowired
    private AttachmentService attachmentService;

    @RequestMapping (value = "index/{projectId}")
    public String index(@PathVariable (value = "projectId") String projectId,
                        Model model){
        model.addAttribute("projectId", projectId);
        return "discuss/discussForm";
    }

    @RequestMapping (value = "upload")
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile[] files,
                         HttpServletRequest request){
        Map<String, String> fileNameAndPathMap = null;
        HandlerUpload handlerUpload = new HandlerUpload();
        for (MultipartFile file : files){
            fileNameAndPathMap = handlerUpload.uploadFile(file,request);
        }
        return  fileNameAndPathMap.get("filePath")+fileNameAndPathMap.get("fileName");
    }

    @RequestMapping (value = "c/{projectId}", method = RequestMethod.POST)
    public String create(@RequestParam(value = "fileName", required = false) String[] fileName,
                         @Valid Discuss discuss,
                         @PathVariable (value = "projectId") String projectId){
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        if (user != null){
            Date date = new Date();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String createTime = simpleDateFormat.format(date);
            discuss.setCreateTime(createTime);
            User author = accountService.getUser(user.id);
            discuss.setAuthor(author);
            Project project = projectService.findWithId(projectId);
            discuss.setProject(project);
            discussService.save(discuss);
            String path, name, fileType;
            Attachment attachment;
            for (String str : fileName){
                path = str.substring(0, str.lastIndexOf("/"));
                name = str.substring(str.lastIndexOf("/"), str.length());
                fileType = str.substring(str.indexOf("."), str.length());
                attachment = new Attachment();
                attachment.setFilePath(path);
                attachment.setFileName(name);
                attachment.setCreateTime(createTime);
                attachment.setFileType(fileType);
                attachment.setDiscuss(discuss);
                attachmentService.save(attachment);
            }
            return "discuss/discussForm";
        } else {
            return "account/login";
        }

    }
}

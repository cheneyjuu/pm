package com.baosight.pm.web.project;

import com.baosight.pm.entity.Project;
import com.baosight.pm.entity.ProjectUser;
import com.baosight.pm.entity.User;
import com.baosight.pm.service.account.AccountService;
import com.baosight.pm.service.account.ShiroDbRealm;
import com.baosight.pm.service.project.ProjectService;
import com.baosight.pm.service.project.ProjectUserService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * User: Juchen
 * Date: 14-5-4
 * Time: 9:58
 */
@Controller
@RequestMapping (value = "/project")
public class ProjectController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private ProjectService projectService;
    @Autowired
    private ProjectUserService projectUserService;

    @RequestMapping (value = "list", method = RequestMethod.GET)
    public String list(Model model){
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        if (user != null){
            List<ProjectUser> projectUserList = projectUserService.listWithUser(user.id);
            model.addAttribute("projectUserList", projectUserList);
            return "project/projectList";
        } else {
            return "account/login";
        }
    }

    @RequestMapping (value = "index/{projectId}", method = RequestMethod.GET)
    public String index(@PathVariable(value = "projectId") String projectId, Model model){
        Project project = projectService.findWithId(projectId);
        model.addAttribute("project", project);
        return "project/projectIndex";
    }

    @RequestMapping (value = "cf")
    public String createForm(Model model){
        List<User> userList = accountService.getAllUser();
        model.addAttribute("userList", userList);
        return "project/projectForm";
    }

    @RequestMapping (value = "c", method = RequestMethod.POST)
    public String create(@Valid Project project,
                         @RequestParam("userId") String userId,
                         RedirectAttributes redirectAttributes){
        String[] userIdList = userId.split(",");
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = simpleDateFormat.format(date);
        Set<ProjectUser> projectUserSet = new HashSet<ProjectUser>();
        project.setCreateTime(createTime);
        projectService.save(project);

        ProjectUser projectUser;
        for (int i=0; i<userIdList.length; i++){
            projectUser = new ProjectUser();
            projectUser.setUser(accountService.getUser(new Long(userIdList[i])));
            projectUser.setProject(project);
            projectUserSet.add(projectUser);
            projectUserService.save(projectUserSet);
        }
        redirectAttributes.addFlashAttribute("message", "项目创建成功");
        return "redirect:/project/index/"+project.getId();
    }
}

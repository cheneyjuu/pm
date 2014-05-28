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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

        List<Project> projectList = projectService.listWithUser(user.id);
        model.addAttribute("projectList", projectList);
        return "project/projectList";
    }

    @RequestMapping (value = "index", method = RequestMethod.GET)
    public String index(){
        return "project/projectIndex";
    }

    @RequestMapping (value = "cf")
    public String createForm(Model model){
        List<User> userList = accountService.getAllUser();
        model.addAttribute("userList", userList);
        return "project/projectForm";
    }

    @RequestMapping (value = "c", method = RequestMethod.POST)
    public String create(@Valid Project project, @RequestParam("userId") String userId){
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

        return "project/projectForm";
    }
}

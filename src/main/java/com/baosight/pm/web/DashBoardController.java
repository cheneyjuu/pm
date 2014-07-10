package com.baosight.pm.web;

import com.baosight.pm.entity.Project;
import com.baosight.pm.entity.ProjectUser;
import com.baosight.pm.entity.Task;
import com.baosight.pm.entity.User;
import com.baosight.pm.service.account.AccountService;
import com.baosight.pm.service.account.ShiroDbRealm;
import com.baosight.pm.service.project.ProjectService;
import com.baosight.pm.service.project.ProjectUserService;
import com.baosight.pm.service.task.TaskService;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.ArrayList;
import java.util.List;

/**
 * User: Juchen
 * Date: 14-7-8
 * Time: 20:22
 */
@Controller
@RequestMapping (value = "/dash")
public class DashBoardController {

    @Autowired
    private ProjectUserService projectUserService;


    @RequestMapping (method = RequestMethod.GET)
    public String dash(Model model){
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        if (user != null){
            List<ProjectUser> projectUserList = projectUserService.listWithUser(user.id);
            model.addAttribute("projectUserList", projectUserList);
            return "dash/dashBoard";
        } else {
            return "account/login";
        }
    }
}

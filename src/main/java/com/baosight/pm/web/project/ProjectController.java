package com.baosight.pm.web.project;

import com.baosight.pm.entity.User;
import com.baosight.pm.service.account.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

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

    @RequestMapping (value = "list", method = RequestMethod.GET)
    public String list(){
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
}

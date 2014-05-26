package com.baosight.pm.web.project;

import com.baosight.pm.entity.Project;
import com.baosight.pm.entity.User;
import com.baosight.pm.service.account.AccountService;
import com.baosight.pm.service.project.ProjectService;
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

    @RequestMapping (value = "c", method = RequestMethod.POST)
    public String create(@Valid Project project, @RequestParam("userId") String userId){
        String[] userIdList = userId.split(",");
        Date date = new Date();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String createTime = simpleDateFormat.format(date);
        Set<User> userSet = new HashSet<User>();
        for (int i=0; i<userIdList.length; i++){
            userSet.add(accountService.getUser(new Long(userIdList[i])));
        }
        project.setCreateTime(createTime);
        project.setUsers(userSet);
//        String id = UUID.randomUUID().toString().replace("-","");
        Long id = new Random(200).nextLong();
        project.setId(id);
        projectService.save(project);
        return "project/projectForm";
    }
}

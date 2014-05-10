package com.baosight.pm.web.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * User: Juchen
 * Date: 14-5-4
 * Time: 9:58
 */
@Controller
@RequestMapping (value = "/project")
public class ProjectController {

    @RequestMapping (value = "list", method = RequestMethod.GET)
    public String list(){
        return "project/projectList";
    }

    @RequestMapping (value = "index", method = RequestMethod.GET)
    public String index(){
        return "project/projectIndex";
    }
}

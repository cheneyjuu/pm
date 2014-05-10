package com.baosight.pm.web.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Chen on 2014/5/5.
 */
@Controller
@RequestMapping (value = "/todolists")
public class TodoLists {

    @RequestMapping (value = "index")
    public String index(){
        return "project/todolistsIndex";
    }
}

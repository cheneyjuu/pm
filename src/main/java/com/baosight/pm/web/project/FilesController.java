package com.baosight.pm.web.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Chen on 2014/5/6.
 */
@Controller
@RequestMapping (value = "/files")
public class FilesController {

    @RequestMapping (value = "index")
    public String index(){
        return "projectFile/filesIndex";
    }
}

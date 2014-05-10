package com.baosight.pm.web.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * User: Juchen
 * Date: 14-5-5
 * Time: 11:31
 */
@Controller
@RequestMapping (value = "/discuss")
public class DiscussController {

    @RequestMapping (value = "index")
    public String index(){
        return "project/discussForm";
    }
}

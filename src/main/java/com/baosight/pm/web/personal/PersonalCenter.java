package com.baosight.pm.web.personal;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by 臣 on 2014/5/15.
 */
@Controller
@RequestMapping (value = "/p")
public class PersonalCenter {
    @RequestMapping(value = "index")
    public String index(){
        return "person/personalCenter";
    }
}

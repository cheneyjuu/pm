package com.baosight.pm.web.person;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * User: Juchen
 * Date: 14-5-15
 * Time: 9:45
 */
@Controller
@RequestMapping (value = "/p")
public class PersonalCenter {

    @RequestMapping (value = "index")
    public String index(){
        return "person/personalCenter";
    }
}

package com.baosight.pm.web.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * User: Juchen
 * Date: 14-5-7
 * Time: 13:14
 */
@Controller
@RequestMapping (value = "/documents")
public class DocumentsController {

    @RequestMapping (value = "list")
    public String list(){
        return "project/documentsList";
    }

    @RequestMapping (value = "create")
    public String createDocument(){
        return "project/documentsForm";
    }

    @RequestMapping (value = "details")
    public String details(){
        return "project/documentDetails";
    }
}

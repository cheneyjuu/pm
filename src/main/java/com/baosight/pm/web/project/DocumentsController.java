package com.baosight.pm.web.project;

import org.pegdown.Extensions;
import org.pegdown.PegDownProcessor;
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
        return "document/documentsList";
    }

    @RequestMapping (value = "create")
    public String createDocument(){
        return "document/documentsForm";
    }

    @RequestMapping (value = "details")
    public String details(){
        return "document/documentDetails";
    }

    public static void main(String[] args){
        PegDownProcessor pegDownProcessor = new PegDownProcessor(Extensions.TABLES);

        String markdownStr = ":-----|-----:|----|:---:\n" +
                "Cool  | Shit | in | here";

        String result = pegDownProcessor.markdownToHtml(markdownStr);
        System.out.println(result);
    }
}

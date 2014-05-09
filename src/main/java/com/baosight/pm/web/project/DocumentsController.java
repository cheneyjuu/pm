package com.baosight.pm.web.project;

import org.pegdown.Extensions;
import org.pegdown.Parser;
import org.pegdown.PegDownProcessor;
import org.pegdown.ast.RootNode;
import org.pegdown.plugins.PegDownPlugins;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import java.io.*;

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

    public static void main(String[] args){
        PegDownProcessor pegDownProcessor = new PegDownProcessor(Extensions.TABLES);

        String markdownStr = ":-----|-----:|----|:---:\n" +
                "Cool  | Shit | in | here";

        String result = pegDownProcessor.markdownToHtml(markdownStr);
        System.out.println(result);
    }
}

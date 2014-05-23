package com.baosight.pm.web.project;

import org.pegdown.Extensions;
import org.pegdown.PegDownProcessor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Administrator on 2014/5/9.
 */
@Controller
@RequestMapping (value = "/markdown")
public class MarkdownController {

    @RequestMapping (value = "index")
    public String index(){
        return "document/markdown";
    }

    @ResponseBody
    @RequestMapping (value = "convert")
    public String markdown(@RequestParam("str") String str){
        PegDownProcessor pegDownProcessor = new PegDownProcessor(Extensions.TABLES);
        String result = pegDownProcessor.markdownToHtml(str);
        return result;
    }
}

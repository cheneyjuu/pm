package com.baosight.pm.web.project;

import com.baosight.pm.utility.HandlerUpload;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.util.Map;

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
        return "discuss/discussForm";
    }

    @RequestMapping (value = "/upload")
    @ResponseBody
    public String upload(@RequestParam("file") MultipartFile[] files,
                         HttpServletRequest request, Model model){
        Map<String, String> fileNameAndPathMap = null;
        HandlerUpload handlerUpload = new HandlerUpload();
        for (MultipartFile file : files){
            fileNameAndPathMap = handlerUpload.uploadFile(file,request);
        }
        return  fileNameAndPathMap.get("filePath")+fileNameAndPathMap.get("fileName");
    }
}

package com.ng.daily.server.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by fangs on 15/2/1.
 */
@Controller
@RequestMapping(value = "/demo/pages")
public class DemoController {

    @RequestMapping(method = RequestMethod.GET)
    public String defaultPage() {
        return "demo/pages/index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "demo/pages/index";
    }

    @RequestMapping(value = "/flot", method = RequestMethod.GET)
    public String flot() {
        return "demo/pages/flot";
    }

    @RequestMapping(value = "/morris", method = RequestMethod.GET)
    public String morris() {
        return "demo/pages/morris";
    }

    @RequestMapping(value = "/tables", method = RequestMethod.GET)
    public String tables() {
        return "demo/pages/tables";
    }

    @RequestMapping(value = "/forms", method = RequestMethod.GET)
    public String forms() {
        return "demo/pages/forms";
    }

    @RequestMapping(value = "/panels-wells", method = RequestMethod.GET)
    public String panelsWells() {
        return "demo/pages/panels-wells";
    }

    @RequestMapping(value = "/buttons", method = RequestMethod.GET)
    public String buttons() {
        return "demo/pages/buttons";
    }

    @RequestMapping(value = "/notifications", method = RequestMethod.GET)
    public String notifications() {
        return "demo/pages/notifications";
    }

    @RequestMapping(value = "/typography", method = RequestMethod.GET)
    public String typography() {
        return "demo/pages/typography";
    }

    @RequestMapping(value = "/icons", method = RequestMethod.GET)
    public String icons() {
        return "demo/pages/icons";
    }

    @RequestMapping(value = "/grid", method = RequestMethod.GET)
    public String grid() {
        return "demo/pages/grid";
    }

    @RequestMapping(value = "/blank", method = RequestMethod.GET)
    public String blank() {
        return "demo/pages/blank";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "demo/pages/login";
    }

    @RequestMapping(value = "/webuploader", method = RequestMethod.GET)
    public String webuploader() {
        return "demo/pages/webuploader";
    }


    @RequestMapping(value = "/webuploader/upload", method = RequestMethod.POST)
    @ResponseBody
    public String webuploaderUpload(MultipartFile file) {
        String fileName = file.getName();
        System.out.println(fileName);
        return "true";
    }

    @RequestMapping(value = "/ueditor", method = RequestMethod.GET)
    public String ueditor() {
        return "demo/pages/ueditor";
    }


    @RequestMapping(value = "/ueditorPost", method = RequestMethod.POST)
    public String ueditorPost(HttpServletRequest request, HttpServletResponse response) {

        Map<String, String[]> params = request.getParameterMap();
        for (String s : params.keySet()) {
            System.out.println(s);
            System.out.println(params.get(s));
        }

        String[] values = request.getParameterValues("editorValue");
        for (String v : values) {
            System.out.println(v);
        }

        return "demo/pages/ueditor";
    }

//    uploadimage：//执行上传图片或截图的action名称
//    uploadscrawl：//执行上传涂鸦的action名称
//    uploadvideo：//执行上传视频的action名称
//    uploadfile：//controller里,执行上传视频的action名称
//    catchimage：//执行抓取远程图片的action名称
//    listimage：//执行列出图片的action名称
//    listfile：//执行列出文件的action名称

}

package com.ng.daily.server.admin.controller.pages;

import com.ng.daily.server.admin.base.BaseAdminController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Map;

/**
 * Created by fangs on 15/2/3.
 */
@Controller
@RequestMapping(value = "/admin/pages")
public class UEditorController extends BaseAdminController {


    @RequestMapping(value = "/ueditor", method = RequestMethod.GET)
    public String ueditor() {
        return "admin/pages/ueditor";
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

        return "admin/pages/ueditor";

    }

    @RequestMapping(value = "/umeditor", method = RequestMethod.GET)
    public String umeditor() {
        return "admin/pages/umeditor";
    }

    @RequestMapping(value = "/umeditorPost", method = RequestMethod.POST)
    public String umeditorPost(HttpServletRequest request, HttpServletResponse response) {

        Map<String, String[]> params = request.getParameterMap();
        for (String s : params.keySet()) {
            System.out.println(s);
            System.out.println(params.get(s));
        }

        return "admin/pages/umeditor";

    }

//    uploadimage：//执行上传图片或截图的action名称
//    uploadscrawl：//执行上传涂鸦的action名称
//    uploadvideo：//执行上传视频的action名称
//    uploadfile：//controller里,执行上传视频的action名称
//    catchimage：//执行抓取远程图片的action名称
//    listimage：//执行列出图片的action名称
//    listfile：//执行列出文件的action名称

}

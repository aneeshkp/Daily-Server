package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/fragment")
public class FragmentController extends BaseAdminController {

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/edit_fragment";
    }

    // 图片 简短文字

    @RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public String add() {

        return "";

    }


}

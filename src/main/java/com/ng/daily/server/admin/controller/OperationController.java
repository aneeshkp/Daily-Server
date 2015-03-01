package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/operation")
public class OperationController extends BaseAdminController {

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/operation";
    }

    // 用户数 微信 微博 友盟 分享..
}

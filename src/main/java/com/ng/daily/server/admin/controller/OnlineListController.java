package com.ng.daily.server.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/onlinelist")
public class OnlineListController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/onlinelist";
    }

    // 查看 ( 撤回? 编辑? )

}

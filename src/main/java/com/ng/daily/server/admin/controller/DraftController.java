package com.ng.daily.server.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/draft")
public class DraftController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/draft";
    }

    // 编辑 提交发布 废弃
    

}

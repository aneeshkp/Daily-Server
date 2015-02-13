package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/postqueue")
public class PostQueueController extends BaseAdminController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/postqueue";
    }

    // 按时间排序 调整定时发布时间 立刻发布 转到草稿箱 调整顺序 预发布(开发者DEBUG) 废弃

}

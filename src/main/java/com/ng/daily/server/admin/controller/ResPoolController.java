package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 资源池
 * <p/>
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/respool")
public class ResPoolController extends BaseAdminController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/respool";
    }

    //链接 文字 图片 来源 时间 已使用/废弃 评分 备注

}

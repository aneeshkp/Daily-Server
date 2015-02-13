package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/admin/api")
public class ApiListController extends BaseAdminController {

    @RequestMapping(method = RequestMethod.GET)
    public String list() {
        return "admin/api/list";
    }


}

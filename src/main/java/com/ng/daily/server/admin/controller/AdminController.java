package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by fangs on 15/2/14.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController extends BaseAdminController {


    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/summary";
    }


    @RequestMapping(value = "/summary", method = RequestMethod.GET)
    public String summary() {
        return "admin/summary";
    }


}

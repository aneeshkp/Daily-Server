package com.ng.daily.server.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by fangs on 15/2/14.
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {


    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/main";
    }


    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main() {
        return "admin/main";
    }


}

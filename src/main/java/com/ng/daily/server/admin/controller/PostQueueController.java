package com.ng.daily.server.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/postqueue")
public class PostQueueController {
    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/postqueue";
    }

}

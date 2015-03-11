package com.ng.daily.server.admin.controller.demo;

import com.ng.daily.server.admin.controller.AdminController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by fangs on 15/3/1.
 */

@Controller
@RequestMapping(value = "/admin/fancybox")
public class FancyBoxController extends AdminController {


    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "/demo/fancybox/fancybox";
    }


}

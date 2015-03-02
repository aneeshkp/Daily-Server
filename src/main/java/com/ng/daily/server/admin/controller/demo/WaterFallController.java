package com.ng.daily.server.admin.controller.demo;

import com.ng.daily.server.admin.controller.AdminController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by fangs on 15/3/1.
 */

@Controller
@RequestMapping(value = "/admin/waterfall")
public class WaterFallController extends AdminController {


    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "/demo/waterfall/examples/main";
    }


    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main() {
        return "/demo/waterfall/examples/main";
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete() {
        return "/demo/waterfall/examples/delete";
    }


    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String order() {
        return "/demo/waterfall/examples/order";
    }


    @RequestMapping(value = "/recycledemo1", method = RequestMethod.GET)
    public String recycledemo1() {
        return "/demo/waterfall/examples/recycledemo1";
    }

    @RequestMapping(value = "/recycledemo2", method = RequestMethod.GET)
    public String recycledemo2() {
        return "/demo/waterfall/examples/recycledemo2";
    }


    @RequestMapping(value = "/recyclefinal", method = RequestMethod.GET)
    public String recyclefinal() {
        return "/demo/waterfall/examples/recyclefinal";
    }


    @RequestMapping(value = "/messup", method = RequestMethod.GET)
    public String messup() {
        return "/demo/waterfall/examples/messup";
    }


    @RequestMapping(value = "/reinstall", method = RequestMethod.GET)
    public String reinstall() {
        return "/demo/waterfall/examples/reinstall";
    }


    @RequestMapping(value = "/mobile", method = RequestMethod.GET)
    public String mobile() {
        return "/demo/waterfall/examples/mobile";
    }


    @RequestMapping(value = "/fixedw", method = RequestMethod.GET)
    public String fixedw() {
        return "/demo/waterfall/examples/fixedw";
    }


    @RequestMapping(value = "/norequest", method = RequestMethod.GET)
    public String norequest() {
        return "/demo/waterfall/examples/norequest";
    }


    @RequestMapping(value = "/specialcol", method = RequestMethod.GET)
    public String specialcol() {
        return "/demo/waterfall/examples/specialcol";
    }


    @RequestMapping(value = "/sinkleft", method = RequestMethod.GET)
    public String sinkleft() {
        return "/demo/waterfall/examples/sinkleft";
    }


}

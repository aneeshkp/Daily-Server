package com.ng.daily.server.admin.controller;

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
        return "/admin/waterfall/examples/main";
    }


    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String main() {
        return "/admin/waterfall/examples/main";
    }


    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete() {
        return "/admin/waterfall/examples/delete";
    }


    @RequestMapping(value = "/order", method = RequestMethod.GET)
    public String order() {
        return "/admin/waterfall/examples/order";
    }


    @RequestMapping(value = "/recycledemo1", method = RequestMethod.GET)
    public String recycledemo1() {
        return "/admin/waterfall/examples/recycledemo1";
    }

    @RequestMapping(value = "/recycledemo2", method = RequestMethod.GET)
    public String recycledemo2() {
        return "/admin/waterfall/examples/recycledemo2";
    }


    @RequestMapping(value = "/recyclefinal", method = RequestMethod.GET)
    public String recyclefinal() {
        return "/admin/waterfall/examples/recyclefinal";
    }


    @RequestMapping(value = "/messup", method = RequestMethod.GET)
    public String messup() {
        return "/admin/waterfall/examples/messup";
    }


    @RequestMapping(value = "/reinstall", method = RequestMethod.GET)
    public String reinstall() {
        return "/admin/waterfall/examples/reinstall";
    }


    @RequestMapping(value = "/mobile", method = RequestMethod.GET)
    public String mobile() {
        return "/admin/waterfall/examples/mobile";
    }


    @RequestMapping(value = "/fixedw", method = RequestMethod.GET)
    public String fixedw() {
        return "/admin/waterfall/examples/fixedw";
    }


    @RequestMapping(value = "/norequest", method = RequestMethod.GET)
    public String norequest() {
        return "/admin/waterfall/examples/norequest";
    }


    @RequestMapping(value = "/specialcol", method = RequestMethod.GET)
    public String specialcol() {
        return "/admin/waterfall/examples/specialcol";
    }


    @RequestMapping(value = "/sinkleft", method = RequestMethod.GET)
    public String sinkleft() {
        return "/admin/waterfall/examples/sinkleft";
    }


}

package com.ng.daily.server.site.controller;

import com.ng.daily.server.site.base.BaseSiteController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 网站
 *
 * Created by fangs on 15/2/1.
 */
@Controller
@RequestMapping(value = "/site")
public class SiteController extends BaseSiteController {


    @RequestMapping(method = RequestMethod.GET)
    public String about() {
        return "site/about";
    }

}

package com.ng.daily.server.site.controller;

import com.ng.daily.server.site.base.BaseSiteController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 网站
 * <p/>
 * Created by fangs on 15/2/1.
 */
@Controller
@RequestMapping(value = "/site")
public class SiteController extends BaseSiteController {

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public String index() {
        return "site/pure";
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about() {
        return "site/about";
    }

    @RequestMapping(value = "/pure", method = RequestMethod.GET)
    public String pure() {
        return "site/pure";
    }

}

package com.ng.daily.server.site.controller;

import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.post.PostService;
import com.ng.daily.server.site.base.BaseSiteController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 网站
 * <p/>
 * Created by fangs on 15/2/1.
 */
@Controller
@RequestMapping(value = "/site")
public class SiteController extends BaseSiteController {

    private static final Logger logger = LoggerFactory.getLogger(SiteController.class);

    @Autowired
    private PostService postService;

    @RequestMapping(value = {"", "/"}, method = RequestMethod.GET)
    public ModelAndView index() {
        return pure();
    }

    @RequestMapping(value = "/about", method = RequestMethod.GET)
    public String about() {
        return "site/about";
    }

    @RequestMapping(value = "/pure", method = RequestMethod.GET)
    public ModelAndView pure() {

        logger.debug("pure......");


        ModelAndView mv = new ModelAndView();
        List<Post> postList = postService.listOnlinePosts();


        mv.addObject("postList", postList);

        mv.setViewName("site/pure");
        return mv;
    }

}

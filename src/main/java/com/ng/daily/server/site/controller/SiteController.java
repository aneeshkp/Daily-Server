package com.ng.daily.server.site.controller;

import com.google.common.collect.Maps;
import com.ng.daily.server.common.util.web.Servlets;
import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.post.PostService;
import com.ng.daily.server.site.base.BaseSiteController;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 网站
 * <p/>
 * Created by fangs on 15/2/1.
 */
@Controller
@RequestMapping(value = "/site")
public class SiteController extends BaseSiteController {

    private static final Logger logger = LoggerFactory.getLogger(SiteController.class);

    private static final String PAGE_SIZE = "5";

    @Autowired
    private PostService postService;

    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();

    static {
        sortTypes.put("auto", "自动");
        sortTypes.put("title", "标题");
    }


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


    @RequestMapping(value = "/pure2", method = RequestMethod.GET)
    public ModelAndView list(@RequestParam(value = "page", defaultValue = "0") int pageNumber,
                             @RequestParam(value = "page.size", defaultValue = PAGE_SIZE) int pageSize,
                             @RequestParam(value = "sortType", defaultValue = "auto") String sortType, ModelAndView mv,
                             ServletRequest request) {

        logger.debug("pageNumber {} " ,pageNumber);
        logger.debug("pageSize {}" ,pageSize);
        logger.debug("sortType {}" ,sortType);


        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

        Page<Post> posts = postService.listOnlinePosts(searchParams, pageNumber, pageSize, sortType);

        logger.debug("postList size {}", posts.getSize());

        mv.addObject("posts", posts);

        mv.addObject("sortType", sortType);
        mv.addObject("sortTypes", sortTypes);
        // 将搜索条件编码成字符串，用于排序，分页的URL
        mv.addObject("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        mv.setViewName("site/pure");


        return mv;
    }


//
//    /**
//     * 所有RequestMapping方法调用前的Model准备方法, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出Task对象,再把Form提交的内容绑定到该对象上。
//     * 因为仅update()方法的form中有id属性，因此仅在update时实际执行.
//     */
//    @ModelAttribute
//    public void getTask(@RequestParam(value = "id", defaultValue = "-1") Long id, Model model) {
//        if (id != -1) {
//            model.addAttribute("task", taskService.getTask(id));
//        }
//    }
//
//    /**
//     * 取出Shiro中的当前用户Id.
//     */
//    private Long getCurrentUserId() {
//        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
//        return user.id;
//    }

}

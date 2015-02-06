package com.ng.daily.server.api.controller;

import com.ng.daily.server.api.base.ApiController;
import com.ng.daily.server.api.base.ApiResponse;
import com.ng.daily.server.admin.entity.Article;
import com.ng.daily.server.common.service.article.ArticleService;
import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by fangs on 15/1/27.
 */
@Controller
@RequestMapping(value = "/api/v1/article")
public class ArticleController extends ApiController {

    private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

    @Autowired
    private ArticleService articleService;

    @Autowired
    private Cache ehCache;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    public ApiResponse list() {

        logger.debug("article list .....");

        Page<Article> list = articleService.listAll();

        ehCache.put(new Element("k", "v"));

        return success(list);
    }

}

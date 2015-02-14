package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import com.ng.daily.server.common.datatables.PageEntity;
import com.ng.daily.server.common.datatables.annotation.DatatablesParams;
import com.ng.daily.server.common.datatables.request.DatatablesMetadata;
import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.entity.Article;
import com.ng.daily.server.service.article.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/draft")
public class DraftController extends BaseAdminController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {

//        for(int i = 0 ; i < 200; i ++) {
//            Article article = new Article();
//            article.setId(IDGenerator.getArticleId());
//            article.setContent("内容内容" + 1);
//            article.setTitle("中文中文" + i);
//            article.setCreateAt(DateTime.now().toDate());
//            article.setCreateBy("admin");
//            article.setSource("测试");
//
//            articleService.saveArticle(article);
//        }

        return "admin/draft";
    }

    // 编辑 提交发布 废弃

    @RequestMapping(value = "list", method = RequestMethod.GET,  produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public PageEntity<Article> list(@DatatablesParams DatatablesMetadata metadata) {
        Page<Article> page = articleService.findAll(metadata.getCurrentPageIndex(), metadata.getLength(), metadata.getSearch());

        return new PageEntity<>(metadata.getDraw(), page.getNumberOfElements(), page.getTotalElements(), page.getContent());
    }



    @RequestMapping(value = "editor", produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object editor(HttpServletRequest request, HttpServletResponse response) {

        // action:
        // create
        // remove
        // edit

        return "";
    }

}

package com.ng.daily.server.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/article")
public class ArticleController {

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/edit_article";
    }


    // 内容 标题 题图 分类/标签 创建人 创建时间 最后修改人 最后修改时间 发布人 发布时间  来源  推荐度(决定展示优先级)


}

package com.ng.daily.server.common.service.article;

import com.ng.daily.server.admin.entity.Article;
import com.ng.daily.server.admin.repository.article.ArticleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Component;

/**
 * Created by fangs on 15/1/27.
 */
@Component
public class ArticleService {

    @Autowired
    private ArticleRepository articleRepository;

    public Page<Article> listAll() {
        return articleRepository.findAll(new PageRequest(0, Integer.MAX_VALUE));
    }

}

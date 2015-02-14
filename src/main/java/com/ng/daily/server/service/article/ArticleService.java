package com.ng.daily.server.service.article;

import com.ng.daily.server.entity.Article;
import com.ng.daily.server.repository.article.ArticleRepository;
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

    public void saveArticle(Article article) {
        articleRepository.save(article);
    }

    public Page<Article> listAll() {
        return articleRepository.findAll(new PageRequest(0, Integer.MAX_VALUE));


    }

    public Page<Article> findAll(int currentPageIndex, int length, String search) {
//        ArticlePredicate.searchTerm(search),
        return articleRepository.findAll( new PageRequest(currentPageIndex, length));
    }

}

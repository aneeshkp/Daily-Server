package com.ng.daily.server.admin.repository.article;

import com.ng.daily.server.admin.entity.Article;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by fangs on 15/1/9.
 */
public interface ArticleRepository extends PagingAndSortingRepository<Article, String>, ArticleRepositoryCustom {

    public Article findByAuthor(String author);

}

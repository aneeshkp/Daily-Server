package com.ng.daily.server.repository.article;

import com.ng.daily.server.entity.Article;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * Created by fangs on 15/1/9.
 */
public interface ArticleRepository extends PagingAndSortingRepository<Article, String>, ArticleRepositoryPlus {

    public Article findByAuthor(String author);

}

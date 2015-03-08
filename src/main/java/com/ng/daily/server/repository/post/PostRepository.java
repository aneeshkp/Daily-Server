package com.ng.daily.server.repository.post;

import com.ng.daily.server.entity.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

/**
 * Created by fangs on 15/1/9.
 */
public interface PostRepository extends PagingAndSortingRepository<Post, String>, PostRepositoryPlus {


    public Page<Post> findByTag(String tag, Pageable page);


    public Page<Post> findByStatus(Integer status, Pageable page);

    public List<Post> findByCrawlerUrl(String url);
}

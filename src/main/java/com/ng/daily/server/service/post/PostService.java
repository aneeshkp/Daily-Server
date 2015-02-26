package com.ng.daily.server.service.post;

import com.ng.daily.server.entity.Post;
import com.ng.daily.server.repository.post.PostRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Component;

/**
 * Created by fangs on 15/1/27.
 */
@Component
public class PostService {

    @Autowired
    private PostRepository postRepository;

    public void savePost(Post post) {
        postRepository.save(post);
    }

    public Post findById(String id) {
        return postRepository.findOne(id);
    }

    public void deleteById(String id) {
        postRepository.delete(id);
    }

    public void updateStatus(String id, Integer status) {
        Post post = postRepository.findOne(id);
        if (post != null) {
            post.setStatus(status);
            postRepository.save(post);
        }
    }

    public Page<Post> listAll() {
        return postRepository.findAll(new PageRequest(0, Integer.MAX_VALUE));
    }

    public Page<Post> findAll(int currentPageIndex, int length, String search) {
//        ArticlePredicate.searchTerm(search),
        return postRepository.findAll(new PageRequest(currentPageIndex, length));
    }

}

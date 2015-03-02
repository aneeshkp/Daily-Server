package com.ng.daily.server.service.post;

import com.ng.daily.server.entity.Post;
import com.ng.daily.server.repository.post.PostRepository;
import org.joda.time.DateTime;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * Created by fangs on 15/1/27.
 */
@Component
public class PostService {

    private static final Logger log = LoggerFactory.getLogger(PostService.class);

    @Autowired
    private PostRepository postRepository;

    @CacheEvict(value = "postCache", key = "#post.id")
    public void savePost(Post post) {
        postRepository.save(post);
    }

    @Cacheable(value = "postCache")
    public Post findById(String id) {
        return postRepository.findOne(id);
    }

    @CacheEvict(value = "postCache")
    public void deleteById(String id) {
        postRepository.delete(id);
    }

    @CacheEvict(value = "postCache")
    public void updateStatusDraft(String id) {
        Post post = postRepository.findOne(id);
        if (post != null) {
            post.setStatus(Post.STATUS_DRAFT);
            postRepository.save(post);
        }
    }

    @CacheEvict(value = "postCache")
    public void updateStatusQueue(String id) {
        Post post = postRepository.findOne(id);
        if (post != null) {
            post.setStatus(Post.STATUS_QUEUE);
            postRepository.save(post);
        }
    }

    @CacheEvict(value = "postCache")
    public void updateStatusOnline(String id) {
        Post post = postRepository.findOne(id);
        if (post != null) {
            post.setStatus(Post.STATUS_ONLINE);
            postRepository.save(post);
        }
    }

    public Page<Post> findByTag(String tag,int page, int size) {
        return postRepository.findByTag(tag, new PageRequest(page, size));
    }

    public Page<Post> findByStatus(Integer status, int page, int size) {
        return postRepository.findByStatus(status, new PageRequest(page, size));
    }

    public Page<Post> listAll() {
        return postRepository.findAll(new PageRequest(0, Integer.MAX_VALUE));
    }

    public Page<Post> findAll(int page, int size, String search) {
//        PostPredicate.searchTerm(search),
        return postRepository.findAll(new PageRequest(page, size));
    }


    public void checkAndDoPost() {

        log.debug("check and Do Post..");

        List<Post> postList = postRepository.findPostToSchedule(DateTime.now().toDate());

        for(Post post : postList) {
            post.setStatus(Post.STATUS_ONLINE);
            post.setPublishAt(DateTime.now().toDate());
            postRepository.save(post);
            log.debug("publish post : " + post.getTitle());
        }

    }

    public List<Post> listQueuedPosts() {
        List<Post> postList = postRepository.findPostQueued();
        return postList;
    }
}

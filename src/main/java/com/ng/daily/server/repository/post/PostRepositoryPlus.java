package com.ng.daily.server.repository.post;

import com.ng.daily.server.entity.Post;

import java.util.Date;
import java.util.List;

/**
 * Created by fangs on 15/1/14.
 */
public interface PostRepositoryPlus {

    public List<Post> findPostToSchedule(Date currentDate);

    public List<Post> findPostQueued();

}

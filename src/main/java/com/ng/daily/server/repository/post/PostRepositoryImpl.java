package com.ng.daily.server.repository.post;

import com.ng.daily.server.entity.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * Created by fangs on 15/1/14.
 */
@Repository
public class PostRepositoryImpl implements PostRepositoryPlus {

    @Autowired
    private MongoTemplate mongoTemplate;

    @Override
    public List<Post> findPostToSchedule(Date currentDate) {
        Query query = new Query();
        query.addCriteria(Criteria.where("publishScheduleAt").lt(currentDate));
        query.addCriteria(Criteria.where("status").is(Post.STATUS_QUEUE));
        return mongoTemplate.find(query, Post.class);
    }

    @Override
    public List<Post> findPostQueued() {
        Query query = new Query();
        query.addCriteria(Criteria.where("status").is(Post.STATUS_QUEUE));
        query.with(new Sort(Sort.Direction.ASC, "publishScheduleAt"));
        return mongoTemplate.find(query, Post.class);
    }


}

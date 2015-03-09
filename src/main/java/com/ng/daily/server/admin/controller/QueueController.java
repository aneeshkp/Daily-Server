package com.ng.daily.server.admin.controller;

import com.google.common.collect.Maps;
import com.ng.daily.server.admin.base.BaseAdminController;
import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.post.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/queue")
public class QueueController extends BaseAdminController {

    @Autowired
    private PostService postService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/queue";
    }

    // 按时间排序 调整定时发布时间 立刻发布 转到草稿箱 调整顺序 预发布(开发者DEBUG) 废弃

    /**
     * 列出队列待发布内容
     *
     * @return
     */
    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object listQueue() {
        List<Post> postList = postService.listQueuedPosts();
        Map result = Maps.newHashMap();
        result.put("list", postList);
        return result;
    }

    /**
     * 修改发布时间
     *
     * @param postId
     * @param publishTime
     * @return
     */
    @RequestMapping(value = "/changePublishTime", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object changePublishTime(@RequestParam(value = "postId") String postId, @RequestParam(value = "publishTime") Long publishTime) {
        Post post = postService.findById(postId);
        post.setPublishAt(new Date(publishTime));
        postService.savePost(post);
        return success();
    }

    /**
     * 列出队列待发布内容
     *
     * @return
     */
    @RequestMapping(value = "/getPublishConfig", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object getPublishConfig() {
        return success();
    }

}

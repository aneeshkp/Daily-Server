package com.ng.daily.server.api.controller;

import com.ng.daily.server.api.base.ApiController;
import com.ng.daily.server.api.base.ApiResponse;
import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.post.PostService;
import net.sf.ehcache.Cache;
import net.sf.ehcache.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by fangs on 15/1/27.
 */
@Controller
@RequestMapping(value = "/api/v1/post")
public class PostApi extends ApiController {

    @Autowired
    private PostService postService;

    @Autowired
    private Cache ehCache;

    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public ApiResponse list() {
        Page<Post> list = postService.listAll();
        ehCache.put(new Element("k", "v"));
        return success(list);
    }


    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public ApiResponse get(@PathVariable("id") String id) {
        Post post = postService.findById(id);
        return success(post);
    }


}

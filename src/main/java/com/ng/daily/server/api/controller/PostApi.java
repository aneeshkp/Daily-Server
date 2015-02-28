package com.ng.daily.server.api.controller;

import com.ng.daily.server.api.base.ApiController;
import com.ng.daily.server.api.base.ApiResponse;
import com.ng.daily.server.api.exception.RestException;
import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.post.PostService;
import net.sf.ehcache.Cache;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.validation.Validator;

/**
 * Created by fangs on 15/1/27.
 */
@Controller
@RequestMapping(value = "/api/v1/post")
public class PostApi extends ApiController {

    @Autowired
    private PostService postService;

    @Autowired
    private Validator validator;

    @Autowired
    private Cache ehCache;

    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public ApiResponse list() {
        Page<Post> list = postService.listAll();
//        ehCache.put(new Element("k", "v"));
        return success(list);
    }


    @RequestMapping(value = "/listByTag", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public ApiResponse listByTag(@RequestParam(value = "tag") String tag,
                                 @RequestParam(value = "page") int page,
                                 @RequestParam(value = "size") int size) {
        Page<Post> list = postService.findByTag(tag, page, size);
        return success(list);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public ApiResponse get(@PathVariable("id") String id) {
        Post post = postService.findById(id);
        if (post == null) {
            String message = "POST不存在(id:" + id + ")";
            log.warn(message);
            throw new RestException(HttpStatus.NOT_FOUND, message);
        }
        return success(post);
    }


}

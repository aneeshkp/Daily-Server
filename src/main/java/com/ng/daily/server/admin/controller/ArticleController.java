package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.IDGenerator;
import com.ng.daily.server.admin.base.BaseAdminController;
import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.post.PostService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/article")
public class ArticleController extends BaseAdminController {

    @Autowired
    private PostService postService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, Post post) {
        model.addAttribute("post", post);
        return "admin/edit_article";
    }

    @RequestMapping(value = "/preview", method = RequestMethod.GET)
    public String preview(Model model, @RequestParam(value = "id", required = true) String id) {
        Post post = postService.findById(id);
        model.addAttribute("post", post);
        return "admin/preview_article";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model model, @RequestParam(value = "id", required = true) String id) {
        Post post = postService.findById(id);
        return index(model, post);
    }

    @RequestMapping(value = "/save", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object save(Post post) {
        if (StringUtils.isBlank(post.getId())) {
            post.setId(IDGenerator.getArticleId());
            post.setType(Post.TYPE_ARTICLE);
            post.setStatus(Post.STATUS_DRAFT);
        }
        postService.savePost(post);
        return post;
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object delete(@RequestParam(value = "id", required = true) String id) {
        postService.deleteById(id);
        return success;
    }

    @RequestMapping(value = "/queue", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object queue(@RequestParam(value = "id", required = true) String id) {
        postService.updateStatusQueue(id);
        return success;
    }

}

package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.post.PostService;
import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Calendar;

/**
 * 文章
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/article")
public class ArticleController extends BaseAdminController {

    @Autowired
    private PostService postService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, Post post) {
        if (post == null || StringUtils.isBlank(post.getId())) {
            post = Post.createArticle();
        }
        model.addAttribute("post", post);
        return "admin/edit_article";
    }

    /**
     * 预览
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/preview", method = RequestMethod.GET)
    public String preview(Model model, @RequestParam(value = "id", required = true) String id) {
        Post post = postService.findById(id);
        model.addAttribute("post", post);
        return "admin/preview_article";
    }

    /**
     * 编辑
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model model, @RequestParam(value = "id", required = true) String id) {
        Post post = postService.findById(id);
        if (post == null) {
            post = Post.createArticle();
        }
        return index(model, post);
    }

    /**
     * 保存
     *
     * @param post
     * @return
     */
    @RequestMapping(value = "/save", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object save(Post post) {
        if (post == null || StringUtils.isBlank(post.getId())) {
            post = Post.createArticle();
        }
        post.setType(Post.TYPE_ARTICLE);
        post.setStatus(Post.STATUS_DRAFT);


        post.setPublishScheduleAt(DateTime.now().toDate());

        postService.savePost(post);
        return post;
    }

    /**
     * 删除
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object delete(@RequestParam(value = "id", required = true) String id) {
        postService.deleteById(id);
        return success();
    }

    /**
     * 提交到发布队列
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/queue", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object queue(@RequestParam(value = "id", required = true) String id) {

        Post post = postService.findById(id);
        if (post != null) {
            Calendar calendar = Calendar.getInstance();
            calendar.add(Calendar.YEAR, 1000);
            post.setPublishAt(calendar.getTime());
            System.err.println(calendar.getTime());

            postService.updateStatusQueue(id);
            return success();
        } else {
            return error("找不到内容");
        }

    }

}

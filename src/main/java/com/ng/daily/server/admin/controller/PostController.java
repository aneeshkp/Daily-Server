package com.ng.daily.server.admin.controller;

import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.post.PostService;
import org.apache.commons.lang.StringUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 根据Post类型 分发操作
 * <p/>
 * Created by fangs on 15/2/28.
 */
@Controller
@RequestMapping(value = "/admin/post")
public class PostController extends AdminController {

    @Autowired
    private PostService postService;

    /**
     * 编辑
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    public String edit(@RequestParam(value = "id", required = true) String id) {
        Post post = postService.findById(id);
        if (StringUtils.equals(Post.TYPE_ARTICLE, post.getType())) {
            return "redirect:/admin/article/edit?id=" + id;
        } else if (StringUtils.equals(Post.TYPE_FRAGMENT, post.getType())) {
            return "redirect:/admin/fragment/edit?id=" + id;
        }
        return "redirect:/admin/";
    }

    /**
     * 预览
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/preview", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    public String preview(@RequestParam(value = "id", required = true) String id) {
        Post post = postService.findById(id);
        if (StringUtils.equals(Post.TYPE_ARTICLE, post.getType())) {
            return "redirect:/admin/article/preview?id=" + id;
        } else if (StringUtils.equals(Post.TYPE_FRAGMENT, post.getType())) {
            return "redirect:/admin/fragment/preview?id=" + id;
        }
        return "redirect:/admin/";
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
     * 撤回
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/withdraw", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object withdraw(@RequestParam(value = "id", required = true) String id) {
        Post post = postService.findById(id);
        post.setStatus(Post.STATUS_DRAFT);
        postService.savePost(post);
        return success();
    }

    /**
     * 撤回所有
     *
     * @return
     */
    @RequestMapping(value = "/withdrawAll", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object withdrawAll() {
        Integer oldStatus = Post.STATUS_QUEUE;
        Integer newStatus = Post.STATUS_DRAFT;
        postService.changeStatusAll(oldStatus, newStatus);
        return success();
    }

    /**
     * 发布
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/publish", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object publish(@RequestParam(value = "id", required = true) String id) {
        Post post = postService.findById(id);
        post.setStatus(Post.STATUS_ONLINE);
        post.setPublishAt(DateTime.now().toDate());
        postService.savePost(post);
        return success();
    }

}

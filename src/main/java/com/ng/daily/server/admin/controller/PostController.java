package com.ng.daily.server.admin.controller;

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
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit", method = RequestMethod.GET)
    public String edit(Model model, @RequestParam(value = "id", required = true) String id) {
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
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/preview", method = RequestMethod.GET)
    public String preview(Model model, @RequestParam(value = "id", required = true) String id) {
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
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    public Object delete(Model model, @RequestParam(value = "id", required = true) String id) {
        postService.deleteById(id);
        return success();
    }

}

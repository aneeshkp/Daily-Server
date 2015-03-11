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

/**
 * 碎片
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/fragment")
public class FragmentController extends BaseAdminController {

    @Autowired
    private PostService postService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index(Model model, Post post) {
        if (post == null || StringUtils.isBlank(post.getId())) {
            post = Post.createFragment();
        }
        model.addAttribute("post", post);
        return "admin/edit_fragment";
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
        return "admin/preview_fragment";
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
            post = Post.createFragment();
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
            post = Post.createFragment();
        }

        if (post.getImageList().size() > 0) {
            post.setTitleImage(post.getImageList().get(0));
        }

        post.setPublishScheduleAt(DateTime.now().toDate());

        post.setType(Post.TYPE_FRAGMENT);
        post.setStatus(Post.STATUS_DRAFT);
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
     * 队列
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "/queue", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object queue(@RequestParam(value = "id", required = true) String id) {
        postService.updateStatusQueue(id);
        return success();
    }

}

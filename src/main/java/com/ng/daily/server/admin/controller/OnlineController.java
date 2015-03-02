package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import com.ng.daily.server.common.datatables.PageEntity;
import com.ng.daily.server.common.datatables.annotation.DatatablesParams;
import com.ng.daily.server.common.datatables.request.DatatablesMetadata;
import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.post.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/online")
public class OnlineController extends BaseAdminController {

    @Autowired
    private PostService postService;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/list_online";
    }

    @RequestMapping(value = "list", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public PageEntity<Post> list(@DatatablesParams DatatablesMetadata metadata) {
        Page<Post> page = postService.findByStatus(Post.STATUS_ONLINE, metadata.getCurrentPageIndex(), metadata.getLength());
        return new PageEntity<>(metadata.getDraw(), page.getNumberOfElements(), page.getTotalElements(), page.getContent());
    }
}

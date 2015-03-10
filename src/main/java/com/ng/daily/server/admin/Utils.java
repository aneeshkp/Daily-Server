package com.ng.daily.server.admin;

import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.account.ShiroDbRealm;
import org.apache.shiro.SecurityUtils;

/**
 * Created by fangs on 15/2/14.
 */
public class Utils {

    /**
     * 取出Shiro中的当前用户Id.
     */
    public static String getCurrentUserId() {
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return user.id;
    }


    public static String getPostStatusByPostId(Integer id) {
        if(id.intValue() == Post.STATUS_DRAFT.intValue()) {
            return "草稿";
        } else if(id.intValue() == Post.STATUS_QUEUE.intValue()) {
            return "队列中";
        } else if(id.intValue() == Post.STATUS_ONLINE.intValue()) {
            return "已上线";
        }
        return String.valueOf(id);
    }

}

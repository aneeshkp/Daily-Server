package com.ng.daily.server.admin.security;

import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpSession;
import java.io.Serializable;

import static com.ng.daily.server.admin.security.Const.SESSION_ACCOUNT;
import static com.ng.daily.server.admin.security.Const.SESSION_USER_ID;

/**
 * 保存登录状态到 ThreadLocal 中,用于权限校验
 * <p/>
 * Created by fangs on 15/1/15.
 */
public class ThreadValue implements Serializable {

    private static ThreadLocal<ThreadValue> local = new ThreadLocal<ThreadValue>();

    public static ThreadValue get() {
        return local.get();
    }

    public static void clear() {
        local.remove();
    }

    public static void init(HttpSession session) {
        if (local.get() == null) {
            if (session != null) {
                String userId = String.valueOf(session.getAttribute(SESSION_USER_ID));
                String account = String.valueOf(session.getAttribute(SESSION_ACCOUNT));
                if (!StringUtils.equals(userId, "null") && !StringUtils.equals(account, "null")) {
                    ThreadValue value = new ThreadValue();
                    value.setId(userId);
                    value.setEmail(account);
                    if (Utils.isAdminEmail(account)) {
                        value.setIsAdmin(Boolean.TRUE); // 是否是admin用户
                    } else {
                        value.setIsAdmin(Boolean.FALSE);
                    }
                    local.set(value);
                }
            }
        }
    }

    private String id; // 用户ID
    private String email; // 邮箱
    private Boolean isAdmin; // 是否是管理员

    public ThreadValue() {

    }

    public ThreadValue(String id, String email, Boolean isAdmin) {
        this.id = id;
        this.email = email;
        this.isAdmin = isAdmin;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Boolean getIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(Boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

}

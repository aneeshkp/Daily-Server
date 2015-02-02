package com.ng.daily.server.admin.security;

import com.ng.daily.server.admin.entity.User;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import static com.ng.daily.server.admin.security.Const.SESSION_LOGIN_STATUS;
import static com.ng.daily.server.admin.security.Const.SESSION_ROLES;

/**
 * 登录状态 & Session
 * <p/>
 * Created by fangs on 15/1/15.
 */
public class Login {

    /**
     * 获取登录人账号
     *
     * @param request
     * @return
     */
    public static String getUserEmail(HttpServletRequest request) {
        if (isLogin(request)) {
            return (String) request.getSession().getAttribute(Const.SESSION_ACCOUNT);
        }
        return null;
    }


    /**
     * 设置登陆
     *
     * @param request
     * @param user
     */
    public static void setLogin(HttpServletRequest request, User user) {

        /**
         if (user.getRole() == null) {
         if (DeveloperUtils.isAdminEmail(user.getEmail())) {
         user.setRole(Const.ROLE_ADMIN);
         } else {
         user.setRole(Const.ROLE_DEVELOPER);
         }
         }
         HttpSession session = request.getSession();
         session.setAttribute(SESSION_USER_ID, user.getId());
         session.setAttribute(SESSION_ACCOUNT, user.getEmail());
         session.setAttribute(SESSION_ROLES, user.getRole());
         session.setAttribute(SESSION_LOGIN_STATUS, Boolean.TRUE);
         **/
    }


    /**
     * 是否是开发者角色
     *
     * @param request
     */
    public static boolean isDevRole(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session != null) {
            String roles = (String) session.getAttribute(SESSION_ROLES);
            return Const.ROLE_DEVELOPER.equalsIgnoreCase(roles);
        }
        return false;
    }

    /**
     * 是否已登录
     *
     * @param request
     * @return
     */
    public static Boolean isLogin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            return (session.getAttribute(SESSION_LOGIN_STATUS) == Boolean.TRUE);
        }
        return false;
    }

    /**
     * 是否是管理员
     *
     * @param request
     * @return
     */
    public static Boolean isAdmin(HttpServletRequest request) {
        if (isLogin(request)) {
            String role = String.valueOf(request.getSession().getAttribute(SESSION_ROLES));
            if (StringUtils.equals(role, Const.ROLE_ADMIN)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 登出
     *
     * @param request
     */
    public static void setLogout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }

}

package com.ng.daily.server.admin.security;

/**
 * 常量定义
 * <p/>
 * Created by fangs on 15/1/20.
 */
public class Const {

    public static final int VERIFY_CODE_EXPIRES_DAYS = 3; // 验证码过期天数

    public static final String ROLE_DEVELOPER = "DEV"; // 开发者角色
    public static final String ROLE_ADMIN = "ADMIN"; // 管理员角色

    public static final String SESSION_LOGIN_STATUS = "LOGIN_STATUS";
    public static final String SESSION_ROLES = "SESSION_ROLES";
    public static final String SESSION_ACCOUNT = "SESSION_ACCOUNT";
    public static final String SESSION_USER_ID = "SESSION_USER_ID";


    public static final String COOKIE_KEY_ACCOUNT = "k_account"; // 自动登录记录在cookie中的账号
    public static final String COOKIE_KEY_AUTOLOGIN_CODE = "k_autologin_code"; // 自动登录记录在cookie中的code
    public static final int AUTOLOGIN_MAX_DAYS = 15; // 自动登录最长生效时间(天)

    public static final String ADMIN_EMAIL = "service@dajiashequ.com"; // 大家社区管理员账号 TODO 转移到配置

}

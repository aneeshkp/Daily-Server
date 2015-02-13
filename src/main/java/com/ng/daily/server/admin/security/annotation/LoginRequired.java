package com.ng.daily.server.admin.security.annotation;

import java.lang.annotation.*;

/**
 * 标识方法执行需要登录权限
 * <p/>
 * Created by fangs on 15/1/21.
 */
@Retention(RetentionPolicy.RUNTIME)
@Target(ElementType.METHOD)
@Inherited
@Documented
public @interface LoginRequired {

}
package com.ng.daily.server.admin;

import com.ng.daily.server.service.account.ShiroDbRealm;
import org.apache.shiro.SecurityUtils;

import java.math.BigInteger;

/**
 * Created by fangs on 15/2/14.
 */
public class Utils {


    /**
     * 取出Shiro中的当前用户Id.
     */
    public static BigInteger getCurrentUserId() {
        ShiroDbRealm.ShiroUser user = (ShiroDbRealm.ShiroUser) SecurityUtils.getSubject().getPrincipal();
        return BigInteger.valueOf(user.id);
    }

}

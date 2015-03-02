package com.ng.daily.server.admin;

import com.ng.daily.server.service.account.ShiroDbRealm;
import org.apache.shiro.SecurityUtils;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Date;

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

    public static void main(String[] args) {
        System.out.println(System.currentTimeMillis());
        SimpleDateFormat sdf = new SimpleDateFormat("MMM dd,yyyy HH:mm");

        Date resultdate = new Date(1425450300000L);
        System.out.println(sdf.format(resultdate));


    }
}

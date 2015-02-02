package com.ng.daily.server.admin.security;

import org.apache.commons.lang.StringUtils;

/**
 * Created by fangs on 15/1/20.
 */
public class Utils {

    public static final String getSiteOfEmail(String email) {
        if (StringUtils.isNotBlank(email) && StringUtils.contains(email, "@")) {
            return "http://www." + email.substring(email.indexOf("@") + 1);
        } else {
            return email;
        }
    }

    public static final boolean isAdminEmail(String email) {
        return StringUtils.equals(email, Const.ADMIN_EMAIL);
    }

}

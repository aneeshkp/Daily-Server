package com.ng.daily.server.common.security;

import org.apache.commons.codec.CharEncoding;
import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.codec.net.URLCodec;
import org.apache.commons.lang.RandomStringUtils;

import java.io.UnsupportedEncodingException;

/**
 * 生成邮箱验证码
 * <p/>
 * Created by fangs on 15/1/15.
 */
public class SecurityCode {

    public static final String MAGIC = "NG-DAILY";

    /**
     * 生成 邮件校验码
     *
     * @param email
     * @return
     */
    public static final String getEmailVerifyCode(String email) {
        URLCodec urlCodec = new URLCodec();
        String code = null;
        try {
            code = urlCodec.encode(email, CharEncoding.UTF_8);
        } catch (UnsupportedEncodingException ignore) {
            ignore.printStackTrace();
        }
        // MD5 : 邮箱+随机字符串+时间戳+MAGIC
        String hash = DigestUtils.md5Hex(code + "-" + RandomStringUtils.random(10) + "-" + System.nanoTime() + "-" + MAGIC);
        return hash;
    }

    /**
     * 生成 记住我校验码
     *
     * @return
     */
    public static final String getAutoLoginCode() {
        // MD5 : 随机字符串+时间戳+MAGIC
        String hash = DigestUtils.md5Hex(RandomStringUtils.random(10) + "-" + System.nanoTime() + "-" + MAGIC);
        return hash;
    }

}

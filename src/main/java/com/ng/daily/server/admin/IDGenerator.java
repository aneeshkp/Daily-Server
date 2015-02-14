package com.ng.daily.server.admin;

import org.joda.time.DateTime;

import java.util.Random;

/**
 * Created by fangs on 15/2/14.
 */
public class IDGenerator {


    public static String getArticleId() {
        return getId("A");
    }

    public static String getFragmentId() {
        return getId("F");
    }

    public static String getArticleImageId() {
        return getId("AP");
    }

    public static String getFragmentImageId() {
        return getId("FP");
    }

    private static String getId(String prefix) {
        String timestamp = DateTime.now().toString("yyyyMMddHHmmssS");
        String random = String.valueOf(new Random().nextInt(999 - 100 + 1) + 100);
        return prefix + timestamp + random;
    }

    public static void main(String[] args) {
        System.out.println(getArticleId());
    }
}

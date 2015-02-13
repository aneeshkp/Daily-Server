package com.ng.daily.server.admin.crawler;

import com.ng.daily.server.admin.crawler.style.Style;

import java.io.IOException;

/**
 * Created by fangs on 15/2/6.
 */
public class Start {


    public static void main(String[] args) throws IOException {

        Style style = new Style();
        String saveDir = "/tmp/style.com";
        String collectionUrl = "http://www.style.com/slideshows/fashion-shows/spring-2015-couture/chanel/collection";

        style.download(saveDir, collectionUrl);

    }


}

package com.ng.daily.server.service.crawler.douban;

import com.google.common.collect.Lists;
import com.ng.daily.server.entity.Post;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.List;

/**
 * Created by fangs on 15/3/1.
 */
public class Dongxi {

    int threadPoolSize = 20;

    public Post download(String saveDir, String url) throws IOException {


        Post post = Post.createFragment();
        post.setSource("豆瓣");
        post.setTag("东西");

        Document doc = Jsoup.connect(url).get();

        List<String> imageList = Lists.newArrayList();
        Elements imageElements = doc.select(".nav-images .nav-image");
        for(Element e : imageElements) {
            String imageUrl = e.attr("data-original-url");
            imageList.add(imageUrl);
        }

        Element titleElement = doc.select(".commodity-name a").get(0);
        String title = titleElement.attr("title");

        post.setTitle(title);
        post.setImageList(imageList);

        System.err.println(title);
        System.err.println(imageList);

        return post;

    }

    public static void main(String[] args) throws IOException {

        Dongxi zhihu = new Dongxi();
        String saveDir = "/tmp/dongxi.douban.com";
        String answerUrl = "http://dongxi.douban.com/show/2534804/?r=P";
        zhihu.download(saveDir, answerUrl);

    }


}
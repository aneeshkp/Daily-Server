package com.ng.daily.server.service.crawler.zhihu;

import com.google.common.collect.Lists;
import com.ng.daily.server.entity.Post;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.IOException;
import java.util.List;

/**
 * Created by fangs on 15/2/28.
 */
public class ZhihuDaily {


    int threadPoolSize = 20;

    public Post download(String saveDir, String dailyUrl) throws IOException {


        Post post = Post.createArticle();
        post.setSource("知乎");
        post.setTag("设计");

        Document doc = Jsoup.connect(dailyUrl).get();

        Element contentElement = doc.select(".question .answer .content").get(0);
        String content = contentElement.toString();
//        content = Jsoup.clean(content, Whitelist.basic());

        Element titleElement = doc.select(".headline-title").get(0);
        String title = titleElement.text();

        post.setTitle(title);
        post.setContent(content);

        List<String> imageList = Lists.newArrayList();
        for(Element imageElement : doc.select(".content-image")) {
            String imageUrl = imageElement.attr("src");
            System.err.println(imageUrl);
            imageList.add(imageUrl);
        }
        post.setImageList(imageList);

        return post;

    }

    public static void main(String[] args) throws IOException {

        ZhihuDaily zhihu = new ZhihuDaily();
        String saveDir = "/tmp/zhihu.com";
        String answerUrl = "http://www.zhihu.com/question/22332149/answer/24682860";
        zhihu.download(saveDir, answerUrl);

    }



}

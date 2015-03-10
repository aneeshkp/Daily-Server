package com.ng.daily.server.service.crawler.zhihu;

import com.google.common.collect.Lists;
import com.ng.daily.server.entity.Post;
import org.joda.time.DateTime;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.IOException;
import java.util.List;

/**
 * 知乎日报
 * Created by fangs on 15/2/28.
 */
public class ZhihuDailyDownloader {


    int threadPoolSize = 20;

    public Post download(String saveDir, String dailyUrl) throws IOException {


        Post post = Post.createArticle();

        Document doc = Jsoup.connect(dailyUrl).get();

        Element contentElement = doc.select(".question .answer .content").get(0);
        String content = contentElement.toString();
//        content = Jsoup.clean(content, Whitelist.basic());

//        content = content.replaceAll("(\r\n|\n)", "<br />");
        content = content.replaceAll("(\r\n|\n)", "");

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

        post.setSource("知乎");
        post.setTag("设计");
        post.setCrawlerUrl(dailyUrl);
        post.setCrawledAt(DateTime.now().toDate());

        return post;

    }

    public static void main(String[] args) throws IOException {

        ZhihuDailyDownloader zhihu = new ZhihuDailyDownloader();
        String saveDir = "/tmp/zhihu.com";
        String answerUrl = "http://www.zhihu.com/question/22332149/answer/24682860";
        zhihu.download(saveDir, answerUrl);

    }



}

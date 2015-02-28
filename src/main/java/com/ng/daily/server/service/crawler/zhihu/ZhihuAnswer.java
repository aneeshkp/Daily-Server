package com.ng.daily.server.service.crawler.zhihu;

import com.ng.daily.server.entity.Post;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.IOException;

/**
 * Created by fangs on 15/2/28.
 */
public class ZhihuAnswer {


    int threadPoolSize = 20;

    public Post download(String saveDir, String questionUrl) throws IOException {

        Document doc = Jsoup.connect(questionUrl).get();

        Element contentElement = doc.select(".zm-item-answer .zm-item-rich-text .zm-editable-content").get(0);
        String content = contentElement.toString();

        Element titleElement = doc.select("#zh-question-title .zm-item-title").get(0);
        String title = titleElement.text();


//        System.err.println(content);
//
//        System.err.println("=======================================================");
//
//        final CleanerProperties props = new CleanerProperties();
//        final HtmlCleaner htmlCleaner = new HtmlCleaner(props);
//        final SimpleHtmlSerializer htmlSerializer = new SimpleHtmlSerializer(props);
//
//        TagNode tagNode = htmlCleaner.clean(content);
//        String contentCleaned = htmlSerializer.getAsString(tagNode);
//
//        System.err.println(contentCleaned);


        Post post = Post.createArticle();
        post.setTitle(title);
        post.setSource("知乎");
        post.setContent(content);
        post.setTag("设计");
        return post;

    }

    public static void main(String[] args) throws IOException {

        ZhihuAnswer zhihu = new ZhihuAnswer();
        String saveDir = "/tmp/zhihu.com";
        String answerUrl = "http://www.zhihu.com/question/22332149/answer/24682860";
        zhihu.download(saveDir, answerUrl);

    }



}

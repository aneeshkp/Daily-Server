package com.ng.daily.server.service.crawler.zhihu;

import com.ng.daily.server.entity.Post;
import org.joda.time.DateTime;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.IOException;

/**
 * 知乎答案
 * Created by fangs on 15/2/28.
 */
public class ZhihuAnswerDownloader {


    public Post download(String questionUrl) throws IOException {

        Document doc = Jsoup.connect(questionUrl).get();

        Element contentElement = doc.select(".zm-item-answer .zm-item-rich-text .zm-editable-content").get(0);
        String content = contentElement.toString();
//        content = Jsoup.clean(content, Whitelist.basic());

//        content = content.replaceAll("(\r\n|\n)", "<br />");
        content = content.replaceAll("(\r\n|\n)", "");

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
        post.setContent(content);

        post.setSource("知乎");
        post.setTag("设计");
        post.setCrawlerUrl(questionUrl);
        post.setCrawledAt(DateTime.now().toDate());

        return post;

    }

    public static void main(String[] args) throws IOException {

        ZhihuAnswerDownloader zhihu = new ZhihuAnswerDownloader();
        String answerUrl = "http://www.zhihu.com/question/22332149/answer/24682860";
        zhihu.download( answerUrl);

    }



}

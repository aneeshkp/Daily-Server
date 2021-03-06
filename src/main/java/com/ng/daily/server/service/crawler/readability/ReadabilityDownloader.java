package com.ng.daily.server.service.crawler.readability;

import com.ng.daily.server.entity.Post;
import com.sree.textbytes.network.HtmlFetcher;
import com.sree.textbytes.readability.Article;
import com.sree.textbytes.readability.ContentExtractor;
import org.joda.time.DateTime;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.NodeTraversor;
import org.jsoup.select.NodeVisitor;

import java.net.URLDecoder;

/**
 * Created by fangs on 15/3/9.
 */
public class ReadabilityDownloader {


    public Post download(String targetUrl) throws Exception {

        ContentExtractor ce = new ContentExtractor();
        HtmlFetcher htmlFetcher = new HtmlFetcher();
        String html = htmlFetcher.getHtml(targetUrl, 0);
        Article article = ce.extractContent(html, "ReadabilitySnack");

        article.setCleanedArticleText(article.getCleanedArticleText().replaceAll("(\r\n|\n)", ""));

        System.err.println(article.getCleanedArticleText());

        Document doc = Jsoup.parse(article.getCleanedArticleText());
        NodeTraversor traversor = new NodeTraversor(new NodeVisitor() {
            @Override
            public void tail(Node node, int depth) {
                if (node instanceof Element) {
                    Element e = (Element) node;
                    e.removeAttr("class");
                    e.removeAttr("style");
                    e.removeAttr("algoscore");
                }
            }

            @Override
            public void head(Node node, int depth) {
            }
        });
        traversor.traverse(doc.body());
        String modifiedHtml = doc.toString();

        modifiedHtml = modifiedHtml.replaceAll("(\r\n|\n)", "");

        Post post = Post.createArticle();

        String title = URLDecoder.decode(article.getTitle(), "UTF-8");
        post.setTitle(title);
        post.setContent(modifiedHtml);

        post.setSource("机器人");
        post.setTag("资源");
        post.setCrawlerUrl(targetUrl);
        post.setCrawledAt(DateTime.now().toDate());

        return post;

    }


}

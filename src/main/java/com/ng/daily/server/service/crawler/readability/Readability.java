package com.ng.daily.server.service.crawler.readability;

import com.ng.daily.server.entity.Post;
import com.sree.textbytes.network.HtmlFetcher;
import com.sree.textbytes.readabilityBUNDLE.Article;
import com.sree.textbytes.readabilityBUNDLE.ContentExtractor;
import org.joda.time.DateTime;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.NodeTraversor;
import org.jsoup.select.NodeVisitor;

/**
 * Created by fangs on 15/3/9.
 */
public class Readability {


    public Post download(String articleUrl) throws Exception {

        ContentExtractor ce = new ContentExtractor();
        HtmlFetcher htmlFetcher = new HtmlFetcher();
        String html = htmlFetcher.getHtml(articleUrl, 0);
        Article article =  ce.extractContent(html, "ReadabilitySnack");


        Document doc = Jsoup.parse(article.getCleanedArticleText());
        NodeTraversor traversor  = new NodeTraversor(new NodeVisitor() {
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


        Post post = Post.createArticle();

        post.setTitle(article.getTitle());
        post.setContent(modifiedHtml);

        post.setSource("机器人");
        post.setTag("资源");
        post.setCrawlerUrl(articleUrl);
        post.setCrawledAt(DateTime.now().toDate());

        return post;

    }


}

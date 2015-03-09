package com.sree.textbytes;

import com.sree.textbytes.network.HtmlFetcher;
import com.sree.textbytes.readabilityBUNDLE.Article;
import com.sree.textbytes.readabilityBUNDLE.ContentExtractor;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.select.NodeTraversor;
import org.jsoup.select.NodeVisitor;

/**
 * Created by fangs on 15/3/9.
 */
public class Test {
    public static void main(String[] args) throws Exception {


//        String articleUrl = "http://www.uisdc.com/invincible-designer-daily-life";
//        String articleUrl = "http://daily.zhihu.com/story/4576838";
        String articleUrl = "http://www.zhihu.com/question/22332149/answer/24682860";

        Article article = new Article();
        ContentExtractor ce = new ContentExtractor();
        HtmlFetcher htmlFetcher = new HtmlFetcher();
        String html = htmlFetcher.getHtml(articleUrl, 0);

        article = ce.extractContent(html, "ReadabilitySnack");


        System.out.println("Content : "+article.getCleanedArticleText());


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

        System.err.println(modifiedHtml);


//        final CleanerProperties props = new CleanerProperties();
//        final HtmlCleaner htmlCleaner = new HtmlCleaner(props);
//        final SimpleHtmlSerializer htmlSerializer = new SimpleHtmlSerializer(props);
//
//        TagNode tagNode = htmlCleaner.clean(article.getCleanedArticleText());
//        String contentCleaned = htmlSerializer.getAsString(tagNode);
//
//        System.err.println(contentCleaned);

    }
}

package com.ng.daily.server.service.crawler.wmagazine;

import com.ng.daily.server.service.crawler.DownloadTask;
import com.ng.daily.server.service.crawler.HttpClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by fangs on 15/4/19.
 */
public class Downloader {

    String saveDir = "/tmp/wmagazine.com";

    int threadPoolSize = 20;
    ExecutorService service = Executors.newFixedThreadPool(threadPoolSize);
    HttpClient httpClient = new HttpClient();

    public void download() {
        httpClient.init();
        Set<String> subPages = getSubPages();
        // 图片slide链接
        for (String subPage : subPages) {
            processSubPage(subPage);
        }
    }

    private Set<String> getSubPages() {
        // 子页面
        int totalPages = 2; // 364
        Set<String> subPages = new HashSet<>();
        for (int i = 2; i <= totalPages; i++) {
            String pageUrl = "http://www.wmagazine.com/fashion/street-style/page/" + String.valueOf(i);
            System.out.println(pageUrl);

            int retry = 0;
            Document doc = null;
            while (retry <= 10 && doc == null) {
                try {
                    doc = Jsoup.connect(pageUrl).get();
                } catch (Exception e) {
                    System.err.println(retry + " retry : " + pageUrl + " : " + e.getMessage());
                    retry++;
                }
            }

            if (doc != null) {
                Elements items = doc.select(".box-section-inner a");
                System.out.println(items.size());
                for (Element e : items) {
                    String href = e.attr("href");
                    subPages.add(href.replace("/slide/1", ""));
                }
            } else {
                System.err.println("error getting page : " + pageUrl);
            }

        }
        return subPages;
    }

    private void processSubPage(String subPage) {
        System.out.println(subPage);


        int retry = 0;
        Document doc = null;
        while (retry <= 10 && doc == null) {
            try {
                doc = Jsoup.connect(subPage).get();
            } catch (Exception e) {
                System.err.println(retry + " retry : " + subPage + " : " + e.getMessage());
                retry++;
            }
        }


        Set<String> imageUrls = new HashSet<>();
        if (doc != null) {
            Elements items = doc.select(".slide-grid ul li a img");
            System.out.println(items.size());

            for (Element e : items) {
                String img = e.attr("src").replace("-160x160.jpg", ".jpg");
                imageUrls.add(img);
            }

            //http://www.wmagazine.com/wp-content/uploads/2015/01/milan-mens-fashion-week-street-style-day-1-6.jpg
            //http://www.wmagazine.com/wp-content/uploads/2015/01/milan-mens-fashion-week-street-style-day-1-6-160x160.jpg

        }

        //http://www.wmagazine.com/fashion/street-style/2015/04/mercedes-benz-fashion-week-australia-spring-2015/photos
        int t = subPage.indexOf("/photos");
        String slideName = subPage.substring(subPage.replace("/photos", "").lastIndexOf("/") + 1, t);
        System.err.println("slideName = " + slideName);

        for (String img : imageUrls) {
            String saveName = img.substring(img.lastIndexOf("/") + 1, img.length());
            downloadImage(img, saveDir + "/" + slideName, saveName);
        }


    }

    private void downloadImage(String url, String saveDir, String saveName) {
        url = url.replaceAll(" ", "%20");
        DownloadTask task = new DownloadTask("", url, saveDir, saveName, httpClient);
        service.submit(task);
    }


    public static void main(String[] args) {
        Downloader downloader = new Downloader();
        downloader.download();
    }


}

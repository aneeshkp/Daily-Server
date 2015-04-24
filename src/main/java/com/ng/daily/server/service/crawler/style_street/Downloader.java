package com.ng.daily.server.service.crawler.style_street;

import com.google.gson.Gson;
import com.ng.daily.server.service.crawler.DownloadTask;
import com.ng.daily.server.service.crawler.HttpClient;
import org.apache.commons.lang.StringUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by fangs on 15/4/19.
 */
public class Downloader {

    String saveDir = "/tmp/style.com";

    int threadPoolSize = 20;
    ExecutorService service = Executors.newFixedThreadPool(threadPoolSize);
    HttpClient httpClient = new HttpClient();

    public void download() {
        httpClient.init();
        List<String> subPages = getSubPages();
        // 图片slide链接
        for (String subPage : subPages) {
            processSubPage(subPage);
        }
    }

    private List<String> getSubPages() {
        // 子页面
        int totalPages = 33; // 33
        List<String> subPages = new ArrayList<>();
        for (int i = 1; i <= totalPages; i++) {
            String pageUrl = "http://www.style.com/street/page/" + String.valueOf(i);
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
                Elements items = doc.select(".story-item__title");
                for (Element e : items) {
                    System.out.println(e.text());
                    String href = e.select("a").attr("href");
                    subPages.add("http://www.style.com" + href);
                }

                Elements items2 = doc.select(".poster-story-item__title");
                for (Element e : items2) {
                    System.out.println(e.text());
                    String href = e.select("a").attr("href");
                    subPages.add("http://www.style.com" + href);
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

        if (doc != null) {
            Elements elements = null;
            // 样式1
            elements = doc.select(".slideshow-btn a");
            if (elements.size() != 0) {
                String slideUrl = "http://www.style.com" + elements.get(0).attr("href");
                System.out.println("样式一 " + slideUrl);
                processSlide(slideUrl);

            } else {
                // 样式2
                elements = doc.select(".headline .text-center a");
                if (elements.size() != 0) {
                    String slideUrl = "http://www.style.com" + elements.get(0).attr("href");
                    System.out.println("样式二 " + slideUrl);
                    processSlide(slideUrl);

                } else {
                    // 样式3
                    try {
                        String title = doc.select(".headline__title").text();
                        String image1 = doc.select(".story .pinterest-feature-image").get(0).attr("src");
                        String image2 = doc.select(".story figure").get(1).select("img").attr("src");
                        System.out.println("样式三 ==>>>> ");
                        System.out.println("image1 = " + image1);
                        System.out.println("image2 = " + image2);

                        System.out.println("imageUrl = " + image1);
                        String saveName1 = image1.substring(image1.lastIndexOf("/") + 1, image1.length());
                        downloadImage(image1, saveDir + "/" + title, saveName1);


                        System.out.println("imageUrl = " + image2);
                        String saveName2 = image2.substring(image2.lastIndexOf("/") + 1, image2.length());
                        downloadImage(image2, saveDir + "/" + title, saveName2);

                    } catch (Exception e) {
                        // 其他样式
                        System.err.println("样式未知 !!!!! " + subPage);
                    }
                }
            }

        } else {
            System.err.println("error getting subPage : " + subPage);
        }
    }

    private void processSlide(String slideUrl) {
        int retry = 0;
        Document doc = null;
        while (retry <= 10 && doc == null) {
            try {
                doc = Jsoup.connect(slideUrl).get();
            } catch (Exception e) {
                System.err.println(retry + " retry : " + slideUrl + " : " + e.getMessage());
                retry++;
            }
        }

        if (doc != null) {
            String json = doc.select("script").get(5).toString().replace("<script>", "").replace("window.slideshowItems =", "").replace("</script>", "").replace("};", "}");
            Gson gson = new Gson();
            ResultMap resultMap = gson.fromJson(json, ResultMap.class);


            String slideName = resultMap.title;
            for (Item item : resultMap.items) {
                String slidePath;
                if (StringUtils.isNotBlank(item.pintrestImage)) {
                    slidePath = item.pintrestImage;
                } else {
                    slidePath = item.slidepath;
                }
                int width = item.width;
                int height = item.height;

//                System.err.println("slidePath = " + slidePath);

                String pname = "";
                if (slidePath.contains("/slides/")) {
                    pname = "/slides/";
                } else if (slidePath.contains("/slide/")) {
                    pname = "/slide/";
                } else if (slidePath.contains("/slideshow/")) {
                    pname = "/slideshow/";
                } else if (slidePath.contains("/slideshows/")) {
                    pname = "/slideshows/";
                } else if (slidePath.contains("/images/")) {
                    pname = "/images/";
                }

                int p = slidePath.indexOf(pname);
                String s1 = slidePath.substring(0, p);
                String s2 = slidePath.substring(p + pname.length(), slidePath.length());
                String imageUrl = "http://media.style.com/image" + s1 + pname + width + "/" + height + "/" + s2;

                System.out.println("imageUrl = " + imageUrl);
                String saveName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1, imageUrl.length());

                downloadImage(imageUrl, saveDir + "/" + slideName, saveName);

            }
        }

    }

    private void downloadImage(String url, String saveDir, String saveName) {
        url = url.replaceAll(" ", "%20");
        DownloadTask task = new DownloadTask("", url, saveDir, saveName, httpClient);
        service.submit(task);
    }

    class ResultMap {
        String title;
        List<Item> items;
    }

    class Item {
        String id;
        String slidepath;
        String type;
        String pintrestImage;
        int width;
        int height;
    }

    public static void main(String[] args) {
        Downloader downloader = new Downloader();
        downloader.download();
    }


}

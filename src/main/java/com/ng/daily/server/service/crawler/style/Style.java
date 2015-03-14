package com.ng.daily.server.service.crawler.style;

import com.google.gson.Gson;
import com.ng.daily.server.service.crawler.DownloadTask;
import com.ng.daily.server.service.crawler.HttpClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Style.com 爬虫
 * Created by fangs on 15/2/5.
 */
public class Style {


    public static void main(String[] args) throws IOException {
        Style style = new Style();
//        String seasonUrl = "http://www.style.com/fashion-shows/fall-2015-ready-to-wear";
        String seasonUrl = "http://www.style.com/fashion-shows/pre-fall-2015";
        style.downloadSeason(seasonUrl);
    }

    int threadPoolSize = 20;
    ExecutorService service = Executors.newFixedThreadPool(threadPoolSize);


    public void downloadSeason(String seasonUrl) throws IOException {
        Document doc = Jsoup.connect(seasonUrl).get();
        Elements elements = doc.select("#s0-all li a");
        List<String> brands = new ArrayList<>();
        for (Element element : elements) {
            String href = element.attr("href");
            String brand = href.substring(href.lastIndexOf("/") + 1, href.length());
            brands.add(brand);
        }
        int c = 1;
        for (String brand : brands) {
            service.submit(new CollectionTask(this, brand, c++, brands.size()));
        }
    }


    public void downloadCollection(String description, String saveDir, String collectionUrl) throws IOException {

        Document doc = null;
        int retrys = 1;
        while (doc == null && retrys < 50) {
            try {
                doc = Jsoup.connect(collectionUrl).timeout(5000).get();
            } catch (Exception e) {
                System.err.println("collection download exception : " + "===" + e.toString() + " ---  " + retrys);
            }
            retrys++;
        }
        if (doc == null) {
            System.err.println("collection download failed : " + collectionUrl);
        }

        Element script = doc.select("script").get(5);
        String json = script.toString().replace("<script>", "").replace("window.slideshowItems =", "").replace(";\n</script>", "");

        Gson gson = new Gson();
        ResultMap resultMap = gson.fromJson(json, ResultMap.class);

        HttpClient httpClient = new HttpClient();
        httpClient.init();

        int index = 0;
        int total = resultMap.items.size();
        for (Item item : resultMap.items) {
            index++;
            String url = "http://media.style.com/image" + item.slidepath;

            int pos = url.lastIndexOf("collection/") + "collection/".length();
            url = url.substring(0, pos) + "683/1024/" + url.substring(pos, url.length());

            String saveName = url.substring(url.lastIndexOf("/") + 1, url.length());

            DownloadTask task = new DownloadTask(description + ",image " + index + "/" + total, url, saveDir, saveName, httpClient);
            service.submit(task);

            if (item.hasDetailSlides) {

                int i = 0;
                for (Details detail : item.details) {
                    String detailUrl = "http://media.style.com/image" + detail.slidepath;

                    int p = detailUrl.lastIndexOf("detail/") + "detail/".length();
                    detailUrl = detailUrl.substring(0, p) + "683/1024/" + detailUrl.substring(p, detailUrl.length());
                    String saveNameDetail = saveName.replace(".jpg", "") + "_" + (++i) + ".jpg";

                    DownloadTask detailTask = new DownloadTask(description + ",detail " + index + "/" + total, detailUrl, saveDir, saveNameDetail, httpClient);
                    service.submit(detailTask);
                }

            }

        }

//        service.shutdown();
    }

}

class CollectionTask implements Runnable {

    private String brand;
    private Style style;
    private int order;
    private int total;

    public CollectionTask(Style style, String brand, int order, int total) {
        this.brand = brand;
        this.style = style;
        this.order = order;
        this.total = total;
    }

    @Override
    public void run() {
        System.out.println("=========>>>>>>>>>>>>>" + brand + "," + order + " / " + total);
        String saveDir = "/tmp/style.com/" + brand + "/";

        // TODO
        String collectionUrl = "http://www.style.com/slideshows/fashion-shows/pre-fall-2015/" + brand + "/collection";
        try {
            style.downloadCollection("brand " + brand + " " + order + "/" + total, saveDir, collectionUrl);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}

class ResultMap {
    String id;
    String title;
    String slideCount;
    String seasonUrlFragment;
    String brandUrlFragment;
    List<Item> items;
    String canonicalUrl;
}

class Item {
    String id;
    int order;
    String slidepath;
    Boolean hasDetailSlides;
    int height;
    int width;
    List<Details> details;
}

class Details {
    String id;
    int order;
    String slidepath;
    int height;
    int width;
}
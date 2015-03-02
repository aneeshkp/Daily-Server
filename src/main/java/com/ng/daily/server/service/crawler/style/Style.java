package com.ng.daily.server.service.crawler.style;

import com.google.gson.Gson;
import com.ng.daily.server.service.crawler.DownloadTask;
import com.ng.daily.server.service.crawler.HttpClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.IOException;
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
        String saveDir = "/tmp/style.com";
//        String collectionUrl = "http://www.style.com/slideshows/fashion-shows/spring-2015-couture/chanel/collection";
        String collectionUrl = "http://www.style.com/slideshows/fashion-shows/pre-fall-2015/alice-olivia/collection";
        style.download(saveDir, collectionUrl);

    }


    int threadPoolSize = 20;

    public void download(String saveDir, String collectionUrl) throws IOException {

        Document doc = Jsoup.connect(collectionUrl).get();
        Element script = doc.select("script").get(5);
        String json = script.toString().replace("<script>", "").replace("window.slideshowItems =", "").replace(";\n</script>", "");

        System.err.println(json);

        Gson gson = new Gson();
        ResultMap resultMap = gson.fromJson(json, ResultMap.class);

        HttpClient httpClient = new HttpClient();
        httpClient.init();
        ExecutorService service = Executors.newFixedThreadPool(threadPoolSize);

//        System.out.println(resultMap.id);
//        System.out.println(resultMap.slideCount);
//        System.out.println(resultMap.items.size());
        for (Item item : resultMap.items) {
            String url = "http://media.style.com/image" + item.slidepath;

            int pos = url.lastIndexOf("collection/") + "collection/".length();
            url = url.substring(0, pos) + "683/1024/" + url.substring(pos, url.length());

            String saveName = url.substring(url.lastIndexOf("/") + 1, url.length());

            DownloadTask task = new DownloadTask(url, saveDir, saveName, httpClient);
//            service.submit(task);

            if(item.hasDetailSlides) {
            // TODO deltail image download
            }

        }

        service.shutdown();
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
    SlideDetail slideDetails;
}

class SlideDetail {

}
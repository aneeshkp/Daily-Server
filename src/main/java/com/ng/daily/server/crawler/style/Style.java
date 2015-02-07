package com.ng.daily.server.crawler.style;

import com.google.gson.Gson;
import com.ng.daily.server.crawler.DownloadTask;
import com.ng.daily.server.crawler.HttpClient;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by fangs on 15/2/5.
 */
public class Style {

    int threadPoolSize = 20;

    public void download(String saveDir, String collectionUrl) throws IOException {

        Document doc = Jsoup.connect(collectionUrl).get();
        Element script = doc.select("script").get(5);
        String json = script.toString().replace("<script>", "").replace("window.slideshowItems =", "").replace(";\n</script>", "");

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
            service.submit(task);

//            if(item.hasDetailSlides) {
                // TODO deltail image download
//            }

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
}

class Item {
    String id;
    String slidepath;
    String hasDetailSlides;
    String height;
    String width;
}
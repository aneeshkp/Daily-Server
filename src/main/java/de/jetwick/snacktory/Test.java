package de.jetwick.snacktory;

/**
 * Created by fangs on 15/3/9.
 */
public class Test {

    public static void main(String[] args) throws Exception {

        String articleUrl = "http://www.uisdc.com/invincible-designer-daily-life";
        int resolveTimeout = 3000;


        HtmlFetcher fetcher = new HtmlFetcher();
        // set cache. e.g. take the map implementation from google collections:
        // fetcher.setCache(new MapMaker().concurrencyLevel(20).maximumSize(count).
        //    expireAfterWrite(minutes, TimeUnit.MINUTES).makeMap();


        JResult res = fetcher.fetchAndExtract(articleUrl, resolveTimeout, true);
        String text = res.getText();
        String title = res.getTitle();
        String imageUrl = res.getImageUrl();

        System.out.println(title);
        System.out.println(text);
        System.out.println(imageUrl);

        for(ImageResult imageResult  : res.getImages()) {
            System.out.println(imageResult.src);
        }

    }


}

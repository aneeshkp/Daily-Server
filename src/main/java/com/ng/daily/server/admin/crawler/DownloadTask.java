package com.ng.daily.server.admin.crawler;

import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.OutputStream;
import java.util.concurrent.Callable;

/**
 * Created by fangs on 15/2/6.
 */
public class DownloadTask implements Callable {

    private String url;
    private String savePath;
    private String saveName;
    private HttpClient httpClient;

    public DownloadTask(String url, String savePath, String saveName, HttpClient httpClient) {
        this.url = url;
        this.savePath = savePath;
        this.saveName = saveName;
        this.httpClient = httpClient;
    }

    @Override
    public Object call() throws Exception {
        OutputStream out = FileUtils.openOutputStream(new File(savePath, saveName));
        httpClient.httpGet(url, out);
        System.out.println("downloaded : " + url);
        return Boolean.TRUE;
    }
}
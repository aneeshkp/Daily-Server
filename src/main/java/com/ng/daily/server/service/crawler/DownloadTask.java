package com.ng.daily.server.service.crawler;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;

import java.io.File;
import java.io.OutputStream;
import java.util.concurrent.Callable;

/**
 * 文件下载任务
 * <p/>
 * Created by fangs on 15/2/6.
 */
public class DownloadTask implements Callable {

    private String description;
    private String url;
    private String savePath;
    private String saveName;
    private HttpClient httpClient;

    public DownloadTask(String description, String url, String savePath, String saveName, HttpClient httpClient) {
        this.description = description;
        this.url = url;
        this.savePath = savePath;
        this.saveName = saveName;
        this.httpClient = httpClient;
    }

    @Override
    public Object call() throws Exception {


        File f = new File(savePath, saveName);
        if (f.exists()) {
            System.out.println("skip : " + description);
            return Boolean.TRUE;
        }

        int retry = 1;
        boolean success = false;
        while (!success && retry < 10) {
            OutputStream out = null;
            try {
                out = FileUtils.openOutputStream(new File(savePath, saveName));
                httpClient.httpGet(url, out);
                success = true;
                System.out.println("finished : " + description);
            } catch (Exception e) {
                System.err.println("image download exception: " + "===" + e.toString() + " ---  " + retry);
            } finally {
                IOUtils.closeQuietly(out);
            }
            retry++;
        }
        if (!success) {
            System.err.println("image download failed : " + url);
        }


        return Boolean.TRUE;
    }
}
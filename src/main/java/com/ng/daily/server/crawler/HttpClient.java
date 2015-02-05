package com.ng.daily.server.crawler;

import com.google.common.base.Stopwatch;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClientBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.concurrent.TimeUnit;

/**
 * HTTP客户端
 * <p/>
 * Created by fangs on 15/1/26.
 */
public class HttpClient {


    private static final Logger log = LoggerFactory.getLogger(HttpClient.class);
    private int timeoutSeconds = 20; // 连接超时时间
    private int poolSize = 20; // 连接池大小
    private CloseableHttpClient httpClient;

    // 创建包含connection pool与超时设置的client
    public void init() {
        RequestConfig requestConfig = RequestConfig.custom().setSocketTimeout(timeoutSeconds * 1000)
                .setConnectTimeout(timeoutSeconds * 1000).build();

        httpClient = HttpClientBuilder.create().setMaxConnTotal(poolSize).setMaxConnPerRoute(poolSize)
                .setDefaultRequestConfig(requestConfig).build();
    }


    public void httpGet(String targetUrl, OutputStream result) throws IOException {

        Stopwatch sw = Stopwatch.createStarted();
        if (StringUtils.isBlank(targetUrl)) {
            throw new RuntimeException("invoke failed , targetUrl is empty");
        }
        HttpGet httpGet = new HttpGet(targetUrl);
        CloseableHttpResponse remoteResponse = httpClient.execute(httpGet);
        try {
            // 返回值
            int statusCode = remoteResponse.getStatusLine().getStatusCode();
            if (statusCode >= 400) {
                throw new RuntimeException("invoke failed, statusCode = " + statusCode);
            }
            HttpEntity entity = remoteResponse.getEntity();
            // 输出结果
            InputStream input = entity.getContent();
            if (result != null) {
                IOUtils.copy(input, result); // 基于byte数组读取InputStream并直接写入OutputStream, 数组默认大小为4k.
                result.flush();
            }
        } finally {
            remoteResponse.close();
            log.debug("invoke finished:" + targetUrl + ", cost " + sw.stop().elapsed(TimeUnit.MILLISECONDS) + " ms");
        }
    }

    public void destroy() {
        try {
            httpClient.close();
        } catch (IOException e) {
            log.error("httpclient close fail", e);
        }
    }

    public void setPoolSize(int poolSize) {
        this.poolSize = poolSize;
    }

    public void setTimeoutSeconds(int timeoutSeconds) {
        this.timeoutSeconds = timeoutSeconds;
    }

}

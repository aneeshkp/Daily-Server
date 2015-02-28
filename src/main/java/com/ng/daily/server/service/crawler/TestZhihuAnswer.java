package com.ng.daily.server.service.crawler;

import com.ng.daily.server.service.crawler.zhihu.ZhihuAnswer;

import java.io.IOException;

/**
 * Created by fangs on 15/2/28.
 */
public class TestZhihuAnswer {

    public static void main(String[] args) throws IOException {

        ZhihuAnswer zhihu = new ZhihuAnswer();
        String saveDir = "/tmp/zhihu.com";
        String answerUrl = "http://www.zhihu.com/question/22332149/answer/24682860";
        zhihu.download(saveDir, answerUrl);

    }

}

package com.ng.daily.server.service.post;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * 定时任务
 *
 * Created by fangs on 15/3/1.
 */
@Component
@Lazy(false)
public class PublishScheduler {


    private static final Logger logger = LoggerFactory.getLogger(PublishScheduler.class);

    @Autowired
    private PostService postService;

    @Scheduled(fixedDelay = 5000)
    void doSomethingWithDelay() {
//        logger.debug("I'm doing with delay now!");
    }

    @Scheduled(fixedRate = 5000)
    void doSomethingWithRate() {
//        logger.debug("I'm doing with rate now!");
    }

    @Scheduled(cron = "0/60 * * * * *") // 每分钟触发任务
    void doSomethingWithCron() {
        postService.checkAndDoPost();
    }


}

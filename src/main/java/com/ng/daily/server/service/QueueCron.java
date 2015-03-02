package com.ng.daily.server.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.annotation.Lazy;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

/**
 * Created by fangs on 15/3/1.
 */
@Component
@Lazy(false)
public class QueueCron {


    private static final Logger logger = LoggerFactory.getLogger(QueueCron.class);

    @Scheduled(fixedDelay = 5000)
    void doSomethingWithDelay() {
        logger.debug("I'm doing with delay now!");
    }

    @Scheduled(fixedRate = 5000)
    void doSomethingWithRate() {
        logger.debug("I'm doing with rate now!");
    }

    @Scheduled(cron = "0/5 * * * * *")
    void doSomethingWithCron() {
        logger.debug("I'm doing with cron now!");
    }


}

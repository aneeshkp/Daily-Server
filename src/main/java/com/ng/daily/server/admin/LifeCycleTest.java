package com.ng.daily.server.admin;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * 测试Bean生命周期方法
 * Created by fangs on 15/2/13.
 */
@Component
public class LifeCycleTest implements InitializingBean, DisposableBean {

    public static final Logger log = LoggerFactory.getLogger(LifeCycleTest.class);

    @Override
    public void afterPropertiesSet() throws Exception {
        log.debug("LifeCycleTest afterPropertiesSet");
    }

    @Override
    public void destroy() throws Exception {
        log.debug("LifeCycleTest destroy");
    }

    @PostConstruct
    public void test() {       //startup explanation here
        log.debug("LifeCycleTest PostConstruct");
    }

}
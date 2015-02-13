package com.ng.daily.server.test;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;

/**
 * Created by fangs on 15/2/13.
 */
@Component
public class LifeBean implements InitializingBean, DisposableBean {

    public static final Logger log = LoggerFactory.getLogger(LifeBean.class);

    @Override
    public void afterPropertiesSet() throws Exception {
        log.debug("000000000000000000000000000000000000 afterPropertiesSet");
    }

    @Override
    public void destroy() throws Exception {
        log.debug("000000000000000000000000000000000000 destroy");
    }

    @PostConstruct
    public void test() {       //startup explanation here
        log.debug("000000000000000000000000000000000000 PostConstruct");
    }

}
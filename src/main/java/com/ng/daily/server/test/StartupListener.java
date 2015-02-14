package com.ng.daily.server.test;

import com.ng.daily.server.common.util.SpringContextHolder;
import com.ng.daily.server.entity.User;
import com.ng.daily.server.service.account.AccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * Created by fangs on 15/2/13.
 */
@Component
public class StartupListener implements ApplicationListener<ContextRefreshedEvent> {

    private static final Logger log = LoggerFactory.getLogger(StartupListener.class);

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {

        log.debug("========================start .........");

        System.out.println(SpringContextHolder.getResourceRootRealPath());
        System.out.println(SpringContextHolder.getRootRealPath());
        AccountService accountService = SpringContextHolder.getBean(AccountService.class);
        User admin = accountService.findUserByLoginName("admin");
        if (admin == null) {
            admin = new User();
            admin.setLoginName("admin");
            admin.setName("admin");
            admin.setPlainPassword("admin");
            accountService.registerUser(admin);
            admin.setRoles("admin");
            accountService.updateUser(admin);
        }


    }
}
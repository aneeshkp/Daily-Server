package com.ng.daily.server;

import com.ng.daily.server.common.util.SpringContextHolder;
import com.ng.daily.server.entity.User;
import com.ng.daily.server.service.account.AccountService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.stereotype.Component;

/**
 * Created by fangs on 15/2/13.
 */
@Component
public class StartupListener implements ApplicationListener<ContextRefreshedEvent> {

    private static final Logger log = LoggerFactory.getLogger(StartupListener.class);

    private Boolean inited = Boolean.FALSE;

    @Value(value = "${admin_login_default}")
    private String admin_login_default;
    @Value(value = "${admin_pass_default}")
    private String admin_pass_default;


    /**
     * 会调用两次, 需要自己判断初始化状态
     *
     * @param event
     */
    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {

        if (!inited) {
            try {
                log.debug("server start.........");

                System.err.println(SpringContextHolder.getResourceRootRealPath());
                System.err.println(SpringContextHolder.getRootRealPath());

                AccountService accountService = SpringContextHolder.getBean(AccountService.class);
                User admin = accountService.findUserByLoginName("admin");
                if (admin == null) {
                    admin = new User();
                    admin.setLoginName(admin_login_default);
                    admin.setName(admin_login_default);
                    admin.setPlainPassword(admin_pass_default);
                    accountService.registerUser(admin);
                    admin.setRoles("admin");
                    accountService.updateUser(admin);
                }
            } finally {
                inited = true;
            }

        }
    }
}
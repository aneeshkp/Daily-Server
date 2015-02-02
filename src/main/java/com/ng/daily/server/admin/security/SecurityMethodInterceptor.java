package com.ng.daily.server.admin.security;

import com.ng.daily.server.admin.security.annotation.AdminRequired;
import com.ng.daily.server.admin.security.annotation.LoginRequired;
import com.ng.daily.server.admin.security.exception.LoginException;
import com.ng.daily.server.admin.security.exception.RoleDenyException;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * 校验方法执行权限
 * <p/>
 * Created by fangs on 15/1/21.
 */
@Component
public class SecurityMethodInterceptor implements MethodInterceptor {

    public static final Logger log = LoggerFactory.getLogger(SecurityMethodInterceptor.class);

    private static LoginException loginRequiredException = new LoginException();
    private static RoleDenyException adminRequiredException = new RoleDenyException();

    @Override
    public Object invoke(MethodInvocation invocation) throws Throwable {
        ThreadValue value = ThreadValue.get();
        if (invocation.getMethod().isAnnotationPresent(LoginRequired.class)) {
            if (value == null) {
                throw loginRequiredException;
            }
        }
        if (invocation.getMethod().isAnnotationPresent(AdminRequired.class)) {
            if (value == null) {
                throw loginRequiredException;
            }
            if (value.getIsAdmin() == Boolean.FALSE) {
                throw adminRequiredException;
            }
        }
        return invocation.proceed();
    }

}
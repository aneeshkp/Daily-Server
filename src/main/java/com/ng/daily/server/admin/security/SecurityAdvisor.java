package com.ng.daily.server.admin.security;

import com.ng.daily.server.admin.security.annotation.AdminRequired;
import com.ng.daily.server.admin.security.annotation.LoginRequired;
import org.aopalliance.aop.Advice;
import org.springframework.aop.Pointcut;
import org.springframework.aop.support.AbstractPointcutAdvisor;
import org.springframework.aop.support.StaticMethodMatcherPointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.lang.reflect.Method;

/**
 * Created by fangs on 15/1/21.
 */
@Component
public class SecurityAdvisor extends AbstractPointcutAdvisor {

    private static final long serialVersionUID = 1L;

    private final StaticMethodMatcherPointcut pointcut = new
            StaticMethodMatcherPointcut() {
                @Override
                public boolean matches(Method method, Class<?> targetClass) {
                    return method.isAnnotationPresent(AdminRequired.class)
                            || method.isAnnotationPresent(LoginRequired.class);
                }
            };

    @Autowired
    private SecurityMethodInterceptor interceptor;

    @Override
    public Pointcut getPointcut() {
        return this.pointcut;
    }

    @Override
    public Advice getAdvice() {
        return this.interceptor;
    }
}
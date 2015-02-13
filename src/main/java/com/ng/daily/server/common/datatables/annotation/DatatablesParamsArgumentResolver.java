package com.ng.daily.server.common.datatables.annotation;


import com.ng.daily.server.common.datatables.request.DatatablesMetadata;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

import javax.servlet.http.HttpServletRequest;

/**
 * Declare nos arguments resolvers bean
 * <p>{@code
 *
 * @Override public void addArgumentResolvers(List<HandlerMethodArgumentResolver> argumentResolvers) {
 * argumentResolvers.add(new DatatablesParamsArgumentResolver());
 * }
 * <p/>
 * <p/>
 * }
 */
public class DatatablesParamsArgumentResolver implements HandlerMethodArgumentResolver {
    @Override
    public boolean supportsParameter(MethodParameter parameter) {
        DatatablesParams paramAnnotation = parameter.getParameterAnnotation(DatatablesParams.class);
        if (paramAnnotation != null) {
            if (DatatablesMetadata.class.isAssignableFrom(parameter.getParameterType())) {
                return true;
            }
        }
        return false;
    }

    @Override
    public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception {
        HttpServletRequest request = (HttpServletRequest) webRequest.getNativeRequest();
        return DatatablesMetadata.fromRequest(request);
    }
}

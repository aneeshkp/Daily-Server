package com.ng.daily.server.api.base;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 移动API基础Controller
 * <p/>
 * <pre>
 *     1. success, exception 响应方法
 *     2. 异常捕获, 统一处理
 * </pre>
 * <p/>
 * Created by fangs on 15/1/7.
 */
public abstract class ApiController {

    private static Logger logger = LoggerFactory.getLogger(ApiController.class);

    protected ApiResponse success() {
        return new ApiResponse();
    }

    protected ApiResponse success(Object data) {
        return new ApiResponse(data);
    }

    protected ApiResponse exception(String exception) {
        return new ApiResponse(ApiCode.ERROR, exception);
    }

    protected ApiResponse exception(Exception e) {
        return new ApiResponse(e);
    }

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ApiResponse handleException(Exception e) {
        logger.error("mobile api exception =====>>>>>>>>>>", e);
        e.printStackTrace();
        return exception(e);
    }

}

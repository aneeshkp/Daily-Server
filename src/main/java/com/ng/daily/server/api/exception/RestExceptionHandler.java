package com.ng.daily.server.api.exception;

import com.ng.daily.server.common.mapper.JsonMapper;
import com.ng.daily.server.common.utils.BeanValidators;
import com.ng.daily.server.common.web.MediaTypes;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

import javax.validation.ConstraintViolationException;
import java.util.Map;

/**
 * 自定义ExceptionHandler，专门处理Restful异常.
 *
 * @author calvin
 */
@ControllerAdvice
public class RestExceptionHandler extends ResponseEntityExceptionHandler {
    private JsonMapper jsonMapper = new JsonMapper();

    /**
     * 处理RestException.
     */
    @ExceptionHandler(value = {RestException.class})
    public final ResponseEntity<?> handleException(RestException ex, WebRequest request) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType(MediaTypes.TEXT_PLAIN_UTF_8));
        return handleExceptionInternal(ex, ex.getMessage(), headers, ex.status, request);
    }

    /**
     * 处理JSR311 Validation异常.
     */
    @ExceptionHandler(value = {ConstraintViolationException.class})
    public final ResponseEntity<?> handleException(ConstraintViolationException ex, WebRequest request) {
        Map<String, String> errors = BeanValidators.extractPropertyAndMessage(ex.getConstraintViolations());
        String body = jsonMapper.toJson(errors);
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.parseMediaType(MediaTypes.TEXT_PLAIN_UTF_8));
        return handleExceptionInternal(ex, body, headers, HttpStatus.BAD_REQUEST, request);
    }
}

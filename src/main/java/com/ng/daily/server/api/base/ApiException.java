package com.ng.daily.server.api.base;

import org.springframework.http.HttpStatus;

/**
 * Created by fangs on 15/1/27.
 */
public class ApiException extends RuntimeException {

    public HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;

    public ApiException() {
    }

    public ApiException(HttpStatus status) {
        this.status = status;
    }

    public ApiException(String message) {
        super(message);
    }

    public ApiException(HttpStatus status, String message) {
        super(message);
        this.status = status;
    }

}


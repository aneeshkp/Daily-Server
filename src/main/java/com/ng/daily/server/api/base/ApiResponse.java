package com.ng.daily.server.api.base;

/**
 * 移动API响应对象
 *
 * Created by fangs on 15/1/7.
 */
public class ApiResponse {

    private int code = ApiCode.OK; // 状态码
    private String msg = ""; // 向用户提示的消息(可选)
    private Object data = ""; // 数据
    private String exception = ""; // 异常信息(DEBUG)

    public ApiResponse() {

    }


    /**
     * 正常
     *
     * @param data
     */
    public ApiResponse(Object data) {
        this.data = data;
    }

    /**
     * 异常时使用, 提示用户
     *
     * @param code
     * @param msg
     */
    public ApiResponse(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    /**
     * 异常时使用, DEBUG
     *
     * @param e
     */
    public ApiResponse(Exception e) {
        this.code = ApiCode.ERROR;
        this.exception = e.getMessage();
    }

    /**
     * 异常时使用, DEBUG
     *
     * @param msg
     * @param e
     */
    public ApiResponse(String msg, Exception e) {
        this.code = ApiCode.ERROR;
        this.msg = msg;
        this.exception = e.getMessage();
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getException() {
        return exception;
    }

    public void setException(String exception) {
        this.exception = exception;
    }
}

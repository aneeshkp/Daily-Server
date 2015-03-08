package com.ng.daily.server.admin.base;

import com.google.common.collect.Maps;
import com.ng.daily.server.common.util.BeanValidators;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.ConstraintViolationException;
import javax.validation.Validator;
import java.util.HashMap;
import java.util.List;

/**
 * 系统后台 Controller 功能辅助
 * <p/>
 * Created by fangs on 15/1/27.
 */
public abstract class BaseAdminController {

    protected static final String MESSAGE_DEFAULT = "error";
    protected static final String MESSAGE_SUCCES = "success";
    protected static final String MESSAGE_ERROR = "error";
    protected static final String MESSAGE_ALERT = "alert";

    /**
     * 日志对象
     */
    protected Logger log = LoggerFactory.getLogger(getClass());

    /**
     * 验证Bean实例对象
     */
    @Autowired
    protected Validator validator;

    /**
     * 服务端参数有效性验证
     *
     * @param object 验证的实体对象
     * @param groups 验证组
     * @return 验证成功：返回true；严重失败：将错误信息添加到 message 中
     */
    protected boolean beanValidator(Model model, Object object, Class<?>... groups) {
        try {
            BeanValidators.validateWithException(validator, object, groups);
        } catch (ConstraintViolationException ex) {
            List<String> list = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
            list.add(0, "数据验证失败：");
            addMessage(model, list.toArray(new String[]{}));
            return false;
        }
        return true;
    }

    /**
     * 服务端参数有效性验证
     *
     * @param object 验证的实体对象
     * @param groups 验证组
     * @return 验证成功：返回true；严重失败：将错误信息添加到 flash message 中
     */
    protected boolean beanValidator(RedirectAttributes redirectAttributes, Object object, Class<?>... groups) {
        try {
            BeanValidators.validateWithException(validator, object, groups);
        } catch (ConstraintViolationException ex) {
            List<String> list = BeanValidators.extractPropertyAndMessageAsList(ex, ": ");
            list.add(0, "数据验证失败：");
            addMessage(redirectAttributes, list.toArray(new String[]{}));
            return false;
        }
        return true;
    }

    /**
     * 添加Model消息
     *
     * @param messages 消息
     */
    protected void addMessage(Model model, String... messages) {
        StringBuilder sb = new StringBuilder();
        for (String message : messages) {
            sb.append(message).append(messages.length > 1 ? "<br/>" : "");
        }
        model.addAttribute("message", sb.toString());
    }

    /**
     * 添加Flash消息
     *
     * @param messages 消息
     */
    protected void addMessage(RedirectAttributes redirectAttributes, String... messages) {
        StringBuilder sb = new StringBuilder();
        for (String message : messages) {
            sb.append(message).append(messages.length > 1 ? "<br/>" : "");
        }
        redirectAttributes.addFlashAttribute("message", sb.toString());
        redirectAttributes.addFlashAttribute("type", MESSAGE_DEFAULT);
    }


    /**
     * @param messageType
     * @param redirectAttributes
     * @param messages
     */
    protected void addMessage(String messageType, RedirectAttributes redirectAttributes, String... messages) {
        StringBuilder sb = new StringBuilder();
        for (String message : messages) {
            sb.append(message).append(messages.length > 1 ? "<br/>" : "");
        }
        redirectAttributes.addFlashAttribute("message", sb.toString());
        redirectAttributes.addFlashAttribute("messageType", messageType);
    }

    /**
     * 公共异常处理
     *
     * @param ex
     * @return
     */
    @ExceptionHandler(Exception.class)
    @ResponseBody
    public ModelAndView handleException(Exception ex) {
        log.error("admin controller exception =====>>>>>>>>>>", ex);
        ModelAndView model = new ModelAndView("error/500");
        model.addObject("exception", ex);
        model.addObject(ex);
        return model;
    }


    protected HashMap error() {
        return error(null);
    }

    protected HashMap error(String message) {
        HashMap exception = Maps.newHashMap();
        exception.put("result", "error");
        if (StringUtils.isNotEmpty(message)) {
            exception.put("message", message);
        }
        return exception;
    }

    protected HashMap success() {
        return success(null);
    }

    protected HashMap success(Object data) {
        HashMap map = Maps.newHashMap();
        map.put("result", "ok");
        if (data != null) {
            map.put("data", data);
        }
        return map;
    }


}

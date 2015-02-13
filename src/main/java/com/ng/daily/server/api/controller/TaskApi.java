package com.ng.daily.server.api.controller;

import com.ng.daily.server.api.base.ApiController;
import com.ng.daily.server.api.exception.RestException;
import com.ng.daily.server.common.util.BeanValidators;
import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.entity.Task;
import com.ng.daily.server.service.task.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.util.UriComponentsBuilder;

import javax.validation.Validator;
import java.net.URI;
import java.util.List;

/**
 * Task的Restful API的Controller.
 *
 * @author calvin
 */
@Controller
@RequestMapping(value = "/api/v1/task")
public class TaskApi extends ApiController {

    @Autowired
    private TaskService taskService;

    @Autowired
    private Validator validator;

    @RequestMapping(method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public List<Task> list() {
        return taskService.getAllTask();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Task get(@PathVariable("id") Long id) {
        Task task = taskService.getTask(id);
        if (task == null) {
            String message = "任务不存在(id:" + id + ")";
            log.warn(message);
            throw new RestException(HttpStatus.NOT_FOUND, message);
        }
        return task;
    }

    @RequestMapping(method = RequestMethod.POST, consumes = MediaTypes.JSON)
    @ResponseBody
    public ResponseEntity<?> create(@RequestBody Task task, UriComponentsBuilder uriBuilder) {
        // 调用JSR303 Bean Validator进行校验, 异常将由RestExceptionHandler统一处理.
        BeanValidators.validateWithException(validator, task);

        // 保存任务
        taskService.saveTask(task);

        // 按照Restful风格约定，创建指向新任务的url, 也可以直接返回id或对象.
        Long id = task.getId().longValue();
        URI uri = uriBuilder.path("/api/v1/task/" + id).build().toUri();
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(uri);

        return new ResponseEntity(headers, HttpStatus.CREATED);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.PUT, consumes = MediaTypes.JSON)
    // 按Restful风格约定，返回204状态码, 无内容. 也可以返回200状态码.
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @ResponseBody
    public void update(@RequestBody Task task) {
        // 调用JSR303 Bean Validator进行校验, 异常将由RestExceptionHandler统一处理.
        BeanValidators.validateWithException(validator, task);

        // 保存任务
        taskService.saveTask(task);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @ResponseBody
    public void delete(@PathVariable("id") Long id) {
        taskService.deleteTask(id);
    }
}

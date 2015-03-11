package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import com.ng.daily.server.common.qiniu.QiniuService;
import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.service.scheduler.PublishScheduler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 系统管理
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/system")
public class SystemController extends BaseAdminController {

    @Autowired
    private QiniuService qiniuService;

    @Autowired
    private PublishScheduler publishScheduler;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/system";
    }

    // 配置 异常日志..


    /**
     * 清空七牛文件
     *
     * @return
     */
    @RequestMapping(value = "/clearQiniuFiles", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object clearQiniuFiles() {
        qiniuService.deleteAll();
        return success();
    }

    @RequestMapping(value = "/getSchedulerStatus", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object getSchedulerStatus() {
        if (publishScheduler.isPaused()) {
            return success("status", "paused");
        } else {
            return success("status", "running");
        }
    }

    @RequestMapping(value = "/pauseScheduler", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object pauseScheduler() {
        publishScheduler.setPaused(Boolean.TRUE);
        return success("status", "paused");
    }

    @RequestMapping(value = "/resumeScheduler", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object resumeScheduler() {
        publishScheduler.setPaused(Boolean.FALSE);
        return success("status", "running");
    }

}

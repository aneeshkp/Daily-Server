package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import com.ng.daily.server.common.qiniu.QiniuService;
import com.ng.daily.server.common.util.web.MediaTypes;
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

}

package com.ng.daily.server.api.controller;

import com.google.common.collect.Maps;
import com.ng.daily.server.api.base.ApiController;
import com.ng.daily.server.api.base.ApiResponse;
import com.ng.daily.server.common.util.web.MediaTypes;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

/**
 * Created by fangs on 15/1/27.
 */
@Controller
@RequestMapping(value = "/api/v1/version")
public class VersionApi extends ApiController {

    @RequestMapping(value = "/{platform}/{version}", method = RequestMethod.GET, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public ApiResponse version(@PathVariable(value = "platform") String platform, @PathVariable(value = "version") String version) {
        log.debug("version");
        Map<String, String> map = Maps.newHashMap();
        map.put("platform", platform);
        map.put("version", version);
        return success(map);
    }

}

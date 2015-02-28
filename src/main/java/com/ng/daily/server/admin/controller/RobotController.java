package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import com.ng.daily.server.common.qiniu.QiniuService;
import com.ng.daily.server.common.util.HttpClientManager;
import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.crawler.zhihu.ZhihuAnswer;
import com.ng.daily.server.service.crawler.zhihu.ZhihuDaily;
import com.ng.daily.server.service.post.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

/**
 * Created by fangs on 15/2/13.
 */
@Controller
@RequestMapping(value = "/admin/robot")
public class RobotController extends BaseAdminController {

    @Autowired
    private PostService postService;

    @Autowired
    private QiniuService qiniuService;

    @Autowired
    private HttpClientManager httpClientManager;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public String index() {
        return "admin/robot";
    }

    // 运行状态 抓取日志 抓取量


    @RequestMapping(value = "/getZhihuAnswer", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object getZhihuAnswer(@RequestParam(value = "url", required = true) String url) {
        ZhihuAnswer zhihu = new ZhihuAnswer();
        String saveDir = "/tmp/zhihu.com";
//        String answerUrl = "http://www.zhihu.com/question/22332149/answer/24682860";
        try {
            Post post = zhihu.download(saveDir, url);


            postService.savePost(post);
            log.debug("抓取完成:" + post.getTitle());
        } catch (IOException e) {
            e.printStackTrace();
        }
        return success;
    }


    @RequestMapping(value = "/getZhihuDaily", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object getZhihuDaily(@RequestParam(value = "url", required = true) String url) {
        ZhihuDaily zhihu = new ZhihuDaily();
        String saveDir = "/tmp/zhihu.com";
//        String answerUrl = "http://daily.zhihu.com/story/4559173";
        try {
            Post post = zhihu.download(saveDir, url);



//            for(String imageUrl : post.getImageList()) {
//                ByteArrayOutputStream out = new ByteArrayOutputStream();
//                httpClientManager.httpGet(imageUrl, out);
//                InputStream in = new ByteArrayInputStream(out.toByteArray());
//                String fileName = IDGenerator.getArticleImageId() + ".jpg";
//                String qiniuUrl = qiniuService.upload(in, fileName);
//                String newContent = post.getContent().replaceAll(imageUrl,qiniuUrl);
//                post.setContent(newContent);
//            }

            postService.savePost(post);
            success.put("post", post);

            log.debug("抓取完成:" + post.getTitle());
        } catch (IOException e) {
            e.printStackTrace();
            return exception;
        }
        return success;
    }

}

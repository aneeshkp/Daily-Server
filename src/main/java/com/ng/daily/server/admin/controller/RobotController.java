package com.ng.daily.server.admin.controller;

import com.google.common.collect.Lists;
import com.ng.daily.server.admin.IDGenerator;
import com.ng.daily.server.admin.base.BaseAdminController;
import com.ng.daily.server.common.qiniu.QiniuService;
import com.ng.daily.server.common.util.HttpClientManager;
import com.ng.daily.server.common.util.web.MediaTypes;
import com.ng.daily.server.entity.Post;
import com.ng.daily.server.service.crawler.douban.DongxiDownloader;
import com.ng.daily.server.service.crawler.readability.ReadabilityDownloader;
import com.ng.daily.server.service.crawler.zhihu.ZhihuAnswerDownloader;
import com.ng.daily.server.service.crawler.zhihu.ZhihuDailyDownloader;
import com.ng.daily.server.service.post.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 爬虫
 * <p/>
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

    private Post checkExisted(String url) {
        List<Post> postList = postService.findByCrawlerUrl(url);
        if (postList != null && postList.size() > 0) {
            return postList.get(0);
        } else {
            return null;
        }
    }

    /**
     * 通用正文提取
     *
     * @param url
     * @return
     */
    @RequestMapping(value = "/getReadability", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object getReadability(@RequestParam(value = "url", required = true) String url,
                                 @RequestParam(value = "toQiniu", required = false) boolean toQiniu,
                                 @RequestParam(value = "forceCrawl", required = false) boolean forceCrawl) throws Exception {
        ReadabilityDownloader downloader = new ReadabilityDownloader();
        Post post = checkExisted(url);
        if (post == null || forceCrawl) {
            post = downloader.download(url);

            // TOOD 提取图片上传到七牛
            if (toQiniu) {

            }

            postService.savePost(post);
            log.debug("抓取完成:" + post.getTitle());
        } else {
            log.debug("重复URL:" + url);
        }
        return success("post", post);
    }


    /**
     * 知乎答案
     *
     * @param url
     * @return
     */
    @RequestMapping(value = "/getZhihuAnswer", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object getZhihuAnswer(@RequestParam(value = "url", required = true) String url,
                                 @RequestParam(value = "toQiniu", required = false) boolean toQiniu,
                                 @RequestParam(value = "forceCrawl", required = false) boolean forceCrawl) throws Exception {
        ZhihuAnswerDownloader downloader = new ZhihuAnswerDownloader();
        Post post = checkExisted(url);
        try {

            if (post == null || forceCrawl) {
                post = downloader.download(url);


                // TOOD 提取图片上传到七牛
                if (toQiniu) {

                }


                postService.savePost(post);
                log.debug("抓取完成:" + post.getTitle());
            } else {
                log.debug("重复URL:" + url);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return success("post", post);
    }


    /**
     * 知乎日报
     *
     * @param url
     * @return
     */
    @RequestMapping(value = "/getZhihuDaily", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object getZhihuDaily(@RequestParam(value = "url", required = true) String url,
                                @RequestParam(value = "toQiniu", required = false) boolean toQiniu,
                                @RequestParam(value = "forceCrawl", required = false) boolean forceCrawl) throws Exception {

        ZhihuDailyDownloader downloader = new ZhihuDailyDownloader();
        Post post = checkExisted(url);
        try {
            if (post == null || forceCrawl) {
                post = downloader.download(url);

                if (toQiniu) {
                    List<String> imageListCopy = new ArrayList<>();
                    imageListCopy.addAll(post.getImageList());
                    for (String imageUrl : imageListCopy) {
                        String fileName = IDGenerator.getArticleImageId() + ".jpg";
                        String qiniuUrl = qiniuService.uploadWithURL(imageUrl, fileName);
                        String newContent = post.getContent().replaceAll(imageUrl, qiniuUrl);
                        post.setContent(newContent);

                        if (post.getImageList().contains(imageUrl)) {
                            post.getImageList().remove(imageUrl);
                            post.getImageList().add(qiniuUrl);
                        }

                    }
                }

                postService.savePost(post);
                log.debug("抓取完成:" + post.getTitle());

            } else {
                log.debug("重复URL:" + url);
            }
            log.debug("抓取完成:" + post.getTitle());
        } catch (IOException e) {
            e.printStackTrace();
            return error(e.getMessage());
        }
        return success("post", post);
    }


    /**
     * 豆瓣东西
     *
     * @param url
     * @return
     */
    @RequestMapping(value = "/getDoubanDongxi", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public Object getDoubanDongxi(@RequestParam(value = "url", required = true) String url,
                                  @RequestParam(value = "toQiniu", required = false) boolean toQiniu,
                                  @RequestParam(value = "forceCrawl", required = false) boolean forceCrawl) throws Exception {
        DongxiDownloader downloader = new DongxiDownloader();
        Post post = checkExisted(url);
        try {
            if (post == null || forceCrawl) {
                post = downloader.download(url);

                if (toQiniu) {
                    List<String> newImageList = Lists.newArrayList();
                    for (String imageUrl : post.getImageList()) {
                        String fileName = IDGenerator.getFragmentImageId() + ".jpg";
                        String qiniuUrl = qiniuService.uploadWithURL(imageUrl, fileName);
                        newImageList.add(qiniuUrl);
                    }
                    post.setImageList(newImageList);
                }

                postService.savePost(post);
                log.debug("抓取完成:" + post.getTitle());
            } else {
                log.debug("重复URL:" + url);
            }
            log.debug("抓取完成:" + post.getTitle());
        } catch (IOException e) {
            e.printStackTrace();
            return error(e.getMessage());
        }
        return success("post", post);
    }

}

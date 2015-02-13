package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import com.ng.daily.server.common.qiniu.QiniuService;
import com.ng.daily.server.common.util.web.MediaTypes;
import org.apache.commons.io.FileUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;

/**
 * Created by fangs on 15/2/14.
 */
@Controller
@RequestMapping(value = "/admin/image")
public class ImageUploadController extends BaseAdminController {

    @Value("${image.upload.path}")
    private String imageUploadPath; // 图片上传路径

    @Autowired
    private QiniuService qiniuService;

    @RequestMapping(value = "/upload/article", method = RequestMethod.POST)
    @ResponseBody
    public String uploadArticleImage(@RequestParam(value = "file", required = true) MultipartFile file) throws IOException {
        String imageUrl = null;
        if (!file.isEmpty()) {
            String fileName = "A" + DateTime.now().toString("yyyyMMddHHmmss") + ".jpg";
            // 保存原图
            File origFile = new File(imageUploadPath, fileName);
            FileUtils.touch(origFile);
            FileUtils.writeByteArrayToFile(origFile, file.getBytes());
            // 上传到七牛
            imageUrl = qiniuService.uploadFile(origFile.getAbsolutePath(), fileName);
        }
        log.debug("imageUrl = " + imageUrl);
        return imageUrl;
    }

    @RequestMapping(value = "/upload/fragment", method = RequestMethod.POST, produces = MediaTypes.JSON_UTF_8)
    @ResponseBody
    public String uploadFragmentImage(@RequestParam(value = "file", required = true) MultipartFile file) throws IOException {
        String imageUrl = null;
        if (!file.isEmpty()) {
            String fileName = "F" + DateTime.now().toString("yyyyMMddHHmmss") + ".jpg";
            // 保存原图
            File origFile = new File(imageUploadPath, fileName);
            FileUtils.touch(origFile);
            FileUtils.writeByteArrayToFile(origFile, file.getBytes());
            // 上传到七牛
            imageUrl = qiniuService.uploadFile(origFile.getAbsolutePath(), fileName);
        }
        log.debug("imageUrl = " + imageUrl);
        return imageUrl;
    }
}

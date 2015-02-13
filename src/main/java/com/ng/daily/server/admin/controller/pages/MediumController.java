package com.ng.daily.server.admin.controller.pages;

import com.ng.daily.server.common.qiniu.QiniuService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.util.Map;

/**
 * Created by fangs on 15/2/11.
 */
@Controller
@RequestMapping(value = "/admin/pages")
public class MediumController {


    @Value("image.upload.path")
    private String imageUploadPath; // 图片上传路径

    @Value("image.placeholder")
    private String imagePlaceHolder; // 默认图片

    @Autowired
    private QiniuService qiniuService;

    @RequestMapping(value = "/medium", method = RequestMethod.GET)
    public String medium() {
        return "admin/pages/medium";
    }


    @RequestMapping(value = "/medium/save", method = RequestMethod.POST)
    @ResponseBody
    public String upload(HttpServletRequest request, HttpServletResponse response) {
        System.out.println(request.toString());
        Map<String, String[]> map = request.getParameterMap();

        try {
            String content = IOUtils.toString(request.getInputStream(), "UTF-8");
            System.out.println(content);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "";
    }

    @RequestMapping(value = "/medium/upload", method = RequestMethod.POST)
    @ResponseBody
    public String upload(
//                         @RequestParam(value = "name", required = false) String name,
            @RequestParam(value = "file", required = true) MultipartFile file) throws IOException {

        String imageUrl = imagePlaceHolder;
        if (!file.isEmpty()) {

            //yyyy-MM-dd HH:mm:ss.fff
            String fileName = DateTime.now().toString("yyyyMMddHHmmss") + ".jpg";

            // 保存原图
            File origFile = new File(imageUploadPath, fileName);
            FileUtils.touch(origFile);
            FileUtils.writeByteArrayToFile(origFile, file.getBytes());

            // 创建缩略图
//            BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
//            File destination = new File("File directory with file name");
//            ImageIO.write(src, "png", destination);

            imageUrl = qiniuService.uploadFile(origFile.getAbsolutePath(), fileName);


//            ByteArrayOutputStream os = new ByteArrayOutputStream();
//            ImageIO.write(image, "gif", os);
//            InputStream is = new ByteArrayInputStream(os.toByteArray());
//            FileUtils.copyInputStreamToFile(is, file);

            // 返回图片路径

        }
        return imageUrl;

    }


}

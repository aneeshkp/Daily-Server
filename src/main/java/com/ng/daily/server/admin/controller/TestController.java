package com.ng.daily.server.admin.controller;

import com.ng.daily.server.admin.base.BaseAdminController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;

/**
 * Created by fangs on 15/2/1.
 */
@Controller
@RequestMapping(value = "/admin/pages")
public class TestController extends BaseAdminController {

    @RequestMapping(method = RequestMethod.GET)
    public String defaultPage(RedirectAttributes attributes) {
//        addMessage(MESSAGE_ALERT, attributes, "欢迎");
//        return "redirect:index";
        return "admin/pages/index";
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index() {
        return "admin/pages/index";
    }

    @RequestMapping(value = "/flot", method = RequestMethod.GET)
    public String flot() {
        return "admin/pages/flot";
    }

    @RequestMapping(value = "/morris", method = RequestMethod.GET)
    public String morris() {
        return "admin/pages/morris";
    }

    @RequestMapping(value = "/tables", method = RequestMethod.GET)
    public String tables() {
        return "admin/pages/tables";
    }

    @RequestMapping(value = "/forms", method = RequestMethod.GET)
    public String forms() {
        return "admin/pages/forms";
    }

    @RequestMapping(value = "/panels-wells", method = RequestMethod.GET)
    public String panelsWells() {
        return "admin/pages/panels-wells";
    }

    @RequestMapping(value = "/buttons", method = RequestMethod.GET)
    public String buttons() {
        return "admin/pages/buttons";
    }

    @RequestMapping(value = "/notifications", method = RequestMethod.GET)
    public String notifications() {
        return "admin/pages/notifications";
    }

    @RequestMapping(value = "/typography", method = RequestMethod.GET)
    public String typography() {
        return "admin/pages/typography";
    }

    @RequestMapping(value = "/icons", method = RequestMethod.GET)
    public String icons() {
        return "admin/pages/icons";
    }

    @RequestMapping(value = "/grid", method = RequestMethod.GET)
    public String grid() {
        return "admin/pages/grid";
    }

    @RequestMapping(value = "/blank", method = RequestMethod.GET)
    public String blank() {
        return "admin/pages/blank";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "admin/pages/login";
    }

    @RequestMapping(value = "/medium", method = RequestMethod.GET)
    public String medium() {
        return "admin/pages/medium";
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public String handleFormUpload(
            @RequestParam("file") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
            File destination = new File("File directory with file name");
            ImageIO.write(src, "png", destination);
        }
        return "";
    }

}

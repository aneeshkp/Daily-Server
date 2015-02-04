package com.ng.daily.server.util.web;

import com.github.bingoohuang.patchca.background.BackgroundFactory;
import com.github.bingoohuang.patchca.color.ColorFactory;
import com.github.bingoohuang.patchca.color.RandomColorFactory;
import com.github.bingoohuang.patchca.custom.ConfigurableCaptchaService;
import com.github.bingoohuang.patchca.filter.ConfigurableFilterFactory;
import com.github.bingoohuang.patchca.filter.library.AbstractImageOp;
import com.github.bingoohuang.patchca.filter.library.WobbleImageOp;
import com.github.bingoohuang.patchca.font.RandomFontFactory;
import com.github.bingoohuang.patchca.service.Captcha;
import com.github.bingoohuang.patchca.text.renderer.BestFitTextRenderer;
import com.github.bingoohuang.patchca.text.renderer.TextRenderer;
import com.github.bingoohuang.patchca.word.RandomWordFactory;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.PostConstruct;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.BufferedImageOp;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

/**
 * 验证码
 *
* Created by fangs on 15/1/14.
*/
@Controller
@RequestMapping(value = "/captcha")
public class CaptchaController {

    private static final Logger log = LoggerFactory.getLogger(CaptchaController.class);

    private ConfigurableCaptchaService configurableCaptchaService = null;
    private ColorFactory colorFactory = null;
    private RandomFontFactory fontFactory = null;
    private RandomWordFactory wordFactory = null;
    private TextRenderer textRenderer = null;

    @RequestMapping(value = "", method = RequestMethod.GET)
    public void getCaptcha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("image/png");
        response.setHeader("cache", "no-cache");

        HttpSession session = request.getSession(true);
        OutputStream outputStream = response.getOutputStream();

        // 得到验证码对象,有验证码图片和验证码字符串
        Captcha captcha = configurableCaptchaService.getCaptcha();
        // 取得验证码字符串放入Session
        String validationCode = captcha.getChallenge();
        session.setAttribute("validationCode", validationCode);
        // 取得验证码图片并输出
        BufferedImage bufferedImage = captcha.getImage();
        ImageIO.write(bufferedImage, "png", outputStream);

        outputStream.flush();
        outputStream.close();
    }

    @RequestMapping(value="" ,method = RequestMethod.POST)
    public void validCaptcha(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);
        String code = String.valueOf(session.getAttribute("validationCode"));
        String inputCode = request.getParameter("captcha");
        Boolean result = Boolean.FALSE;
        if (code != null && code.equals(inputCode)) {
            result = Boolean.TRUE;
        }
        response.setContentType("text/json; charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter pw = response.getWriter();
        pw.write("{\"" + "valid" + "\":" + String.valueOf(result) + "}");
        pw.close();
    }


    @PostConstruct
    public void init() throws Exception {
        configurableCaptchaService = new ConfigurableCaptchaService();

        // 颜色创建工厂,使用一定范围内的随机色
        colorFactory = new RandomColorFactory();
        configurableCaptchaService.setColorFactory(colorFactory);

        // 随机字体生成器
        fontFactory = new RandomFontFactory();
        fontFactory.setMaxSize(32);
        fontFactory.setMinSize(28);
        configurableCaptchaService.setFontFactory(fontFactory);

        // 随机字符生成器,去除掉容易混淆的字母和数字,如o和0等
        wordFactory = new RandomWordFactory();
        wordFactory.setCharacters("abcdefghkmnpqstwxyz23456789");
        wordFactory.setMaxLength(5);
        wordFactory.setMinLength(4);
        configurableCaptchaService.setWordFactory(wordFactory);

        // 自定义验证码图片背景
        MyCustomBackgroundFactory backgroundFactory = new MyCustomBackgroundFactory();
        configurableCaptchaService.setBackgroundFactory(backgroundFactory);

        // 图片滤镜设置
        ConfigurableFilterFactory filterFactory = new ConfigurableFilterFactory();

        List<BufferedImageOp> filters = new ArrayList<BufferedImageOp>();
        WobbleImageOp wobbleImageOp = new WobbleImageOp();
        wobbleImageOp.setEdgeMode(AbstractImageOp.EDGE_MIRROR);
        wobbleImageOp.setxAmplitude(2.0);
        wobbleImageOp.setyAmplitude(1.0);
        filters.add(wobbleImageOp);
        filterFactory.setFilters(filters);

        configurableCaptchaService.setFilterFactory(filterFactory);

        // 文字渲染器设置
        textRenderer = new BestFitTextRenderer();
        textRenderer.setBottomMargin(3);
        textRenderer.setTopMargin(3);
        configurableCaptchaService.setTextRenderer(textRenderer);

        // 验证码图片的大小
        configurableCaptchaService.setWidth(82);
        configurableCaptchaService.setHeight(32);
    }

    /**
     * 自定义验证码图片背景,主要画一些噪点和干扰线
     */
    private class MyCustomBackgroundFactory implements BackgroundFactory {
        private Random random = new Random();

        public void fillBackground(BufferedImage image) {
            Graphics graphics = image.getGraphics();

            // 验证码图片的宽高
            int imgWidth = image.getWidth();
            int imgHeight = image.getHeight();

            // 填充为白色背景
            graphics.setColor(Color.WHITE);
            graphics.fillRect(0, 0, imgWidth, imgHeight);

            // 画100个噪点(颜色及位置随机)
            for (int i = 0; i < 100; i++) {
                // 随机颜色
                int rInt = random.nextInt(255);
                int gInt = random.nextInt(255);
                int bInt = random.nextInt(255);

                graphics.setColor(new Color(rInt, gInt, bInt));

                // 随机位置
                int xInt = random.nextInt(imgWidth - 3);
                int yInt = random.nextInt(imgHeight - 2);

                // 随机旋转角度
                int sAngleInt = random.nextInt(360);
                int eAngleInt = random.nextInt(360);

                // 随机大小
                int wInt = random.nextInt(6);
                int hInt = random.nextInt(6);

                graphics.fillArc(xInt, yInt, wInt, hInt, sAngleInt, eAngleInt);

                // 画5条干扰线
                if (i % 20 == 0) {
                    int xInt2 = random.nextInt(imgWidth);
                    int yInt2 = random.nextInt(imgHeight);
                    graphics.drawLine(xInt, yInt, xInt2, yInt2);
                }
            }
        }
    }

}

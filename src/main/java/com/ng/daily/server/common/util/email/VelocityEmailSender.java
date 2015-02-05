package com.ng.daily.server.common.util.email;


import org.apache.velocity.app.VelocityEngine;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;
import org.springframework.ui.velocity.VelocityEngineUtils;

import javax.mail.internet.MimeMessage;
import java.util.HashMap;
import java.util.Map;

/**
* 邮件
* <p/>
* Created by fangs on 15/1/15.
*/
@Component
public class VelocityEmailSender {

    private static final Logger log = LoggerFactory.getLogger(VelocityEmailSender.class);

    @Value("${mail.systemEmail}")
    private String systemEmail; // 邮件链接前缀

    private final VelocityEngine velocityEngine;
    private final JavaMailSender mailSender;

    @Autowired
    public VelocityEmailSender(VelocityEngine velocityEngine, JavaMailSender mailSender) {
        this.velocityEngine = velocityEngine;
        this.mailSender = mailSender;
    }

    public void sendRegisterMail(String email, String verifyLink) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("email", email);
        params.put("verifyLink", verifyLink);
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(systemEmail);
        message.setTo(email);
        message.setSubject("大家社区开发平台账号激活");
        send(message, params, "registerVerify.vm");

        log.debug("账号激活邮件发送完成: email=" + email + ",verifyLink=" + verifyLink);
    }

    public void sendResetPasswordMail(String email, String verifyLink) {
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("email", email);
        params.put("verifyLink", verifyLink);
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(systemEmail);
        message.setTo(email);
        message.setSubject("重置大家社区开发平台密码");
        send(message, params, "resetPassword.vm");

        log.debug("重置密码邮件发送完成: email=" + email + ",verifyLink=" + verifyLink);
    }

    /**
     * Sends e-mail using Velocity template for the body and
     * the properties passed in as Velocity variables.
     *
     * @param msg                The e-mail message to be sent, except for the body.
     * @param hTemplateVariables Variables to use when processing the template.
     */
    @Async
    private void send(final SimpleMailMessage msg,
                      final Map<String, Object> hTemplateVariables, final String templateName) {
        MimeMessagePreparator preparator = new MimeMessagePreparator() {
            public void prepare(MimeMessage mimeMessage) throws Exception {
                MimeMessageHelper message = new MimeMessageHelper(mimeMessage, "UTF-8");
                message.setTo(msg.getTo());
                message.setFrom(msg.getFrom());
                message.setSubject(msg.getSubject());
                String body = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, templateName, "UTF-8", hTemplateVariables);
                message.setText(body, true);
            }
        };

        mailSender.send(preparator);
    }


}


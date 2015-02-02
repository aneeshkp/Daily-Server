package com.ng.daily.server.common;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.ConfigurableWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 启动加载处理
 * <p/>
 * Created by fangs on 15/1/29.
 */
public class CommonDispatcherServlet extends DispatcherServlet {

    private static final long serialVersionUID = 2959768372779854322L;
    private static Logger log = LoggerFactory.getLogger(CommonDispatcherServlet.class);

    @Override
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
        loadSystemConfig();
    }

    @Override
    public void setContextConfigLocation(String contextConfigLocation) {
        super.setContextConfigLocation(contextConfigLocation);
    }

    @Override
    protected void initFrameworkServlet() throws ServletException {
        super.initFrameworkServlet();
    }

    @Override
    protected void postProcessWebApplicationContext(
            ConfigurableWebApplicationContext wac) {
        super.postProcessWebApplicationContext(wac);
    }

    @Override
    protected ModelAndView processHandlerException(HttpServletRequest request, HttpServletResponse response,
                                                   Object handler, Exception ex) throws Exception {
        return super.processHandlerException(request, response, handler, ex);
    }

    @Override
    public void destroy() {
        super.destroy();
    }

    private void loadSystemConfig() {
        String servletName = getServletContext().getServletContextName();

        StringBuilder buf = new StringBuilder("==> 开始初始化 [");
        buf.append(servletName);
        buf.append("]... ....");
        log.info(buf.toString());

    }

}

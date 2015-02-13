<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">


            <li class="sidebar-search">
                <div class="input-group custom-search-form">
                    <input type="text" class="form-control" placeholder="搜索...">
                    <span class="input-group-btn">
                    <button class="btn btn-default" type="button">
                        <i class="fa fa-search"></i>
                    </button>
                    </span>
                </div>
                <!-- /input-group -->
            </li>

            <li>
                <a href="${ctx}/admin/article/"><i class="fa fa-edit fa-fw"></i> 编辑文章</a>
            </li>
            <li>
                <a href="${ctx}/admin/fragment/"><i class="fa fa-edit fa-fw"></i> 编辑碎片</a>
            </li>
            <li>
                <a href="${ctx}/admin/draft/"><i class="fa fa-inbox fa-fw"></i> 草稿箱</a>
            </li>
            <li>
                <a href="${ctx}/admin/postqueue/"><i class="fa fa-paper-plane fa-fw"></i> 发布队列</a>
            </li>
            <li>
                <a href="${ctx}/admin/onlinelist/"><i class="fa fa-list  fa-fw"></i> 已发布列表</a>
            </li>
            <li>
                <a href="${ctx}/admin/robot/"><i class="fa fa-beer fa-fw"></i> 抓取机器人</a>
            </li>
            <li>
                <a href="${ctx}/admin/respool/"><i class="fa fa-retweet fa-fw"></i> 资源池</a>
            </li>
            <li>
                <a href="${ctx}/admin/operation/"><i class="fa fa-weixin fa-fw"></i> 运营管理</a>
            </li>
            <li>
                <a href="${ctx}/admin/system/"><i class="fa fa-cog fa-fw"></i> 系统管理</a>
            </li>



            <li>
                <a href="${ctx}/demo/pages/ueditor"><i class="fa fa-dashboard fa-fw"></i> UEditor</a>
            </li>
            <li>
                <a href="${ctx}/demo/pages/webuploader"><i class="fa fa-dashboard fa-fw"></i> Uploader</a>
            </li>

            <li>
                <a href="${ctx}/demo/pages/tables"><i class="fa fa-table fa-fw"></i> Tables</a>
            </li>
            <li>
                <a href="${ctx}/demo/pages/forms"><i class="fa fa-edit fa-fw"></i> Forms</a>
            </li>
            <li>
                <a href="#"><i class="fa fa-wrench fa-fw"></i> UI Elements<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${ctx}/demo/pages/panels-wells">Panels and Wells</a>
                    </li>
                    <li>
                        <a href="${ctx}/demo/pages/buttons">Buttons</a>
                    </li>
                    <li>
                        <a href="${ctx}/demo/pages/notifications">Notifications</a>
                    </li>
                    <li>
                        <a href="${ctx}/demo/pages/typography">Typography</a>
                    </li>
                    <li>
                        <a href="${ctx}/demo/pages/icons"> Icons</a>
                    </li>
                    <li>
                        <a href="${ctx}/demo/pages/grid">Grid</a>
                    </li>
                </ul>
                <!-- /.nav-second-level -->
            </li>





            <%--<li>--%>
                <%--<a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Charts<span class="fa arrow"></span></a>--%>
                <%--<ul class="nav nav-second-level">--%>
                    <%--<li>--%>
                        <%--<a href="${ctx}/demo/pages/flot">Flot Charts</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="${ctx}/demo/pages/morris">Morris.js Charts</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <%--<!-- /.nav-second-level -->--%>
            <%--</li>--%>
            <%----%>
            <%--<li>--%>
                <%--<a href="#"><i class="fa fa-sitemap fa-fw"></i> Multi-Level Dropdown<span--%>
                        <%--class="fa arrow"></span></a>--%>
                <%--<ul class="nav nav-second-level">--%>
                    <%--<li>--%>
                        <%--<a href="#">Second Level Item</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="#">Second Level Item</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="#">Third Level <span class="fa arrow"></span></a>--%>
                        <%--<ul class="nav nav-third-level">--%>
                            <%--<li>--%>
                                <%--<a href="#">Third Level Item</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">Third Level Item</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">Third Level Item</a>--%>
                            <%--</li>--%>
                            <%--<li>--%>
                                <%--<a href="#">Third Level Item</a>--%>
                            <%--</li>--%>
                        <%--</ul>--%>
                        <%--<!-- /.nav-third-level -->--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <%--<!-- /.nav-second-level -->--%>
            <%--</li>--%>
            <%--<li>--%>
                <%--<a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span--%>
                        <%--class="fa arrow"></span></a>--%>
                <%--<ul class="nav nav-second-level">--%>
                    <%--<li>--%>
                        <%--<a href="${ctx}/demo/pages/blank">Blank Page</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                        <%--<a href="${ctx}/demo/pages/login">Login Page</a>--%>
                    <%--</li>--%>
                <%--</ul>--%>
                <%--<!-- /.nav-second-level -->--%>
            <%--</li>--%>


        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->
<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<div class="navbar-default sidebar" role="navigation">
    <div class="sidebar-nav navbar-collapse">
        <ul class="nav" id="side-menu">


            <%--<li class="sidebar-search">--%>
                <%--<div class="input-group custom-search-form">--%>
                    <%--<input type="text" class="form-control" placeholder="搜索...">--%>
                    <%--<span class="input-group-btn">--%>
                    <%--<button class="btn btn-default" type="button">--%>
                        <%--<i class="fa fa-search"></i>--%>
                    <%--</button>--%>
                    <%--</span>--%>
                <%--</div>--%>
                <%--<!-- /input-group -->--%>
            <%--</li>--%>

            <li>
                <a href="${ctx}/admin/summary/"><i class="fa fa-dashboard fa-fw"></i> 概要</a>
            </li>


            <li class="active">
                <a href="#"><i class="fa fa-edit fa-fw"></i> 编辑<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="${ctx}/admin/article/"><i  ></i> 编辑文章</a>
                    </li>
                    <li>
                        <a href="${ctx}/admin/fragment/"><i  ></i> 编辑碎片</a>
                    </li>
                </ul>
            </li>

            <li>
                <a href="${ctx}/admin/draft/"><i class="fa fa-inbox fa-fw"></i> 草稿箱</a>
            </li>
            <li>
                <a href="${ctx}/admin/queue/"><i class="fa fa-paper-plane fa-fw"></i> 发布队列</a>
            </li>
            <li>
                <a href="${ctx}/admin/online/"><i class="fa fa-list  fa-fw"></i> 已发布列表</a>
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
                <a href="${ctx}/admin/waterfall/"><i class="fa fa-newspaper-o fa-fw"></i> 瀑布流</a>
            </li>


        </ul>
    </div>
    <!-- /.sidebar-collapse -->
</div>
<!-- /.navbar-static-side -->
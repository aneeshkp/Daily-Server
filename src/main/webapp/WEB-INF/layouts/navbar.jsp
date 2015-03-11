<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="${ctx}/admin/">绿草鞋 <small style="color:darkgray;"><em>重生</em></small></a>
</div>
<!-- /.navbar-header -->

<ul class="nav navbar-top-links navbar-right">


    <shiro:hasRole name="admin">
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="${ctx}/admin/profile"><i class="fa fa-user fa-fw"></i> <shiro:principal
                        property="name"/></a>
                </li>
                <shiro:hasRole name="admin">
                    <li><a href="${ctx}/admin/user/list"><i class="fa fa-gear fa-fw"></i> 用户管理</a>
                    </li>
                </shiro:hasRole>
                <li class="divider"></li>
                <li><a href="${ctx}/admin/logout"><i class="fa fa-sign-out fa-fw"></i> 退出</a>
                </li>

            </ul>
            <!-- /.dropdown-user -->
        </li>

    </shiro:hasRole>

    <!-- /.dropdown -->
</ul>
<!-- /.navbar-top-links -->
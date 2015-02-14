<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="header">
    <div id="title">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">

            <jsp:include page="navbar.jsp"></jsp:include>

            <shiro:hasRole name="admin">
                <jsp:include page="left.jsp"></jsp:include>
            </shiro:hasRole>

        </nav>

    </div>
</div>
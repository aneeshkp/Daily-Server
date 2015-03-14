<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <title>绿草鞋:<sitemesh:title/></title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">


    <link rel="stylesheet" href="${ctx}/static/site/libs/foundation-5.5.1/css/foundation.css">

    <!-- This is how you would link your custom stylesheet -->
    <link rel="stylesheet" href="${ctx}/static/site/libs/foundation-5.5.1/css/app.css">

    <script src="${ctx}/static/site/libs/foundation-5.5.1/js/vendor/modernizr.js"></script>

    <sitemesh:head/>
</head>

<body>

<%@ include file="/WEB-INF/layouts/site/menu.jsp" %>
<%--<%@ include file="/WEB-INF/layouts/site/navbar.jsp" %>--%>
<%@ include file="/WEB-INF/layouts/site/footer.jsp" %>

</body>
</html>



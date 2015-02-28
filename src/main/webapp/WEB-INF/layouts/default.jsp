<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fns" uri="/WEB-INF/tlds/fns.tld" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>

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
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>

    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">

    <!-- Bootstrap Core CSS -->
    <link href="${ctx}/static/libs/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="${ctx}/static/libs/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${ctx}/static/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="${ctx}/static/libs/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="${ctx}/static/libs/html5shiv.js"></script>
    <script src="${ctx}/static/libs/respond.min.js"></script>
    <![endif]-->

    <!-- jQuery -->
    <script src="${ctx}/static/libs/jquery/jquery.min.js"></script>
    <%--<script src="${ctx}/static/libs/datatables-editor/jquery-1.11.1.min.js"></script>--%>

    <!-- Bootstrap Core JavaScript -->
    <script src="${ctx}/static/libs/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="${ctx}/static/libs/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="${ctx}/static/js/sb-admin-2.js"></script>

    <!-- JBox -->
    <link href="${ctx}/static/libs/jBox/jBox.css" rel="stylesheet"/>
    <script src="${ctx}/static/libs/jBox/jBox.js" type="text/javascript"></script>


    <!-- FormValidation CSS file -->
    <link rel="stylesheet" href="${ctx}/static/libs/formvalidation/css/formValidation.min.css">
    <!-- FormValidation plugin and the class supports validating Bootstrap form -->
    <script src="${ctx}/static/libs/formvalidation/js/formValidation.js"></script>
    <script src="${ctx}/static/libs/formvalidation/js/framework/bootstrap.min.js"></script>
    <script src="${ctx}/static/libs/formvalidation/js/language/zh_CN.js"></script>

    <script>
        var _ctxPath = "${ctx}";

        // 确认
        $(document).ready(function () {
            new jBox('Confirm', {
                confirmButton: '确定',
                cancelButton: '取消'
            });
        });
        // 提醒
        function notice(msg) {
            new jBox('Notice', {
                content: msg, color: 'green',
                autoClose: 1000, position: {x: 'center', y: 'center'}
            });
        }

    </script>

    <sitemesh:head/>
</head>

<body>
<tags:message content="${message}" type="${type}"/>
<%@ include file="/WEB-INF/layouts/header.jsp" %>
<sitemesh:body/>
<%@ include file="/WEB-INF/layouts/footer.jsp" %>

</body>
</html>
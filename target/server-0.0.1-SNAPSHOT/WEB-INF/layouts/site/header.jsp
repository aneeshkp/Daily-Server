<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="{{ site.description }}">

    <title>{% if page.title %}{{ page.title }} - {{ site.title }}{% else %}{{ site.title }}{% endif %}</title>

    <link rel="canonical" href="{{ page.url | replace:'index.html','' | prepend: site.baseurl | prepend: site.url }}">

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="${ctx}/static/site/css/bootstrap.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="${ctx}/static/site/css/clean-blog.min.css">

    <!-- Pygments Github CSS -->
    <link rel="stylesheet" href="${ctx}/static/site/css/syntax.css">

    <!-- Custom Fonts -->
    <link href="${ctx}/static/site/css/font-awesome.min.css" rel="stylesheet"
          type="text/css">

    <link href='${ctx}/static/site/css/fonts.googleapis.com.lora.css' rel='stylesheet'
          type='text/css'>
    <link href='${ctx}/static/site/css/fonts.googleapis.com.opensans.css'
          rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="${ctx}/static/libs/html5shiv.js"></script>
    <script src="${ctx}/static/libs/respond.min.js"></script>
    <![endif]-->

</head>

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
    <meta http-equiv="Cache-Control" content="no-store"/>
    <meta http-equiv="Pragma" content="no-cache"/>
    <meta http-equiv="Expires" content="0"/>

    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">


    <sitemesh:head/>
</head>

<body>
<%@ include file="/WEB-INF/layouts/site/header.jsp" %>
<%@ include file="/WEB-INF/layouts/site/navbar.jsp" %>
<sitemesh:body/>


<!-- Post Header -->
<header class="intro-header"
        style="background-image: url('{{ site.baseurl }}/{% if page.header-img %}{{ page.header-img }}{% else %}{{ site.header-img }}{% endif %}')">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <div class="post-heading">
                    <h1>{{ page.title }}</h1>
                    {% if page.subtitle %}
                    <h2 class="subheading">{{ page.subtitle }}</h2>
                    {% endif %}
                    <span class="meta">Posted by {% if page.author %}{{ page.author }}{% else %}{{ site.title }}{% endif %} on {{ page.date | date: "%B %-d, %Y" }}</span>
                </div>
            </div>
        </div>
    </div>
</header>

<!-- Post Content -->
<article>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">

                {{ content }}

                <hr>

                <ul class="pager">
                    {% if page.previous.url %}
                    <li class="previous">
                        <a href="{{ page.previous.url | prepend: site.baseurl | replace: '//', '/' }}"
                           data-toggle="tooltip" data-placement="top" title="{{page.previous.title}}">&larr; Previous
                            Post</a>
                    </li>
                    {% endif %}
                    {% if page.next.url %}
                    <li class="next">
                        <a href="{{ page.next.url | prepend: site.baseurl | replace: '//', '/' }}" data-toggle="tooltip"
                           data-placement="top" title="{{page.next.title}}">Next Post &rarr;</a>
                    </li>
                    {% endif %}
                </ul>

            </div>
        </div>
    </div>
</article>

<hr>


<%@ include file="/WEB-INF/layouts/site/footer.jsp" %>

</body>
</html>



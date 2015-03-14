<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>关于我们</title>
    <meta name="decorator" content="site"/>
</head>

<body>


<div class="row">
    <div class="large-12 columns">
        <ul class="pagination" role="menubar" aria-label="Pagination">
            <li class="arrow unavailable" aria-disabled="true"><a href="">&laquo; 前一页</a></li>
            <li class="current"><a href="">1</a></li>
            <li><a href="">2</a></li>
            <li><a href="">3</a></li>
            <li><a href="">4</a></li>
            <li class="unavailable" aria-disabled="true"><a href="">&hellip;</a></li>
            <li><a href="">12</a></li>
            <li><a href="">13</a></li>
            <li class="arrow"><a href="">后一页 &raquo;</a></li>
        </ul>
    </div>
</div>
</body>

</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<html>
<head>
    <title>预览文章</title>
    <meta name="decorator" content="default"/>
</head>


<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">预览
                        <a href="${ctx}/admin/article/edit?id=${post.id}"><i class="fa fa-edit fa-fw"></i></a>
                    </h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-8 col-lg-offset-2" style="background: #f6f8fa">
                    <h2 class="text-center">${post.title}</h2>

                    <p>${post.content}</p>

                    <div class="row">
                        <p class="pull-left">来源:${post.source}</p>

                        <p class="pull-right">标签:${post.tag}</p>
                    </div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->


</body>

</html>

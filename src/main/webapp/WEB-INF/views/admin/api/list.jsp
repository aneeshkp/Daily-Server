<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="reqUrl"
       value="http://${pageContext.request.serverName}:${pageContext.request.serverPort}${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Restful API 列表</title>
    <meta name="decorator" content="default"/>
</head>

<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">查询 API</h1>

                    <ul>
                        <li>获取任务列表 ： <a href="${reqUrl}/admin/api/v1/task">${reqUrl}/api/v1/task</a></li>
                        <li>获取任务(id=1) ： <a href="${reqUrl}/admin/api/v1/task/1">${reqUrl}/api/v1/task/1</a></li>
                    </ul>

                    <h4>修改API</h4>
                    <ul>
                        <li>创建任务 ：${reqUrl}/admin/api/v1/task method=Post, consumes=JSON</li>
                        <li>修改任务(id=1) ：${reqUrl}/admin/api/v1/task/1 method=Put, consumes=JSON</li>
                    </ul>


                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

</body>


</body>
</html>

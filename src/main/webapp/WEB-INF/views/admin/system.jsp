<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>系统管理</title>
</head>


<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">系统管理</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">

                    <div class="list-group">
                        <button class="btn btn-danger" type="button"
                                data-confirm="确定要清空吗?慎用慎用"
                                onclick="clearQiniuFiles()">清空七牛文件</button>
                    </div>

                </div>
            </div>


        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<script>
    function clearQiniuFiles() {

        notice("操作开始, 请稍候...");
        $.ajax({
            type: "GET",
            url: "${ctx}/admin/system/clearQiniuFiles",
            success: function (data) {

                notice("操作完成");
            },
            error: function (data, errCode, errDesc) {
                alert("操作失败:\n" + errCode + errDesc);
            }
        });
    }
</script>

</body>

</html>

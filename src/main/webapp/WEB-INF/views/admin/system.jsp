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

                    <div class="row form-group">
                        <div class="col-lg-2">
                            <label>七牛文件存储: </label>
                        </div>
                        <div class="col-lg-8">
                            <button class="btn btn-danger" type="button"
                                    data-confirm="确定要清空吗?慎用慎用"
                                    onclick="clearQiniuFiles()">清空七牛文件
                            </button>
                        </div>
                    </div>


                    <div class="row form-group">
                        <div class="col-lg-2">
                            <label>发布队列: </label>
                        </div>
                        <div class="col-lg-8">
                            <button class="btn btn-default" type="button"
                                    data-confirm="确定要暂停吗?"
                                    onclick="pauseQueue()">暂停发布队列
                            </button>
                            <button class="btn btn-success" type="button"
                                    data-confirm="确定要回复吗?"
                                    onclick="resumeQueue()">启动发布队列
                            </button>
                            <label>当前状态:</label><label id="queueStatus" style="color:#ff0000"></label>
                        </div>
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
    function pauseQueue() {
        $.ajax({
            type: "GET",
            url: "${ctx}/admin/system/pauseScheduler",
            success: function (data) {
                refreshQueueStatus();
            },
            error: function (data, errCode, errDesc) {
                alert("操作失败:\n" + errCode + errDesc);
            }
        });
    }
    function resumeQueue() {
        $.ajax({
            type: "GET",
            url: "${ctx}/admin/system/resumeScheduler",
            success: function (data) {
                refreshQueueStatus();
            },
            error: function (data, errCode, errDesc) {
                alert("操作失败:\n" + errCode + errDesc);
            }
        });
    }
    function refreshQueueStatus() {
        $.ajax({
            type: "GET",
            url: "${ctx}/admin/system/getSchedulerStatus",
            success: function (data) {
                if (data.status == "running") {
                    $('#queueStatus').text("正在运行");
                } else if (data.status == "paused") {
                    $('#queueStatus').text("已暂停");
                }
                notice("操作完成");
            },
            error: function (data, errCode, errDesc) {
                alert("操作失败:\n" + errCode + errDesc);
            }
        });
    }
    $(document).ready(
            function () {
                refreshQueueStatus();
            }
    );
</script>

</body>

</html>

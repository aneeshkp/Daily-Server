<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>发布队列</title>

    <link href="${ctx}/static/libs/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>
    <script type="text/javascript" charset="utf-8"
            src="${ctx}/static/libs/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${ctx}/static/libs/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

    <script type="text/javascript" charset="utf-8"
            src="${ctx}/static/libs/artTemplate/template.js"></script>

</head>


<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">发布队列</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-3">
                    <button class="btn btn-success btn-block" onclick="refreshQueue()">刷新队列</button>
                </div>
            </div>

            <p/>

            <div class="row">
                <div class="col-lg-12">
                    <div id="queuelist"></div>
                </div>
            </div>

        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->


<script id="tpl" type="text/html">

    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="col-lg-1">ID</th>
            <th class="col-lg-2">发布时间</th>
            <th class="col-lg-1">类型</th>
            <th class="col-lg-4">标题</th>
            <th class="col-lg-1">操作</th>
        </tr>
        </thead>
        <tbody>

        {{each list as post i}}

        <tr>
            <td>{{post.id}}</td>
            <td>
                <div class="input-append date form_datetime">
                    <input id="timeset_{{post.id}}" size="26" type="text" value="{{post.publishScheduleAt}}" readonly
                           placeholder="未设置">
                    <span class="add-on"><i class="icon-remove"></i></span>
                    <span class="add-on"><i class="icon-th"></i></span>
                    <button type="button" class="btn btn-link btn-flat" onclick="setPublishTime('{{post.id}}')">
                        设置
                    </button>
                </div>
            </td>
            <td>{{post.type}}</td>
            <td>{{post.title}}</td>
            <td>
                <div class="btn-group btn-group-xs">
                    <button type="button" class="btn btn-link btn-flat" onclick="offline('{{post.id}}')">
                        撤回
                    </button>
                    <button type="button" class="btn btn-link btn-flat" onclick="view('{{post.id}}')">
                        查看
                    </button>
                </div>
            </td>
        </tr>

        {{/each}}


        </tbody>
    </table>


</script>

<script>

    function setPublishTime(id) {
        var time = $("#timeset_" + id).val();
        alert('publishtime' + id + time);
    }

    function offline(id) {
        alert('offline' + id);
    }
    function view(id) {
        alert('view' + id);
    }

    function refreshQueue() {

        $.ajax({
            type: "GET",
            url: "${ctx}/admin/queue/list",
            success: function (data) {
                console.log(data);

                var html = template('tpl', data);
                document.getElementById('queuelist').innerHTML = html;
                makeTimePicker();
            },
            error: function (data, errCode, errDesc) {
                alert("操作失败:\n" + errCode + errDesc);
            }
        });

    }


    $(document).ready(function () {
        refreshQueue();
    });

    function makeTimePicker() {

        $(".form_datetime").datetimepicker({
            format: "dd MM yyyy - HH:ii P",
            showMeridian: true,
            autoclose: true,
            todayBtn: true,
            pickerPosition: "bottom-left",
            language: "zh-CN"
        });
    }

</script>

</body>


</html>

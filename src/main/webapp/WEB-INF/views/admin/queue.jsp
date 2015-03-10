<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>发布队列</title>

    <link href="${ctx}/static/libs/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>


    <!-- Bootcards CSS for desktop: -->
    <link rel="stylesheet" href="${ctx}/static/libs/bootcards/css/bootcards-desktop.min.css">

    <!-- Bootstrap and Bootcards JS -->
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/bootcards/js/bootcards.min.js"></script>

    <script type="text/javascript" charset="utf-8"
            src="${ctx}/static/libs/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${ctx}/static/libs/bootstrap-datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>

    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/artTemplate/template.js"></script>

    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/moment/moment.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/jquery-timeago/jquery.timeago.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${ctx}/static/libs/jquery-timeago/locales/jquery.timeago.zh-CN.js"></script>
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
            <br/><br/>

            <div class="row">
                <div class="col-lg-12">
                    <div id="cardsList"></div>
                </div>
            </div>

            <div class="row">
                <div class="col-lg-12">
                    <div id="queueList"></div>
                </div>
            </div>


        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->


<script id="cardsTpl" type="text/html">

    {{each list as post i}}

    <div class="col-lg-3">

        <div class="panel panel-default bootcards-media">
            <div class="panel-heading clearfix">
                <h3 class="panel-title pull-left">{{post.id}}</h3>

                <!--small screen component-->
                <div class="btn-group pull-right visible-xs">
                    <a class="btn btn-primary" href="/notes/edit"
                       data-toggle="modal"
                       data-target="#editModal">
                        <i class="fa fa-pencil"></i>
                        <span>编辑</span>
                    </a>
                </div>
                <!--big screen component-->
                <a class="btn btn-primary pull-right hidden-xs" href="/notes/edit"
                   data-toggle="modal"
                   data-target="#editModal">
                    <i class="fa fa-pencil"></i>
                    <span>编辑</span>
                </a>
            </div>
            <div class="panel-body">
                {{post.title}}
            </div>

            <img src="{{post.titleImage}}" class="img-responsive"/>

            <div class="panel-footer">
                <small class="pull-left">Built with Bootcards - Media Card</small>
            </div>

        </div>

    </div>

    {{/each}}
</script>

<script id="queueTpl" type="text/html">

    <table class="table table-bordered table-hover">
        <thead>
        <tr>
            <th class="col-lg-1">ID</th>
            <th class="col-lg-2">发布时间</th>
            <th class="col-lg-1">类型</th>
            <th class="col-lg-4">标题</th>
            <th class="col-lg-1">操作</th>
            <th class="col-lg-1">测试下拉操作</th>
        </tr>
        </thead>
        <tbody>

        {{each list as post i}}

        <tr>
            <td>{{post.id}}</td>
            <td>
                <div id="datetimepicker_{{post.id}}" class="input-append date form_datetime">
                    <input id="timeset_{{post.id}}" data-format="yyyy-MM-dd hh:mm:ss" size="26" type="text"
                           value="{{post.publishScheduleAt}}" readonly
                           placeholder="未设置">
                    <span class="add-on"><i class="icon-remove"></i></span>
                    <span class="add-on"><i class="icon-th"></i></span>
                    <button type="button" class="btn btn-link btn-flat" onclick="changePublishTime('{{post.id}}')">
                        设置
                    </button>
                </div>
            </td>

            {{if post.type == 'article'}}
            <td>文章</td>
            {{else if post.type == 'fragment'}}
            <td>碎片</td>
            {{/if}}
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

            <td>
                <div class="dropdown">
                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1"
                            data-toggle="dropdown" aria-expanded="true">
                        Dropdown
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Another action</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Something else here</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">Separated link</a></li>
                    </ul>
                </div>
            </td>

        </tr>

        {{/each}}


        </tbody>
    </table>


</script>

<script>

    $(document).ready(function () {
        refreshQueue();
//        refreshCards();
    });

    function refreshCards() {
        $.ajax({
            type: "GET",
            url: "${ctx}/admin/queue/list",
            success: function (data) {
                var html = template('cardsTpl', data);
                document.getElementById('#cardsList').innerHTML = html;
                makeTimePicker();
            },
            error: function (data, errCode, errDesc) {
                alert("操作失败:\n" + errCode + errDesc);
            }
        });
    }

    function refreshQueue() {
        $.ajax({
            type: "GET",
            url: "${ctx}/admin/queue/list",
            success: function (data) {
                var html = template('queueTpl', data);
                document.getElementById('queueList').innerHTML = html;
                makeTimePicker();
            },
            error: function (data, errCode, errDesc) {
                alert("操作失败:\n" + errCode + errDesc);
            }
        });
    }


    function changePublishTime(id) {
        var date = $("#datetimepicker_" + id).data("datetimepicker").getDate();
        var publishTime = date.getTime(); // 取到时间戳
        var postId = id;
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/queue/changePublishTime",
            data: {"postId": postId, "publishTime": publishTime},
            success: function (data) {

                alert(data['publishScheduleAt']);

                notice("修改成功");
            },
            error: function (data, errCode, errDesc) {
                alert("操作失败:\n" + errCode + errDesc);
            }
        });
    }

    function offline(id) {
        alert('offline' + id);
    }
    function view(id) {
        alert('view' + id);
    }

    function makeTimePicker() {
        $(".form_datetime").datetimepicker({
            format: "dd MM yyyy - HH:ii P",
            showMeridian: true,
            autoclose: true,
            todayBtn: true,
            pickerPosition: "bottom-left",
            language: "zh-CN"
        });
//        $(".form_datetime").datetimepicker.dates['zh-CN'] = {
//            format: 'dd/mm/yyyy'
//        };
    }

</script>

</body>


</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>发布队列</title>

    <link href="${ctx}/static/libs/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet"/>


    <!-- Bootcards CSS for desktop: -->
    <%--<link rel="stylesheet" href="${ctx}/static/libs/bootcards/css/bootcards-desktop-lite.css">--%>

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
                <div class="col-lg-2">
                    <button class="btn btn-success btn-block" onclick="refreshCards()">刷新队列</button>
                </div>
                <div class="col-lg-2">
                    <button class="btn btn-danger btn-block" onclick="_withdrawAll()">撤销全部</button>
                </div>
            </div>
            <br/><br/>

            <div class="row">
                <div class="col-lg-12">
                    <div id="cardsList"></div>
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

                <em style="color:blueviolet">发布时间:{{post.publishScheduleAt}}</em><br/>

                <h3 class="panel-title pull-left">
                    <a href="javascript:void(0)" onclick='_previewFun("{{post.id}}")'>{{post.title}}</a></h3><br/>

                <!--small screen component-->
                <%--<div class="btn-group pull-right visible-xs">--%>
                <%--<a class="btn btn-default" href="/notes/edit"--%>
                <%--data-toggle="modal"--%>
                <%--data-target="#editModal">--%>
                <%--<i class="fa fa-pencil"></i>--%>
                <%--<span>编辑</span>--%>
                <%--</a>--%>
                <%--</div>--%>

                <!--big screen component-->
                <%--<a class="btn btn-default pull-right hidden-xs" href="/notes/edit"--%>
                <%--data-toggle="modal"--%>
                <%--data-target="#editModal">--%>
                <%--<i class="fa fa-pencil"></i>--%>
                <%--<span>编辑</span>--%>
                <%--</a>--%>

            </div>
            <div class="panel-body">
                {{post.abstract}}
            </div>

            {{if post.type == 'article'}}
            <img src="{{post.titleImage}}" class="img-responsive"/>
            {{else if post.type == 'fragment'}}
            <%--{{each post.imageList as img i}}--%>
            <%--<div class="col-lg-3 col-md-4 col-xs-6 thumb">--%>
            <%--<a class="thumbnail" href="{{img}}">--%>
            <%--<img class="img-responsive" src="{{img}}" alt="">--%>
            <%--</a>--%>
            <%--</div>--%>
            <%--{{/each}}--%>
            <img src="{{post.titleImage}}" class="img-responsive"/>
            {{/if}}

            <div class="panel-footer">
                <a href="javascript:void(0)" onclick='_withdrawFun("{{post.id}}")' style="color: #ff0000"><u>撤回</u></a>
                <%--<a href="javascript:void(0)" onclick='_previewFun("{{post.id}}")'><u>查看</u></a>--%>
                <a href="javascript:void(0)" onclick='_previewFun("{{post.id}}")' style="color: cadetblue"><u>设置发布时间</u></a>
                <a href="javascript:void(0)" onclick='_publishFun("{{post.id}}")' style="color: green"><u>现在发布!</u></a>
            </div>

            <div class="panel-footer" style="height: 30px;">
                {{if post.type == 'article'}}
                <small class="pull-left"><em>文章</em></small>
                {{else if post.type == 'fragment'}}
                <small class="pull-left"><em>碎片</em></small>
                {{/if}}
                <small class="pull-right"><em>{{post.id}}</em></small>
            </div>

        </div>

    </div>

    {{/each}}
</script>

<script>

    $(document).ready(function () {
        refreshCards();
    });

    function refreshCards() {
        $.ajax({
            type: "GET",
            url: "${ctx}/admin/queue/list",
            success: function (data) {
                var html = template('cardsTpl', data);
                document.getElementById('cardsList').innerHTML = html;
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

<script>


    function _previewFun(id) {
        <%--window.location = "${ctx}/admin/post/preview?id=" + id;--%>
        window.open("${ctx}/admin/post/preview?id=" + id, 'newwindow');
    }

    function _publishFun(id) {
        if (window.confirm("确认现在发布吗?")) {
            $.ajax({
                type: "POST",
                url: "${ctx}/admin/post/publish",
                data: {"id": id},
                success: function (data) {
                    if (data.result == "ok") {
                        notice("已发布");
                        refreshCards();
                    }
                },
                error: function (data, errCode, errDesc) {
                    alert("操作失败:\n" + errCode + errDesc);
                }
            });
        }
    }

    function _withdrawFun(id) {

        if (window.confirm("确认撤回吗? 已发布的内容, 请不要轻易撤回!!")) {
            $.ajax({
                type: "POST",
                url: "${ctx}/admin/post/withdraw",
                data: {"id": id},
                success: function (data) {
                    if (data.result == "ok") {
                        notice("已撤回到草稿箱");
                        refreshCards();
                    }
                },
                error: function (data, errCode, errDesc) {
                    alert("操作失败:\n" + errCode + errDesc);
                }
            });
        }
    }

    function _withdrawAll() {
        if (window.confirm("仅供调试时使用, 正式环境需要去掉此功能!!! , 请不要误点 !!! ")) {
            $.ajax({
                type: "POST",
                url: "${ctx}/admin/post/withdrawAll",
                success: function (data) {
                    if (data.result == "ok") {
                        notice("已撤回到草稿箱");
                        refreshCards();
                    }
                },
                error: function (data, errCode, errDesc) {
                    alert("操作失败:\n" + errCode + errDesc);
                }
            });
        }
    }

</script>

</body>


</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>抓取机器人</title>
</head>


<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">抓取机器人</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->


            <div class="col-lg-8">
                <div class="row">
                    <label>知乎答案:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="知乎答案地址" id="zhihuAnswerUrl">
                        <span class="input-group-addon" id="getZhihuAnswer" onclick="zhihuAnswer()">抓取</span>
                    </div>
                </div>
                <p/>

                <div class="row">
                    <label>知乎日报:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="知乎日报地址" id="zhihuDailyUrl">
                        <span class="input-group-addon" id="getZhihuDaily" onclick="zhihuDaily()">抓取</span>
                    </div>
                </div>
                <p/>

                <div class="row">
                    <label>豆瓣东西:</label>
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="豆瓣东西地址" id="doubanDongxiUrl">
                        <span class="input-group-addon" id="getDoubanDongxi" onclick="dongxi()">抓取</span>
                    </div>
                </div>
                <p/>

            </div>

            <div class="col-lg-8">
                <div class="row" id="resultInfo">
                </div>
            </div>

            <script>

                function zhihuAnswer() {
                    var zhihuUrl = $("#zhihuAnswerUrl").val();
                    $.ajax({
                        type: "POST",
                        url: "${ctx}/admin/robot/getZhihuAnswer",
                        data: {"url": zhihuUrl},
                        success: function (data) {
                            notice("抓取完成");
                        },
                        error: function (data, errCode, errDesc) {
                            alert("操作失败:\n" + errCode + errDesc);
                        }
                    });

                }

                function zhihuDaily() {
                    var zhihuUrl = $("#zhihuDailyUrl").val();
                    notice("开始抓取,请稍候...");
                    $.ajax({
                        type: "POST",
                        url: "${ctx}/admin/robot/getZhihuDaily",
                        data: {"url": zhihuUrl},
                        success: function (data) {

                            var editUrl = "${ctx}/admin/article/edit?id=" + data.post.id;
                            var previewUrl = "${ctx}/admin/article/preview?id=" + data.post.id;

                            var html = '<div class="alert alert-success alert-dismissable">' +
                                    ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> '
                                     + data.post.title +
                                    '<a href='+ editUrl +' class="alert-link">' + " -去编辑 "+'</a>' +
                                    '<a href='+ previewUrl +' class="alert-link">' + " -去预览 "+'</a>' +
                                    '</div>';
                            $("#resultInfo").append(html);
                            console.log(html);
                            notice("抓取完成");
                        },
                        error: function (data, errCode, errDesc) {
                            alert("操作失败:\n" + errCode + errDesc);
                        }
                    });

                }

                function dongxi() {
                    var dongxiUrl = $("#doubanDongxiUrl").val();
                    console.log(dongxiUrl);
                }

            </script>


        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

</body>

</html>

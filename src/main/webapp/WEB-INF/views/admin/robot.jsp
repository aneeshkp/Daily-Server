<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>抓取机器人</title>
    <meta name="decorator" content="default"/>
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
                <div class="row form-group">
                    <label>图片上传至七牛服务器:</label>
                    <label class="radio-inline">
                        <input type="radio" name="uploadOptions" id="uploadToQiniu"
                               value="option1" checked>上传
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="uploadOptions"
                               value="option2">不上传
                    </label>
                </div>

                <div class="row form-group">
                    <label>抓取设置:</label>
                    <label class="radio-inline">
                        <input type="radio" name="crawlOptions" id="forceCrawl"
                               value="option1">强制抓取
                    </label>
                    <label class="radio-inline">
                        <input type="radio" name="crawlOptions"
                               value="option2" checked>先检查,没有抓取过才抓取
                    </label>
                </div>


            </div>

            <div class="col-lg-8">
                <div class="row form-group">
                    <label>通用文章提取, 可提取网页正文信息
                        <small>(提取有问题的文章, 请把URL发给我)</small>
                        :</label>

                    <div class="input-group">
                        <input type="text" class="form-control"
                               placeholder="文章地址"
                               id="readabilityUrl">
                        <span class="input-group-addon" id="getReadabilityUrl" onclick="readability()">抓取</span>
                    </div>
                </div>

                <div class="row form-group">
                    <label>知乎答案:</label>

                    <div class="input-group">
                        <input type="text" class="form-control"
                               placeholder="知乎答案地址 (例如 http://www.zhihu.com/question/28311018/answer/40543556)"
                               id="zhihuAnswerUrl">
                        <span class="input-group-addon" id="getZhihuAnswer" onclick="zhihuAnswer()">抓取</span>
                    </div>
                </div>

                <div class="row form-group">
                    <label>知乎日报:</label>

                    <div class="input-group">
                        <input type="text" class="form-control"
                               placeholder="知乎日报地址 (例如 http://daily.zhihu.com/story/4525786)" id="zhihuDailyUrl">
                        <span class="input-group-addon" id="getZhihuDaily" onclick="zhihuDaily()">抓取</span>
                    </div>
                </div>

                <div class="row form-group">
                    <label>豆瓣东西:</label>

                    <div class="input-group">
                        <input type="text" class="form-control"
                               placeholder="豆瓣东西地址 (例如 http://dongxi.douban.com/show/2534804/?r=P)"
                               id="doubanDongxiUrl">
                        <span class="input-group-addon" id="getDoubanDongxi" onclick="doubanDongxi()">抓取</span>
                    </div>
                </div>

                <div class="row form-group">
                    <br/>

                    <p>更多针对性抓取, 敬请期待. 请提交想抓取的内容网站地址给我</p>
                </div>
            </div>

            <div class="col-lg-8">
                <div class="row" id="resultInfo">
                </div>
            </div>

            <script>

                function showSuccessPost(post, type) {
                    var editUrl;
                    var previewUrl;
                    if (type = "article") {
                        editUrl = "${ctx}/admin/article/edit?id=" + post.id;
                        previewUrl = "${ctx}/admin/article/preview?id=" + post.id;
                    } else if (type = "fragment") {
                        editUrl = "${ctx}/admin/fragment/edit?id=" + data.post.id;
                        previewUrl = "${ctx}/admin/fragment/preview?id=" + data.post.id;
                    }
                    var html = '<div class="alert alert-success alert-dismissable">' +
                            ' <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button> '
                            + post.title +
                            '<a href=' + editUrl + ' class="alert-link" target="_blank">' + " -去编辑 " + '</a>' +
                            '<a href=' + previewUrl + ' class="alert-link" target="_blank">' + " -去预览 " + '</a>' +
                            '</div>';
                    $("#resultInfo").append(html);
                    notice("抓取完成");
                }

                function readability() {
                    var url = $("#readabilityUrl").val();
                    if (!url || !isUrl(url)) {
                        alert("请输入网址");
                        return;
                    }
                    var toQiniu = false;
                    if ($('#uploadToQiniu').prop("checked")) {
                        toQiniu = true;
                    }

                    var forceCrawl = false;
                    if ($('#forceCrawl').prop("checked")) {
                        forceCrawl = true;
                    }

                    $.ajax({
                        type: "POST",
                        url: "${ctx}/admin/robot/getReadability",
                        data: {"url": url, "toQiniu": toQiniu, "forceCrawl":forceCrawl},
                        success: function (data) {
                            if (data.result == "ok") {
                                showSuccessPost(data.post, "article");
                            } else {
                                alert(data.message);
                            }
                        },
                        error: function (data, errCode, errDesc) {
                            alert("操作失败:\n" + errCode + errDesc);
                        }
                    });
                }

                function zhihuDaily() {
                    var url = $("#zhihuDailyUrl").val();
                    if (!url || !isUrl(url)) {
                        alert("请输入网址");
                        return;
                    }
                    var toQiniu = false;
                    if ($('#uploadToQiniu').prop("checked")) {
                        toQiniu = true;
                    }
                    var forceCrawl = false;
                    if ($('#forceCrawl').prop("checked")) {
                        forceCrawl = true;
                    }

                    $.ajax({
                        type: "POST",
                        url: "${ctx}/admin/robot/getZhihuDaily",
                        data: {"url": url, "toQiniu": toQiniu, "forceCrawl":forceCrawl},
                        success: function (data) {
                            showSuccessPost(data.post, "article");
                        },
                        error: function (data, errCode, errDesc) {
                            alert("操作失败:\n" + errCode + errDesc);
                        }
                    });

                }


                function zhihuAnswer() {
                    var url = $("#zhihuAnswerUrl").val();
                    if (!url || !isUrl(url)) {
                        alert("请输入网址");
                        return;
                    }
                    var toQiniu = false;
                    if ($('#uploadToQiniu').prop("checked")) {
                        toQiniu = true;
                    }
                    var forceCrawl = false;
                    if ($('#forceCrawl').prop("checked")) {
                        forceCrawl = true;
                    }

                    $.ajax({
                        type: "POST",
                        url: "${ctx}/admin/robot/getZhihuAnswer",
                        data: {"url": url, "toQiniu": toQiniu, "forceCrawl":forceCrawl},
                        success: function (data) {
                            showSuccessPost(data.post, "article");
                        },
                        error: function (data, errCode, errDesc) {
                            alert("操作失败:\n" + errCode + errDesc);
                        }
                    });

                }

                function doubanDongxi() {
                    var url = $("#doubanDongxiUrl").val();
                    if (!url || !isUrl(url)) {
                        alert("请输入网址");
                        return;
                    }
                    var toQiniu = false;
                    if ($('#uploadToQiniu').prop("checked")) {
                        toQiniu = true;
                    }
                    var forceCrawl = false;
                    if ($('#forceCrawl').prop("checked")) {
                        forceCrawl = true;
                    }


                    $.ajax({
                        type: "POST",
                        url: "${ctx}/admin/robot/getDoubanDongxi",
                        data: {"url": url, "toQiniu": toQiniu, "forceCrawl":forceCrawl},
                        success: function (data) {
                            showSuccessPost(data.post, "fragment");
                        },
                        error: function (data, errCode, errDesc) {
                            alert("操作失败:\n" + errCode + errDesc);
                        }
                    });
                }

            </script>


            <script>
                function isUrl(url) {
                    var expression = /[-a-zA-Z0-9@:%_\+.~#?&//=]{2,256}\.[a-z]{2,4}\b(\/[-a-zA-Z0-9@:%_\+.~#?&//=]*)?/gi;
                    var regex = new RegExp(expression);
                    if (url.match(regex)) {
                        return true;
                    } else {
                        return false;
                    }
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

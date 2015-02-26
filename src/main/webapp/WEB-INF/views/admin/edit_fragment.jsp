<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>编辑碎片</title>
    <meta name="decorator" content="default"/>
    <link href="${ctx}/static/libs/webuploader/webuploader.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/static/libs/image-upload/style.css" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/webuploader/webuploader.min.js"></script>
    <script type="text/javascript" charset="utf-8"
            src="${ctx}/static/libs/image-upload/upload_fragment_image.js"></script>
</head>


<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">编辑碎片</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <form role="form" method="post">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="form-group">
                            <label>图片(4张)</label>

                            <!--头部，相册选择和格式选择-->
                            <div id="uploader">
                                <div class="queueList">
                                    <div id="dndArea" class="placeholder">
                                        <div id="filePicker"></div>
                                        <p>或将照片拖到这里，单次最多可选300张</p>
                                    </div>
                                </div>
                                <div class="statusBar" style="display:none;">
                                    <div class="progress">
                                        <span class="text">0%</span>
                                        <span class="percentage"></span>
                                    </div>
                                    <div class="info"></div>
                                    <div class="btns">
                                        <div id="filePicker2"></div>
                                        <div class="uploadBtn">开始上传</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">
                        <input id="postId" type="hidden">

                        <div class="form-group">
                            <label>标题</label>
                            <textarea id="postTitle" class="form-control" rows="2" placeholder="标题,不超过20字"></textarea>
                        </div>
                        <div class="form-group">
                            <label>来源</label>
                            <input id="postSource" class="form-control" placeholder="来源">
                        </div>
                        <div class="form-group">
                            <label>标签</label>
                            <input id="postTag" class="form-control" placeholder="标签">
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <input id="draftBtn" class="btn btn-primary btn-block" type="button" value="暂存到草稿箱"
                               onclick="doDraft()"/>
                    </div>
                    <div class="col-lg-3">
                        <input id="previewBtn" class="btn btn-normal btn-block" type="button" value="预览"
                               onclick="doPreview()"/>
                    </div>
                    <div class="col-lg-3">
                        <input id="publishBtn" class="btn btn-success btn-block" type="button" value="提交发布"
                               data-confirm="确定要发布吗?"
                               onclick="doPublish()"/>
                    </div>
                    <div class="col-lg-3">
                        <input id="dropBtn" class="btn btn-warning btn-block" type="button" value="废弃"
                               data-confirm="确定要废弃吗?"
                               onclick="doDrop()"/>
                    </div>
                </div>
            </form>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->


<script>
    function doDrop() {
        var id = $("#postId").val();
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/fragment/delete",
            data: {"id": id},
            success: function (data) {
                notice("已废弃")
            },
            error: function (data, errCode, errDesc) {
                alert("操作失败:\n" + errCode + errDesc);
            }
        });
    }
    function doPublish() {
        doDraft(function(){
            var id = $("#postId").val();
            $.ajax({
                type: "POST",
                url: "${ctx}/admin/fragment/queue",
                data: {"id": id},
                success: function (data) {
                    notice("已提交到发布队列");
                },
                error: function (data, errCode, errDesc) {
                    alert("操作失败:\n" + errCode + errDesc);
                }
            });
        });
    }
    function doPreview() {
        alert("preview");
    }
    function doDraft(callback) {
//        var content = UE.getEditor('editor').getContent();
        var id = $("#postId").val();
        var title = $("#postTitle").val();
        var source = $("#postSource").val();
        var tag = $("#postTag").val();
        $.ajax({
            type: "POST",
            url: "${ctx}/admin/fragment/save",
            data: {"id": id, "title": title, "source": source, "tag": tag, "content": ""},
            success: function (data) {
                $("#postId").val(data.id);
                if(callback){
                    callback();
                } else {
                    notice("已暂存到草稿箱");
                }
            },
            error: function (data, errCode, errDesc) {
                alert("错误:\n" + errCode + errDesc);
            }
        });
    }

    $(document).ready(function () {
        $("#postId").val("${post.id}");
        $("#postTitle").val("${post.title}");
        $("#postSource").val("${post.source}");
        $("#postTag").val("${post.tag}");
    });

</script>

</body>

</html>

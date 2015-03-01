<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<html>
<head>
    <title>编辑文章</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/ueditor/lang/zh-cn/zh-cn.js"></script>

</head>


<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">编辑文章</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <form method="post" role="form">

                <div class="row">
                    <div class="col-lg-8">
                        <div class="form-group">
                            <label>内容</label>
                            <!-- 加载编辑器的容器 -->
                            <div>
                                <script id="editor" type="text/plain" style="height:300px;"></script>
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
                               data-confirm="废弃后无法恢复,确定要废弃吗?"
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
            url: "${ctx}/admin/article/delete",
            data: {"id": id},
            success: function (data) {
                notice("已废弃");
                window.location = "${ctx}/admin/article/";
            },
            error: function (data, errCode, errDesc) {
                alert("操作失败:\n" + errCode + errDesc);
            }
        });
    }
    function doPublish() {
        doDraft(function () {
            var id = $("#postId").val();
            $.ajax({
                type: "POST",
                url: "${ctx}/admin/article/queue",
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
        doDraft(function () {
            var id = $("#postId").val();
//            window.open('/admin/article/preview?id=' + id, 'newwindow', 'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable = no, location = no, status = no');
            window.open('/admin/article/preview?id=' + id, 'newwindow');
        });
    }
    function doDraft(callback) {
        var content = UE.getEditor('editor').getContent();
        content = content.replace(/(?:\r\n|\r|\n)/g, '<br />');
        var id = $("#postId").val();
        var title = $("#postTitle").val();
        var source = $("#postSource").val();
        var tag = $("#postTag").val();

        if(!content || content=='') {
            alert('内容不能为空');
            return;
        }
        if(!title || title=='') {
            alert('标题不能为空');
            return;
        }
        if(!source || source=='') {
            alert('来源不能为空');
            return;
        }
        if(!tag || tag=='') {
            alert('标签不能为空');
            return;
        }

        $.ajax({
            type: "POST",
            url: "${ctx}/admin/article/save",
            data: {"id": id, "title": title, "source": source, "tag": tag, "content": content},
            success: function (data) {
                $("#postId").val(data.id);
                if (callback) {
                    callback();
                } else {
                    notice("已暂存到草稿箱");
                }
            },
            error: function (data, errCode, errDesc) {
                alert("保存失败:\n" + errCode + errDesc);
            }
        });
    }

    $(document).ready(function () {
        //判断ueditor 编辑器是否创建成功
        UE.getEditor('editor').addListener("ready", function () { // editor ready后 初始化
            UE.getEditor('editor').setContent('${post.content}', false);
            console.log('${post.id}');
            $("#postId").val("${post.id}");
            $("#postTitle").val("${post.title}");
            $("#postSource").val("${post.source}");
            $("#postTag").val("${post.tag}");
        });
    });

</script>


</body>

</html>

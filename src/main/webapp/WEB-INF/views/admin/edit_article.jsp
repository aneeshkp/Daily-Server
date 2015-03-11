<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fns" uri="http://java.sun.com/jsp/jstl/functionss" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<html>
<head>
    <title>编辑文章</title>
    <meta name="decorator" content="default"/>

    <!-- WebUploader -->
    <link href="${ctx}/static/libs/webuploader/webuploader.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/static/libs/image-upload/cropper/cropper.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/static/libs/image-upload/cropper/style.css" type="text/css" rel="stylesheet"/>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/webuploader/webuploader.min.js"></script>

    <!-- UEditor -->
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/ueditor/lang/zh-cn/zh-cn.js"></script>

    <!-- Sortable -->
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/sortable/Sortable.js"></script>

    <!-- Sticky -->
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/jquery.sticky-kit.min.js"></script>

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


            <div class="row sticky" style="z-index: 100; padding-bottom: 10px;">
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

            <div class="row">

                <div class="col-lg-8">

                    <div id="uploaderDiv" class="uploader-container col-lg-4">
                        <label>封面</label>

                        <div id="filePicker">选择文件</div>
                    </div>

                    <!-- Croper container -->
                    <div id="croperDiv" class="cropper-wraper webuploader-element-invisible">
                        <div class="img-container">
                            <img src="" alt=""/>
                        </div>
                        <div class="upload-btn">上传所选区域</div>
                        <div class="img-preview"></div>
                    </div>

                </div>

                <div class="col-lg-4">

                    <div class="form-group">
                        <script>
                            $(document).ready(function () {
                                new jBox('Image')
                            });
                        </script>

                        <br/>
                        <br/>
                        <label>封面图片</label>
                        <ul id="imageList" class="list-group">
                            <c:forEach var="image" items="${post.imageList}">
                                <li class=" thumbnail">
                                    <a href="${image}" data-jbox-image="gallery">
                                        <img style="height: 140px; width: 100%; display: block;"
                                             src="${image}"
                                             data-holder-rendered="true"
                                                />
                                    </a>
                                    <i class="js-remove">✖</i>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>

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
                    <div class="form-group">
                        <label>摘要</label>
                        <input id="postSummary" class="form-control" placeholder="摘要">
                    </div>
                    <div class="form-group">
                        <label>状态: <strong id="postStatus"></strong></label>
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
        var summary = $("#postSummary").val();


        var imageList = {};

        for (var i = 0; i < $('#imageList li a').length; i++) {
            var imageUrl = $('#imageList li a')[i].href;
            imageList[i] = imageUrl;
        }

        if (!imageList[0]) {
            alert('封面图片不能为空');
            return;
        }
        if (imageList[1]) {
            alert('封面图片只能设置一张,请挑选一张作为封面图片,移除其他  (目前是这样,容我再想想..)');
            return;
        }
        var titleImage = imageList[0];

        if (!content || content == '') {
            alert('内容不能为空');
            return;
        }
        if (!title || title == '') {
            alert('标题不能为空');
            return;
        }
        if (!source || source == '') {
            alert('来源不能为空');
            return;
        }
        if (!tag || tag == '') {
            alert('标签不能为空');
            return;
        }

        $.ajax({
            type: "POST",
            url: "${ctx}/admin/article/save",
            data: {
                "id": id,
                "title": title,
                "source": source,
                "summary": summary,
                "tag": tag,
                "content": content,
                "imageList": imageList,
                "titleImage": titleImage
            },
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
            var content = '${post.content}'.replace(/(?:\r\n|\r|\n)/g, '<br />');
            UE.getEditor('editor').setContent(content, false);

        });
    });

    $(document).ready(function () {
                $("#postId").val("${post.id}");
                $("#postTitle").val("${post.title}");
                $("#postSource").val("${post.source}");
                $("#postTag").val("${post.tag}");
                $("#postSummary").val("${post.summary}");
                $("#postStatus").text('${fns:getPostStatusByPostId(post.status)}');
            }
    );

    $(document).ready(function(){
        $(".sticky").stick_in_parent();
    });

</script>


<script>
    var imageList = document.getElementById("imageList");

    var sortable = new Sortable(imageList, {
        ghostClass: "ghost",
        animation: 150,
        filter: ".js-remove, .js-edit",
        onFilter: function (evt) {
            var item = evt.item,
                    ctrl = evt.target;

            if (Sortable.utils.is(ctrl, ".js-remove")) {  // Click on remove button
                item.parentNode.removeChild(item); // remove sortable item
            }
            else if (Sortable.utils.is(ctrl, ".js-edit")) {  // Click on edit link
                // ...
            }
        }
//                        group: "name",  // or { name: "...", pull: [true, false, clone], put: [true, false, array] }
//                        sort: true  // sorting inside list
//                        disabled: false, // Disables the sortable if set to true.
//                        store: null,  // @see Store
//                        animation: 150,  // ms, animation speed moving items when sorting, `0` — without animation
//                        handle: ".my-handle",  // Drag handle selector within list items
//                        filter: ".ignore-elements",  // Selectors that do not lead to dragging (String or Function)
//                        draggable: ".item",  // Specifies which items inside the element should be sortable
//                        ghostClass: "sortable-ghost",  // Class name for the drop placeholder

//                        scroll: true, // or HTMLElement
//                        scrollSensitivity: 30, // px, how near the mouse must be to an edge to start scrolling.
//                        scrollSpeed: 10, // px

//                        setData: function (dataTransfer, dragEl) {
//                            dataTransfer.setData('Text', dragEl.textContent);
//                        },
//
//                        // dragging started
//                        onStart: function (/**Event*/evt) {
//                            evt.oldIndex;  // element index within parent
//                        },
//
//                        // dragging ended
//                        onEnd: function (/**Event*/evt) {
//                            evt.oldIndex;  // element's old index within parent
//                            evt.newIndex;  // element's new index within parent
//                        },
//
//                        // Element is dropped into the list from another list
//                        onAdd: function (/**Event*/evt) {
//                            var itemEl = evt.item;  // dragged HTMLElement
//                            evt.from;  // previous list
//                            // + indexes from onEnd
//                        },
//
//                        // Changed sorting within list
//                        onUpdate: function (/**Event*/evt) {
//                            var itemEl = evt.item;  // dragged HTMLElement
//                            // + indexes from onEnd
//                        },
//
//                        // Called by any change to the list (add / update / remove)
//                        onSort: function (/**Event*/evt) {
//                            // same properties as onUpdate
//                        },
//
//                        // Element is removed from the list into another list
//                        onRemove: function (/**Event*/evt) {
//                            // same properties as onUpdate
//                        },
//
//                        // Attempt to drag a filtered element
//                        onFilter: function (/**Event*/evt) {
//                            var itemEl = evt.item;  // HTMLElement receiving the `mousedown|tapstart` event.
//                        }

    });

</script>

<script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/image-upload/cropper/cropper.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/image-upload/cropper/uploader.js"></script>

</body>

</html>

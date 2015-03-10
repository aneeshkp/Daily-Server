<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fns" uri="http://java.sun.com/jsp/jstl/functionss" %>
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

    <!-- 用于将碎片附图排序 -->
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/sortable/Sortable.js"></script>

    <style>

        #editable {
        }

        #editable li {
            position: relative;
        }

        #editable i {
            -webkit-transition: opacity .2s;
            transition: opacity .2s;
            opacity: 0;
            display: block;
            cursor: pointer;
            color: #c00;
            top: 10px;
            right: 40px;
            position: absolute;
            font-style: normal;
        }

        #editable li:hover i {
            opacity: 1;
        }

        #filter {
        }

        #filter button {
            color: #fff;
            width: 100%;
            border: none;
            outline: 0;
            opacity: .5;
            margin: 10px 0 0;
            transition: opacity .1s ease;
            cursor: pointer;
            background: #5F9EDF;
            padding: 10px 0;
            font-size: 20px;
        }

        #filter button:hover {
            opacity: 1;
        }

        #filter .block__list {
            padding-bottom: 0;
        }

        .drag-handle {
            margin-right: 10px;
            font: bold 20px Sans-Serif;
            color: #5F9EDF;
            display: inline-block;
            cursor: move;
            cursor: -webkit-grabbing; /* overrides 'move' */
        }

        .my-handle {
            cursor: move;
            cursor: -webkit-grabbing;
        }

        .ghost {
            opacity: 0.4;
        }
    </style>
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
                            <label>图片上传</label>
                            <!--头部，相册选择和格式选择-->
                            <div id="uploader">
                                <div class="queueList">
                                    <div id="dndArea" class="placeholder">
                                        <div id="filePicker"></div>
                                        <p>或将照片拖到这里</p>
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
                        <div class="form-group">
                            <label>摘要</label>
                            <input id="postSummary" class="form-control" placeholder="摘要">
                        </div>
                        <div class="form-group">
                            <label>状态: <strong id="postStatus"></strong></label>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <script>
                        $(document).ready(function () {
                            new jBox('Image')
                        });
                    </script>
                    <!-- 当前图片列表 -->
                    <label>当前图片</label>
                    <ul id="imageList" class="list-group">
                        <c:forEach var="image" items="${post.imageList}">
                            <li class="col-xs-6 col-md-2 thumbnail">
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
            url: "${ctx}/admin/fragment/delete",
            data: {"id": id},
            success: function (data) {
                notice("已废弃");
                window.location = "${ctx}/admin/fragment";
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
        doDraft(function () {
            var id = $("#postId").val();
//            window.open('/admin/fragment/preview?id=' + id, 'newwindow', 'height=100,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable = no, location = no, status = no');
            window.open('/admin/fragment/preview?id=' + id, 'newwindow');
        });
    }
    function doDraft(callback) {

        var imageList = {};

        for (var i = 0; i < $('#imageList li a').length; i++) {
            var imageUrl = $('#imageList li a')[i].href;
            imageList[i] = imageUrl;
        }

//        for (var i = 0; i < uploader.getFiles().length; i++) {
//            imageList[i] = uploader.getFiles()[i].uploadUrl;
//        }

        var id = $("#postId").val();
        var title = $("#postTitle").val();
        var source = $("#postSource").val();
        var tag = $("#postTag").val();
        var summary = $("#postSummary").val();

        if (!imageList[0]) {
            alert('图片不能为空');
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
            url: "${ctx}/admin/fragment/save",
            data: {"id": id, "title": title, "source": source, "summary": summary, "tag": tag, "imageList": imageList},
            success: function (data) {
                $("#postId").val(data.id);
                if (callback) {
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
        $("#postSummary").val("${post.summary}");
        $("#postStatus").text('${fns:getPostStatusByPostId(post.status)}');
    });

    $(document).ready(function () {
        uploader.on('uploadSuccess', function (file, ret) {
            file.uploadUrl = ret._raw;

            var imageList = document.getElementById("imageList");
            var $li = $('<li class="col-xs-6 col-md-2 thumbnail">' +
            '<a href="' + file.uploadUrl + '" class="thumbnail" data-jbox-image="gallery">' +
            '<img style="height: 140px; width: 100%; display: block;"' +
            'src="' + file.uploadUrl + '"' +
            'data-holder-rendered="true"' +
            '/>' +
            '</a>' +
            '<i class="js-remove">✖</i>' +
            '</li>');
            $li.appendTo(imageList);


        });
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

</body>

</html>

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
                        <div class="form-group">
                            <label>标题</label>
                            <textarea class="form-control" rows="2" placeholder="标题,不超过20字"></textarea>
                        </div>
                        <div class="form-group">
                            <label>来源</label>
                            <input class="form-control" placeholder="来源">
                        </div>
                        <div class="form-group">
                            <label>分类/标签</label>
                            <input class="form-control" placeholder="分类/标签">
                        </div>
                    </div>

                </div>

                <div class="row">
                    <div class="col-lg-4">
                        <input id="2" class="btn btn-normal btn-block" type="submit" value="预览"/>
                    </div>
                    <div class="col-lg-4">
                        <input id="submit_btn" class="btn btn-primary btn-block" type="submit" value="暂存到草稿箱"/>
                    </div>
                    <div class="col-lg-4">
                        <input id="1" class="btn btn-success btn-block" type="submit" value="提交发布"/>
                    </div>
                </div>

            </form>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

</body>

</html>

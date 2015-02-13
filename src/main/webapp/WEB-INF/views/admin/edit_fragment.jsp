<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>编辑碎片</title>
    <link href="${ctx}/static/libs/webuploader/webuploader.css" type="text/css" rel="stylesheet"/>
    <link href="${ctx}/static/libs/image-upload/style.css" type="text/css" rel="stylesheet"/>

    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/webuploader/webuploader.min.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/image-upload/upload.js"></script>
</head>


<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">编辑碎片</h1>


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
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

</body>

</html>

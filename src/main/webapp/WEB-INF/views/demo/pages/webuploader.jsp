<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Uploader</title>
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
                    <h1 class="page-header">Blank</h1>


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
                                <div class="uploadBtn">上传</div>
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


<%--<script>--%>
<%--// 初始化Web Uploader--%>
<%--var uploader = WebUploader.create({--%>
<%--// 选完文件后，是否自动上传。--%>
<%--auto: true,--%>
<%--// swf文件路径--%>
<%--swf: '${ctx}/static/libs/webuploader/Uploader.swf',--%>
<%--// 文件接收服务端。--%>
<%--server: '${ctx}/admin/pages/webuploader/upload',--%>
<%--// 选择文件的按钮。可选。--%>
<%--// 内部根据当前运行是创建，可能是input元素，也可能是flash.--%>
<%--pick: '#filePicker',--%>
<%--// 只允许选择图片文件。--%>
<%--accept: {--%>
<%--title: 'Images',--%>
<%--extensions: 'gif,jpg,jpeg,bmp,png',--%>
<%--mimeTypes: 'image/*'--%>
<%--}--%>
<%--});--%>
<%--//jalert('wewe');--%>
<%--// 当有文件添加进来的时候--%>
<%--uploader.on( 'fileQueued', function( file ) {--%>
<%--var $li = $(--%>
<%--'<div id="' + file.id + '" class="file-item thumbnail">' +--%>
<%--'<img>' +--%>
<%--'<div class="info">' + file.name + '</div>' +--%>
<%--'</div>'--%>
<%--),--%>
<%--$img = $li.find('img');--%>
<%--// $list为容器jQuery实例--%>
<%--$("#fileList").append( $li );--%>
<%--// 创建缩略图--%>
<%--// 如果为非图片文件，可以不用调用此方法。--%>
<%--// thumbnailWidth x thumbnailHeight 为 100 x 100--%>
<%--uploader.makeThumb( file, function( error, src ) {--%>
<%--if ( error ) {--%>
<%--$img.replaceWith('<span>不能预览</span>');--%>
<%--return;--%>
<%--}--%>
<%--$img.attr( 'src', src );--%>
<%--}, 100, 100 );--%>
<%--});--%>
<%--</script>--%>

</body>

</html>

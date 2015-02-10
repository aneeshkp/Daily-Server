<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>Dante Medium Editor Test</title>

    <!-- Dante CSS -->
    <link href="${ctx}/static/libs/dante/0.0.10/css/dante-editor.css" rel="stylesheet">
    <!-- Dante JavaScript -->
    <script src="${ctx}/static/libs/dante/0.0.10/js/dante-editor.js"></script>
    <script src="${ctx}/static/libs/dante/sanitize.js"></script>
    <script src="${ctx}/static/libs/dante/underscore-min.js"></script>
</head>


<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Blank</h1>

                    <div id="editor">
                        your content here
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

<script type="text/javascript">
    editor = new Dante.Editor(
            {
                el: "#editor",
                upload_url: "/images.json", //it expect an url string in response like /your/server/image.jpg or http://app.com/images/image.jpg
                store_url: "/save" //post to save

            }
    );
    editor.start()
</script>

</body>

</html>

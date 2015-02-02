<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>用户管理</title>
    <!-- Morris Charts CSS -->
    <link href="${ctx}/static/libs/morrisjs/morris.css" rel="stylesheet">

</head>


<body>

<div id="wrapper">

    <div id="page-wrapper">
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Morris.js Charts</h1>
            </div>
            <!-- /.col-lg-12 -->
        </div>
        <!-- /.row -->
        <div class="row">
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Area Chart Example
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-area-chart"></div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Bar Chart Example
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-bar-chart"></div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Line Chart Example
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-line-chart"></div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
            <div class="col-lg-6">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Donut Chart Example
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div id="morris-donut-chart"></div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
            <div class="col-lg-12">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        Morris.js Usage
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <p>Morris.js is a jQuery based charting plugin created by Olly Smith. In SB Admin, we are using
                            the most recent version of Morris.js which includes the resize function, which makes the
                            charts fully responsive. The documentation for Morris.js is available on their website, <a
                                    target="_blank" href="http://morrisjs.github.io/morris.js/">http://morrisjs.github.io/morris.js/</a>.
                        </p>
                        <a target="_blank" class="btn btn-default btn-lg btn-block"
                           href="http://morrisjs.github.io/morris.js/">View Morris.js Documentation</a>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
            <!-- /.col-lg-6 -->
        </div>
        <!-- /.row -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->


<!-- Morris Charts JavaScript -->
<script src="${ctx}/static/libs/raphael/raphael-min.js"></script>
<script src="${ctx}/static/libs/morrisjs/morris.min.js"></script>
<script src="${ctx}/static/js/morris-data.js"></script>


</body>

</html>

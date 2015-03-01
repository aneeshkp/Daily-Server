<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>瀑布流</title>

    <style>
        * {
            box-sizing: border-box;
        }

        .container {
            background: #EEE;
            width: 50%;
            margin-bottom: 20px;
        }

        .item {
            width: 60px;
            height: 60px;
            float: left;
            border: 1px solid;
            background: #09F;
        }

        .item.w2 {
            width: 120px;
        }

        .item.w3 {
            width: 180px;
        }

        .item.w4 {
            width: 240px;
        }

        .item.h2 {
            height: 100px;
        }

        .item.h3 {
            height: 160px;
        }

        .item.h4 {
            height: 220px;
        }

        .item.h5 {
            height: 280px;
        }

        .stamp {
            background: red;
            opacity: 0.75;
            position: absolute;
            border: 1px solid;
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
                    <h1 class="page-header">瀑布流</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">


                    <h1>basic</h1>

                    <div id="basic" class="container">


                        <div class="item"><img src="${ctx}/static/images/testflow/1.jpg" /></div>
                        <div class="item"><img src="${ctx}/static/images/testflow/2.jpg" /></div>
                        <div class="item"><img src="${ctx}/static/images/testflow/3.jpg" /></div>

                        <div class="item"><img src="${ctx}/static/images/testflow/1.jpg" /></div>
                        <div class="item h4"><img src="${ctx}/static/images/testflow/2.jpg" /></div>
                        <div class="item w2 h2"><img src="${ctx}/static/images/testflow/3.jpg" /></div>
                        <div class="item w2"></div>
                        <div class="item h3"></div>
                        <div class="item w3"></div>
                        <div class="item"></div>
                        <div class="item h4"></div>
                        <div class="item"></div>
                        <div class="item w2 h4"></div>
                        <div class="item w2"></div>
                        <div class="item h5"></div>
                        <div class="item w3"></div>
                        <div class="item"></div>
                        <div class="item h4"></div>
                        <div class="item"></div>
                        <div class="item w2 h5"></div>
                        <div class="item w2"></div>
                        <div class="item h3"></div>
                        <div class="item w3"></div>
                        <div class="item"></div>
                    </div>


                </div>
            </div>


        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

</body>

<script>

    var msnry;
    $(document).ready(function () {
        // initialize Masonry after all images have loaded
        imagesLoaded(container, function () {
            var container = document.querySelector('#container');
            msnry = new Masonry(container, {
                // options
                columnWidth: 12,
                itemSelector: '.item'
            });
        });


    });

</script>


<script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/masonry/masonry.pkgd.js"></script>
<script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/masonry/imagesloaded.pkgd.js"></script>

</html>

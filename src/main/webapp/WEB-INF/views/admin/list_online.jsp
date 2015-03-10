<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>已发布列表</title>
    <!-- DataTables CSS -->
    <link href="${ctx}/static/libs/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
          rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="${ctx}/static/libs/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">

</head>


<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">已发布列表</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            已发布列表
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table class="table table-striped table-bordered table-hover" id="draftTable">
                                    <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>类型</th>
                                        <th>标题</th>
                                        <th>来源</th>
                                        <th>标签</th>
                                        <th>状态</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>
                                    <tbody>

                                    </tbody>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>


        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<!-- DataTables JavaScript -->
<script src="${ctx}/static/libs/datatables/js/jquery.dataTables.min.js"></script>
<script src="${ctx}/static/libs/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>


<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function () {


        $('#draftTable').DataTable({
            responsive: true,
            language: {
                "sProcessing": "处理中...",
                "sLengthMenu": "显示 _MENU_ 项结果",
                "sZeroRecords": "没有匹配结果",
                "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                "sInfoPostFix": "",
                "sSearch": "搜索:",
                "sUrl": "",
                "sEmptyTable": "表中数据为空",
                "sLoadingRecords": "载入中...",
                "sInfoThousands": ",",
                "oPaginate": {
                    "sFirst": "首页",
                    "sPrevious": "上页",
                    "sNext": "下页",
                    "sLast": "末页"
                },
                "oAria": {
                    "sSortAscending": ": 以升序排列此列",
                    "sSortDescending": ": 以降序排列此列"
                }
            }
            ,

            "columns": [ // 列映射
                {"data": "id", sDefaultContent: ""}, // 默认值
                {"data": "type"},
                {"data": "title"},
                {"data": "source"},
                {"data": "tag"},
                {"data": "status"}
            ],

            "columnDefs": [
                {
                    "targets": 5,
                    "data": "status",
                    "render": function (data, type, row) {
                        if (data == "-1") {
                            return "草稿箱";
                        } else if (data == "0") {
                            return "队列中";
                        } else if (data == "1") {
                            return "已发布";
                        }
                    }
                },
                {
                    "targets": 6,
                    "data": null,
                    "render": function (data, type, row) {
//                    var editHtml = "<a href='javascript:void(0);' onclick='_editFun(" + "\"" + data.id + "\"" + ")'> 编辑 </a>";
                        var previewHtml = "<a href='javascript:void(0);' onclick='_previewFun(" + "\"" + data.id + "\"" + ")'> 查看 </a>";
//                    var submitHtml = "<a href='javascript:void(0);' onclick='_submitFun(\"" + data.id + "\")'> 发布 </a>";
//                    var deleteHtml = "<a href='javascript:void(0);' onclick='_deleteFun(\"" + data.id + "\")'> 废弃 </a>";
//                    return editHtml + previewHtml + submitHtml + deleteHtml;
                        return previewHtml;
                    }
                }],

//            scrollX: true,
//            scrollY: true,
//            stateSave: true,
            pagingType: "full_numbers",
            processing: true,
            serverSide: true,
            ajax: _ctxPath + "/admin/online/list" // 指定服务端URL
        });

        $('#draftTable tbody').on('click', 'tr', function () {
            var name = $('td', this).eq(0).text();
//            alert( '你点击了 '+name+'这行' );
        });


    });


    function _previewFun(id) {
        window.location = "${ctx}/admin/post/preview?id=" + id;
    }

</script>

</body>

</html>

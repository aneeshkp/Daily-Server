<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>草稿箱</title>
    <meta name="decorator" content="default"/>

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
                    <h1 class="page-header">草稿箱</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->


            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            草稿列表
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
    var draftTable;
    $(document).ready(function () {

        draftTable = $('#draftTable').DataTable({
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
                {"data": "status"},
            ],

            "columnDefs": [{
                "targets": 6,
                "data": null,
                "render": function (data, type, row) {
                    var editHtml = "<a href='javascript:void(0);' onclick='_editFun(" + "\"" + data.id + "\"" + ")'> 编辑 </a>";
                    var previewHtml = "<a href='javascript:void(0);' onclick='_previewFun(" + "\"" + data.id + "\"" + ")'> 预览 </a>";
                    var submitHtml = "<a href='javascript:void(0);' onclick='_submitFun(\"" + data.id + "\")'> 发布 </a>";
                    var deleteHtml = "<a href='javascript:void(0);' onclick='_deleteFun(\"" + data.id + "\")'> 废弃 </a>";
                    return editHtml + previewHtml + submitHtml + deleteHtml;
                }
            }],

//            scrollX: true,
//            scrollY: true,
//            stateSave: true,
            pagingType: "full_numbers",
            processing: true,
            serverSide: true,
            ajax: _ctxPath + "/admin/draft/list" // 指定服务端URL
        });

        $('#draftTable tbody').on('click', 'tr', function () {
            var id = $('td', this).eq(0).text();
//            console.log( '你点击了 '+id+'这行' );
        });


    });

    function _submitFun(id) {
        if (window.confirm("确认发布?")) {
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
        }
    }

    function _deleteFun(id) {
        if (window.confirm("废弃后无法恢复,确定要废弃吗?")) {
            $.ajax({
                type: "POST",
                url: "${ctx}/admin/post/delete",
                data: {"id": id},
                success: function (data) {
                    notice("已废弃");
                    draftTable.ajax.reload();
                },
                error: function (data, errCode, errDesc) {
                    alert("操作失败:\n" + errCode + errDesc);
                }
            });
        }
    }

    function _editFun(id) {
        window.location = "${ctx}/admin/post/edit?id=" + id;
    }

    function _previewFun(id) {
        window.location = "${ctx}/admin/post/preview?id=" + id;
    }


</script>


</body>

</html>

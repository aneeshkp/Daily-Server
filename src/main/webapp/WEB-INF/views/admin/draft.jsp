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

    <link href="${ctx}/static/libs/datatables-tools/dataTables.tableTools.css" rel="stylesheet">
    <link href="${ctx}/static/libs/datatables-editor/css/dataTables.editor.css" rel="stylesheet">


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
                                        <th>标题</th>
                                        <th>内容</th>
                                        <th>创建时间</th>
                                        <th>创建人</th>
                                        <th>来源</th>
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

<script src="${ctx}/static/libs/datatables-tools/dataTables.tableTools.js"></script>
<script src="${ctx}/static/libs/datatables-editor/js/dataTables.editor.js"></script>

<!-- Page-Level Demo Scripts - Tables - Use for reference -->
<script>
    $(document).ready(function () {

        var editor = new $.fn.dataTable.Editor({
            ajax: _ctxPath + "/admin/draft", // 指定服务端URL
            table: "#draftTable",

            fields: [{
                label: "标题:",
                name: "title"
            }, {
                label: "内容:",
                name: "content"
            }, {
                label: "创建时间:",
                name: "createAt"
            }, {
                label: "创建人:",
                name: "createBy"
            }
            ]
        });

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
                {"data": "title"},
                {"data": "content"},
                {"data": "createAt"},
                {"data": "createBy"},
                {"data": "source"}
            ],

//            sDom: "draftTable",
//            tableTools: {
//                sRowSelect: "os",
//                aButtons: [
//                    {sExtends: "editor_create", editor: editor},
//                    {sExtends: "editor_edit", editor: editor},
//                    {sExtends: "editor_remove", editor: editor}
//                ]
//            },

//            scrollX: true,
//            scrollY: true,
//            stateSave: true,
            pagingType: "full_numbers",
            processing: true,
            serverSide: true,
            ajax: _ctxPath + "/admin/draft/list" // 指定服务端URL
        });

        $('#draftTable tbody').on('click', 'tr', function () {
            var name = $('td', this).eq(0).text();
            alert( '你点击了 '+name+'这行' );
        });


    });


</script>


</body>

</html>

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>个人资料</title>
    <meta name="decorator" content="default"/>
</head>

<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">资料修改</h1>

                    <div class="row">
                        <div class="col-lg-6">

                            <form id="inputForm" action="${ctx}/admin/profile" method="post" role="form">
                                <input type="hidden" name="id" value="${user.id}"/>
                                <fieldset>
                                    <div class="form-group">
                                        <label for="name" class="control-label">用户名:</label>
                                        <input type="text" id="name" name="name" value="${user.name}"
                                               class="form-control required"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="plainPassword" class="control-label">密码:</label>

                                        <input type="password" id="plainPassword" name="plainPassword"
                                               class="form-control" placeholder="密码"/>
                                    </div>
                                    <div class="form-group">
                                        <label for="confirmPassword" class="control-label">确认密码:</label>

                                        <input type="password" id="confirmPassword" name="confirmPassword"
                                               class="form-control"
                                               equalTo="#plainPassword"/>
                                    </div>
                                    <div class="form-actions">
                                        <input id="submit_btn" class="btn btn-primary" type="submit" value="提交"/>&nbsp;
                                        <input id="cancel_btn" class="btn" type="button" value="返回"
                                               onclick="history.back()"/>

                                    </div>
                                </fieldset>
                            </form>
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

<script>
    $(document).ready(function () {
        //聚焦第一个输入框
        $("#name").focus();
        //为inputForm注册validate函数
        $("#inputForm").validate();
    });
</script>
</body>
</html>

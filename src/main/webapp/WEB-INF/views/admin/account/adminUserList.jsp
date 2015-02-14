<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>用户列表</title>
</head>

<body>
<c:if test="${not empty message}">
    <div id="message" class="alert alert-success">
        <button data-dismiss="alert" class="close">×</button>
            ${message}</div>
</c:if>


<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">用户列表</h1>


                    <table id="contentTable" class="table table-striped table-bordered table-condensed">
                        <thead>
                        <tr>
                            <th>登录名</th>
                            <th>用户名</th>
                            <th>注册时间
                            <th>管理</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${users}" var="user">
                            <tr>
                                <td><a href="${ctx}/admin/user/update/${user.id}">${user.loginName}</a></td>
                                <td>${user.name}</td>
                                <td>
                                    <fmt:formatDate value="${user.registerDate}" pattern="yyyy年MM月dd日  HH时mm分ss秒"/>
                                </td>
                                <td><a href="${ctx}/admin/user/delete/${user.id}">删除</a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>


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

<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>用户注册</title>

</head>

<body>


<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">注册</h3>
                </div>
                <div class="panel-body">

                    <form id="inputForm" action="${ctx}/admin/register" method="post" role="form">
                        <fieldset>

                            <div class="form-group">
                                <input type="text" id="loginName" name="loginName" class="form-control required"
                                       minlength="3" placeholder="登录名" autofocus/>
                            </div>
                            <div class="form-group">
                                <input type="text" id="name" name="name" class="form-control required"
                                       minlength="3" placeholder="用户名" autofocus/>
                            </div>
                            <div class="form-group">
                                <input type="password" id="plainPassword" name="plainPassword"
                                       class="form-control required" placeholder="密码"/>
                            </div>
                            <div class="form-group">
                                <input type="password" id="confirmPassword" name="confirmPassword"
                                       class="form-control required"
                                       equalTo="#plainPassword" placeholder="确认密码"/>
                            </div>
                            <div class="form-group">
                                <input id="submit_btn" class="btn btn-lg btn-success btn-block" type="submit"
                                       value="提交"/>&nbsp;
                                <div>
                                    <a class="btn" onclick="history.back()">返回</a>
                                </div>
                            </div>

                        </fieldset>
                    </form>

                </div>
            </div>
        </div>
    </div>
</div>


<script>

    // 前端输入验证
    $(document).ready(function () {

        $('#inputForm').formValidation({
            framework: 'bootstrap',
            icon: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            err: {
                container: 'tooltip'
            },
            fields: {
                loginName: {
                    validators: {
                        notEmpty: {
                            message: '登录名不能为空'
                        }
                        <%--,--%>
                        <%--remote: {--%>
                            <%--url: "${ctx}/register/checkLoginName",--%>
                            <%--type: 'POST',--%>
                            <%--data: function (validator) {--%>
                                <%--return {--%>
                                    <%--loginName: validator.getFieldElements('loginName').val()--%>
                                <%--};--%>
                            <%--},--%>
                            <%--message: '该账号已被注册'--%>
                        <%--}--%>
                    }
                }
            }
        });
    });

</script>

</body>
</html>

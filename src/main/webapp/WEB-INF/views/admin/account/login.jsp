<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>登录页</title>
    <meta name="decorator" content="default"/>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="login-panel panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">请登录</h3>
                </div>
                <div class="panel-body">

                    <form id="loginForm" action="${ctx}/admin/login" method="post" role="form">
                        <%
                            String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
                            if (error != null) {
                        %>
                        <div class="alert alert-error input-medium controls">
                            <button class="close" data-dismiss="alert">×</button>
                            登录失败，请重试.
                        </div>
                        <%
                            }
                        %>

                        <fieldset>
                            <div class="form-group">
                                <input type="text" id="username" name="username" value="${username}"
                                       class="form-control required" placeholder="用户名" autofocus/>
                            </div>
                            <div class="form-group">
                                <input type="password" id="password" name="password" class="form-control required"
                                       placeholder="密码"/>
                            </div>

                            <div class="form-group">
                                <div class="checkbox">
                                    <label>
                                        <input type="checkbox" id="rememberMe" name="rememberMe" value="Remember Me"/>记住我
                                    </label>
                                </div>
                                <input id="submit_btn" class="btn btn-lg btn-success btn-block" type="submit"
                                       value="登录"/>

                                <div>
                                    <a class="btn" href="${ctx}/admin/register">注册</a>
                                </div>
                            </div>
                            <span class="help-block">(管理员: <b>admin/admin</b>, 普通用户: <b>user/user</b>)</span>
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
        $('#loginForm').formValidation({
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
                username: {
                    validators: {
                        notEmpty: {
                            message: '不能为空'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: '请输入密码'
                        },
                        stringLength: {
                            min: 1,
                            max: 20,
                            message: '密码长度必须在6-20位之间'
                        }
                    }
                }
            }
        });
    });
</script>


</body>
</html>

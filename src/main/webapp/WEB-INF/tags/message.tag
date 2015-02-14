<%@ tag language="java" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ attribute name="content" type="java.lang.String" required="true" description="消息内容" %>
<%@ attribute name="type" type="java.lang.String" description="消息类型：info success warning error loading alert" %>

<c:if test="${not empty content}">
    <c:if test="${not empty messageType}">
        <c:set var="ctype" value="${messageType}"/>
    </c:if>
    <c:if test="${empty ctype}">
        <c:set var="ctype" value="${fn:indexOf(content,'失败') eq -1?'success':'error'}"/>
    </c:if>

    <%-- TODO 根据 提示类型参数 支持更多提示展现... --%>
    <script>

        $(document).ready(function(){

            // Notice at the bottom right
            function successNoticeBottomRight() {
                new jBox('Notice', {
                    content: '${content}',
                    position : {
                       x : 'center',
                       y : 'center'
                    },
                    color: "green",
                    autoClose: 2000
                });
            }
            // Notice at the bottom right
            function errorNoticeBottomRight() {
                new jBox('Notice', {
                    content: '${content}',
                    position : {
                      x : 'center',
                      y : 'center'
                   },
                    color: "red",
                    autoClose: 1000
                });
            }

            function alertNotice() {
                new jBox('Modal', {
                    title: '提示',
                    animation: 'flip',
                    width: 350,
                    content: '<div style="padding: 80px 0; text-align: center;">${content}</div>'
                }).open();
            }

            var type = "${ctype}";
            if (type == "success") {
                successNoticeBottomRight();
            }
            else if (type == "alert") {
                alertNotice();
            }
            else {
                errorNoticeBottomRight();
            }

        });


    </script>

</c:if>
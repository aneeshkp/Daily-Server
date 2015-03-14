<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<script src="${ctx}/static/site/libs/foundation-5.5.1/js/vendor/jquery.js"></script>
<script src="${ctx}/static/site/libs/foundation-5.5.1/js/vendor/fastclick.js"></script>
<script src="${ctx}/static/site/libs/foundation-5.5.1/js/foundation.min.js"></script>
<script>
    $(document).foundation();
</script>


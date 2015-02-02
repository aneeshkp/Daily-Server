<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!-- Footer -->
<footer>
    <div class="container">
        <div class="row">
            <div class="col-lg-8 col-lg-offset-2 col-md-10 col-md-offset-1">
                <ul class="list-inline text-center">

                    <li>
                        <a href="http://ng.daily.com/rss">
                            <span class="fa-stack fa-lg">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-rss fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>

                    <li>
                        <a href="https://twitter.com/ngdaily">
                            <span class="fa-stack fa-lg">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-twitter fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>

                    <li>
                        <a href="https://www.facebook.com/ngdaily">
                            <span class="fa-stack fa-lg">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-facebook fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>

                    <li>
                        <a href="https://github.com/ngdaily">
                            <span class="fa-stack fa-lg">
                                <i class="fa fa-circle fa-stack-2x"></i>
                                <i class="fa fa-github fa-stack-1x fa-inverse"></i>
                            </span>
                        </a>
                    </li>

                </ul>
                <p class="copyright text-muted">Copyright &copy; 绿草鞋 2015</p>
            </div>
        </div>
    </div>
</footer>

<!-- jQuery -->
<script src="${ctx}/static/site/js/jquery.min.js"></script>

<!-- Bootstrap Core JavaScript -->
<script src="${ctx}/static/site/js/bootstrap.min.js"></script>

<!-- Custom Theme JavaScript -->
<script src="${ctx}/static/site/js/clean-blog.min.js"></script>

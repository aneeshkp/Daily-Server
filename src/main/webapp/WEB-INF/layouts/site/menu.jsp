<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<div class="off-canvas-wrap" data-offcanvas>
    <div class="inner-wrap">
        <nav class="tab-bar">
            <section class="left-small"><a class="left-off-canvas-toggle menu-icon" href="#"><span></span></a></section>
            <section class="middle tab-bar-section"><h1 class="title">绿草鞋 日报</h1></section>
            <section class="right-small"><a class="right-off-canvas-toggle menu-icon" href="#"><span></span></a>
            </section>
        </nav>
        <aside class="left-off-canvas-menu">
            <ul class="off-canvas-list">
                <li><label>标签</label></li>
                <li><a href="#">灵感</a></li>
                <li><a href="#">流行</a></li>
                <label>知乎</label>
                <li><a href="#">设计</a></li>
                <li><a href="#">设计</a></li>
                <li><a href="#">设计</a></li>
                <label>小清新</label>
                <li><a href="#">设计</a></li>
                <li><a href="#">设计</a></li>
            </ul>
        </aside>
        <aside class="right-off-canvas-menu">
            <ul class="off-canvas-list">
                <li><label>设置</label></li>
                <li><a href="#">分享</a></li>
                <li><a href="#">分享</a></li>
                <li><a href="#">分享</a></li>
            </ul>
        </aside>
        <section class="main-section">

            <!-- content goes here -->


            <sitemesh:body/>


        </section>
        <a class="exit-off-canvas"></a></div>
</div>
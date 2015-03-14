<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>

    <title>绿草鞋</title>

    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link type="image/x-icon" href="${ctx}/static/images/favicon.ico" rel="shortcut icon">



    <link rel="stylesheet" href="${ctx}/static/site/libs/pure/pure-min.css">


    <link rel="stylesheet" href="${ctx}/static/site/libs/pure/site/css/main-grid.css">
    <link rel="stylesheet" href="${ctx}/static/site/libs/pure/site/css/main.css">
    <link rel="stylesheet" href="${ctx}/static/site/libs/pure/site/css/home.css">
    <link rel="stylesheet" href="${ctx}/static/site/libs/pure/site/css/rainbow/baby-blue.css">




    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="${ctx}/static/libs/html5shiv.js"></script>
    <script src="${ctx}/static/libs/respond.min.js"></script>
    <![endif]-->



    <style>

        h1, h2, h3, h4, h5, h6 {
            font-family: Helvetica, Tahoma, Arial, STXihei, "华文细黑", "Microsoft YaHei", "微软雅黑", SimSun, "宋体", Heiti, "黑体", sans-serif;
        }

        p, div {
            font-family: Helvetica, Tahoma, Arial, STXihei, "华文细黑", "Microsoft YaHei", "微软雅黑", SimSun, "宋体", Heiti, "黑体", sans-serif;
        }

        body {
            font-family: Helvetica, Tahoma, Arial, STXihei, "华文细黑", "Microsoft YaHei", "微软雅黑", SimSun, "宋体", Heiti, "黑体", sans-serif;
        }
    </style>

</head>


<body>



<div id="layout">
    <a href="#menu" id="menuLink" class="menu-link">
        <span></span>
    </a>
    <div id="menu">
        <div class="pure-menu">
            <a class="pure-menu-heading" href="/">绿草鞋</a>
            <ul class="pure-menu-list">

                <li class="pure-menu-item">
                    <a href="/start/" class="pure-menu-link">设计</a>
                </li>

                <li class="pure-menu-item">
                    <a href="/layouts/" class="pure-menu-link">资讯</a>
                </li>

                <li class="pure-menu-item menu-item-divided">
                    <a href="/base/" class="pure-menu-link">灵感</a>
                </li>

                <li class="pure-menu-item">
                    <a href="/grids/" class="pure-menu-link">人物</a>
                </li>

                <li class="pure-menu-item">
                    <a href="/forms/" class="pure-menu-link">公司</a>
                </li>

                <li class="pure-menu-item">
                    <a href="/buttons/" class="pure-menu-link">自然</a>
                </li>

                <li class="pure-menu-item">
                    <a href="/tables/" class="pure-menu-link">风格</a>
                </li>

                <li class="pure-menu-item">
                    <a href="/menus/" class="pure-menu-link">国外</a>
                </li>

                <li class="pure-menu-item menu-item-divided">
                    <a href="/tools/" class="pure-menu-link">精选</a>
                </li>

                <li class="pure-menu-item">
                    <a href="/customize/" class="pure-menu-link">品质</a>
                </li>

                <li class="pure-menu-item">
                    <a href="/extend/" class="pure-menu-link">味道</a>
                </li>

                <li class="pure-menu-item">
                    <a href="http://blog.purecss.io/" class="pure-menu-link">八卦</a>
                </li>
                <li class="pure-menu-item">
                    <a href="https://github.com/yahoo/pure/releases/" class="pure-menu-link">周报</a>
                </li>
            </ul>
        </div>
    </div>


    <div id="main">







        <div class="hero">
            <div class="hero-titles">
                <img class="logo" src="${ctx}/static/images/logo_pure@2x.png" alt="绿草鞋">
                <h2 class="hero-tagline">给你最想要的设计资讯.</h2>
            </div>

            <div class="hero-cta">
                <div class="is-code-full">
                    <pre class="code code-wrap" data-language="html">CC TT FS 为您呈现.</pre>
                </div>

                <p>
                    <a class="button-cta pure-button" href="/start/">查看最新</a>
                    <a class="button-secondary pure-button" href="https://github.com/yahoo/pure/">微信关注</a>
                </p>
            </div>
        </div>

        <div class="marketing">
            <div class="size-chart pure-g">

                <div class="size-chart-base pure-u" style="width: 19.8516%;">
                    <a class="size-chart-item" href="/base/">
                <span class="size-chart-label">
                    <span class="size-chart-mod">专业</span>
                    <span class="size-chart-size">20%</span>
                </span>
                    </a>
                </div>

                <div class="size-chart-grids pure-u" style="width: 15.4361%;">
                    <a class="size-chart-item" href="/grids/">
                <span class="size-chart-label">
                    <span class="size-chart-mod">深度</span>
                    <span class="size-chart-size">15.4361%</span>
                </span>
                    </a>
                </div>

                <div class="size-chart-forms pure-u" style="width: 26.8730%;">
                    <a class="size-chart-item" href="/forms/">
                <span class="size-chart-label">
                    <span class="size-chart-mod">灵感</span>
                    <span class="size-chart-size">26.8730%</span>
                </span>
                    </a>
                </div>

                <div class="size-chart-buttons pure-u" style="width: 14.4951%;">
                    <a class="size-chart-item" href="/buttons/">
                <span class="size-chart-label">
                    <span class="size-chart-mod">潮流</span>
                    <span class="size-chart-size">14.4951%</span>
                </span>
                    </a>
                </div>

                <div class="size-chart-tables pure-u" style="width: 8.9215%;">
                    <a class="size-chart-item" href="/tables/">
                <span class="size-chart-label">
                    <span class="size-chart-mod">国外</span>
                    <span class="size-chart-size">8.9215%</span>
                </span>
                    </a>
                </div>

                <div class="size-chart-menus pure-u" style="width: 14.4227%;">
                    <a class="size-chart-item" href="/menus/">
                <span class="size-chart-label">
                    <span class="size-chart-mod">灵感</span>
                    <span class="size-chart-size">14.4227%</span>
                </span>
                    </a>
                </div>

            </div>

            <div class="content">
                <h3 class="marketing-header">CSS with a minimal footprint.</h3>
                <p>
                    Pure is ridiculously tiny. The entire set of modules clocks in at <b>4.0KB* minified and gzipped</b>. Crafted with mobile devices in mind, it was important to us to keep our file sizes small, and every line of CSS was carefully considered. If you decide to only use a subset of these modules, you'll save even more bytes.
                </p>

                <p style="font-size:smaller;">
                    * We can add correctly :) the numbers above are individual module sizes; when grouped together they compress (gzip) even more.
                </p>
            </div>
        </div>

        <div class="marketing l-wrap pure-g">
            <div class="content pure-u-1 u-sm-1-2 u-xl-1-3">
                <h3 class="marketing-header">Your CSS foundation.</h3>
                <p>
                    Pure builds on <a href="http://necolas.github.io/normalize.css/">Normalize.css</a> and provides layout and styling for native HTML elements, plus the most common UI components. It's what you need, without the cruft.
                </p>
            </div>

            <div class="content pure-u-1 u-sm-1-2 u-xl-1-3">
                <h3 class="marketing-header">Made with mobile in mind.</h3>
                <p>
                    Pure is responsive out of the box, so elements look great on all screen sizes.
                </p>
            </div>

            <div class="content pure-u-1 u-lg-3-4 u-xl-1-3">
                <h3 class="marketing-header">Stays out of your way.</h3>
                <p>
                    Pure has minimal styles and encourages you to write your application styles on top of it. It's designed to get out of your way and makes it easy to override styles.
                </p>
            </div>
        </div>

        <div class="marketing l-wrap pure-g">
            <div class="marketing-diagram content pure-u-1 u-sm-2-3 u-md-1-2">
                <a href="/layouts/">
                    <img src="${ctx}/static/images/layout-icon.jpg" class="pure-img-responsive" alt="Diagram of a sample layout.">
                </a>
            </div>

            <div class="content pure-u-1 u-md-1-2">
                <h3 class="marketing-header">Create responsive layouts.</h3>
                <p>
                    By using <a href="/grids/">Grids</a>, <a href="/menus/">Menus</a>, and more, it's easy to create beautiful responsive layouts for all screen sizes. We've made it easy for you to get started. Take a look at a few different <a href="/layouts/">layouts</a> and start your next web project with a rock-solid foundation.
                </p>

                <p>
                    <a href="/layouts/" class="pure-button">View Layouts</a>
                </p>
            </div>
        </div>

        <div class="marketing marketing-customize l-wrap pure-g">
            <div class="content pure-u-1 u-md-1-2">
                <h3 class="marketing-header">Create your own look and feel.</h3>
                <p>
                    Unlike other frameworks, Pure's design is unopinionated, minimal and flat. We believe that it's much easier to add new CSS rules than to overwrite existing rules. By adding a few lines of CSS, you can customize Pure's appearance to work with your web project.
                </p>

                <p>
                    <a href="/extend/" class="pure-button">Extend Pure</a>
                </p>
            </div>

            <div class="sample-buttons content pure-u-1 u-md-1-2">
                <div class="pure-g">
            <span class="sample-button pure-u-1-2 u-sm-1-3">
                <button class="pure-button">Default</button>
            </span>

            <span class="sample-button pure-u-1-2 u-sm-1-3">
                <button class="button-a pure-button">Blue</button>
            </span>

            <span class="sample-button pure-u-1-2 u-sm-1-3">
                <button class="button-b pure-button">Yellow</button>
            </span>

            <span class="sample-button pure-u-1-2 u-sm-1-3">
                <button class="button-c pure-button">Black</button>
            </span>

            <span class="sample-button pure-u-1-2 u-sm-1-3">
                <button class="button-d pure-button">Green</button>
            </span>

            <span class="sample-button pure-u-1-2 u-sm-1-3">
                <button class="button-e pure-button">Red</button>
            </span>

            <span class="sample-button pure-u-1-2 u-sm-1-3">
                <button class="button-f pure-button">Purple</button>
            </span>

            <span class="sample-button pure-u-1-2 u-sm-1-3">
                <button class="button-g pure-button">Orange</button>
            </span>

            <span class="sample-button pure-u-1 u-sm-1-3">
                <button class="button-h pure-button">Indigo</button>
            </span>
                </div>
            </div>
        </div>


        <div class="footer">
            <div class="legal pure-g">
                <div class="pure-u-1 u-sm-1-2">
                    <p class="legal-license">
                        This site is built with &lt;3 using Pure v0.6.0<br>
                        All code on this site is licensed under the <a href="https://github.com/yahoo/pure-site/blob/master/LICENSE.md">Yahoo BSD License</a> unless otherwise stated.
                    </p>
                </div>

                <div class="pure-u-1 u-sm-1-2">
                    <ul class="legal-links">
                        <li><a href="https://github.com/yahoo/pure/">GitHub Project</a></li>
                        <li><a href="https://hackerone.com/yahoo/">Security Contact Info</a></li>
                    </ul>

                    <p class="legal-copyright">
                        &copy; 2014 Yahoo! Inc. All rights reserved.
                    </p>
                </div>
            </div>

        </div>
    </div>
</div>







<script src="${ctx}/static/site/libs/pure/site/js/ui.js"></script>




</body>

</html>

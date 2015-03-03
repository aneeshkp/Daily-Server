<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>堆糖瀑布流Woo - perfect solution for waterfall(jQuery)</title>
    <meta name="keywords" content="瀑布流,jQuery,waterfall,woo"/>
    <link rel="stylesheet" href="${ctx}/static/libs/waterfall/css/reset.css"/>
    <link rel="stylesheet" href="${ctx}/static/libs/waterfall/css/mobile.css"/>
    <link rel="stylesheet" href="${ctx}/static/libs/waterfall/css/woo.css"/>
    <link rel="stylesheet" href="${ctx}/static/libs/waterfall/css/resize.css"/>
    <script src="${ctx}/static/libs/waterfall/js/zepto/zepto.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/zepto/event.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/zepto/ajax.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/zepto/form.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/zepto/ie.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/zepto/selector.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/zepto/data.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/zepto/fx.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/zepto/fx_methods.js"></script>


    <script src="${ctx}/static/libs/waterfall/js/browser.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/history.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/template.min.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/tabswitch.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/woo.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/masnunit.js"></script>
</head>
<body>


<style>
    html, body {
        background-color: black;
    }

    #content {
        margin: 0
    }

    .woo div {
        color: blue;
        font-size: 40px;
        text-align: center;
    }

    .woo-loading {
        background: none;
    }

    /* switch holder */
    #switchholder {
        height: 40px;
    }

    #switchholder li {
        display: inline;
        padding: 0 8px;
    }

    #switchholder a:link,
    #switchholder a:visited {
        color: #fff;
    }

    #switchholder a:hover {
        color: #fff;
    }

    #switchholder li.woo-cur a:link,
    #switchholder li.woo-cur a:visited {
        color: #0f0;
    }

    #switchholder li.woo-cur a:hover {
        color: #0f0;
    }

    .flinetop,
    .flinebot {
        position: fixed;
        z-index: 9999999;
        top: 100px;
        bottom: auto;
        overflow: hidden;
        width: 100%;
        border-top: 2px solid green;
        height: 0px;
    }

    .flinebot {
        top: auto;
        bottom: 100px;
    }

    .freport {
        position: fixed;
        z-index: 9999999;
        top: 150px;
        right: 0;
        width: 300px;
        padding: 2px 8px 8px;
        border: 1px solid green;
        color: white;
        font-size: 20px;
    }

    .freport h3 {
        margin: 8px 0 0;
        color: #ccc
    }

    #visiblerange p {
        zoom: 1
    }

    #visiblerange p:after {
        content: "\0020";
        display: block;
        height: 0;
        overflow: hidden;
        clear: both;
    }

    #visiblerange p u {
        float: left;
        width: 60px;
        text-align: right;
    }

    #visiblerange p span {
        float: left;
        width: 40px;
        margin: 0 0 0 8px;
    }

    #visibleindex {
        word-wrap: break-word;
        word-break: break-all;
        overflow: hidden;
    }
</style>

<div class="flinetop"></div>
<div class="flinebot"></div>
<div class="freport">
    <h3>columnVisibleRange:</h3>

    <div id="visiblerange">

    </div>
    <h3>visibleUnits:</h3>

    <div id="visibleindex"></div>
</div>


<div style="height:800px">

</div>


<div id="content">
    <div id="woo-holder">
        <!-- When gotop button is clicked, scrollbar will be positioned where the anchor is. -->
        <a name="woo-anchor"></a>
        <ul id="switchholder">
            <li><a href="${ctx}/admin/waterfall/recycledemo1">step1</a></li>
            <li><a href="${ctx}/admin/waterfall/recycledemo2">step2</a></li>
            <li class="woo-swa woo-cur"><a href="${ctx}/admin/waterfall/recyclefinal">final</a></li>
            <li><a href="${ctx}/admin/waterfall/main" target="_blank">other demos</a></li>
        </ul>

        <div class="woo-swb">
            <!-- "data-wootemp=2" indicates the ANALYZERESPONSE[2] in masnunit.js will be used  -->
            <!-- Different numbers reprent different types of waterfall -->
            <div class="woo-pcont woo-masned my-pic" data-wootemp="2" data-subpagenum="400">

            </div>
            <div class="woo-pager"></div>
        </div>

    </div>
    <!-- Woo holder over -->

</div>


<div style="height:800px">

</div>

<style>
    /* invisible holder for the page */
    #win-holder {
        overflow: hidden;
        height: 0px;
    }
</style>
<div id="win-holder">
    <form id="woo-form-collect" action="/message/list/">
    </form>
</div>

<script src="./debugdata.js"></script>

<script>
    $(function () {
        var conf = {
            // Identification of a single waterfall. There are 4 waterfalls in main.jsp.
            // You can get the form in #win-holder by putting formprefix and one identification together.
            // <form id="woo-form-(collect|original|album|favalbum)">
            "arrform": ['collect'],

            // arrsplit, the last part of the url which has been split by page number.
            // The first part of the url has already been put in the action attribute of the proper form.
            // Page number can be seen neighther in the first part nor the last part.
            // Why and how we do this? Think a simple url like '/message/list/1/tail/?type=hot'
            // First, we put '/message/list/' in form action.
            // Then, we can make a hidden input in this form <input type="hidden" name="type" value="hot"/>.
            // Finally, we put '/tail/' into arrsplit.
            // Or, we could choose no hidden input and '/tail/?type=hot' into arrsplit.
            // Nevertheless, we put them together and get the entire url.
            "arrsplit": '',

            // The extend width of each common column including margin between two cols.
            "arrmasnw": 104,

            // The margin between two cols.
            "arrmargin": 8,

            // Diff value of special column width, default 0.
            // Why the value is 0, not [0,0,0,0]?
            // We simplified params by converting equal-value array [0,0,0,0] to single value 0.
            // Params arrsplit, arrmasnw, arrmargin and arrgap can be treated on the same principle.
            // But, param arrform is out of the principle.
            "arrfmasnw": 0,

            // The gap between units in one column.
            "arrgap": 8,

            // Open resize mode.
            // If you open it, every time window resizes, waterfall will be repainted.
            // Not recommend in ie.
            "resize": false,

            // auto recycle invisible units while scrolling
            // resize will not work if recycle is used
            // don't open it if you want to do operations like delete or ordering
            "exrecycle": true,
            "exrecycletop": -100,
            "exrecyclebot": -100
        }

        // Let's go.
        $.Woo(conf);
    })


    // all code below is not necessary in real environment
    $(window).scroll(function () {
        var masn = $.Woo.masn[0];
        if (masn) {
            var $dom = masn.$dom,
                    domtp = $dom.position().top;

            var visibleunits = [];
            $('#visiblerange').html(function () {
                var part0 = '',
                        part1 = '';
                for (var i = 0; i < masn.colCount; i++) {
                    var ranget = masn.columnVisibleRange[0][i],
                            rangeb = masn.columnVisibleRange[1][i];
                    part0 += '<span>' + masn.columnVisibleRange[0][i] + '</span>';
                    part1 += '<span>' + masn.columnVisibleRange[1][i] + '</span>';

                    for (var j = ranget; j <= rangeb;) {
                        visibleunits.push(j);
                        if (masn.posCoordination["" + j]) {
                            j = masn.posCoordination["" + j][4];
                        } else {
                            break;
                        }
                    }
                }
                ;
                return '<p><u>from:</u>' + part0 + '</p><p><u>to:</u>' + part1 + '</p>';
            })


            visibleunits.sort(function (a, b) {
                if (a < b) {
                    return -1;
                } else {
                    return 1;
                }
            });

            $('#visibleindex').html(visibleunits.join(','))
        }
    })
</script>
</body>
</html>


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
    <link rel="stylesheet" href="${ctx}/static/libs/waterfall/css/main.css"/>
    <link rel="stylesheet" href="${ctx}/static/libs/waterfall/css/woo.css"/>
    <link rel="stylesheet" href="${ctx}/static/libs/waterfall/css/gotop.css"/>
    <link rel="stylesheet" href="${ctx}/static/libs/waterfall/css/pagine.css"/>
    <link rel="stylesheet" href="${ctx}/static/libs/waterfall/css/resize.css"/>
    <script src="${ctx}/static/libs/waterfall/js/jquery-1.6.1.min.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/browser.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/history.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/template.min.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/tabswitch.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/woo.js"></script>
    <script src="${ctx}/static/libs/waterfall/js/masnunit.js"></script>
</head>
<body>

<div id="header">

    <div class="lattern">
        <a href="${ctx}/admin/waterfall/delete">demo-del</a>
        <a href="${ctx}/admin/waterfall/order">demo-order</a>
        <a class="redlk" href="${ctx}/admin/waterfall/recycledemo1" title="auto recycle">demo-recycle</a>
        <a class="redlk" href="${ctx}/admin/waterfall/messup" title="messup">demo-messup</a>
        <a class="redlk" href="${ctx}/admin/waterfall/reinstall" title="messup">demo-reinstall</a>
        <a href="${ctx}/admin/waterfall/mobile">demo-mobile</a>
        <a href="${ctx}/admin/waterfall/fixedw" title="fixed width">demo-fixedw</a>
        <a href="${ctx}/admin/waterfall/norequest">demo-simplest</a>
        <a href="${ctx}/admin/waterfall/specialcol">demo-specialcol</a>
        <a href="${ctx}/admin/waterfall/main">demo-main</a>
        <a href="${ctx}/admin/waterfall/sinkleft">demo-sink</a>
        <a href="http://blog.duitang.com/?p=1" target="_blank">博客</a>
        <a href="https://github.com/duitang/waterfall" target="_blank">GitHub</a>
    </div>


    <h1><a href="http://www.duitang.com" title="www.duitang.com">堆糖瀑布流 Woo(Waterfall O O) in duitang.com</a></h1>
</div>


<div id="content">
    <style>
        .newinfo {
            padding: 8px 8px 10px;
            border: 2px solid #2386d8;
            color: #f14382;
        }

        .newinfo u {
            color: #ccc;
            text-decoration: none;
        }

        .newinfo .operate {
            text-align: right;
        }
    </style>
    <div class="newinfo">
        Order by favarites. This example has no preseted contents in html.<u>（Units preseted in html have no saved datas
        in $.Woo.WooTemp.masnUnits）</u>

        <div class="operate">
            <a id="btnorderdesc" class="abtn" href="javascript:;">&gt;&gt; order by favarites desc &lt;&lt;</a>&nbsp;&nbsp;<a
                id="btnorderasc" class="abtn" href="javascript:;">&gt;&gt; order by favarites asc &lt;&lt;</a>
        </div>
    </div>
    <div id="woo-holder">
        <!-- When gotop button is clicked, scrollbar will be positioned where the anchor is. -->
        <a class="woo-swa" name="woo-anchor"></a>


        <div class="woo-swb">
            <div class="woo-pcont woo-masned my-pic">
            </div>
            <div class="woo-pager"></div>
        </div>
        <div class="woo-swb">

            <div class="woo-pcont woo-masned my-album" data-domwidth="1000" data-wootemp="1" data-subpagenum="6"></div>
            <div class="woo-pager"></div>
        </div>
        <div class="woo-swb">
            <div class="woo-pcont woo-masned my-album" data-wootemp="1" data-subpagenum="6"></div>
            <div class="woo-pager"></div>
        </div>
        <div class="woo-swb">
            <div class="woo-pcont woo-masned my-pic"></div>
            <div class="woo-pager"></div>
        </div>

    </div>
    <!-- Woo holder over -->

</div>



<div id="footer">
    &copy;Copyright by 堆糖 2010-2013 duitang.com, all rights reserved
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
        // Append buttons gonext, gopre, gotop to the body as you like.
        $('<div id="mycontrols"><a href="javascript:;" id="gotop"></a></div>').appendTo('body');

        var conf = {
            // Prefix of form id. Each form represents a subpage data request.
            "formprefix": '#woo-form-',

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
            "arrmasnw": 245,

            // The margin between two cols.
            // In this example, visible column width is 245-21=224.
            "arrmargin": 21,


            // Diff value of special column width, default 0.
            // Why the value is 0, not [0,0,0,0]?
            // We simplified params by converting equal-value array [0,0,0,0] to single value 0.
            // Params arrsplit, arrmasnw, arrmargin and arrgap can be treated on the same principle.
            // But, param arrform is out of the principle.
            "arrfmasnw": 0,

            // The gap between units in one column.
            "arrgap": 0,


            // Install $gopre $gonext $gotop as you like.
//		"gopre" : '#gopre',
//		"gonext" : '#gonext',
            "gotop": '#gotop',

            // Footer selctor, any tag below the pager can be treated as footer.
            "footer": '#footer,#preserve',

            // Open resize mode.
            // If you open it, every time window resizes, waterfall will be repainted.
            // Not recommend in ie.
            "resize": true,

            // Sth you do during scrolling, say, pop out a login confirm.
            "onScroll": function (tp) {
                // tp current scrolltop
//			if( (typeof ALREADYNOTICED === 'undefined' || !ALREADYNOTICED) && tp >= 1000 ){
//				ALREADYNOTICED = true
//				alert("login")
//			}
            }
        }

        // Let's go.
        $.Woo(conf);


        // order units by favarites, data has already been saved in $.Woo.WooTemp.masnUnits
        $('#btnorderdesc,#btnorderasc').click(function (e) {
            e.preventDefault();
            e.stopPropagation();

            // param desc = true
            orderCall(this.id === 'btnorderdesc' ? true : false);
        })


        // param desc
        function orderCall(desc) {
            var masn = $.Woo.masn[0],
                    colc = masn.colCount,
                    colY = masn.$dom.data('colY'),
                    minY, minI, left,
                    munits = $.Woo.WooTemp.masnUnits,
                    el,
                    arru = [],
                    $units = $('.woo:visible').not('.woo-f');


            // set each colY height 0
            for (var i = 0; i < colc; i++) {
                colY[i] = 0;
            }
            masn.screent = masn.screen = 0;


            for (el in munits) {
                arru.push({
                    "indx": munits[el].indx,
                    "fav": munits[el].favc
                })
            }


            // order
            arru.sort(function (a, b) {
                if (a.fav > b.fav) {
                    return desc ? -1 : 1;
                } else {
                    return desc ? 1 : -1;
                }
            });


            for (var i = 0, l = arru.length; i < l; i++) {
                var $new = $units.eq(arru[i].indx),
                        ht = $new.data('ht'),
                        len = colc,
                        ars = masn.prePlaceUnit($new, colY, colc);

                minY = ars[0],
                        minI = ars[1],
                        left = ars[2],
                        ht = ars[3];


                $new.css({
                    "left": left,
                    "top": minY
                })
                        .removeClass(function (i, cls) {
                            return 'woo-spcol ' + (cls.match(/(co|sc)\d+/ig) || []).join(' ')
                        })
                        .addClass('sc' + masn.screen + ' co' + minI);
            }
        }
    })
</script>
</body>
</html>


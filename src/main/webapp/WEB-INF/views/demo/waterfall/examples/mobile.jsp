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
    <div id="woo-holder">
        <!-- When gotop button is clicked, scrollbar will be positioned where the anchor is. -->
        <a name="woo-anchor"></a>

        <div class="woo-swa">my pics</div>

        <div class="woo-swb">
            <!-- "data-wootemp=2" indicates the ANALYZERESPONSE[2] in masnunit.js will be used  -->
            <!-- Different numbers reprent different types of waterfall -->
            <div class="woo-pcont woo-masned my-pic" data-wootemp="2">
                <!-- You can preset some(no limit) '.woo' tags here in '.woo-pcont', they will be treated as the first subpage. Then waterfall request will start from subpage No. 2. -->
                <div class="woo" data-ht="96">
                    <div class="j" style="height:96px"><a href="http://m.duitang.com/people/mblog/87354707/detail/"><img
                            src="http://cdn.duitang.com/uploads/item/201307/24/20130724101156_GjTNy.thumb.200_0.jpeg"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="72">
                    <div class="j" style="height:72px"><a href="http://m.duitang.com/people/mblog/87354659/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/24/20130724101146_WzNym.thumb.200_0.jpeg"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="96">
                    <div class="j" style="height:96px"><a href="http://m.duitang.com/people/mblog/87354603/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/24/20130724101104_YTeCw.thumb.200_0.jpeg"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="100">
                    <div class="j" style="height:100px"><a
                            href="http://m.duitang.com/people/mblog/87354520/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/24/20130724101054_WUuTZ.thumb.200_0.jpeg"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="97">
                    <div class="j" style="height:97px"><a href="http://m.duitang.com/people/mblog/87172299/detail/"><img
                            src="http://cdn.duitang.com/uploads/item/201307/23/20130723103900_2BQiW.thumb.200_0.jpeg"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="96">
                    <div class="j" style="height:96px"><a href="http://m.duitang.com/people/mblog/87172284/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/23/20130723103853_ranmk.thumb.200_0.jpeg"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="70">
                    <div class="j" style="height:70px"><a href="http://m.duitang.com/people/mblog/87172270/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/23/20130723103848_L5Cn3.thumb.200_0.jpeg"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="101">
                    <div class="j" style="height:101px"><a
                            href="http://m.duitang.com/people/mblog/87172247/detail/"><img
                            src="http://cdn.duitang.com/uploads/item/201307/23/20130723103841_uCKPC.thumb.200_0.jpeg"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="96">
                    <div class="j" style="height:96px"><a href="http://m.duitang.com/people/mblog/87172231/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/23/20130723103816_AuMRT.thumb.200_0.jpeg"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="84">
                    <div class="j" style="height:84px"><a href="http://m.duitang.com/people/mblog/87006784/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/22/20130722114543_kJLfk.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="95">
                    <div class="j" style="height:95px"><a href="http://m.duitang.com/people/mblog/87006744/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/22/20130722114539_L4TCx.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="95">
                    <div class="j" style="height:95px"><a href="http://m.duitang.com/people/mblog/87006707/detail/"><img
                            src="http://cdn.duitang.com/uploads/item/201307/22/20130722114521_LhrdV.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="84">
                    <div class="j" style="height:84px"><a href="http://m.duitang.com/people/mblog/87006667/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/22/20130722114506_ZTHjw.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="101">
                    <div class="j" style="height:101px"><a
                            href="http://m.duitang.com/people/mblog/87006574/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/22/20130722114421_vkJYx.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="95">
                    <div class="j" style="height:95px"><a href="http://m.duitang.com/people/mblog/86991265/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/22/20130722095141_ECrxH.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="93">
                    <div class="j" style="height:93px"><a href="http://m.duitang.com/people/mblog/86991214/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/22/20130722095134_KY3Wt.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="95">
                    <div class="j" style="height:95px"><a href="http://m.duitang.com/people/mblog/86991186/detail/"><img
                            src="http://cdn.duitang.com/uploads/item/201307/22/20130722095011_UEPfy.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="86">
                    <div class="j" style="height:86px"><a href="http://m.duitang.com/people/mblog/86277048/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/18/20130718100345_SKPX3.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="103">
                    <div class="j" style="height:103px"><a
                            href="http://m.duitang.com/people/mblog/86276978/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/18/20130718100310_KXGT2.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="134">
                    <div class="j" style="height:134px"><a
                            href="http://m.duitang.com/people/mblog/86276907/detail/"><img
                            src="http://cdn.duitang.com/uploads/item/201307/18/20130718100228_zyYBa.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="94">
                    <div class="j" style="height:94px"><a href="http://m.duitang.com/people/mblog/86276840/detail/"><img
                            src="http://cdn.duitang.com/uploads/item/201307/18/20130718100208_2UeaR.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="71">
                    <div class="j" style="height:71px"><a href="http://m.duitang.com/people/mblog/86276784/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/18/20130718100135_F4AKh.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="66">
                    <div class="j" style="height:66px"><a href="http://m.duitang.com/people/mblog/86111112/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/17/20130717103101_RWxvf.thumb.200_0.png"
                            width="96"></a></div>
                </div>
                <div class="woo" data-ht="144">
                    <div class="j" style="height:144px"><a
                            href="http://m.duitang.com/people/mblog/86111018/detail/"><img
                            src="http://img4.duitang.com/uploads/item/201307/17/20130717102953_YcweY.thumb.200_0.png"
                            width="96"></a></div>
                </div>
            </div>
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
        var $wooholder = $('#woo-holder');
        $wooholder.find('.woo-pager').append('<a id="gonext" href="javascript:;">下一页</a>').css({
            "height": 0,
            "overflow": "hidden"
        })


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


            // Install $gopre $gonext $gotop as you like.
            "gonext": '#gonext',

            // Footer selctor, any tag below the pager can be treated as footer.
            "footer": '#footer,#preserve',

            // Open resize mode.
            // If you open it, every time window resizes, waterfall will be repainted.
            // Not recommend in ie.
            "resize": false,

            // auto recycle invisible units while scrolling
            // resize will not work if recycle is used
            // don't open it if you want to do operations like delete or ordering
            "exrecycle": false,

            // Sth you do during scrolling, say, pop out a login confirm.
            "onScroll": function (tp) {
                // tp current scrolltop
                // TODO
            }
        }

        // Let's go.
        $.Woo(conf);
    })
</script>
</body>
</html>


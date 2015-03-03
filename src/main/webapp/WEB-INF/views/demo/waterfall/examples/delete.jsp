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

        /* css piece for this page */
        .woo .del {
            position: absolute;
            z-index: 100;
            top: 0;
            right: 0;
        }
    </style>
    <div class="newinfo">
        Delete one single unit, call method $.Woo.resetCol() to reset the colomn related.<br/>In this demo, units are
        not really deleted, only dom nodes are. Unit data is still alive in $.Woo.WooTemp.masnUnits. Meanwhile, the
        first subpage units have no data kept in masnUnits because they are preset via html.
    </div>
    <div id="woo-holder">
        <!-- When gotop button is clicked, scrollbar will be positioned where the anchor is. -->
        <a class="woo-swa" name="woo-anchor"></a>


        <div class="woo-swb">
            <!-- data-totalunits is set here, then pager nums would be fixed -->
            <!-- It would have been Hasnext Mode if you didn't do it -->
            <div class="woo-pcont woo-masned my-pic" data-totalunits="440">
                <!--  -->
                <!-- .woo-pcont 节点内可预先放好若干个单元(个数没有限制) -->
                <!-- 预先放置的会被当做第一子页数据，后面会直接从第二子页开始 -->
                <!-- 可以选择不放置 -->
                <div data-id="97219875" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:266px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97219875/detail/"><img
                                data-rootid="97219875" data-iid="7007475"
                                src="http://cdn.duitang.com/uploads/item/201303/22/20130322143937_mdf5i.thumb.200_0.jpeg"
                                height="266"/></a>

                            <div class="collbtn" data-favorite='{"id":97219875,"owner":1629580}'><a class="y" href="#">52</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">52</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">古风</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/1629580/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201307/29/20130729212849_MiajP.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/1629580/">香水座</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/4319045/">手绘</a>&nbsp;专辑中</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div data-id="97213585" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:320px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97213585/detail/"><img
                                data-rootid="97213585" data-iid="10734426"
                                src="http://cdn.duitang.com/uploads/blog/201309/22/20130922173315_UBJXm.thumb.200_0.jpeg"
                                height="320"/></a>

                            <div class="collbtn" data-favorite='{"id":97213585,"owner":1747443}'><a class="y" href="#">24</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">24</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">几款手链编织方法教程，有兴趣的童鞋可以收藏下次自己动手试试哦~~</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/1747443/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201401/15/20140115014745_4K4Tr.png"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/1747443/">冷面君</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/4753591/">动动动</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="96206849" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:200px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/96206849/detail/"><img
                                data-rootid="96206849" data-iid="8171246"
                                src="http://cdn.duitang.com/uploads/item/201306/03/20130603064322_f8vh5.thumb.200_0.jpeg"
                                height="200"/></a>

                            <div class="collbtn" data-favorite='{"id":96206849,"owner":734625}'><a class="y"
                                                                                                   href="#">43</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">43</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">米子家居美式复古香水瓶/玻璃瓶/漂流瓶/幸运瓶埃蒙德茅头装饰瓶&nbsp;<a class="dymprice dib bl"
                                                                               href="http://www.duitang.com/dj/go2/?mk=_p_96206849&to=http%3A%2F%2Fitem.taobao.com%2Fitem.htm%3Fid%3D14041861280%26spm_d%3D3&spm=2014.12553688.102.0"
                                                                               target="_blank"><u class="_tb"
                                                                                                  title="去购买">￥139.0</u></a>
                        </div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/734625/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201206/06/20120606220254_Q5h8i.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank"
                                      href="http://www.duitang.com/people/734625/">安昂昂Adele</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/1111768/">BUYUBU</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97210029" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:200px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97210029/detail/"><img
                                data-rootid="97210029" data-iid="9376609"
                                src="http://cdn.duitang.com/uploads/item/201307/17/20130717220825_emeCH.thumb.200_0.jpeg"
                                height="200"/></a>

                            <div class="collbtn" data-favorite='{"id":97210029,"owner":543533}'><a class="y"
                                                                                                   href="#">24</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">24</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">三年二班●创意家居简约复古咖啡杯马克杯水杯牛奶杯子&nbsp;<a class="dymprice dib bl"
                                                                         href="http://www.duitang.com/dj/go2/?mk=_p_97210029&to=http%3A%2F%2Fitem.taobao.com%2Fitem.htm%3Fid%3D19157046510%26spm_d%3D3&spm=2014.12553688.102.0"
                                                                         target="_blank"><u class="_tb" title="去购买">￥12.0</u></a>
                        </div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/543533/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201309/11/20130911205934_8mZQP.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/543533/">半分热度</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/1678901/">小时尚</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97217289" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:268px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97217289/detail/"><img
                                data-rootid="97217289" data-iid="7256268"
                                src="http://cdn.duitang.com/uploads/item/201304/02/20130402181544_UJRue.thumb.200_0.jpeg"
                                height="268"/></a>

                            <div class="collbtn" data-favorite='{"id":97217289,"owner":276980}'><a class="y" href="#">2648</a><a
                                    class="z" href="#">0</a><a class="x" href="#">2</a></div>
                        </div>
                        <div class="d"><span class="d1">2648</span><span class="d2">0</span><span class="d3">2</span>
                        </div>
                        <div class="g">泰式菠萝饭 菠萝直立，从菠萝的1/3处切开，不要破坏菠萝头部，留下的2/3段做容器，轻轻地将菠萝果肉挖出，并用淡盐水浸泡15分钟后切成小丁备用
                            洋葱切成丁，朝天椒切圈、鸡蛋打入碗中，调入一点蚝油打散备用 热锅放入适量油，大火加热至油8成热时，倒入鸡蛋液并用铲子快速搅碎，鸡蛋熟后盛出。再放入生花生仁炒约1分钟至酥脆后捞出
                            热锅再倒入1勺油，放入青豆、洋葱丁、虾仁、朝天椒炒片刻，放入白米饭、炒好的鸡蛋和菠萝丁、最后加入调味料拌炒均匀，然后盛入菠萝盅里，在上面撒上花生米即可【桑】
                        </div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/276980/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201201/09/20120109230952_5ZmYL.thumb.24_24_c.jpg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/276980/">晨雨er</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/5532602/">甜品小食</a>&nbsp;专辑中
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/980269/"><img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201209/27/20120927102833_Cuasa.thumb.24_24_c.jpeg"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/980269/">nananana825</a>&nbsp;我想吃
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/1481614/"><img
                                    width="24" height="24" src="http://cdn.duitang.com/img/0/dfhead.thumb.24_24_c.gif"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/1481614/">kmzhangsir</a>&nbsp;爱美食就要爱自己http://www.haxiu.com/meishi/weibolucaipu/
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97219924" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:207px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97219924/detail/"><img
                                data-rootid="97219924" data-iid="10705005"
                                src="http://cdn.duitang.com/uploads/blog/201309/20/20130920232245_jwVuQ.thumb.200_0.jpeg"
                                height="207"/></a>

                            <div class="collbtn" data-favorite='{"id":97219924,"owner":901331}'><a class="y" href="#">166</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">166</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">【DIY椰汁西米糕】 1.西米煮至透明； 2.煮好捞出冲凉沥干； 3.西米放入10g白糖搅匀，平铺容器底部； 4.锅中倒200ml椰浆、25g白糖，小火煮化；
                            5.放入冷水泡软、挤干水份的吉利丁片2片搅化； 6.倒入底部铺有西米的容器中，入冰箱冷藏至凝固， 取出倒扣切小块即可。
                        </div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/901331/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201208/18/20120818235411_KrEFx.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/901331/">小蓝酱</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/1501245/">菜谱</a>&nbsp;专辑中</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div data-id="97212210" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:373px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97212210/detail/"><img
                                data-rootid="97212210" data-iid="3259783"
                                src="http://cdn.duitang.com/uploads/item/201206/06/20120606225855_Nihxt.thumb.200_0.jpeg"
                                height="373"/></a>

                            <div class="collbtn" data-favorite='{"id":97212210,"owner":823415}'><a class="y" href="#">1476</a><a
                                    class="z" href="#">0</a><a class="x" href="#">2</a></div>
                        </div>
                        <div class="d"><span class="d1">1476</span><span class="d2">0</span><span class="d3">2</span>
                        </div>
                        <div class="g">【费列罗金箔玫瑰DIY】真不想用废物利用四个字来定义它~~~美得真有质感，不是么~~（ps:在那个什么节，送给你的费列罗，金箔纸就可以不用团个球扔了！！！）
                        </div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/823415/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201207/25/20120725151311_GZi4F.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/823415/">空白o丶</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/1350258/">创造世界 丶</a>&nbsp;专辑中
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/1384237/"><img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201303/31/20130331212301_5HJBK.thumb.24_24_c.jpeg"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/1384237/">ADAMAS碎</a>&nbsp;很好
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/1339046/"><img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201303/13/20130313144632_HULX8.thumb.24_24_c.jpeg"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/1339046/">Ruthjie</a>&nbsp;太有才了,下次吃费列罗后试试
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97219857" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:266px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97219857/detail/"><img
                                data-rootid="97219857" data-iid="6370566"
                                src="http://cdn.duitang.com/uploads/item/201301/24/20130124190110_CizNc.thumb.200_0.jpeg"
                                height="266"/></a>

                            <div class="collbtn" data-favorite='{"id":97219857,"owner":1815860}'><a class="y" href="#">220</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">220</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">{油漆。}玄关，穿鞋椅和收纳是必须有的</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/1815860/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201309/25/20130925093805_f4HSd.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/1815860/">媛来在这里_</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/5532992/">家居</a>&nbsp;专辑中</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div data-id="97156026" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:272px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97156026/detail/"><img
                                data-rootid="97156026" data-iid="10619315"
                                src="http://cdn.duitang.com/uploads/item/201309/16/20130916094625_VtZML.thumb.200_0.jpeg"
                                height="272"/></a>

                            <div class="collbtn" data-favorite='{"id":97156026,"owner":1392014}'><a class="y" href="#">133</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">133</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">质朴 宁静 的蓝</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/1392014/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201304/03/20130403171738_ssMai.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank"
                                      href="http://www.duitang.com/people/1392014/">jie899874</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/2770262/">默认专辑</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="95500043" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:141px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/95500043/detail/"><img
                                data-rootid="95500043" data-iid="3465404"
                                src="http://cdn.duitang.com/uploads/item/201206/19/20120619160043_j3iMr.thumb.200_0.jpeg"
                                height="141"/></a>

                            <div class="collbtn" data-favorite='{"id":95500043,"owner":624958}'><a class="y"
                                                                                                   href="#">61</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">61</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">衍纸</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/624958/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201401/15/20140115014745_4K4Tr.png"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/624958/">leonfans200224</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/3962967/">默认专辑</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97202989" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:491px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97202989/detail/"><img
                                data-rootid="97202989" data-iid="3538824"
                                src="http://cdn.duitang.com/uploads/item/201206/24/20120624123851_GBKmA.thumb.200_0.jpeg"
                                height="491"/></a>

                            <div class="collbtn" data-favorite='{"id":97202989,"owner":1794311}'><a class="y" href="#">219</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">219</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">可爱小浣熊卡包，喜欢的大家转吧转吧！动手做做属于自己的小浣熊包包！</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/1794311/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201401/15/20140115014745_4K4Tr.png"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/1794311/">尐粄團</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/4927655/">默认专辑</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97219917" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:266px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97219917/detail/"><img
                                data-rootid="97219917" data-iid="9714303"
                                src="http://cdn.duitang.com/uploads/item/201308/02/20130802123451_8hnme.thumb.200_0.jpeg"
                                height="266"/></a>

                            <div class="collbtn" data-favorite='{"id":97219917,"owner":136211}'><a class="y" href="#">191</a><a
                                    class="z" href="#">0</a><a class="x" href="#">1</a></div>
                        </div>
                        <div class="d"><span class="d1">191</span><span class="d2">0</span><span class="d3">1</span>
                        </div>
                        <div class="g">装修大图</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/136211/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201110/24/20111024230309_8U2CG.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/136211/">边摇边滚</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/5343156/">家居新时代</a>&nbsp;专辑中
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/1421419/"><img
                                    width="24" height="24" src="http://cdn.duitang.com/img/0/dfhead.thumb.24_24_c.gif"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/1421419/">牛奶微甜</a>&nbsp;厨房就这样，但不要玻璃门
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97202878" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:687px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97202878/detail/"><img
                                data-rootid="97202878" data-iid="9964420"
                                src="http://cdn.duitang.com/uploads/item/201308/13/20130813165104_xGeiw.thumb.200_0.jpeg"
                                height="687"/></a>

                            <div class="collbtn" data-favorite='{"id":97202878,"owner":1804551}'><a class="y" href="#">129</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">129</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">小鬼的轻粘土手工课-超級瑪里奧（1）頭部製作方法： 1. 用手心把肉色土捏成頭部基本形狀.2. 用手指把耳朵壓出來, 要輕力點,
                            再用細少的圓頭工具把耳乙壓出.3. 用畫線及平頭工具把口製作出來, 在凹下位置貼上紅色.4. 用肉色加上鼻子, 用細圓頭工具鑽眼孔.5. 用黑色製作眼睛, 貼於早前鑽出來的位置,
                            用棕色製作髺子, 用畫線工具壓紋理.6. 加上左右兩組頭髮, 壓紋.7. 加上頭後方的頭髮.8. 壓紋理.9. 用紅色製作帽子, 留意大小要剛剛好啊, 帽底下要凹入.10.
                            加上帽前方的長方塊, 用白色做帽子上的特點.
                        </div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/1804551/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201309/21/20130921133335_3ZYQW.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/1804551/">乖怪的金牛</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/5531900/">纸粘土、软陶</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97103905" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:300px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97103905/detail/"><img
                                data-rootid="97103905" data-iid="2614471"
                                src="http://cdn.duitang.com/uploads/item/201204/29/20120429003003_VeyPS.thumb.200_0.jpeg"
                                height="300"/></a>

                            <div class="collbtn" data-favorite='{"id":97103905,"owner":1813859}'><a class="y" href="#">4098</a><a
                                    class="z" href="#">0</a><a class="x" href="#">17</a></div>
                        </div>
                        <div class="d"><span class="d1">4098</span><span class="d2">0</span><span class="d3">17</span>
                        </div>
                        <div class="g">有天窗的浴室哦~</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/1813859/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201401/15/20140115014745_4K4Tr.png"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/1813859/">布布不不</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/5463390/">默认专辑</a>&nbsp;专辑中
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/1688104/"><img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201308/08/20130808192630_UZvny.thumb.24_24_c.jpeg"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/1688104/">暗夜男爵</a>&nbsp;窗户外一里外才是别人家~~~呵呵呵
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/1675263/"><img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201308/04/20130804103642_XZmj5.thumb.24_24_c.jpeg"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/1675263/">好菇凉你真可爱c</a>&nbsp;额，这个浴室也太......为什么门是透明的？还有天窗。
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/1535282/"><img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201306/05/20130605211731_AkuYd.thumb.24_24_c.gif"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/1535282/">斗斗糖</a>&nbsp;窒息</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div data-id="97219757" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:200px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97219757/detail/"><img
                                data-rootid="97219757" data-iid="2479873"
                                src="http://cdn.duitang.com/uploads/item/201204/20/20120420142911_iXRry.thumb.200_0.jpeg"
                                height="200"/></a>

                            <div class="collbtn" data-favorite='{"id":97219757,"owner":161679}'><a class="y" href="#">2355</a><a
                                    class="z" href="#">0</a><a class="x" href="#">9</a></div>
                        </div>
                        <div class="d"><span class="d1">2355</span><span class="d2">0</span><span class="d3">9</span>
                        </div>
                        <div class="g">樱の特辑 酒器三件套&nbsp;<a class="dymprice dib bl"
                                                          href="http://www.duitang.com/dj/go2/?mk=_p_97219757&to=http%3A%2F%2Fitem.taobao.com%2Fitem.htm%3Fid%3D12480272951&spm=2014.12553688.102.0"
                                                          target="_blank"><u class="_tb" title="去购买">￥389.0</u></a>
                        </div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/161679/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201111/14/20111114210444_AAWKi.thumb.24_24_c.jpg"/>
                            </a>

                                <p><a class="p" target="_blank"
                                      href="http://www.duitang.com/people/161679/">magicalo</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/447357/">家居</a>&nbsp;专辑中</p>
                            </li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/1596853/"><img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201307/04/20130704104431_CJtsc.thumb.24_24_c.jpeg"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/1596853/">Munia</a>&nbsp;好静透的感觉
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/1574956/"><img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201306/23/20130623160749_skHYL.thumb.24_24_c.jpeg"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/1574956/">我的重口味</a>&nbsp;日本货。。
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/1519364/"><img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201305/30/20130530092207_ni3Bh.thumb.24_24_c.gif"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/1519364/">粥就是粥</a>&nbsp;喝梅子酒应该不错吧
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97219928" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:299px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97219928/detail/"><img
                                data-rootid="97219928" data-iid="9468099"
                                src="http://cdn.duitang.com/uploads/item/201307/21/20130721202750_jrCMr.thumb.200_0.jpeg"
                                height="299"/></a>

                            <div class="collbtn" data-favorite='{"id":97219928,"owner":136211}'><a class="y" href="#">432</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">432</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">装修大图</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/136211/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201110/24/20111024230309_8U2CG.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/136211/">边摇边滚</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/5343156/">家居新时代</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97219885" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:149px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97219885/detail/"><img
                                data-rootid="97219885" data-iid="8400273"
                                src="http://cdn.duitang.com/uploads/item/201306/20/20130620132444_NEQdT.thumb.200_0.jpeg"
                                height="149"/></a>

                            <div class="collbtn" data-favorite='{"id":97219885,"owner":136211}'><a class="y"
                                                                                                   href="#">29</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">29</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">卧室书房</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/136211/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201110/24/20111024230309_8U2CG.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/136211/">边摇边滚</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/5343156/">家居新时代</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="96933494" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:748px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/96933494/detail/"><img
                                data-rootid="96933494" data-iid="708675"
                                src="http://cdn.duitang.com/uploads/item/201111/20/20111120111405_irSBF.thumb.200_0.png"
                                height="748"/></a>

                            <div class="collbtn" data-favorite='{"id":96933494,"owner":526554}'><a class="y" href="#">1522</a><a
                                    class="z" href="#">0</a><a class="x" href="#">8</a></div>
                        </div>
                        <div class="d"><span class="d1">1522</span><span class="d2">0</span><span class="d3">8</span>
                        </div>
                        <div class="g">owl【自己动手】天鹅折纸教程。</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/526554/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201401/15/20140115014745_4K4Tr.png"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/526554/">饭米粒儿</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/876235/">纸艺世界</a>&nbsp;专辑中
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/1360908/"><img
                                    width="24" height="24" src="http://cdn.duitang.com/img/0/dfhead.thumb.24_24_c.gif"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/1360908/">仰望丶放肆的幸福</a>&nbsp;好漂亮呀，我要学
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/230624/"><img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201112/18/20111218185951_EvhJY.thumb.24_24_c.jpeg"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/230624/">小乖臭</a>&nbsp;看不懂，亲，你真的照着折出来了吗
                                </p></li>
                            <li class="last"><a target="_blank" href="http://www.duitang.com/people/492441/"><img
                                    width="24" height="24" src="http://cdn.duitang.com/img/0/dfhead.thumb.24_24_c.gif"/></a>

                                <p><a target="_blank" href="http://www.duitang.com/people/492441/">极地月光</a>&nbsp;很难啊！！
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97093962" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:284px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97093962/detail/"><img
                                data-rootid="97093962" data-iid="8090536"
                                src="http://cdn.duitang.com/uploads/item/201305/28/20130528104552_HYwnk.thumb.200_0.jpeg"
                                height="284"/></a>

                            <div class="collbtn" data-favorite='{"id":97093962,"owner":1394890}'><a class="y" href="#">490</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">490</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">飘窗书房</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/1394890/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201304/05/20130405090017_8R2sN.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank"
                                      href="http://www.duitang.com/people/1394890/">827433124</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/2255022/">屋子</a>&nbsp;专辑中</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div data-id="97155223" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:800px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97155223/detail/"><img
                                data-rootid="97155223" data-iid="5363503"
                                src="http://cdn.duitang.com/uploads/item/201210/24/20121024090533_RWrAF.thumb.200_0.jpeg"
                                height="1297"/><u style="margin-top:-577px"></u></a>

                            <div class="collbtn" data-favorite='{"id":97155223,"owner":15913}'><a class="y"
                                                                                                  href="#">169</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">169</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">手工 生活 钩花 钩针 艺术</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/15913/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/files/201106/02/20110602170546_t4nxC.thumb.24_24_c.jpg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/15913/">猫觅723</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/1506200/">DIY</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="96171234" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:266px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/96171234/detail/"><img
                                data-rootid="96171234" data-iid="321045"
                                src="http://cdn.duitang.com/uploads/item/201108/15/20110815191841_jGFYy.thumb.200_0.jpg"
                                height="266"/></a>

                            <div class="collbtn" data-favorite='{"id":96171234,"owner":517059}'><a class="y"
                                                                                                   href="#">43</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">43</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">粘贴相册/diy相册/手工相册/布面相册：飘零&nbsp;<a class="dymprice dib bl"
                                                                       href="http://www.duitang.com/dj/go2/?mk=_p_96171234&to=http%3A%2F%2Fitem.taobao.com%2Fitem.htm%3Fid%3D10861157025%26amp%3B&spm=2014.12553688.102.0"
                                                                       target="_blank"><u class="_tb"
                                                                                          title="去购买">￥59.0</u></a>
                        </div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/517059/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201205/15/20120515111103_dsHUF.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/517059/">大萝莉</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/863091/">嘎啦手工</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="97214291" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:272px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/97214291/detail/"><img
                                data-rootid="97214291" data-iid="10539787"
                                src="http://cdn.duitang.com/uploads/item/201309/11/20130911093310_sxkmK.thumb.200_0.jpeg"
                                height="272"/></a>

                            <div class="collbtn" data-favorite='{"id":97214291,"owner":1007091}'><a class="y" href="#">293</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">293</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">半开放式厨房设计</div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/1007091/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201210/13/20121013084900_2ZdcV.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/1007091/">芥末黄的白白</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/1777454/">Housing</a>&nbsp;专辑中
                                </p></li>
                        </ul>
                    </div>
                </div>
                <div data-id="96702107" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:200px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/96702107/detail/"><img
                                data-rootid="96702107" data-iid="6691431"
                                src="http://cdn.duitang.com/uploads/item/201302/20/20130220155850_BeZi2.thumb.200_0.jpeg"
                                height="200"/></a>

                            <div class="collbtn" data-favorite='{"id":96702107,"owner":1025910}'><a class="y" href="#">47</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">47</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">派子布艺手工绣花布贴钩针向日葵补丁装饰贴绣花狂卖直径cm&nbsp;<a class="dymprice dib bl"
                                                                            href="http://www.duitang.com/dj/go2/?mk=_p_96702107&to=http%3A%2F%2Fitem.taobao.com%2Fitem.htm%3Fid%3D3483175736%26spm_d%3D3&spm=2014.12553688.102.0"
                                                                            target="_blank"><u class="_tb" title="去购买">￥2.4</u></a>
                        </div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/1025910/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201210/21/20121021222631_kmYxk.thumb.24_24_c.jpeg"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/1025910/">S7M</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/1686242/">编织</a>&nbsp;专辑中</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div data-id="96247155" class="woo">
                    <div class="j">
                        <div class="mbpho" style="height:200px;"><a target="_blank" class="a"
                                                                    href="http://www.duitang.com/people/mblog/96247155/detail/"><img
                                data-rootid="96247155" data-iid="4468891"
                                src="http://cdn.duitang.com/uploads/item/201208/16/20120816203411_scT4m.thumb.200_0.jpeg"
                                height="200"/></a>

                            <div class="collbtn" data-favorite='{"id":96247155,"owner":903663}'><a class="y" href="#">391</a><a
                                    class="z" href="#">0</a><a class="x" href="#">0</a></div>
                        </div>
                        <div class="d"><span class="d1">391</span><span class="d2">0</span><span class="d3">0</span>
                        </div>
                        <div class="g">创意孔雀挂钟表壁钟餐厅客厅卧室超静音现代时尚&nbsp;<a class="dymprice dib bl"
                                                                      href="http://www.duitang.com/dj/go2/?mk=_p_96247155&to=http%3A%2F%2Fitem.taobao.com%2Fitem.htm%3Fspm%3Da230r.1.10.102%26amp%3Bid%3D10782185564%26amp%3B_u%3Dgdnumikb3af&spm=2014.12553688.102.0"
                                                                      target="_blank"><u class="_tb"
                                                                                         title="去购买">￥164.0</u></a>
                        </div>
                        <ul>
                            <li class="f"><a target="_blank" href="http://www.duitang.com/people/903663/"> <img
                                    width="24" height="24"
                                    src="http://cdn.duitang.com/uploads/people/201401/15/20140115014745_4K4Tr.png"/>
                            </a>

                                <p><a class="p" target="_blank" href="http://www.duitang.com/people/903663/">洋葱和小牛</a>&nbsp;收集到&nbsp;<a
                                        target="_blank" href="http://www.duitang.com/album/2523233/">购物</a>&nbsp;专辑中</p>
                            </li>
                        </ul>
                    </div>
                </div>


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
        $('<div id="mycontrols"><a id="gonext" href="javascript:;" title="下一页"></a><a href="javascript:;" id="gotop"></a><a id="gopre" href="javascript:;"  title="上一页"></a></div>').appendTo('body');

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
            "gopre": '#gopre',
            "gonext": '#gonext',
            "gotop": '#gotop',

            // Footer selctor, any node below the pager can be treated as footer.
            "footer": '#footer,#preserve',


            // Open resize mode.
            // If you open it, every time window resizes, waterfall will be repainted.
            // Not recommend in ie.
            "resize": true,

            // Sth you do after every successful subpage data request.
            "requestAlways": function (pg, idx) {
                var $dom = pg.$dom;

                $dom.find('.woo').not('.delset')
                        .append('<a class="del" href="javascript:;">delete</a>')
                        .addClass('delset')
            },

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


        // delete unit
        $('.woo').append('<a class="del" href="javascript:;">delete</a>')
                .parent()
                .delegate('.del', 'click', function (e) {
                    e.preventDefault();
                    e.stopPropagation();

                    var $t = $(this),
                            $woo = $t.closest('.woo').addClass('delset'),
                            ht = $woo.data('ht'),
                            cls = $woo.attr('class'),
                            tp = parseInt($woo.get(0).style.top),
                            sc = 0,
                            co = 0;

                    /\bco(\d+)/ig.exec(cls);
                    co = RegExp.$1;

                    // reset units below current .woo in the same col
                    $.Woo.resetCol(-ht, co, tp),
                        // delete the clicked .woo
                            $woo.slideUp(1000, function () {
                                $woo.remove()
                            })
                })
    })
</script>
</body>
</html>


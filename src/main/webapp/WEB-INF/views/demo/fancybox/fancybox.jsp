<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
    <title>FancyBox</title>

    <!-- Add jQuery library -->
    <%--<script type="text/javascript" src="${ctx}/static/libs/fancybox/lib/jquery-1.10.1.min.js"></script>--%>

    <!-- Add mousewheel plugin (this is optional) -->
    <script type="text/javascript" src="${ctx}/static/libs/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>

    <!-- Add fancyBox -->
    <link rel="stylesheet" href="${ctx}/static/libs/fancybox/jquery.fancybox.css" type="text/css" media="screen"/>
    <script type="text/javascript" src="${ctx}/static/libs/fancybox/jquery.fancybox.pack.js"></script>

    <!-- Optionally add helpers - button, thumbnail and/or media -->
    <link rel="stylesheet" href="${ctx}/static/libs/fancybox/helpers/jquery.fancybox-buttons.css" type="text/css"
          media="screen"/>
    <script type="text/javascript" src="${ctx}/static/libs/fancybox/helpers/jquery.fancybox-buttons.js"></script>
    <script type="text/javascript" src="${ctx}/static/libs/fancybox/helpers/jquery.fancybox-media.js"></script>

    <link rel="stylesheet" href="${ctx}/static/libs/fancybox/helpers/jquery.fancybox-thumbs.css" type="text/css"
          media="screen"/>
    <script type="text/javascript" src="${ctx}/static/libs/fancybox/helpers/jquery.fancybox-thumbs.js"></script>

    <%--<style type="text/css">--%>
        <%--.fancybox-custom .fancybox-skin {--%>
            <%--box-shadow: 0 0 50px #222;--%>
        <%--}--%>

        <%--body {--%>
            <%--max-width: 700px;--%>
            <%--margin: 0 auto;--%>
        <%--}--%>
    <%--</style>--%>
</head>


<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">fancyBox</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">



                    <p>This is a demonstration. More information and examples: <a href="http://fancyapps.com/fancybox/">www.fancyapps.com/fancybox/</a></p>

                    <h3>Simple image gallery</h3>
                    <p>
                        <a class="fancybox" href="${ctx}/static/libs/fancybox/demo/1_b.jpg" data-fancybox-group="gallery" title="Lorem ipsum dolor sit amet"><img src="${ctx}/static/libs/fancybox/demo/1_s.jpg" alt="" /></a>

                        <a class="fancybox" href="${ctx}/static/libs/fancybox/demo/2_b.jpg" data-fancybox-group="gallery" title="Etiam quis mi eu elit temp"><img src="${ctx}/static/libs/fancybox/demo/2_s.jpg" alt="" /></a>

                        <a class="fancybox" href="${ctx}/static/libs/fancybox/demo/3_b.jpg" data-fancybox-group="gallery" title="Cras neque mi, semper leon"><img src="${ctx}/static/libs/fancybox/demo/3_s.jpg" alt="" /></a>

                        <a class="fancybox" href="${ctx}/static/libs/fancybox/demo/4_b.jpg" data-fancybox-group="gallery" title="Sed vel sapien vel sem uno"><img src="${ctx}/static/libs/fancybox/demo/4_s.jpg" alt="" /></a>
                    </p>

                    <h3>Different effects</h3>
                    <p>
                        <a class="fancybox-effects-a" href="${ctx}/static/libs/fancybox/demo/5_b.jpg" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit"><img src="${ctx}/static/libs/fancybox/demo/5_s.jpg" alt="" /></a>

                        <a class="fancybox-effects-b" href="${ctx}/static/libs/fancybox/demo/5_b.jpg" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit"><img src="${ctx}/static/libs/fancybox/demo/5_s.jpg" alt="" /></a>

                        <a class="fancybox-effects-c" href="${ctx}/static/libs/fancybox/demo/5_b.jpg" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit"><img src="${ctx}/static/libs/fancybox/demo/5_s.jpg" alt="" /></a>

                        <a class="fancybox-effects-d" href="${ctx}/static/libs/fancybox/demo/5_b.jpg" title="Lorem ipsum dolor sit amet, consectetur adipiscing elit"><img src="${ctx}/static/libs/fancybox/demo/5_s.jpg" alt="" /></a>
                    </p>

                    <h3>Various types</h3>
                    <p>
                        fancyBox will try to guess content type from href attribute but you can specify it directly by adding classname (fancybox.image, fancybox.iframe, etc).
                    </p>
                    <ul>
                        <li><a class="fancybox" href="#inline1" title="Lorem ipsum dolor sit amet">Inline</a></li>
                        <li><a class="fancybox fancybox.ajax" href="${ctx}/static/libs/fancybox/demo/ajax.txt">Ajax</a></li>
                        <li><a class="fancybox fancybox.iframe" href="${ctx}/static/libs/fancybox/demo/iframe.html">Iframe</a></li>
                        <li><a class="fancybox" href="http://www.adobe.com/jp/events/cs3_web_edition_tour/swfs/perform.swf">Swf</a></li>
                    </ul>

                    <div id="inline1" style="width:400px;display: none;">
                        <h3>Etiam quis mi eu elit</h3>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam quis mi eu elit tempor facilisis id et neque. Nulla sit amet sem sapien. Vestibulum imperdiet porta ante ac ornare. Nulla et lorem eu nibh adipiscing ultricies nec at lacus. Cras laoreet ultricies sem, at blandit mi eleifend aliquam. Nunc enim ipsum, vehicula non pretium varius, cursus ac tortor. Vivamus fringilla congue laoreet. Quisque ultrices sodales orci, quis rhoncus justo auctor in. Phasellus dui eros, bibendum eu feugiat ornare, faucibus eu mi. Nunc aliquet tempus sem, id aliquam diam varius ac. Maecenas nisl nunc, molestie vitae eleifend vel, iaculis sed magna. Aenean tempus lacus vitae orci posuere porttitor eget non felis. Donec lectus elit, aliquam nec eleifend sit amet, vestibulum sed nunc.
                        </p>
                    </div>

                    <p>
                        Ajax example will not run from your local computer and requires a server to run.
                    </p>

                    <h3>Button helper</h3>
                    <p>
                        <a class="fancybox-buttons" data-fancybox-group="button" href="${ctx}/static/libs/fancybox/demo/1_b.jpg"><img src="${ctx}/static/libs/fancybox/demo/1_s.jpg" alt="" /></a>

                        <a class="fancybox-buttons" data-fancybox-group="button" href="${ctx}/static/libs/fancybox/demo/2_b.jpg"><img src="${ctx}/static/libs/fancybox/demo/2_s.jpg" alt="" /></a>

                        <a class="fancybox-buttons" data-fancybox-group="button" href="${ctx}/static/libs/fancybox/demo/3_b.jpg"><img src="${ctx}/static/libs/fancybox/demo/3_s.jpg" alt="" /></a>

                        <a class="fancybox-buttons" data-fancybox-group="button" href="${ctx}/static/libs/fancybox/demo/4_b.jpg"><img src="${ctx}/static/libs/fancybox/demo/4_s.jpg" alt="" /></a>
                    </p>

                    <h3>Thumbnail helper</h3>
                    <p>
                        <a class="fancybox-thumbs" data-fancybox-group="thumb" href="${ctx}/static/libs/fancybox/demo/4_b.jpg"><img src="${ctx}/static/libs/fancybox/demo/4_s.jpg" alt="" /></a>

                        <a class="fancybox-thumbs" data-fancybox-group="thumb" href="${ctx}/static/libs/fancybox/demo/3_b.jpg"><img src="${ctx}/static/libs/fancybox/demo/3_s.jpg" alt="" /></a>

                        <a class="fancybox-thumbs" data-fancybox-group="thumb" href="${ctx}/static/libs/fancybox/demo/2_b.jpg"><img src="${ctx}/static/libs/fancybox/demo/2_s.jpg" alt="" /></a>

                        <a class="fancybox-thumbs" data-fancybox-group="thumb" href="${ctx}/static/libs/fancybox/demo/1_b.jpg"><img src="${ctx}/static/libs/fancybox/demo/1_s.jpg" alt="" /></a>
                    </p>

                    <h3>Media helper</h3>
                    <p>
                        Will not run from your local computer, requires a server to run.
                    </p>

                    <ul>
                        <li><a class="fancybox-media" href="http://www.youtube.com/watch?v=opj24KnzrWo">Youtube</a></li>
                        <li><a class="fancybox-media" href="http://vimeo.com/47480346">Vimeo</a></li>
                        <li><a class="fancybox-media" href="http://www.metacafe.com/watch/7635964/">Metacafe</a></li>
                        <li><a class="fancybox-media" href="http://www.dailymotion.com/video/xoeylt_electric-guest-this-head-i-hold_music">Dailymotion</a></li>
                        <li><a class="fancybox-media" href="http://twitvid.com/QY7MD">Twitvid</a></li>
                        <li><a class="fancybox-media" href="http://twitpic.com/7p93st">Twitpic</a></li>
                        <li><a class="fancybox-media" href="http://instagr.am/p/IejkuUGxQn">Instagram</a></li>
                    </ul>

                    <h3>Open manually</h3>
                    <ul>
                        <li><a id="fancybox-manual-a" href="javascript:;">Open single item</a></li>
                        <li><a id="fancybox-manual-b" href="javascript:;">Open single item, custom options</a></li>
                        <li><a id="fancybox-manual-c" href="javascript:;">Open gallery</a></li>
                    </ul>




                </div>
            </div>


        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<script type="text/javascript">
    $(document).ready(function() {
        /*
         *  Simple image gallery. Uses default settings
         */

        $('.fancybox').fancybox();

        /*
         *  Different effects
         */

        // Change title type, overlay closing speed
        $(".fancybox-effects-a").fancybox({
            helpers: {
                title : {
                    type : 'outside'
                },
                overlay : {
                    speedOut : 0
                }
            }
        });

        // Disable opening and closing animations, change title type
        $(".fancybox-effects-b").fancybox({
            openEffect  : 'none',
            closeEffect	: 'none',

            helpers : {
                title : {
                    type : 'over'
                }
            }
        });

        // Set custom style, close if clicked, change title type and overlay color
        $(".fancybox-effects-c").fancybox({
            wrapCSS    : 'fancybox-custom',
            closeClick : true,

            openEffect : 'none',

            helpers : {
                title : {
                    type : 'inside'
                },
                overlay : {
                    css : {
                        'background' : 'rgba(238,238,238,0.85)'
                    }
                }
            }
        });

        // Remove padding, set opening and closing animations, close if clicked and disable overlay
        $(".fancybox-effects-d").fancybox({
            padding: 0,

            openEffect : 'elastic',
            openSpeed  : 150,

            closeEffect : 'elastic',
            closeSpeed  : 150,

            closeClick : true,

            helpers : {
                overlay : null
            }
        });

        /*
         *  Button helper. Disable animations, hide close button, change title type and content
         */

        $('.fancybox-buttons').fancybox({
            openEffect  : 'none',
            closeEffect : 'none',

            prevEffect : 'none',
            nextEffect : 'none',

            closeBtn  : false,

            helpers : {
                title : {
                    type : 'inside'
                },
                buttons	: {}
            },

            afterLoad : function() {
                this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
            }
        });


        /*
         *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
         */

        $('.fancybox-thumbs').fancybox({
            prevEffect : 'none',
            nextEffect : 'none',

            closeBtn  : false,
            arrows    : false,
            nextClick : true,

            helpers : {
                thumbs : {
                    width  : 50,
                    height : 50
                }
            }
        });

        /*
         *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
         */
        $('.fancybox-media')
                .attr('rel', 'media-gallery')
                .fancybox({
                    openEffect : 'none',
                    closeEffect : 'none',
                    prevEffect : 'none',
                    nextEffect : 'none',

                    arrows : false,
                    helpers : {
                        media : {},
                        buttons : {}
                    }
                });

        /*
         *  Open manually
         */

        $("#fancybox-manual-a").click(function() {
            $.fancybox.open('${ctx}/static/libs/fancybox/demo/1_b.jpg');
        });

        $("#fancybox-manual-b").click(function() {
            $.fancybox.open({
                href : '${ctx}/static/libs/fancybox/demo/iframe.html',
                type : '${ctx}/static/libs/fancybox/demo/iframe',
                padding : 5
            });
        });

        $("#fancybox-manual-c").click(function() {
            $.fancybox.open([
                {
                    href : '${ctx}/static/libs/fancybox/demo/1_b.jpg',
                    title : 'My title'
                }, {
                    href : '${ctx}/static/libs/fancybox/demo/2_b.jpg',
                    title : '2nd title'
                }, {
                    href : '${ctx}/static/libs/fancybox/demo/3_b.jpg'
                }
            ], {
                helpers : {
                    thumbs : {
                        width: 75,
                        height: 50
                    }
                }
            });
        });


    });
</script>


</body>



</html>

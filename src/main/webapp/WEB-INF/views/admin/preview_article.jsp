<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>


<html>
<head>
    <title>预览文章</title>
    <meta name="decorator" content="default"/>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/ueditor/ueditor.all.min.js"></script>
    <!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
    <!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
    <script type="text/javascript" charset="utf-8" src="${ctx}/static/libs/ueditor/lang/zh-cn/zh-cn.js"></script>

</head>


<body>

<div id="wrapper">

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">预览文章</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->

            <form method="post" role="form">

                <div class="row">
                    <div class="col-lg-8">
                        <div class="form-group">
                            <label>内容</label>
                            <!-- 加载编辑器的容器 -->
                            <div>
                                <script id="editor" type="text/plain" style="height:300px;"></script>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-4">

                        <input id="postId" type="hidden">

                        <div class="form-group">
                            <label>标题</label>
                            <textarea id="postTitle" class="form-control" rows="2" placeholder="标题,不超过20字"></textarea>
                        </div>
                        <div class="form-group">
                            <label>来源</label>
                            <input id="postSource" class="form-control" placeholder="来源">
                        </div>
                        <div class="form-group">
                            <label>分类/标签</label>
                            <input id="postTag" class="form-control" placeholder="分类/标签">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-3">
                        <input id="previewBtn" class="btn btn-normal btn-block" type="button" value="预览"
                               onclick="previewBtnClicked()"/>
                    </div>
                    <div class="col-lg-3">
                        <input id="draftBtn" class="btn btn-primary btn-block" type="button" value="暂存到草稿箱"
                               onclick="draftBtnClicked()"/>
                    </div>
                    <div class="col-lg-3">
                        <input id="publishBtn" class="btn btn-success btn-block" type="button" value="提交发布"
                               data-confirm="确定要发布吗?"
                               onclick="publishBtnClicked()"/>
                    </div>
                    <div class="col-lg-3">
                        <input id="dropBtn" class="btn btn-warning btn-block" type="button" value="废弃"
                               data-confirm="确定要废弃吗?"
                               onclick="dropBtnClicked()"/>
                    </div>
                </div>


                <%--<div class="col-lg-12" style="padding-top: 20px;">--%>

                    <%--<div id="btns">--%>

                        <%--<button type="button" class="btn btn-default" onclick="getAllHtml()">获得整个html的内容</button>--%>

                        <%--<button type="button" class="btn btn-default" onclick="getContent()">获得内容</button>--%>
                        <%--<button type="button" class="btn btn-default" onclick="setContent()">写入内容</button>--%>
                        <%--<button type="button" class="btn btn-default" onclick="setContent(true)">追加内容</button>--%>

                        <%--<button type="button" class="btn btn-default" onclick="getContentTxt()">获得纯文本</button>--%>
                        <%--<button type="button" class="btn btn-default" onclick="getPlainTxt()">获得带格式的纯文本</button>--%>
                        <%--<button type="button" class="btn btn-default" onclick="hasContent()">判断是否有内容</button>--%>

                        <%--<button type="button" class="btn btn-default" onclick="setFocus()">使编辑器获得焦点</button>--%>
                        <%--<button type="button" class="btn btn-default" onmousedown="isFocus(event)">编辑器是否获得焦点</button>--%>
                        <%--<button type="button" class="btn btn-default" onmousedown="setblur(event)">编辑器失去焦点</button>--%>

                        <%--<button type="button" class="btn btn-default" onclick="getText()">获得当前选中的文本</button>--%>

                        <%--<button type="button" class="btn btn-default" onclick="insertHtml()">插入给定的内容</button>--%>

                        <%--<button type="button" class="btn btn-default" id="enable" onclick="setEnabled()">可以编辑</button>--%>
                        <%--<button type="button" class="btn btn-default" onclick="setDisabled()">不可编辑</button>--%>

                        <%--<button type="button" class="btn btn-default" onclick=" UE.getEditor('editor').setHide()">隐藏编辑器--%>
                        <%--</button>--%>
                        <%--<button type="button" class="btn btn-default" onclick=" UE.getEditor('editor').setShow()">--%>
                        <%--显示编辑器--%>
                        <%--</button>--%>
                        <%--<button type="button" class="btn btn-default" onclick=" UE.getEditor('editor').setHeight(300)">--%>
                        <%--设置高度为300默认关闭了自动长高--%>
                        <%--</button>--%>

                        <%--<button type="button" class="btn btn-default" onclick="getLocalData()">获取草稿箱内容</button>--%>
                        <%--<button type="button" class="btn btn-default" onclick="clearLocalData()">清空草稿箱</button>--%>

                        <%--<button type="button" class="btn btn-default" onclick="createEditor()">创建编辑器</button>--%>
                        <%--<button type="button" class="btn btn-default" onclick="deleteEditor()">删除编辑器</button>--%>

                    <%--</div>--%>


                <%--</div>--%>

            </form>
        </div>
        <!-- /.container-fluid -->
    </div>
    <!-- /#page-wrapper -->

</div>
<!-- /#wrapper -->

<script>
    $(document).ready(function () {
        new jBox('Confirm', {
            confirmButton: '确定',
            cancelButton: '取消'
        });
    });
    function dropBtnClicked() {
        new jBox('Notice', {
            content: '已废弃', color: 'green',
            autoClose: 1000, position: {x: 'center', y: 'center'}
        });
    }
    function publishBtnClicked() {
        new jBox('Notice', {
            content: '已提交到发布队列', color: 'green',
            autoClose: 1000, position: {x: 'center', y: 'center'}
        });
    }
    function draftBtnClicked() {

        var content = UE.getEditor('editor').getContent();
        var id = $("#postId").val();
        var title = $("#postTitle").val();
        var source = $("#postSource").val();
        var tag = $("#postTag").val();


        $.ajax({
            type: "POST",
            url: "${ctx}/admin/article/save",
            data: {"id": id, "title": title, "source": source, "tag": tag, "content": content},
            success: function (data) {
                console.log(data);
//                if(data.error != "ok") {
//                    alert(data.error);
//                } else {

                $("#postId").val(data.id);

                new jBox('Notice', {
                    content: '已暂存到草稿箱', color: 'green',
                    autoClose: 1000, position: {x: 'center', y: 'center'}
                });
//                }
            },
            error: function (data, errCode, errDesc) {
                /* alert("错误:\n" + errCode + errDesc); */
            }
        });

    }
    function previewBtnClicked() {
        alert("preview");


    }

    function fillPage() {



        UE.getEditor('editor').setContent('${post.content}', false);

//        UE.getEditor('editor').setContent("hello");

        $("#postId").val("${post.id}");
        $("#postTitle").val("${post.title}");
        $("#postSource").val("${post.source}");
        $("#postTag").val("${post.tag}");



    }


</script>

<script>
    $(document).ready(function(){
        //判断ueditor 编辑器是否创建成功
        UE.getEditor('editor').addListener("ready", function () {
            // editor准备好之后才可以使用
            fillPage();
        });
    });
</script>

<!--
<script type="text/javascript">

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');
    fillPage();

    function isFocus(e) {
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e)
    }
    function setblur(e) {
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e)
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value)
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml())
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'))
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt)
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData() {
        alert(UE.getEditor('editor').execCommand("getlocaldata"));
    }

    function clearLocalData() {
        UE.getEditor('editor').execCommand("clearlocaldata");
        alert("已清空草稿箱")
    }
</script>
-->

</body>

</html>

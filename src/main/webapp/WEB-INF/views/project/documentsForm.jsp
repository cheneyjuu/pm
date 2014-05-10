<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>新建文档</title>
    <style>
        .table>tbody>tr>td{
            border-bottom: 1px solid #ddd;
        }
        .code-container > span{
            cursor: pointer;
        }
        #text-input,#preview,#example-code{
            font-family: "Courier New";
            line-height: 1.4em;
        }
        .clean-padding-l{
            padding-left: 0;
        }
        .clean-padding-r{
            padding-right: 0;
        }
        .well{
            min-height: 350px;
        }
        .markdown-table{
            margin-bottom: 0;
        }
        .markdown-table > tbody > tr:last-child a{
            padding-right: 2em;;
        }
        .document-content{
            background-color: #ccc;
            margin: 0 0 20px 0;
        }
        .glyphicon{
            display: inline-block;
            /*height: 2em;*/
            /*line-height: 2em;*/
        }
        .tools-table{
            margin-bottom: 0;
        }
        .tools-table > tbody > tr:first-child > td{
            border-top: none;
        }
        #toggleTools{
            display: inline-block;
            width: 2em;
            height: 2em;
        }
        #preview{
            min-height: 490px;
        }
    </style>
    <script src="${ctx}/static/plugings/jquery.autogrowtextarea.min.js"></script>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3><a href="${ctx}/project/index">项目名称</a></h3>
            <table class="table tools-table">
                <tr>
                    <td class="pull-right"><a href="#" id="toggleTools"><span class="caret"></span></a></td>
                </tr>
                <tr>
                    <td>
                        <ul class="nav nav-pills">
                            <li class="disabled"><a href="#">插入：</a></li>
                            <li class="dropdown">
                                <a id="drop1" role="button" data-toggle="dropdown" href="#">标题 <b class="caret"></b></a>
                                <ul id="menu1" class="dropdown-menu" role="menu" aria-labelledby="drop1">
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">一级标题</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">二级标题</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">三级标题</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">四级标题</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">五级标题</a></li>
                                    <li role="presentation"><a role="menuitem" tabindex="-1" href="javascript:void(0);">六级标题</a></li>
                                </ul>
                            </li>
                            <li><a href="javascript:void(0);">段落和换行</a></li>
                            <li><a href="javascript:void(0);">区块引用</a></li>
                            <li><a href="javascript:void(0);">无序列表</a></li>
                            <li><a href="javascript:void(0);">有序列表</a></li>
                            <li><a href="javascript:void(0);">代码区块</a></li>
                            <li><a href="javascript:void(0);">分隔线</a></li>
                            <li><a href="javascript:void(0);">链接</a></li>
                            <li><a href="javascript:void(0);">粗体</a></li>
                            <li><a href="javascript:void(0);">代码</a></li>
                            <li><a href="javascript:void(0);">图片</a></li>
                            <li><a href="javascript:void(0);">自动链接</a></li>
                        </ul>
                    </td>
                </tr>
            </table>
            <hr class="tools-line"/>
            <textarea name="example-code" id="example-code" rows="6" class="form-control" disabled="disabled">语法示例</textarea>
        </div>
        <div class="panel-body">

            <div class="row document-content">
                <table class="table markdown-table">
                    <tbody>
                    <tr>
                        <td><input type="text" class="form-control input-lg discuss-title" placeholder="输入标题 ..."/></td>
                    </tr>
                    <tr>
                        <td>
                            <a href="javascript:void(0)" class="text-muted pull-right resize-small"><span class="glyphicon glyphicon-resize-small"></span> 恢复</a>
                            <a href="javascript:void(0);" class="text-muted pull-right resize-full"><span class="glyphicon glyphicon-resize-full"></span> 全屏</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
                <div class="col-md-6 clean-padding-r clean-padding-l">
                    <textarea id="text-input" class="form-control" rows="25" oninput="this.editor.update()"></textarea>
                </div>
                <div class="col-md-6 clean-padding-l clean-padding-r">
                    <div id="preview" class="well"></div>
                </div>
            </div>
            <%--<script src="${ctx}/static/markdown/markdown.min.js"></script>--%>
            <hr/>
            <strong>您可以将文档发送给：</strong>
            <ul>
                <li><a href="#">项目参与人员</a> <small>被邀请的人员可以和您一起协作完成任务</small></li>
                <li><a href="#">非项目参与人员</a> <small>被邀请的人只能看到此文档</small></li>
            </ul>
            <button class="btn btn-default btn-success btn-md post-btn"> 提 交 </button>
        </div>
        <div class="panel-footer"></div>
    </div>
</div>

<script>
//    function Editor(input, preview) {
//        this.update = function () {
//            preview.innerHTML = markdown.toHTML(input.value);
//        };
//        input.editor = this;
//        this.update();
//    }
//    new Editor(document.getElementById("text-input"), document.getElementById("preview"));

    $(function(){

        // 让textarea可以使用制表符(TAB)
        var onTextareaKeydown = function(e){
            if(e.keyCode == 9){
                e.preventDefault();
                var start = this.selectionStart, end = this.selectionEnd;
                var text = this.value;
                var tab = '    ';
                text = text.substr(0, start) + tab + text.substr(start);
                this.value = text;
                this.selectionStart = start + tab.length;
                this.selectionEnd = end + tab.length;
            }
        }
        document.getElementById('text-input').onkeydown = onTextareaKeydown;

//        $("#text-input").autoGrow();

        // 标题点击事件,循环标题
        $("#menu1").children().each(function(index){
            $(this).click(function(){
                $("#example-code").empty();
                if (index == 0){
                    $("#example-code").append("# Title");
                } else if (index == 1){
                    $("#example-code").append("## Title");
                } else if (index == 2){
                    $("#example-code").append("### Title");
                } else if (index == 3){
                    $("#example-code").append("#### Title");
                } else if (index == 4){
                    $("#example-code").append("##### Title");
                } else if (index == 5){
                    $("#example-code").append("###### Title");
                }
            });
        });;
        $(".nav-pills > li").each(function(index){
            if (index == 2){
                $(this).click(function(){
                    $("#example-code").empty();
                    $("#example-code").text("一个 Markdown 段落是由一个或多个连续的文本行组成，它的前后要有一个以上的空行。\n");
                });
            } else if (index == 3){
                $(this).click(function(){
                    $("#example-code").empty();
                    $("#example-code").text("> Markdown 中的区块引用以`>`开头。");
                });
            } else if (index == 4){
                $(this).click(function(){
                    $("#example-code").empty();
                    $("#example-code").text("Markdown 中的无序列表可以使用`*`、`+`、`-`。\n\n* 列表第一项 \n* 列表第二项");
                });
            } else if (index == 5){
                $(this).click(function(){
                    $("#example-code").empty();
                    $("#example-code").text("Markdown 中的有序列表使用数字后跟英文句点`.`。\n\n1. 列表第一项 \n2. 列表第二项");
                });
            } else if (index == 6){
                $(this).click(function(){
                    $("#example-code").empty();
                    $("#example-code").text("Markdown 中的代码区块只需要加4个空格或者一个制表符就可以。\n\n    function foo(){\n        console.log('Hello World!')\n    }");
                });
            } else if (index == 7){
                $(this).click(function(){
                    $("#example-code").empty();
                    $("#example-code").text("在一行中用三个以上的星号、减号、底线来建立一个分隔线，行内不能有其他东西。\n\n--------------------------");
                });
            } else if (index == 8){
                $(this).click(function(){
                    $("#example-code").empty();
                    $("#example-code").text("要建立一个行内式的链接，只要在方块括号后面紧接着圆括号并插入网址链接即可，如果你还想要加上链接的 title 文字，只要在网址后面，用双引号把 title 文字包起来即可。\n\n鼠标放在 [链接](http://example.com/ 'Title') 上会有提示.\n\n鼠标放在 [这个链接](http://example.net/) 上没有提示.\n\n");
                });
            } else if (index == 9){
                $(this).click(function(){
                    $("#example-code").empty();
                    $("#example-code").text("使用两个星号`**`或者两个下划线`__`来定义一个**粗体**。\n\n");
                });
            } else if (index == 10){
                $(this).click(function(){
                    $("#example-code").empty();
                    $("#example-code").text("如果要写一小段行内代码，可以使用反引号\\`\\`来标记。\n\n");
                });
            } else if (index == 11){
                $(this).click(function(){
                    $("#example-code").empty();
                    $("#example-code").text("图片以惊叹号`!`开头，后跟一对中括号`[]`，里面放着图片的描述文字，接着一个普通括号，里面放上图片的网址，最后还可以用引号包住并加上 选择性的 'title' 文字。\n\n![BaoSteel](http://mobile.baosteel.com/iPlatMBS/assets/custom/headLOGO.jpg)\n\n![BaoSteel](http://mobile.baosteel.com/iPlatMBS/assets/custom/headLOGO.jpg '宝钢在线')\n\n");
                });
            } else if (index == 12){
                $(this).click(function(){
                    $("#example-code").empty();
                    $("#example-code").text("Markdown 支持以比较简短的自动链接形式来处理网址和电子邮件信箱，只要是用尖括号包` < > `起来， Markdown 就会自动把它转成链接。\n\n");
                });
            }
        });

        // 隐藏显示语法说明
        $("#toggleTools").click(function(){
            $(".tools-table > tbody").children(":last").toggle(function(){
                $(this).addClass("hidden");
            }, function(){
                $(this).removeClass("hidden");
            });
            $(".tools-line").toggle(function(){
                $(this).addClass("hidden");
            }, function(){
                $(this).removeClass("hidden");
            });
            $("#example-code").toggle(function(){
                $(this).addClass("hidden");
            }, function(){
                $(this).removeClass("hidden");
            });
        });

        // 全屏
        var client_height = window.document.body.clientHeight - 500;
        var currentWidth = $(".container").width();
        var currentHeight = $("#text-input").height();
        $(".resize-full").click(function(){
            // 给preview加滚动条
            $("#preview").css("overflow-y","scroll");
            $(".container").animate({
                width:'100%',
                padding: 0
            });
            $("#text-input").animate({height: client_height});
            $("#preview").animate({height: client_height});
            $(".panel-body").animate({padding: "0"});
            $(".panel-heading").hide();
            $(".navbar").hide();
            $("#footer").hide();
        });
        $(".resize-small").click(function(){
            $(".container").animate({
                width: currentWidth + 30,
                padding: "0 15"
            });
            $("#text-input").animate({height: currentHeight});
            $("#preview").animate({height: currentHeight});
            $(".panel-body").animate({padding: 15});
            $(".panel-heading").show();
            $(".navbar").show();
            $("#footer").show();
        });

        var txt;
        $("#text-input").keyup(function(){
            txt = $("#text-input").val();
//            console.log($("#preview").innerHeight());
            $.ajax({
                type: 'POST',
                url : '${ctx}/markdown/convert',
                data: {str : txt},
                success : function(rt){
                    $("#preview").html(rt);
                    $("table").addClass("table").addClass("table-bordered");
                }

            });
        });
    });
</script>
</body>
</html>
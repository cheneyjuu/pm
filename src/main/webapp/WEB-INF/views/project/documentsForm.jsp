<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>新建文档</title>
    <style>
        .code-container > span{
            cursor: pointer;
        }
        #text-input,#preview{
            font-family: "Courier New";
            line-height: 1.4em;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3><a href="${ctx}/project/index">项目名称</a></h3>
        </div>
        <div class="panel-body">
            <input type="text" class="form-control input-lg discuss-title" placeholder="输入标题 ..."/>
            <hr/>
            <ul class="nav nav-pills">
                <li class="disabled"><a href="#">插入：</a></li>
                <li class="dropdown">
                    <a id="drop1" role="button" data-toggle="dropdown" href="#">标题 <b class="caret"></b></a>
                    <ul id="menu1" class="dropdown-menu" role="menu" aria-labelledby="drop1">
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">一级标题</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">二级标题</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">三级标题</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">四级标题</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">五级标题</a></li>
                        <li role="presentation"><a role="menuitem" tabindex="-1" href="#">六级标题</a></li>
                    </ul>
                </li>
                <li><a href="#">段落和换行</a></li>
                <li><a href="#">区块引用</a></li>
                <li><a href="#">无序列表</a></li>
                <li><a href="#">有序列表</a></li>
                <li><a href="#">代码区块</a></li>
                <li><a href="#">分隔线</a></li>
                <li><a href="#">链接</a></li>
                <li><a href="#">强调</a></li>
                <li><a href="#">代码</a></li>
                <li><a href="#">图片</a></li>
                <li><a href="#">自动链接</a></li>
            </ul>
            <hr/>
            <div class="row">
                <div class="col-md-6">
                    <textarea id="text-input" class="form-control" rows="10" oninput="this.editor.update()">支持 **Markdown** 语法.</textarea>
                </div>
                <div class="col-md-6">
                    <div id="preview" class="well"> </div>
                </div>
            </div>
            <script src="${ctx}/static/markdown/markdown.min.js"></script>
        </div>
        <div class="panel-footer"></div>
    </div>
</div>

<script>
    function Editor(input, preview) {
        this.update = function () {
            preview.innerHTML = markdown.toHTML(input.value);
        };
        input.editor = this;
        this.update();
    }
    new Editor(document.getElementById("text-input"), document.getElementById("preview"));
    $(function(){

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

        // 标题点击事件,循环标题
        $("#menu1").children().each(function(index){
            $(this).click(function(){
                if (index == 0){
                    $("#text-input").append("\n# Title");
                } else if (index == 1){
                    $("#text-input").append("\n## Title");
                } else if (index == 2){
                    $("#text-input").append("\n### Title");
                } else if (index == 3){
                    $("#text-input").append("\n#### Title");
                } else if (index == 4){
                    $("#text-input").append("\n##### Title");
                } else if (index == 5){
                    $("#text-input").append("\n###### Title");
                }

                var content = markdown.toHTML($("#text-input").text());
                $("#preview").html(content);
            });
        });;
        $(".nav-pills > li").each(function(index){
            if (index == 2){
                $(this).click(function(){
                    $("#text-input").append("\n\n一个 Markdown 段落是由一个或多个连续的文本行组成，它的前后要有一个以上的空行。\n");
                    var content = markdown.toHTML($("#text-input").text());
                    $("#preview").html(content);
                });
            } else if (index == 3){
                $(this).click(function(){
                    $("#text-input").append("\n> Markdown 中的区块引用以`>`开头。");
                    var content = markdown.toHTML($("#text-input").text());
                    $("#preview").html(content);
                });
            } else if (index == 4){
                $(this).click(function(){
                    $("#text-input").append("\n\nMarkdown 中的无序列表可以使用`*`、`+`、`-`。\n\n* 列表第一项 \n* 列表第二项");
                    var content = markdown.toHTML($("#text-input").text());
                    $("#preview").html(content);
                });
            } else if (index == 5){
                $(this).click(function(){
                    $("#text-input").append("\n\nMarkdown 中的有序列表使用数字后跟英文句点`.`。\n\n1. 列表第一项 \n2. 列表第二项");
                    var content = markdown.toHTML($("#text-input").text());
                    $("#preview").html(content);
                });
            } else if (index == 6){
                $(this).click(function(){
                    $("#text-input").append("\n\nMarkdown 中的代码区块只需要加4个空格或者一个制表符就可以。\n\n    function foo(){\n        console.log('Hello World!')\n    }");
                    var content = markdown.toHTML($("#text-input").text());
                    $("#preview").html(content);
                });
            } else if (index == 7){
                $(this).click(function(){
                    $("#text-input").append("\n\n在一行中用三个以上的星号、减号、底线来建立一个分隔线，行内不能有其他东西。\n\n--------------------------");
                    var content = markdown.toHTML($("#text-input").text());
                    $("#preview").html(content);
                });
            } else if (index == 8){
                $(this).click(function(){
                    $("#text-input").append("\n\n要建立一个行内式的链接，只要在方块括号后面紧接着圆括号并插入网址链接即可，如果你还想要加上链接的 title 文字，只要在网址后面，用双引号把 title 文字包起来即可。\n\n鼠标放在 [链接](http://example.com/ 'Title') 上会有提示.\n\n鼠标放在 [这个链接](http://example.net/) 上没有提示.\n\n");
                    var content = markdown.toHTML($("#text-input").text());
                    $("#preview").html(content);
                });
            }
        });
    });
</script>
</body>
</html>
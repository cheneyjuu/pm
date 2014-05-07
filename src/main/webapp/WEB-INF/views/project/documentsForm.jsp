<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>新建文档</title>
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
            <div class="row">
                <div class="col-md-6">
                    <textarea id="text-input" class="form-control" rows="10" oninput="this.editor.update()">Type **Markdown** here.</textarea>
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
    var $ = function (id) { return document.getElementById(id); };
    new Editor($("text-input"), $("preview"));
</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title></title>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.all.min.js"></script>
    <script type="text/javascript">
        $(function(){
            window.UEDITOR_HOME_URL = "${ctx}/static/ueditor/";
        });
    </script>
</head>
<body>
<form action="${ctx}/documents/update" method="post" class="form-horizontal">
    <input type="hidden" name="type" value="2"/>
    <input type="hidden" name="documentId" value="${document.id}"/>
    <div class="form-group">
        <label for="inputTitle">标题</label>
        <input name="title" type="text" class="form-control" id="inputTitle" value="${document.title}">
    </div>
    <div class="form-group">
        <label for="inputContent">正文</label>
        <textarea name="article" id="inputContent">${document.article}</textarea>
    </div>
    <div class="form-group">
        <label for="inputIntro">项目描述</label>
        <textarea class="form-control" name="description" id="inputIntro">${document.description}</textarea>
    </div>
    <section>
        <button class="btn btn-success" id="subFormBtn"><span class="glyphicon glyphicon-ok"></span> 提交</button>
    </section>
</form>
<script>
    UE.getEditor('inputContent');
    $('#subFormBtn').click(function(){
        $('form').submit();
    });
</script>
</body>
</html>
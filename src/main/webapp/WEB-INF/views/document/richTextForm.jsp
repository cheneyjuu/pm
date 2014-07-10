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
<form action="${ctx}/documents/create/${projectId}" method="post" class="form">
    <input type="hidden" name="type" value="2"/>
    <div class="form-group">
        <label for="inputTitle">标题</label>
        <input name="title" type="text" class="form-control" id="inputTitle" placeholder="请输入文档标题 ...">
    </div>
    <div class="form-group">
        <label for="inputContent">正文</label>
        <textarea name="article" id="inputContent"></textarea>
    </div>
    <div class="form-group">
        <label for="inputIntro">项目描述</label>
        <textarea class="form-control" name="description" id="inputIntro"></textarea>
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
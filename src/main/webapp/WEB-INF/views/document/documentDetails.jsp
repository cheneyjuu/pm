<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title></title>
</head>
<body>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><a href="${ctx}/project/index/${projectId}">项目名称</a>  <small><a href="${ctx}/documents/list/${projectId}">文档列表</a></small></h3>
            </div>
            <div class="panel-body">
                ${document.article}
            </div>
            <div class="panel-footer"></div>
        </div>
    </div>
</body>
</html>
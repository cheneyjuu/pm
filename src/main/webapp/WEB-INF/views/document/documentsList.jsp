<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>文档列表</title>
    <style>
        .document-container a{
            display: inline-block;
            float: left;
            text-decoration: none;
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
            <div class="page-header">
                <h4>所有文档 <button class="btn btn-default btn-sm add-todo" id="create-btn"><span class="glyphicon glyphicon-plus"></span> 添加新文档</button></h4>
                <span class="pull-right">
                    <small>根据标签查看文件</small>
                    <a href="#"><span class="label label-info">所有标签</span></a>
                </span>
            </div>
            <div class="row document-container">
                <c:forEach items="${documentPage.content}" var="document">
                    <a class="col-md-4" href="${ctx}/documents/details/${projectId}/${document.id}">
                        <h4 class="text-center">${document.title}</h4>
                        <p class="text-muted">
                                ${document.description}
                        </p>
                        <small><span class="text-muted">${document.author.name}于${document.createTime}添加</span></small>
                    </a>
                </c:forEach>
            </div>
        </div>
        <div class="panel-footer">
            <c:if test="${fn:length(documentPage.content) > 0}">
                <tags:pagination page="${documentPage}" paginationSize="12"/>
            </c:if>
        </div>
    </div>
</div>
<script>
    $(function(){
        $("#create-btn").click(function(){
            window.location.href="${ctx}/documents/createForm/${projectId}";
        });
    });
</script>
</body>
</html>
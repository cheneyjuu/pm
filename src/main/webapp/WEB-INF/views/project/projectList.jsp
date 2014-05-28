<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>项目列表</title>
    <style>
        .project-list > div img{
            height: 50px;
        }
        .project-list > div a {
            text-decoration: none;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-md-2">
        <a href="/project/cf" class="btn btn-default btn-lg">
            <span class="glyphicon glyphicon-plus"></span> 新建项目
        </a>
        <a href="#" class="center-block">从模板创建新项目</a>
    </div>
    <div class="col-md-10">
        <div class="row project-list">
            <c:forEach items="${projectUserList}" var="pu">
                <div class="col-md-4 well text-center">
                    <a href="${ctx}/project/index">
                        <span class="glyphicon glyphicon-inbox center-block project-inbox"></span>
                        <h3><a href="${ctx}/project/index">${pu.project.projectName}</a></h3>
                        <small class="center-block">${pu.project.createTime}创建</small>
                        <a href="${ctx}/project/index">
                            <p>${pu.project.intro}</p>
                        </a>
                    </a>
                </div>
            </c:forEach>
    </div>
</div>
</body>
</html>
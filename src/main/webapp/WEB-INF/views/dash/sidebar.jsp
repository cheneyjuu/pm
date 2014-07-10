<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title></title>
</head>
<body>
<aside class="nav nav-sidebar text-white ml-20 mt-20">
    <ul class="nav">
        <li class="f-ff1"><span class="glyphicon glyphicon-list"></span> 任务列表</li>
        <li>
            <ul class="nav text-indent">
                <c:forEach items="${newTaskList}" var="tl">
                    <li><a href="${ctx}/task/index/${tl.id}">${tl.title}</a></li>
                </c:forEach>
            </ul>
        </li>
    </ul>
</aside>
</body>
</html>
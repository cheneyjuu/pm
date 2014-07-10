<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title></title>
</head>
<body>
<div class="row">
    <header><a href="#" class="text-white"><span class="glyphicon glyphicon-plus"></span></a></header>
</div>
<div class="row">
    <section class="col-md-6">
        <h3>${task.title}</h3>
        <div class="page-header">待办任务</div>
        <ul>
            <li><a href="#">待办任务1</a></li>
            <li><a href="#">待办任务2</a></li>
            <li><a href="#">待办任务3</a></li>
        </ul>
    </section>
    <section class="col-md-6"></section>
</div>

</body>
</html>
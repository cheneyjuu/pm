<%@ page language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div id="header">
    <%--<div class="collapse navbar-collapse" id="bs-navbar-collapse-1">--%>
        <%--<nav class="navbar navbar-default">--%>
            <%--<ul class="nav navbar-nav">--%>
                <%--<li><a href="${ctx}/project/list">项目列表</a></li>--%>
                <%--<li><a href="#">日程</a></li>--%>
                <%--<li><a href="#">浏览</a></li>--%>
                <%--<li><a href="#">时间轴</a></li>--%>
                <%--<li><a href="#">用户管理</a></li>--%>
                <%--<li><a href="#">个人中心</a></li>--%>
            <%--</ul>--%>
        <%--</nav>--%>
    <%--</div>--%>
        <ul class="nav nav-pills">
            <li class="logo"><img src="${ctx}/static/images/logo.png" alt="项目管理系统"/></li>
            <li><a href="${ctx}/p/index">个人中心</a></li>
            <li><a href="${ctx}/project/list">项目列表</a></li>
            <li><a href="#">日程</a></li>
            <li><a href="#">浏览</a></li>
            <li><a href="#">时间轴</a></li>
            <li><a href="#">用户管理</a></li>
        </ul>
</div>
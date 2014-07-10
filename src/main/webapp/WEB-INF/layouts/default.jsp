<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<title>项目管理系统 - <sitemesh:title/></title>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />
<meta http-equiv="Expires" content="0" />
<meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <link href="${ctx}/static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/css/default.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/css/main.css" type="text/css" rel="stylesheet" />
    <link href="${ctx}/static/css/sidebar.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/static/jquery/jquery.min.js" type="text/javascript"></script>
    <script src="${ctx}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <sitemesh:head/>
</head>

<body>
    <%--<%@ include file="/WEB-INF/layouts/header.jsp"%>--%>
	<div class="container-fluid" id="container-fluid">
        <div class="row clear-left-margin clear-right-margin full-height">
            <div class="col-md-2 dark-color full-height clear-left-padding clear-right-padding" style="position: fixed;">
                <aside>
                    <h4 class="ml-20"><a href="${ctx}/project/list" class="text-white"><span class="glyphicon glyphicon-th-large"></span> 项目列表</a></h4>
                    <hr/>
                    <ul class="nav nav-sidebar text-white mt-20">
                        <li class="f-ff1 ml-20">任务列表</li>
                        <li>
                            <ul class="nav nav-child ml-20">
                                <c:forEach items="${taskList}" var="tl">
                                    <li>
                                        <a href="${ctx}/task/index/${tl.id}">
                                            <span class="glyphicon glyphicon-list"></span> ${tl.title}
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </li>
                        <li class="nav-divider"></li>
                        <li class="ml-20"><a href="${ctx}/documents/list/${projectId}" class="zero-padding"><span class="glyphicon glyphicon-file"></span> 项目文档</a></li>
                    </ul>
                </aside>
            </div>
            <div class="col-md-10 clear-left-margin clear-right-margin col-md-push-2 full-height" style="position: fixed;">
                <sitemesh:body/>
            </div>
        </div>
	</div>
</body>
</html>
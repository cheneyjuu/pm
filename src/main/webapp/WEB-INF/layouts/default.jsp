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
<%--<link href="${ctx}/static/bootstrap/3.0.3/css/bootstrap.min.css" type="text/css" rel="stylesheet" />--%>
<link href="http://cdn.staticfile.org/twitter-bootstrap/3.1.1/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<%--<link href="${ctx}/static/jquery-validation/1.11.1/validate.css" type="text/css" rel="stylesheet" />--%>
<link href="${ctx}/static/css/main.css" type="text/css" rel="stylesheet" />
<script src="${ctx}/static/jquery/jquery-1.9.1.min.js" type="text/javascript"></script>
<sitemesh:head/>
</head>

<body>
    <%@ include file="/WEB-INF/layouts/header.jsp"%>
	<div class="container" id="container">
		<div id="content">
			<sitemesh:body/>
		</div>
	</div>
    <%@ include file="/WEB-INF/layouts/footer.jsp"%>
	<%--<script src="${ctx}/static/bootstrap/3.0.3/js/bootstrap.min.js" type="text/javascript"></script>--%>
	<script src="http://cdn.staticfile.org/twitter-bootstrap/3.1.1/js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>
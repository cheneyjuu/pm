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
<link href="${ctx}/static/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<link href="${ctx}/static/css/main.css" type="text/css" rel="stylesheet" />
<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>
<script src="${ctx}/static/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
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
</body>
</html>
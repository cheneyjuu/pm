<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title></title>
    <link href="${ctx}/static/css/index.css" type="text/css" rel="stylesheet" />
    <%--<script src="http://cdn.staticfile.org/jquery/2.1.1/jquery.min.js" type="text/javascript"></script>--%>
</head>
<body>

    <div class="container-fluid main-container">
        <nav class="navbar-fixed-top">
            <div class="row">
                <div class="col-md-6 pull-left"></div>
                <div class="col-md-6 pull-right text-right col-md-pull-1">
                    <a href="#"><span class="glyphicon glyphicon-plus-sign"></span> 新建项目</a>
                </div>
            </div>
        </nav>
        <section class="project-section">
            <div class="container">
                <div class="row">
                    <c:forEach items="${projectUserList}" var="entity">
                        <div class="col-md-4">
                            <div class="card">
                                <div class="pull-right"><span class="glyphicon glyphicon-pushpin col-md-pull-1 text-info f-fz1"></span></div>
                                <h3 class="text-center pt-20"><a href="${ctx}/project/index/${entity.project.id}" class="white-color">${entity.project.projectName}</a></h3>
                                <p class="text-indent"><a href="${ctx}/project/index/${entity.project.id}" class="white-color f-fz1">${entity.project.intro}</a></p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>
    </div>

</body>
</html>
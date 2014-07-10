<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="org.apache.shiro.web.filter.authc.FormAuthenticationFilter"%>
<%@ page import="org.apache.shiro.authc.ExcessiveAttemptsException"%>
<%@ page import="org.apache.shiro.authc.IncorrectCredentialsException"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<html>
<head>
	<title>登录页</title>
    <style>
        body{
            background-image: url("/static/images/blur-bg-light.png");
        }
    </style>
</head>

<body>
<form id="loginForm" action="${ctx}/login" method="post" class="form-horizontal col-md-6 col-md-push-3">
    <%
        String error = (String) request.getAttribute(FormAuthenticationFilter.DEFAULT_ERROR_KEY_ATTRIBUTE_NAME);
        if(error != null){
    %>
    <div class="alert alert-error input-medium controls">
        <button class="close" data-dismiss="alert">×</button>登录失败，请重试.
    </div>
    <%
        }
    %>
    <div class="form-group">
        <label for="username" class="control-label col-sm-3">名称:</label>
        <div class="col-sm-9">
            <input type="text" id="username" name="username"  value="${username}" class="form-control required"/>
        </div>
    </div>
    <div class="form-group">
        <label for="password" class="control-label col-sm-3">密码:</label>
        <div class="col-sm-9">
            <input type="password" id="password" name="password" class="form-control required"/>
        </div>
    </div>

    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
            <label class="checkbox" for="rememberMe"><input type="checkbox" id="rememberMe" name="rememberMe"/> 记住我</label>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-3 col-sm-9">
            <input id="submit_btn" class="btn btn-primary" type="submit" value="登 录"/> <a class="btn" href="${ctx}/register">注 册</a>
        </div>
    </div>
</form>
<script>
    $(function(){
        var clientHeight = document.documentElement.clientHeight;
        var formHeight = $('form').innerHeight();
        var position = clientHeight/2-formHeight/2;
        $('form').css('margin-top',position+'px');
    });
</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>个人中心</title>
</head>
<body>
<div class="row personal-container">
    <div class="col-md-8 div-bordered work-container">
        <ul class="nav nav-pills">
            <li class="active"><a href="#">最新动态</a></li>
            <li><a href="#" class="text-muted">我的任务</a></li>
            <li><a href="#" class="text-muted">我的邮件</a></li>
        </ul>
        <table class="table table-hover">
            <tr>
                <td class="col-md-2">
                    <img src="${ctx}/static/images/example/3.jpg" class="img-circle user-head-s" alt=""> <span>张三</span></img>
                </td>
                <td class="col-md-8">
                    <h4>这里显示动态类别</h4>
                    <p>这里显示具体的动态</p>
                </td>
                <td class="col-md-2"><span>2014年5月12日</span></td>
            </tr>
            <tr>
                <td>
                    <img src="${ctx}/static/images/example/3.jpg" class="img-circle user-head-s" alt=""> <span>张三</span></img>
                </td>
                <td>
                    <h4>这里显示动态类别</h4>
                    <p>这里显示具体的动态</p>
                </td>
                <td><span>2014年5月12日</span></td>
            </tr>
        </table>
        <div class="text-center"><a href="#" class="text-muted clean-link-decoration">查看全部动态</a></div>
    </div>
    <div class="col-md-4 div-bordered hello">
        <div class="row under-line-gray">
            <div class="col-md-3">
                <img src="${ctx}/static/images/example/3.jpg" alt="" class="img-circle user-head-m"/>
            </div>
            <div class="col-md-9">
                <h4>张三, 吃过午饭了么？</h4>
                <p>今天是 星期四，2014年05月15日</p>
            </div>
        </div>
        <ul class="nav nav-pills nav-justified task-list">
            <li class="text-center">
                <a href="#">
                    <h4 class="text-warning number-ft">0</h4>
                    <span class="text-muted">待完成任务</span>
                </a>
            </li>
            <li class="text-center">
                <a href="#">
                    <h4 class="text-success number-ft">0</h4>
                    <span class="text-muted">已完成任务</span>
                </a>
            </li>
            <li class="text-center">
                <a href="#">
                    <h4 class="text-danger number-ft">0</h4>
                    <span class="text-muted">过期任务</span>
                </a>
            </li>
        </ul>
    </div>
    <div class="col-md-4 div-bordered power-note">
        <h4 class="under-line-gray"><span class="glyphicon glyphicon-th-list"></span> 今天日程</h4>
        <div>
            <span class="glyphicon glyphicon-th-list center-block tips"></span>
            <span class="tips center-block text-center">今天没有日程安排</span>
        </div>
    </div>
</div>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>文档列表</title>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3><a href="${ctx}/project/index">项目名称</a></h3>
        </div>
        <div class="panel-body">
            <div class="page-header">
                <h4>所有文档 <button class="btn btn-default btn-sm add-todo" id="create-btn"><span class="glyphicon glyphicon-plus"></span> 添加新文档</button></h4>
                <span class="pull-right">
                    <small>根据标签查看文件</small>
                    <a href="#"><span class="label label-info">所有标签</span></a>
                </span>
            </div>

            <a href="${ctx}/documents/details">
                <div class="div-bordered">
                    <h4 class="text-center">需求文档标题</h4>
                    <p class="text-muted">百慕大三角真的存在吗？麦田怪圈到底是谁干的？UFO真的是外星人吗？大脚野人真的存在吗？进化论可以解释一切物种的起源吗？处于今天这个信息爆炸的时代中，我们接收到的信息除了真实的信息之外，还有很多谎言，谣言，不实的学说。我们如何能够去伪存真， ...</p>
                    <small><span class="text-muted">张三于2013年12月12日添加</span></small>
                </div>
            </a>
            <a href="${ctx}/documents/details">
                <div class="div-bordered">
                    <h4 class="text-center">需求文档标题</h4>
                    <p class="text-muted">百慕大三角真的存在吗？麦田怪圈到底是谁干的？UFO真的是外星人吗？大脚野人真的存在吗？进化论可以解释一切物种的起源吗？处于今天这个信息爆炸的时代中，我们接收到的信息除了真实的信息之外，还有很多谎言，谣言，不实的学说。我们如何能够去伪存真， ...</p>
                    <small><span class="text-muted">张三于2013年12月12日添加</span></small>
                </div>
            </a>
            <a href="${ctx}/documents/details">
                <div class="div-bordered">
                    <h4 class="text-center">需求文档标题</h4>
                    <p class="text-muted">百慕大三角真的存在吗？麦田怪圈到底是谁干的？UFO真的是外星人吗？大脚野人真的存在吗？进化论可以解释一切物种的起源吗？处于今天这个信息爆炸的时代中，我们接收到的信息除了真实的信息之外，还有很多谎言，谣言，不实的学说。我们如何能够去伪存真， ...</p>
                    <small><span class="text-muted">张三于2013年12月12日添加</span></small>
                </div>
            </a>
            <a href="${ctx}/documents/details">
                <div class="div-bordered">
                    <h4 class="text-center">需求文档标题</h4>
                    <p class="text-muted">百慕大三角真的存在吗？麦田怪圈到底是谁干的？UFO真的是外星人吗？大脚野人真的存在吗？进化论可以解释一切物种的起源吗？处于今天这个信息爆炸的时代中，我们接收到的信息除了真实的信息之外，还有很多谎言，谣言，不实的学说。我们如何能够去伪存真， ...</p>
                    <small><span class="text-muted">张三于2013年12月12日添加</span></small>
                </div>
            </a>
        </div>
        <div class="panel-footer"></div>
    </div>
</div>
<script>
    $(function(){
        $("#create-btn").click(function(){
            window.location.href="${ctx}/documents/create";
        });
    });
</script>
</body>
</html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title></title>
    <style>
        .align-center{
            text-align: center;
            padding-top: 10px;
        }
        .div-bordered{
            border: 1px solid #cccccc;
            padding: 15px;
            margin-left: 4%;
            margin-top: 15px;
            width: 20%;
        }
        input[type="file"]{
            display: inline;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3><a href="${ctx}/project/index">项目名称</a></h3>
        </div>
        <div class="panel-body">
            <div class="page-header">
                <h4>
                    所有文件
                    <input type="file" value="添加新文件" class="add-todo"/>
                    <span class="pull-right">
                        <small>根据标签查看文件</small>
                        <a href="#"><span class="label label-info">所有标签</span></a>
                    </span>
                </h4>

            </div>
            <div class="row">
                <div class="col-md-4 div-bordered">
                    <img src="${ctx}/static/images/example/3.jpg" alt="word" class="img-rounded center-block">
                    <b class="center-block align-center">这个是上传的文件.doc</b>
                    <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                    <a href="#" class=" align-center"><span class="badge">42</span> 个回复</a>
                    <span class="label label-info">New</span>
                    <span class="label label-info">圣诞狗</span>
                    <a href="#"><span class="label label-default">添加新标签</span></a>
                </div>
                <div class="col-md-4 div-bordered">
                    <img src="${ctx}/static/images/example/3.jpg" alt="word" class="img-rounded center-block">
                    <b class="center-block align-center">这个是上传的文件.doc</b>
                    <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                    <a href="#" class=" align-center"><span class="badge">42</span> 个回复</a>
                    <span class="label label-info">New</span>
                    <span class="label label-info">圣诞狗</span>
                    <a href="#"><span class="label label-default">添加新标签</span></a>
                </div>
                <div class="col-md-4 div-bordered">
                    <img src="${ctx}/static/images/example/3.jpg" alt="word" class="img-rounded center-block">
                    <b class="center-block align-center">这个是上传的文件.doc</b>
                    <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                    <a href="#" class=" align-center"><span class="badge">42</span> 个回复</a>
                    <span class="label label-info">New</span>
                    <span class="label label-info">圣诞狗</span>
                    <a href="#"><span class="label label-default">添加新标签</span></a>
                </div>
                <div class="col-md-4 div-bordered">
                    <img src="${ctx}/static/images/example/3.jpg" alt="word" class="img-rounded center-block">
                    <b class="center-block align-center">这个是上传的文件.doc</b>
                    <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                    <a href="#" class=" align-center"><span class="badge">42</span> 个回复</a>
                    <span class="label label-info">New</span>
                    <span class="label label-info">圣诞狗</span>
                    <a href="#"><span class="label label-default">添加新标签</span></a>
                </div>
                <div class="col-md-4 div-bordered">
                    <img src="${ctx}/static/images/example/3.jpg" alt="word" class="img-rounded center-block">
                    <b class="center-block align-center">这个是上传的文件.doc</b>
                    <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                    <a href="#" class=" align-center"><span class="badge">42</span> 个回复</a>
                    <span class="label label-info">New</span>
                    <span class="label label-info">圣诞狗</span>
                    <a href="#"><span class="label label-default">添加新标签</span></a>
                </div>
            </div>
        </div>
        <div class="panel-footer"></div>
    </div>
</div>
</body>
</html>

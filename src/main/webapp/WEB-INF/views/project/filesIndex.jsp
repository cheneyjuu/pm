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
            margin-left: 1%;
            margin-top: 1%;
            width: 23.8%;
            border-radius: 4px;
            -moz-border-radius: 4px;
        }
        input[type="file"]{
            display: inline;
        }
        .file-icon{
            height: 100px;
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
                <h4>所有文件 <button class="btn btn-default btn-sm" class="add-todo"><span class="glyphicon glyphicon-plus"></span> 添加新文件</button></h4>
                <span class="pull-right">
                    <small>根据标签查看文件</small>
                    <a href="#"><span class="label label-info">所有标签</span></a>
                </span>
            </div>
            <div class="row">
                <div class="div-bordered">
                    <a href="#"><img src="${ctx}/static/images/example/word.png" alt="word" class="img-rounded center-block file-icon"></a>
                    <b class="center-block align-center">这个是上传的文件.doc</b>
                    <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                    <a href="#" class="center-block text-center"><span class="badge">42 条回复</span></a>
                    <span class="label label-info text-center">New</span>
                    <span class="label label-info text-center">圣诞狗</span>
                    <a href="#"><span class="label label-warning">添加新标签</span></a>
                </div>
                <div class="div-bordered">
                    <a href="#"><img src="${ctx}/static/images/example/ppt.png" alt="ppt" class="img-rounded center-block file-icon"></a>
                    <b class="center-block align-center">这个是上传的文件.doc</b>
                    <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                    <a href="#" class="center-block text-center"><span class="badge">42 条回复</span></a>
                    <span class="label label-info">New</span>
                    <span class="label label-info">圣诞狗</span>
                    <a href="#"><span class="label label-warning">添加新标签</span></a>
                </div>
                <div class="div-bordered">
                    <a href="#"><img src="${ctx}/static/images/example/excel.png" alt="excel" class="img-rounded center-block file-icon"></a>
                    <b class="center-block align-center">这个是上传的文件.doc</b>
                    <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                    <a href="#" class="center-block text-center"><span class="badge">42 条回复</span></a>
                    <span class="label label-info">New</span>
                    <span class="label label-info">圣诞狗</span>
                    <a href="#"><span class="label label-warning">添加新标签</span></a>
                </div>
                <div class="div-bordered">
                    <a href="#"><img src="${ctx}/static/images/example/folder.png" alt="folder" class="img-rounded center-block file-icon"></a>
                    <b class="center-block align-center">这个是上传的文件.doc</b>
                    <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                    <a href="#" class="center-block text-center"><span class="badge">42 条回复</span></a>
                    <span class="label label-info">New</span>
                    <span class="label label-info">圣诞狗</span>
                    <a href="#"><span class="label label-warning">添加新标签</span></a>
                </div>
                <div class="div-bordered">
                    <a href="#"><img src="${ctx}/static/images/example/rar.png" alt="rar" class="img-rounded center-block file-icon"></a>
                    <b class="center-block align-center">这个是上传的文件.doc</b>
                    <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                    <a href="#" class="center-block text-center"><span class="badge">42 条回复</span></a>
                    <span class="label label-info">New</span>
                    <span class="label label-info">圣诞狗</span>
                    <a href="#"><span class="label label-warning">添加新标签</span></a>
                </div>
            </div>
        </div>
        <div class="panel-footer"></div>
    </div>
</div>
</body>
</html>

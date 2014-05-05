<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>项目主页</title>
    <link href="${ctx}/static/bootstrap/3.0.3/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <style>
        .navbar-collapse{
            padding-left: 0;
            padding-right: 0;
        }
        .panel-body{
            min-height: 200px;
        }
        #project-setting{
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <div class="row">
                    <div class="col-md-10">
                        <h3>项目名称</h3>
                    </div>
                    <div class="col-md-2">
                        <a href="#">邀请成员</a>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12"><small>项目描述</small></div>
                </div>
                <hr/>
                <ul class="nav nav-pills">
                    <li class="disabled"><a href="#">新建：</a></li>
                    <li><a href="${ctx}/discuss/index">讨论</a></li>
                    <li><a href="${ctx}/todolists/index">TODOS</a></li>
                    <li><a href="#">文件</a></li>
                    <li><a href="#">事件</a></li>
                </ul>
                <hr/>
            </div>

            <div class="panel-body">

            </div>
            <div class="panel-footer">
                <div id="project-operation">
                    <a href="#" class="text-muted">项目设置</a>
                    <a href="#" class="pull-right text-muted">删除项目</a>
                </div>
                <div id="project-setting">
                    <span class="center-block">
                        <label for="open"><input name="settingName" id="open" type="radio" checked="checked"/> <strong>开启</strong></label>
                        <label for="close"><input name="settingName" id="close" type="radio"/> <strong>关闭</strong></label>
                    </span>
                    <span class="center-block">
                        <a href="#" class="btn btn-primary btn-sm">保存</a> 或 <a href="#" class="btn btn-default btn-sm">取消</a>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function(){
            // 项目设置
            $("#project-operation").find("a:first-child").click(function(){
                $("#project-operation").css("display", "none");
                $("#project-setting").css("display","block");
            });
            // 删除项目
            $("#project-operation").find("a:last-child").click(function(){
                var del = window.confirm("确定要删除项目？项目删除后，可在回收站恢复！");

            });
        });
    </script>
</body>
</html>
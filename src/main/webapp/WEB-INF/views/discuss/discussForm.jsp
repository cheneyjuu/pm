<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>新建讨论内容</title>
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.all.min.js"></script>
    <style>
        .discuss-title{
            height: 50px;
            font-size: 24px;
        }
        #project-setting{
            display: none;
        }
        .post-btn{
            margin-top: 15px;
            width: 100px;
        }
    </style>
    <script type="text/javascript">
        $(function(){
            window.UEDITOR_HOME_URL = "${ctx}/static/ueditor/";
        });
    </script>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3><a href="${ctx}/project/index">项目名称</a></h3>
        </div>
        <div class="panel-body">
            <input type="text" class="form-control input-lg discuss-title" placeholder="输入标题 ..."/>
            <hr/>
            <form method="post">
                <div class="control-group" id="areaDiv">
                    <div class="controls">
                        <textarea id="myEditor" name="content"></textarea>
                    </div>
                </div>
            </form>
            <hr/>
            <span class="glyphicon glyphicon-paperclip"></span> 您还可以选择添加附件： <a href="#">从电脑选择 ...</a>
            <hr/>
            <strong>您可以邀请其他人来参与：</strong>
            <p>

            </p>
            <ul>
                <li><a href="#">邀请项目参与人员</a> <small>被邀请的人员可以和您一起协作完成任务</small></li>
                <li><a href="#">邀请非项目参与人员</a> <small>被邀请的人只能看到此讨论信息</small></li>
            </ul>
            <button class="btn btn-default btn-success btn-md post-btn"> 提 交 </button>
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
<script type="text/javascript">
    UE.getEditor('myEditor');
</script>
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
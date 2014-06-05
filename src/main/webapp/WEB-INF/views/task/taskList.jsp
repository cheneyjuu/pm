<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="zh-cn">
<head>
    <title>任务列表</title>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3><a href="${ctx}/project/index/${task.project.id}">${task.project.projectName}</a></h3>
        </div>
        <div class="panel-body">
            <div class="page-header">
                <h4 class="red-color">任务列表 <button class="btn btn-default btn-sm add-todo" id="createTaskBtn"><span class="glyphicon glyphicon-plus"></span> 添加任务列表</button></h4>
            </div>
            <div class="row">
                <div class="col-md-9 todo-lists">
                    <input type="hidden" id="parentId" value="${task.id}"/>
                    <section id="createTaskSection">
                        <input type="text" name="title" id="title" placeholder="输入任务标题" class="fn-border-bottom-dotted col-md-12"/>
                        <input type="text" name="description" id="description" placeholder="补充说明(可选)" class="col-md-12 fn-cl-b"/>
                        <div class="clearfix"></div>
                        <div class="actions">
                            <button class="btn btn-sm btn-danger" id="addTaskBtn">添加任务</button>
                            <a href="javascript:void(null);" id="cancelTaskBtn">取消</a>
                        </div>
                    </section>
                    <section class="taskList" id="taskList">
                        <ul class="list-unstyled default-task-list">
                            <li>
                                <input type="checkbox"/> <a href="javascript:void(null)">任务标题</a>
                            </li>
                        </ul>
                        <div class="sub-task-container col-md-offset-1 hidden">
                            <input type="text" placeholder="添加子任务" class="no-border no-outline"/>
                        </div>
                    </section>
                </div>

                <div class="col-md-3">
                    <div class="form-group">
                        <label class="text-muted center-block" for="assignedSelect">显示分配给：</label>
                        <select name="assignedSelect" id="assignedSelect" class="form-control">
                            <option value="1">所有人</option>
                            <option value="2">张三</option>
                            <option value="3">李四</option>
                            <option value="3">1923416@qq.com</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label class="text-muted center-block" for="todosDue">显示截止日期为：</label>
                        <select name="assignedSelect" id="todosDue" class="form-control">
                            <option value="1">所有时间</option>
                            <option value="2">已过期</option>
                            <option value="3">将过期</option>
                        </select>
                    </div>
                    <div>
                        <a href="#" class="text-info">查看所有已完成的 to-dos</a>
                    </div>
                    <div id="currentTodos">
                        <strong>当前的to-dos列表</strong>
                        <ul class="list-unstyled">
                            <li><a href="#" class="text-info">当前任务1</a></li>
                            <li><a href="#" class="text-info">当前任务2</a></li>
                            <li><a href="#" class="text-info">当前任务3</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function(){
        $("#createTaskSection").hide();
        $("#createTaskBtn").click(function(){
            $("#createTaskSection").fadeIn();
        });
        $("#cancelTaskBtn").click(function(){
            $("#createTaskSection").fadeOut();
        });

        function requestServer(){
            var _title = $("#createTaskSection > #title").val();
            var _desc = $("#createTaskSection > #description").val();
            var parentId = $("#parentId").val() == "" ? 0 : $("#parentId").val();
            $.ajax({
                type : "POST",
                url : "${ctx}/task/create/${task.project.id}",
                data : {title : _title, description : _desc, parentId : parentId},
                success : function(result){
                    alert(result);
                    $("#parentId").val(result);
                }
            });
        }

        $("#addTaskBtn").click(function(){
            requestServer();
        });

        $("#taskList > ul > li > a").click(function(){
            $("#taskList > ul").removeClass("default-task-list");
            $("#taskList > ul").addClass("top-task-list");
            $(".sub-task-container").removeClass("hidden");
        });
    });
</script>
</body>
</html>

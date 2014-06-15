<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<html lang="zh-cn">
<head>
    <title>任务列表</title>
</head>
<body>
<div class="container">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3><a href="${ctx}/project/index/${project.id}">${project.projectName}</a></h3>
        </div>
        <div class="panel-body">
            <div class="page-header">
                <h4 class="red-color">任务列表 <button class="btn btn-default btn-sm add-todo" id="createTaskBtn"><span class="glyphicon glyphicon-plus"></span> 添加任务列表</button></h4>
            </div>
            <div class="row">
                <div class="col-md-9 todo-lists">
                    <section id="createTaskSection" style="display: none;">
                        <input type="text" name="title" id="title" placeholder="输入任务标题" class="fn-border-bottom-dotted col-md-12"/>
                        <input type="text" name="description" id="description" placeholder="补充说明(可选)" class="col-md-12 fn-cl-b"/>
                        <div class="clearfix"></div>
                        <div class="actions">
                            <button class="btn btn-sm btn-danger" id="addTaskBtn">添加任务</button>
                            <a href="javascript:void(null);" id="cancelTaskBtn">取消</a>
                        </div>
                        <hr/>
                    </section>
                    <section class="taskList" id="taskList">
                        <c:forEach items="${newTaskList}" var="tl">
                            <div class="task-container" id="${tl.id}">
                                <ul class="list-unstyled default-task-list">
                                    <li>
                                        <input type="checkbox"/>
                                        <c:choose>
                                            <c:when test="${fn:length(tl.childrenTasks) > 0}">
                                                <a class="f-ff1 f-fw" href="javascript:void(null)">${tl.title}</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="javascript:void(null)">${tl.title}</a>
                                            </c:otherwise>
                                        </c:choose>
                                        <small class="text-muted">${tl.description}</small>
                                    </li>
                                    <%--<li>--%>
                                        <%--<div class="btn-group">--%>
                                            <%--<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">--%>
                                                <%--操作 <span class="caret"></span>--%>
                                            <%--</button>--%>
                                            <%--<ul class="dropdown-menu" role="menu">--%>
                                                <%--<li><a href="#">编辑</a></li>--%>
                                                <%--<li><a href="#">删除</a></li>--%>
                                            <%--</ul>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>
                                    <%--<button class="btn btn-sm btn-danger"><span class="glyphicon glyphicon-trash"></span> <small>删除</small></button>--%>
                                </ul>
                                <c:if test="${fn:length(tl.childrenTasks) > 0}">
                                    <div class="sub-task-container" id="${tl.id}">
                                        <ul class="list-unstyled sub-task-list">
                                        <c:forEach items="${tl.childrenTasks}" var="ctl">
                                            <%--<div id="${ctl.id}" class=""><input type="checkbox"><a href="javascript:void(null)">${ctl.title}</a></div>--%>
                                            <li id="${ctl.id}"><input type="checkbox"><a href="javascript:void(null)">${ctl.title}</a></li>
                                        </c:forEach>
                                        </ul>
                                    </div>
                                </c:if>
                            </div>
                        </c:forEach>
                        <ul class="edit-list list-unstyled" id="edit-list">
                            <li><a href="#" class="btn btn-default">编辑</a></li>
                            <li><a href="#" class="btn btn-danger">删除</a></li>
                        </ul>
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
    var parentId = parentId;
    var event = event || window.event;

    $(function(){
//        $("#createTaskSection").hide();
        $("#edit-list").hide();

        $("#createTaskBtn").click(function(){
            $("#createTaskSection").fadeIn();
        });

        $("#cancelTaskBtn").click(function(){
            $("#createTaskSection").fadeOut();
        });

        // 添加任务按钮事件
        $("#addTaskBtn").click(function(){
            addTask();
        });
        // 添加任务键盘事件
        $("#createTaskSection").children("input").each(function(index){
            $(this).keyup(function(e){
                if (e.keyCode == 13){
                    addTask();
                } else if (e.keyCode == 27){
                    $("#createTaskSection").fadeOut();
                }
            });
        });

        // 添加任务函数
        function addTask(){
            var _title = $("#createTaskSection").children("#title").val();
            var _desc = $("#createTaskSection").children("#description").val();
            var task_container =
                    '<ul class="list-unstyled default-task-list">' +
                    '<li><input type="checkbox"><a href="javascript:void(null)"></a><small class="text-muted">'+_desc+'</small></li>' +
                    '</ul></div>';
            $.ajax({
                type : "POST",
                url : "${ctx}/task/create/${project.id}",
                data : {title : _title, description : _desc, parentId : 0},
                success : function(result){
                    parentId = result;
                    task_container = '<div class="task-container" id="'+result +'">' + task_container;
                    $("#taskList").prepend(task_container);
                    $("#"+result).find("ul").find("a").text(_title);
                    $("#createTaskSection > input").val("");
                    addSubTask();
                }
            });
        }

        // 添加子任务函数
        function addSubTask(){
            $(".task-container").each(function(index){
                var oTaskContainer= this;
                var pid = null;
                var subTitle = null;

                var tplSubTaskContainer = '<div class="sub-task-container" id="' + parentId +'">' +
                        '<ul class="list-unstyled sub-task-list"></ul>' +
                        '<input placeholder="添加子任务" class="no-border no-outline" type="text">' +
                        '</div>';

                $(this).find("ul").find("a").on("click", function(){

                    // 如果没有子任务时执行
                    if ($(oTaskContainer).find("ul").siblings().length == 0){
                        $(oTaskContainer).append(tplSubTaskContainer);
                        $(".sub-task-container").find("input").not("[type='checkbox']").on("keyup", function(e){
                            pid = $(oTaskContainer).attr("id");
                            subTitle = $(this).val();
                            var _input = $(this);
                            var task_inner = '<input type="checkbox"><a href="javascript:void(null)"></a>' +
                                    '</li>';
                            if (e.keyCode == 13) {
                                $.ajax({
                                    type : "POST",
                                    url : "${ctx}/task/create/${project.id}",
                                    data : {title : subTitle, description : "", parentId : pid},
                                    success : function(result){
                                        parentId = result;
                                        task_inner = '<li id="'+result +'">' + task_inner;
                                        $(_input).siblings("ul").prepend(task_inner);
                                        $("#"+result).find("a").text(subTitle);
                                        $(_input).val("");
                                        $(oTaskContainer).find("ul.default-task-list").find("a").addClass("f-ff1").addClass("f-fw");
                                    }
                                });
                            } else if (e.keyCode == 27){
                                $(_input).remove();
                            }
                        });
                    } else {
                        // 防止重复创建
                        if ($(oTaskContainer).find("ul").siblings().find("input").not("[type='checkbox']").length == 0){
                            $(oTaskContainer).find(">ul").siblings().append("<input placeholder='添加子任务' class='no-border no-outline' type='text'>");
                            $(oTaskContainer).find("ul").siblings().find("input").not("[type='checkbox']").on("keyup", function(e){
                                pid = $(oTaskContainer).attr("id");
                                subTitle = $(this).val();
                                var _input = $(this);
                                var task_inner = '<input type="checkbox"><a href="javascript:void(null)"></a>' +
                                        '</li>';
                                if (e.keyCode == 13) {
                                    $.ajax({
                                        type : "POST",
                                        url : "${ctx}/task/create/${project.id}",
                                        data : {title : subTitle, description : "", parentId : pid},
                                        success : function(result){
                                            parentId = result;
                                            task_inner = '<li id="'+result +'">' + task_inner;
                                            $(_input).siblings("ul").prepend(task_inner);
                                            $("#"+result).find("a").text(subTitle);
                                            $(_input).val("");
                                            $(oTaskContainer).find("ul.default-task-list").find("a").addClass("f-ff1").addClass("f-fw");
                                        }
                                    });
                                } else if (e.keyCode == 27){
                                    $(_input).remove();
                                }
                            });
                        }
                    }
                });
            });
        }

        addSubTask();

        // 更新任务状态

        $(".task-container").each(function(){

            var oTaskContainer = this;

            // 子任务选中事件
            $(oTaskContainer).find(".sub-task-container > ul > li").each(function(index){
                var oSubList = this;
                var oSubTaskContainer = $(this).parent().parent();
                var subId = null;
                $(this).find("input:checkbox").change(function(){
                    subId = $(this).parent().attr("id");
                    $.ajax({
                        url : "${ctx}/task/update/"+subId,
                        type : "GET",
                        success : function(result){
                            $(oSubList).remove();
                            // 这里需要判断子任务是否为空，如果为空，则还原任务样式
                        }
                    });
                });
            });

            // 任务选中事件
            $(this).children("ul").find("input:checkbox").change(function(){
                // 如果选择的父任务，将父任务和子任务直接删除，不再在页面上做全选操作
                var parentDiv = $(this).parent().parent().parent();
                var parentId = $(this).parent().parent().parent().attr("id");
                $.ajax({
                    type : "GET",
                    url : "${ctx}/task/update/"+parentId,
                    success : function(result){
                        $(parentDiv).remove();
                    }
                });
            });


            // 鼠标移入“任务列表”时，显示“编辑”、“删除”按钮组
            var editTaskObj = {};
            var tplButtonGroup =
                    '<button type="button" id="editTaskBtn" class="btn btn-info"><span class="glyphicon glyphicon-edit"></span> 编辑</button>' +
                    '<button type="button" id="trashTaskBtn" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> 删除</button>' +
                    '</div>';
            // 这里应该加一个计时器，如果鼠标进入时间超过1秒，则显示“操作"按钮
            $(oTaskContainer).children("ul").mouseenter(function(){
                var taskId = $(this).parent().attr("id");
                var taskList = $(this).children("li");
                editTaskObj.taskName = $(taskList).find("a").text();
                editTaskObj.taskDescription = $(taskList).find("small").text();
                tplButtonGroup = '<div class="btn-group btn-group-sm" data-flag="' + taskId + '">' + tplButtonGroup;
                $(this).append("<li class='pull-right btn-group-container'>"+tplButtonGroup+"</li>");
            });
            $(oTaskContainer).children("ul").mouseleave(function(){
                if ($(this).find("li.btn-group-container").length > 0){
                    $(this).find("li.btn-group-container").remove();
                }
            });

            var editSubTaskObj = {};
            if ($(oTaskContainer).children(".sub-task-container").length > 0){
                $(oTaskContainer).children(".sub-task-container").children("ul").children("li").mouseenter(function(){
                    var subTaskId = $(this).attr("id");
                    editSubTaskObj.taskName = $(this).children("a").text();
                    tplButtonGroup = '<div class="btn-group btn-group-sm" data-flag="' + subTaskId +'">' + tplButtonGroup;
                    $(this).append(tplButtonGroup);
                    $(this).children(".btn-group").addClass("pull-right");
                    // 编辑按钮点击事件
                    $(this).children(".btn-group").find("#editTaskBtn").click(function(){

                    });
                });
                $(oTaskContainer).children(".sub-task-container").children("ul").children("li").mouseleave(function(){
                    $(this).children(".btn-group").remove();
                });
            }

        });
    });
</script>
</body>
</html>

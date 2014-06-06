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
                    <section id="createTaskSection">
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
                                        <input type="checkbox"/> <a href="javascript:void(null)">${tl.title}</a>
                                    </li>
                                </ul>
                                <c:if test="${fn:length(tl.childrenTasks) > 0}">
                                    <div class="sub-task-container col-md-offset-1" id="${tl.id}">
                                        <c:forEach items="${tl.childrenTasks}" var="ctl">
                                            <div id="${ctl.id}"><input type="checkbox"><a href="javascript:void(null)">${ctl.title}</a></div>
                                        </c:forEach>
                                    </div>
                                </c:if>

                            </div>
                        </c:forEach>
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
    window.PARENTID;
    $(function(){
        $("#createTaskSection").hide();
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
        $("#createTaskSection > input").each(function(index){
            $(this).keypress(function(e){
                if (e.keyCode == 13){
                    addTask();
                }
            });
        });

        // 添加任务函数
        function addTask(){
            var _title = $("#createTaskSection > #title").val();
            var _desc = $("#createTaskSection > #description").val();
            var task_container =
                    '<ul class="list-unstyled default-task-list">' +
                    '<li><input type="checkbox"><a href="javascript:void(null)"></a></li>' +
                    '</ul></div>';
            $.ajax({
                type : "POST",
                url : "${ctx}/task/create/${project.id}",
                data : {title : _title, description : _desc, parentId : 0},
                success : function(result){
                    window.PARENTID = result;
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
                var _this = this;
                var pid = null;
                var subTitle = null;

                var sub_task_container = '<div class="sub-task-container col-md-offset-1" id="' + window.PARENTID +'">' +
                        '<input placeholder="添加子任务" class="no-border no-outline" type="text">' +
                        '</div>';

                $(this).find("ul").find("a").on("click", function(){

                    if ($(_this).find("ul").siblings().length == 0){
                        $(_this).append(sub_task_container);
                        $(".sub-task-container").find("input").not("[type='checkbox']").on("keypress", function(e){
                            pid = $(_this).attr("id");
                            subTitle = $(this).val();
                            var _input = $(this);
                            var task_inner = '<input type="checkbox"><a href="javascript:void(null)"></a>' +
                                    '</div>';
                            if (e.keyCode == 13) {
                                $.ajax({
                                    type : "POST",
                                    url : "${ctx}/task/create/${project.id}",
                                    data : {title : subTitle, description : "", parentId : pid},
                                    success : function(result){
                                        window.PARENTID = result;
                                        task_inner = '<div id="'+result +'">' + task_inner;
                                        $(_input).before(task_inner);
                                        $("#"+result).find("a").text(subTitle);
                                        $(_input).val("");
                                    }
                                });
                            }
                        });
                    } else {
                        // 防止重复创建
                        if ($(_this).find("ul").siblings().find("input").not("[type='checkbox']").length == 0){
                            $(_this).find("ul").siblings().append("<input placeholder='添加子任务' class='no-border no-outline' type='text'>");
                            $(_this).find("ul").siblings().find("input").not("[type='checkbox']").on("keypress", function(e){
                                pid = $(_this).attr("id");
                                subTitle = $(this).val();
                                var _input = $(this);
                                var task_inner = '<input type="checkbox"><a href="javascript:void(null)"></a>' +
                                        '</div>';
                                if (e.keyCode == 13) {
                                    $.ajax({
                                        type : "POST",
                                        url : "${ctx}/task/create/${project.id}",
                                        data : {title : subTitle, description : "", parentId : pid},
                                        success : function(result){
                                            window.PARENTID = result;
                                            task_inner = '<div id="'+result +'">' + task_inner;
                                            $(_input).before(task_inner);
                                            $("#"+result).find("a").text(subTitle);
                                            $(_input).val("");
                                        }
                                    });
                                }
                            });
                        }
                    }

                });
            });
        }

        addSubTask();
    });
</script>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>创建一个新项目</title>
</head>
<body>
<div class="row">
    <div class="col-md-10 col-md-push-1">
        <div class="form-container">
            <h3>创建新项目</h3>
            <form role="form">
                <section>
                    <div class="form-group">
                        <label class="sr-only" for="projectName">项目名称</label>
                        <input type="text" class="form-control" id="projectName" placeholder="项目名称">
                    </div>
                    <div class="form-group">
                        <label class="sr-only" for="projectIntro">项目描述</label>
                        <textarea name="projectIntro" id="projectIntro" class="form-control" cols="30" rows="10" placeholder="简要介绍项目"></textarea>
                    </div>
                </section>
                <section>
                    <h4>指定项目成员</h4>
                    <p class="text-muted">只有项目成员才能访问该项目的信息。你可以通过项目设置，随时调整成员列表</p>

                    <div class="row">
                        <div class="col-md-9">
                            <select name="selectUsers" id="selectUsers" class="form-control">
                                <option value="-1">选择成员</option>
                            <c:forEach items="${userList}" var="user">
                                <option value="${user.id}">${user.name}</option>
                            </c:forEach>
                            </select>
                        </div>
                        <div class="col-md-3">
                            <a href="javascript:void(null);" class="btn btn-default">所有人</a>
                        </div>
                        <div class="users" id="users">

                        </div>
                    </div>
                </section>
            </form>
            <%--<section>--%>
                <%--<button type="submit" class="btn btn-primary">创建</button>--%>
            <%--</section>--%>
        </div>
    </div>
</div>
<script>
    $(function(){
        var doms = [];
        $("#selectUsers").change(function(){
            var current_id, current_text, current_dom;

            $(this).find("option:selected").each(function(){
                current_id = $(this).val();
                current_text = $(this).text();
            });

            current_dom = "user-"+current_id;


            <%--if (current_id){--%>
                <%----%>
                <%--$("#users").append("<div class='col-md-1 user-"+current_id+"'><img src='${ctx}/static/images/example/3.jpg' class='img-circle user-head-m center-block' /><h5 class='text-center'>"+current_text+"</h5> <a href='javascript:void(null)' class='label label-default text-center center-block'> <span class='glyphicon glyphicon-trash'></span>删除</a></div>");--%>
            <%--}--%>
            if ($("#users").children().length <= 0){
                $("#users").append("<div class='col-md-1 user-"+current_id+"'><img src='${ctx}/static/images/example/3.jpg' class='img-circle user-head-m center-block' /><h5 class='text-center'>"+current_text+"</h5> <a href='javascript:void(null)' class='label label-default text-center center-block'> <span class='glyphicon glyphicon-trash'></span>删除</a></div>");
            } else {
                $("#users").children().each(function(index, elem){
                    if ($(elem).hasClass(current_dom) == false){
                        $("#users").append("<div class='col-md-1 user-"+current_id+"'><img src='${ctx}/static/images/example/3.jpg' class='img-circle user-head-m center-block' /><h5 class='text-center'>"+current_text+"</h5> <a href='javascript:void(null)' class='label label-default text-center center-block'> <span class='glyphicon glyphicon-trash'></span>删除</a></div>");
                    }
                });
            }

        });
    });
</script>
</body>
</html>
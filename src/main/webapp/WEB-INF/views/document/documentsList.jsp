<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>文档列表</title>
    <style>
        .document-container h4 > a{
            color: #ffffff
        }
        .document-container .panel-body a{
            text-decoration: none;
        }
        .modify-btn{
            line-height: 1.2em;
        }
    </style>
</head>
<body>
<div class="container">
    <section>
        <div class="row">
            <div class="col-md-6"><h4 class="pull-left"><span class="glyphicon glyphicon-th-list"></span> 所有文档</h4></div>
            <div class="col-md-6">
                <div class="btn-group pull-right">
                    <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown">
                        <span class="glyphicon glyphicon-file"></span>  新建文档 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#" id="createMarkDownBtn">MarkDown文档</a></li>
                        <li class="divider"></li>
                        <li><a href="#" id="createRichTextBtn">富文本文档</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </section>

    <div class="row">
        <c:forEach items="${documentPage.content}" var="document">
            <div class="col-md-4 document-list">
                <input type="hidden" value="${document.id}"/>
                <input type="hidden" value="${document.type}"/>
                <div class="panel panel-primary">
                    <div class="panel-heading"><h4 class="text-center"><a href="${ctx}/documents/details/${projectId}/${document.id}">${document.title}</a></h4></div>
                    <div class="panel-body"><p><a href="${ctx}/documents/details/${projectId}/${document.id}" class="text-muted">${document.description}</a></p></div>
                    <div class="panel-footer">
                        <small class="text-muted">${document.author.name}于${document.createTime}添加</small>
                        <a href="javascript:void(null)" class="btn btn-sm btn-info pull-right modify-btn"><span class="glyphicon glyphicon-pencil"></span> 修改</a>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <div>
        <c:if test="${fn:length(documentPage.content) > 0}">
            <tags:pagination page="${documentPage}" paginationSize="12"/>
        </c:if>
    </div>
</div>
<script>
    $(function(){
        $("#createMarkDownBtn").click(function(){
            window.location.href="${ctx}/documents/createForm/${projectId}";
        });
        $("#createRichTextBtn").click(function(){
            window.location.href="${ctx}/documents/createRichText/${projectId}";
        });

        $('.document-list').each(function(){
            var id = $(this).find('input[type="hidden"]').first().val();
            var type = $(this).find('input[type="hidden"]').last().val();
            $(this).find('.modify-btn').click(function(){
                if (type == 1){
                    window.location.href="${ctx}/documents/update/"+id;
                } else if (type == 2){
                    window.location.href="${ctx}/documents/updateRichText/"+id;
                }
            });
        });
    });
</script>
</body>
</html>
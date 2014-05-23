<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title></title>
    <style>
        thead tr th{
            text-align: center;
        }
    </style>
</head>
<body>
<div class="row">
    <div class="col-md-6"><textarea class="form-control" name="markdown" id="markdown" cols="30" rows="10"></textarea></div>
    <div class="col-md-6"><div class="well" id="result"></div></div>
</div>

<button class="btn btn-default" id="convert-btn">Convert</button>
<button class="btn btn-default" id="full-btn">全屏</button>
<button class="btn btn-default" id="esc-btn">恢复</button>

<script type="text/javascript">
    <%--$("#convert-btn").click(function(){--%>
        <%--var txt = $("#markdown").val();--%>
        <%--$.ajax({--%>
            <%--type: 'POST',--%>
            <%--url : '${ctx}/markdown/convert',--%>
            <%--data: {str : txt},--%>
            <%--success : function(rt){--%>
                <%--$("#result").append(rt);--%>
                <%--$("table").addClass("table").addClass("table-bordered");--%>
            <%--}--%>

        <%--});--%>
    <%--});--%>
    var txt;
    $("textarea").keyup(function(){
        txt = $("#markdown").val();
        $.ajax({
            type: 'POST',
            url : '${ctx}/markdown/convert',
            data: {str : txt},
            success : function(rt){
                $("#result").html(rt);
                $("table").addClass("table").addClass("table-bordered");
            }

        });
    });
    var currentWidth = $(".container").width();
    $("#full-btn").click(function(){
        $(".container").animate({
            width: '100%'
        });
    });
    $("#esc-btn").click(function(){
        $(".container").animate({
            width: currentWidth+30
        });
    });
</script>
</body>
</html>

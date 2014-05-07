<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title></title>
</head>
<body>
    <div class="container">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h3><a href="${ctx}/project/index">项目名称</a></h3>
            </div>
            <div class="panel-body">
                <div class="page-header">
                    <h4>需求文档标题</h4>
                </div>

                <p id="text-input" class="hidden">** 亲爱的，那是一个阳光明媚的日子——至少从地理意义上来说是的。 **

                    21岁的红河青年杨和良，心情特别惆怅。因为心爱的女朋友就要去远方了，远方是那如梦更如诗般美丽的丽江。从人满为患的昆明火车站出发，去丽江的K9614次列车的开车时间是22点35分。热恋中的这对小情侣，正抓紧这最后的分分秒秒，在密集的候车室里，说着那似乎永远说不完的情话。可万万没想到，生离还没有开始，死别已经悄然拉开序幕。 </p>
                <div class="well" id="preview"></div>
                <hr/>
                <strong>您可以将文档发送给：</strong>
                <p>

                </p>
                <ul>
                    <li><a href="#">项目参与人员</a> <small>被邀请的人员可以和您一起协作完成任务</small></li>
                    <li><a href="#">非项目参与人员</a> <small>被邀请的人只能看到此文档</small></li>
                </ul>
                <button class="btn btn-default btn-success btn-md post-btn"> 提 交 </button>
            </div>
            <div class="panel-footer"></div>
        </div>

        <script src="${ctx}/static/markdown/markdown.min.js"></script>
    </div>
    <script>
        $(function(){
            var content = markdown.toHTML($("#text-input").text());
            console.log(content);
            $("#preview").html(content);
        });
    </script>
</body>
</html>
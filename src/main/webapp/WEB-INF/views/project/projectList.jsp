<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>项目列表</title>
    <link href="${ctx}/static/bootstrap/3.0.3/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
    <script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>
    <script>
        $(function(){

        });
    </script>
    <style>
        .col-md-2{
            /*margin-left: 15px;*/
        }
        .navbar-collapse{
            padding: 0;
        }
        .project-list > div{
            margin-right: 15px;
            padding: 10px;
        }
        .project-list > div:last-child{
            margin-right: -30px;
        }
        .project-list > div img{
            height: 50px;
        }
        .project-list > div a {
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="collapse navbar-collapse" id="bs-navbar-collapse-1">
            <nav class="navbar navbar-default">
                <ul class="nav navbar-nav">
                    <li><a href="${ctx}/project/list">项目列表</a></li>
                    <li><a href="#">日程</a></li>
                    <li><a href="#">浏览</a></li>
                    <li><a href="#">时间轴</a></li>
                    <li><a href="#">用户管理</a></li>
                    <li><a href="#">个人中心</a></li>
                </ul>
            </nav>
        </div>
    </div>

    <div class="container">
        <div class="row">
            <div class="col-md-2">
                <button class="btn btn-default btn-lg">
                    <span class="glyphicon glyphicon-plus"></span> 新建项目
                </button>
                <a href="#" class="center-block">从模板创建新项目</a>
            </div>
            <div class="col-md-10">
                <div class="row project-list">
                    <div class="col-md-4 well">
                        <a href="${ctx}/project/index"><h3>项目名称</h3></a>
                        <em>项目子标题</em>
                        <small class="center-block">2014年5月4日创建</small>
                        <a href="${ctx}/project/index">
                            <p class="text-muted">拥有5.3亿的市场，足以承载任何一种战略，不管是搜索引擎还是电子商务或者社交网络，中国高速增长的移动搜索用户使用者，为阿里或者阿里以外的其他企业做搜索奠定了坚实的基础。换句话说，阿里巴巴进入移动搜索市场，除了自身的努力之外，市场的高速发展也会为其加分，起到事半功倍的效果。</p>
                        </a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/08-023618_517.jpg" alt="张三"/></a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/2.jpeg" alt="李四"/></a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/3.jpg" alt="王五"/></a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/4.jpg" alt="赵六"/></a>
                    </div>
                    <div class="col-md-4 well">
                        <a href="${ctx}/project/index"><h3>项目名称</h3></a>
                        <em>项目子标题</em>
                        <small class="center-block">2014年5月4日创建</small>
                        <a href="${ctx}/project/index">
                            <p class="text-muted">拥有5.3亿的市场，足以承载任何一种战略，不管是搜索引擎还是电子商务或者社交网络，中国高速增长的移动搜索用户使用者，为阿里或者阿里以外的其他企业做搜索奠定了坚实的基础。换句话说，阿里巴巴进入移动搜索市场，除了自身的努力之外，市场的高速发展也会为其加分，起到事半功倍的效果。</p>
                        </a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/08-023618_517.jpg" alt="张三"/></a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/2.jpeg" alt="李四"/></a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/3.jpg" alt="王五"/></a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/4.jpg" alt="赵六"/></a>
                    </div>
                    <div class="col-md-4 well">
                        <a href="${ctx}/project/index"><h3>项目名称</h3></a>
                        <em>项目子标题</em>
                        <small class="center-block">2014年5月4日创建</small>
                        <a href="${ctx}/project/index">
                            <p class="text-muted">拥有5.3亿的市场，足以承载任何一种战略，不管是搜索引擎还是电子商务或者社交网络，中国高速增长的移动搜索用户使用者，为阿里或者阿里以外的其他企业做搜索奠定了坚实的基础。换句话说，阿里巴巴进入移动搜索市场，除了自身的努力之外，市场的高速发展也会为其加分，起到事半功倍的效果。</p>
                        </a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/08-023618_517.jpg" alt="张三"/></a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/2.jpeg" alt="李四"/></a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/3.jpg" alt="王五"/></a>
                        <a href="#"><img class="img-circle" src="${ctx}/static/images/example/4.jpg" alt="赵六"/></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
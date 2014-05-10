<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>项目主页</title>
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
        .list-unstyled{
            padding-left: 15px;
        }
        .list-unstyled > li {
            margin: 10px 0;
        }
        .list-unstyled > li > b{
            padding-right: 10px;
        }
        section{
            margin-bottom: 25px;
        }
        .discuss-btn{
            margin-left: 20px;
        }
        .user-head{
            height: 32px;
        }
        .table tbody tr td{
            line-height: 2.5em;
        }
        .discuss-content:before{
            content: ' - ';
        }
        header{
            margin-bottom: 20px;
        }
        .todo-table > tbody > tr >td:first-child{
            padding-left: 20px;
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
                    <li><a href="${ctx}/files/index">文件</a></li>
                    <li><a href="${ctx}/documents/list">文档</a></li>
                    <%--<li><a href="#">事件</a></li>--%>
                </ul>
                <hr/>
            </div>

            <div class="panel-body">
                <section>
                    <h4><a href="#" class="text-danger">最近更新</a></h4>
                    <ul class="list-unstyled">
                        <li><b>2013年5月05日</b> 1923416@qq.com创建了一个文档：<a href="#"> <span>XXX需求文档</span></a></li>
                        <li><b>2013年5月08日</b> 张三设置了任务截止日期为2013年06月30日：<a href="#">公文管理移动开发</a></li>
                        <li><b>2013年5月08日</b> 张三分配了一条任务给李四：<a href="#">公文管理移动开发</a></li>
                    </ul>
                </section>
                <section>
                    <header>
                        <h4><a href="#" class="text-danger">讨论</a><button class="btn btn-default btn-sm discuss-btn"><span class="glyphicon glyphicon-edit"></span> 发布一条讨论</button></h4>
                    </header>
                    <table class="table discuss-table">
                        <tr>
                            <td><img src="${ctx}/static/images/example/08-023618_517.jpg" alt="user head" class="img-circle user-head"/></td>
                            <td><span class="text-muted">张三</span></td>
                            <td>
                                <div class="pull-right">
                                    <img src="${ctx}/static/images/example/word.png" alt="word" class="img-rounded" style="height: 32px;"/>
                                </div>
                                <a href="#"><b>关于公文管理移动开发的几点疑问？</b><span class="text-muted discuss-content">公文管理开发的时间节点。</span></a>
                            </td>
                            <td><span class="text-muted">5月20日</span></td>
                            <td><span class="badge">42</span></td>
                        </tr>
                        <tr>
                            <td><img src="${ctx}/static/images/example/08-023618_517.jpg" alt="user head" class="img-circle user-head"/></td>
                            <td><span class="text-muted">李四</span></td>
                            <td>
                                <b>关于公文管理移动开发的几点疑问？</b><span class="text-muted discuss-content">公文管理开发的时间节点。</span>
                            </td>
                            <td><span class="text-muted">5月20日</span></td>
                            <td><span class="badge">42</span></td>
                        </tr>
                    </table>
                </section>
                <section>
                    <header>
                        <h4><a href="#" class="text-danger">To-do lists</a><button class="btn btn-default btn-sm discuss-btn"><span class="glyphicon glyphicon-plus"></span> 新建 to-do list</button></h4>
                    </header>
                    <table class="table todo-table">
                        <thead>
                            <h5><a href="#"><b>公文管理开发任务</b></a></h5>
                        </thead>
                        <tbody>
                            <tr>
                                <td><input type="checkbox"/></td>
                                <td>
                                    <b>关于公文管理移动开发的几点疑问？</b><span class="badge">分配给：张三，5月20日完成</span>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"/></td>
                                <td>
                                    <b>关于公文管理移动开发的几点疑问？</b><span class="badge">分配给：张三，5月20日完成</span>
                                </td>
                            </tr>
                        <tr>
                            <td colspan="2"><a href="#">新建一条to-do</a></td>
                        </tr>
                        </tbody>
                    </table>
                    <table class="table todo-table">
                        <thead>
                        <h5><a href="#"><b>日程管理开发任务</b></a></h5>
                        </thead>
                        <tbody>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>
                                <b>关于公文管理移动开发的几点疑问？</b><span class="badge">分配给：张三，5月20日完成</span>
                            </td>
                        </tr>
                        <tr>
                            <td><input type="checkbox"/></td>
                            <td>
                                <b>关于公文管理移动开发的几点疑问？</b><span class="badge">分配给：张三，5月20日完成</span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2"><a href="#">新建一条to-do</a></td>
                        </tr>
                        </tbody>
                    </table>
                    <a href="#">一条已完成</a>
                </section>
                <section>
                    <header>
                        <h4><a href="#" class="text-danger">文件</a><button class="btn btn-default btn-sm discuss-btn"><span class="glyphicon glyphicon-plus"></span> 添加新文件</button></h4>
                    </header>
                    <div class="row">
                        <div class="div-bordered">
                            <a href="#"><img src="${ctx}/static/images/example/word.png" alt="word" class="img-rounded center-block file-icon"></a>
                            <b class="center-block align-center">这个是上传的文件.doc</b>
                            <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                            <a href="#" class="center-block text-center"><span class="badge">42 条回复</span></a>
                            <span class="label label-info text-center">New</span>
                            <span class="label label-info text-center">圣诞狗</span>
                            <a href="#"><span class="label label-warning">添加新标签</span></a>
                        </div>
                        <div class="div-bordered">
                            <a href="#"><img src="${ctx}/static/images/example/ppt.png" alt="ppt" class="img-rounded center-block file-icon"></a>
                            <b class="center-block align-center">这个是上传的文件.doc</b>
                            <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                            <a href="#" class="center-block text-center"><span class="badge">42 条回复</span></a>
                            <span class="label label-info">New</span>
                            <span class="label label-info">圣诞狗</span>
                            <a href="#"><span class="label label-warning">添加新标签</span></a>
                        </div>
                        <div class="div-bordered">
                            <a href="#"><img src="${ctx}/static/images/example/excel.png" alt="excel" class="img-rounded center-block file-icon"></a>
                            <b class="center-block align-center">这个是上传的文件.doc</b>
                            <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                            <a href="#" class="center-block text-center"><span class="badge">42 条回复</span></a>
                            <span class="label label-info">New</span>
                            <span class="label label-info">圣诞狗</span>
                            <a href="#"><span class="label label-warning">添加新标签</span></a>
                        </div>
                        <div class="div-bordered">
                            <a href="#"><img src="${ctx}/static/images/example/folder.png" alt="folder" class="img-rounded center-block file-icon"></a>
                            <b class="center-block align-center">这个是上传的文件.doc</b>
                            <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                            <a href="#" class="center-block text-center"><span class="badge">42 条回复</span></a>
                            <span class="label label-info">New</span>
                            <span class="label label-info">圣诞狗</span>
                            <a href="#"><span class="label label-warning">添加新标签</span></a>
                        </div>
                        <div class="div-bordered">
                            <a href="#"><img src="${ctx}/static/images/example/rar.png" alt="rar" class="img-rounded center-block file-icon"></a>
                            <b class="center-block align-center">这个是上传的文件.doc</b>
                            <small class="text-muted center-block align-center">张三于2014年5月05日添加</small>
                            <a href="#" class="center-block text-center"><span class="badge">42 条回复</span></a>
                            <span class="label label-info">New</span>
                            <span class="label label-info">圣诞狗</span>
                            <a href="#"><span class="label label-warning">添加新标签</span></a>
                        </div>
                    </div>
                </section>
                <section>
                    <header>
                        <h4><a href="#" class="text-danger">文档</a><button class="btn btn-default btn-sm discuss-btn"><span class="glyphicon glyphicon-plus"></span> 添加新文档</button></h4>
                    </header>
                </section>
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
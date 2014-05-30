<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <title>新建讨论内容</title>
    <%--<script src="${ctx}/static/jquery/jquery-1.9.1.min.js"></script>--%>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.config.js"></script>
    <script type="text/javascript" src="${ctx}/static/ueditor/ueditor.all.min.js"></script>
    <link rel="stylesheet" href="${ctx}/static/webuploader/webuploader.css"/>
    <script type="text/javascript" src="${ctx}/static/webuploader/webuploader.js"></script>
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
        <form action="${ctx}/discuss/c" method="post" id="discussForm">
            <div class="panel-body">
                <input type="text" name="title" class="form-control input-lg discuss-title" placeholder="输入标题 ..."/>
                <hr/>
                <div class="control-group" id="areaDiv">
                    <div class="controls">
                        <textarea id="myEditor" name="content"></textarea>
                    </div>
                </div>
                <hr/>
                <div id="uploader" class="file-container">
                    <div id="thelist" class="uploader-list"></div>
                    <div class="btns">
                        <div id="picker"><span class="glyphicon glyphicon-paperclip"></span> 上传附件 ...</div>
                    </div>
                </div>
                <hr/>
                <div class="center-block">
                    <strong>您可以邀请其他人来参与：</strong>
                    <ul>
                        <li><a href="#">邀请项目参与人员</a> <small>被邀请的人员可以和您一起协作完成任务</small></li>
                        <li><a href="#">邀请非项目参与人员</a> <small>被邀请的人只能看到此讨论信息</small></li>
                    </ul>
                </div>
                <button class="btn btn-default btn-success btn-md post-btn"> 提 交 </button>
            </div>
        </form>
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

    var uploader = WebUploader.create({

        auto: true,
        // swf文件路径
        swf: '${ctx}/static/webuploader/Uploader.swf',

        // 文件接收服务端。
        server: '${ctx}/discuss/upload',

        // 选择文件的按钮。可选。
        // 内部根据当前运行是创建，可能是input元素，也可能是flash.
        pick: '#picker',

        // 不压缩image, 默认如果是jpeg，文件上传前会压缩一把再上传！
        resize: false
    });

    // 当有文件被添加进队列的时候
    uploader.on( 'fileQueued', function( file ) {
        $("#thelist").append( '<div id="' + file.id + '" class="item">' +
                '<h4 class="info">' + file.name + '</h4>' +
                '<p class="state">等待上传...</p>' +
                '</div>' );
    });

    // 文件上传过程中创建进度条实时显示。
    uploader.on( 'uploadProgress', function( file, percentage ) {
        var $li = $( '#'+file.id ),
                $percent = $li.find('.progress .progress-bar');

        // 避免重复创建
        if ( !$percent.length ) {
            $percent = $('<div class="progress progress-striped active">' +
                    '<div class="progress-bar" role="progressbar" style="width: 0%">' +
                    '</div>' +
                    '</div>').appendTo( $li ).find('.progress-bar');
        }

        $li.find('p.state').text('上传中');

        $percent.css( 'width', percentage * 100 + '%' );
    });

    uploader.on( 'uploadAccept', function( file, response ) {
        // 通过response._raw拿到上传的文件
        console.log(response._raw);
        $("#discussForm").append('<input type="hidden" name="fileName" value="' + response._raw +'" />');
    });

    uploader.on( 'uploadSuccess', function( file ) {
        console.log(file.id);
        $( '#'+file.id ).find('p.state').text('已上传');
        $( '#'+file.id).find('div.progress').remove();
    });

    uploader.on( 'uploadError', function( file ) {
        $( '#'+file.id ).find('p.state').text('上传出错');
    });
</script>
</body>
</html>
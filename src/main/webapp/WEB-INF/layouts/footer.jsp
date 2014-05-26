<%@ page language="java" pageEncoding="UTF-8" %>
<div id="footer">
    <div class="row">
        <div class="col-md-8 col-md-push-2">
            <div class="row">
                <div class="col-md-4">
                    <img src="${ctx}/static/images/Logo-gray.png" alt="项目管理系统"/>
                    <p>Copyright &copy; 2005-2012</p>
                </div>
                <div class="col-md-4">
                    <div class="footer-navigation">
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="${ctx}/p/index">个人中心</a></li>
                            <li><a href="${ctx}/project/list">项目列表</a></li>
                            <li><a href="#">用户管理</a></li>
                        </ul>
                        <ul class="nav nav-pills nav-stacked">
                            <li><a href="#">日程</a></li>
                            <li><a href="#">浏览</a></li>
                            <li><a href="#">时间轴</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-4 col-md-push-1">
                    <p>关注我们</p>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function positionFooter(){
        var client_height = document.documentElement.clientHeight;
        var container_height = document.getElementById("container").clientHeight;
        var header_height = document.getElementById("header").offsetHeight;
        var footer_height = document.getElementById("footer").offsetHeight;
        if ((container_height+header_height+footer_height) < client_height){
            $("#footer").css('position', 'absolute').css('top', client_height - footer_height).css('width', '100%').css('right', '0').css('left', '0');
        }
    }
    $(function(){
        positionFooter();
    });
</script>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh-cn">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    

    <title>图书管理系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Timeline CSS -->
    <link href="../dist/css/timeline.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Morris Charts CSS -->
    <link href="../bower_components/morrisjs/morris.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    
     <!--网站 或者 触摸屏 图标：开始-->
        <link rel="shortcut icon" href="../images/FaviconIcons/favicon.png">
        <link rel="apple-touch-icon-precomposed" sizes="144*144" href="/images/FaviconIcons/apple-touch-icon-144-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="114*114" href="/images/FaviconIcons/apple-touch-icon-114-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="72*72" href="/images/FaviconIcons/apple-touch-icon-72-precomposed.png">
        <link rel="apple-touch-icon-precomposed" sizes="57*57" href="/images/FaviconIcons/apple-touch-icon-57-precomposed.png">
        <!--网站 或者 触摸屏 图标：结束-->

</head>

<body>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="javascript:location.reload();"><span class="fa fa-home"></span>图书管理系统</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
            	<li>
                	<a href="javascript:logout();">
                		<div>
                			<i class="fa fa-power-off fa-fw"></i>
                		</div>
                	</a>
                </li>
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <form action="/book/book!list.action">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" name="search_LIKE_bname" placeholder="请输入图书名字...">
                                <span class="input-group-btn">
                                <button class="btn btn-default" type="submit">
                                    <i class="fa fa-search"></i>
                                </button>
                            </span>
                            </div>
                            </form>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="/admin!list.action"><i class="fa fa-dashboard fa-fw"></i> 控制台</a>
                        </li>
                        <li>
                        	<a href="/book/book!list.action"><em class="fa fa-book"></em> 图书查询</a>
                        </li>
                        <li>
                            <a href="/record/record!list.action"><i class="fa fa-table fa-fw"></i> 个人资料</a>
                        </li>
                        <li>
                        	<a href="/user/user!view.action"><i class="fa fa-table fa-fw"></i>个人设置</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
		
        <div id="page-wrapper">
            <div class="row">
                <div class="col-lg-12">
                    	<h1 class="page-header">控制台</h1>
			</div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><span class="fa fa-edit"></span></div>
                                    <div>续借图书</div>
                                </div>
                            </div>
                        </div>
                        <a href="/record/record!list.action">
                            <div class="panel-footer">
                                <span class="pull-left">查看可续借图书</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><span class="fa fa-edit"></span></div>
                                    <div>修改密码</div>
                                </div>
                            </div>
                        </div>
                        <a href="javascript:_changePSW()">
                            <div class="panel-footer">
                                <span class="pull-left">点击修改密码</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><span class="fa fa-edit"></span></div>
                                    <div>查看欠费情况</div>
                                </div>
                            </div>
                        </div>
                        <a href="javascript:_watchState();">
                            <div class="panel-footer">
                                <span class="pull-left">点击查看欠费情况</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-xs-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-xs-9 text-right">
                                    <div class="huge"><span class="fa fa-edit"></span></div>
                                    <div>查阅图书</div>
                                </div>
                            </div>
                        </div>
                        <a href="/book/book!list.action">
                            <div class="panel-footer">
                                <span class="pull-left">点击查阅图书</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->
	<script type="text/javascript">
		function _watchState() {
			var state = '${user.violate}';
			if(state==0){
				layer.alert('没欠钱，你想给我钱吗？', {
					  skin: 'layui-layer-molv' //样式类名
					  ,closeBtn: 0
					  ,shift: 4
					});
			}else{
				$.ajax({
	    			 url : '/record/record!getmoney.action',
	    			 success : function (data) {
	    				 layer.alert('你现在一共欠'+data+'元，快快还钱', {
	   					  skin: 'layui-layer-lan' //样式类名
	   					  ,closeBtn: 0
	   					});
					}
	    		 });
			}
			
		}
		
		
		
		//修改密码
		function _changePSW() {
			var type = type;
			var _title = "改密码";
			var _area = ['50%','40%'];
			var _path = "../user/user!beforchange.action";
			var index ;
			index = top.layer.open({
				type : 2,
				title : _title,
				shadeClose : false,
				shade : 0.2,
				maxmin : true,
				area : _area,
				content : [ _path,'yes'],//iframe的url , no代表不显示滚动条
				btn : ['确定', '取消'],
				yes: function(index,layero) {//确定之后的函数
					var _body = top.layer.getChildFrame('body' ,index);
					var _form = _body.find('#changeform');
					var isok = $(_form).validate({
						//这里是加验证的
					}).form();
					if(isok){
						$.ajax({
							type:"POST",
							dataType:"text",
							url:"../user/user!changePSW.action",
							data : _form.serialize(),
							success:function(data){
								if(data=="success"){
									top.layer.msg("用户修改密码成功",{time:500},function(){
										top.layer.close(index);
									});
								}else{
									top.layer.msg("用户修改密码失败",{time:500});
								}
							},
							error : function(data){
								alert("error"+data.responseText);
							}
						});
					}else{
						//阻止关闭
						top.layer.close(index);
					};
				},
				btn2 : function(index){
					//这是btn2的
				}
			});

		}
		
	</script>


    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    
    <!-- layer javaScript -->
    <script src="/bower_components/layer/layer.js" ></script>
    
    <!-- 个性化js -->
    <script type="text/javascript" src="/js/admin.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    
    <!-- jquery验证 -->
    <script src="/bower_components/jquery-validation-1.15.0/dist/jquery.validate.min.js"></script>
</body>

</html>

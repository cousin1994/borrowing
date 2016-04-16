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
            		<h5>欢迎登录</h5>
            	</li>
                <!-- 消息按钮，跳到消息窗口 -->
                <li>
                	<a href="#">
                		<div>
                			<i class="fa fa-bell fa-fw"></i>
                		</div>
                	</a>
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> 个人资料</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> 个人设置</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="javascript:logout();"><i class="fa fa-sign-out fa-fw"></i> 退出登录</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
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
                            <a href="javascript:location.reload();"><i class="fa fa-dashboard fa-fw"></i> 控制台</a>
                        </li>
                        <li><a href="#"><em class="fa fa-book"></em> 图书管理<span class="fa arrow"></span></a>
                          <ul class="nav nav-second-level">
                                <li>
                                    <a href="flot.html">修改图书状态</a>
                                </li>
                                <li>
                                    <a href="/book/book!list.action">查看图书信息</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="/user/user!list.action"><i class="fa fa-table fa-fw"></i> 用户管理</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-edit fa-fw"></i> 图书查询<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                            	<li>
                                	<a href="#">已经借出的图书</a>
                                </li>
                                <li>
                                	<a href="#">在库的图书</a>
                                </li>
                                <li>
                                	<a href="#">今天借出的图书</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                        	<a href="#">系统设置</a>
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>
		
        <div id="page-wrapper">
		<div id="myAlert" class="alert alert-danger col-lg-offset-9 col-lg-3 fade in">
			   	<a href="#" class="close" data-dismiss="alert">&times;</a>
			   	有 <a href="javascript:logout();"><strong>12条！</strong></a>未读消息。
         </div> 
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
                                    <div>新增图书</div>
                                </div>
                            </div>
                        </div>
                        <a href="javascript:_add(0)">
                            <div class="panel-footer">
                                <span class="pull-left">点击新增</span>
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
                                    <div>新增用户</div>
                                </div>
                            </div>
                        </div>
                        <a href="javascript:_adduser(0)">
                            <div class="panel-footer">
                                <span class="pull-left">点击新增</span>
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
                                    <div>借阅图书</div>
                                </div>
                            </div>
                        </div>
                        <a href="javascript:_newrecord()">
                            <div class="panel-footer">
                                <span class="pull-left">点击新增记录</span>
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
                                    <div>归还图书</div>
                                </div>
                            </div>
                        </div>
                        <a href="javascript:_revert()">
                            <div class="panel-footer">
                                <span class="pull-left">点击归还图书</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-8">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bar-chart-o fa-fw"></i> 图书馆进馆人数
                            <div class="pull-right">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default btn-xs dropdown-toggle" data-toggle="dropdown">
                                        横坐标
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu pull-right" role="menu">
                                        <li><a href="#">按小时为横坐标</a>
                                        </li>
                                        <li><a href="#">按日为横坐标</a>
                                        </li>
                                        <li><a href="#">按月为横坐标</a>
                                        </li>
                                        <li><a href="#">按读者种类每星期为横坐标</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div id="morris-area-chart"></div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-8 -->
                <div class="col-lg-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <i class="fa fa-bell fa-fw"></i> 消息通知表
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="list-group">
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-comment fa-fw"></i>新消息通知
                                    <span class="pull-right text-muted small"><em>4 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-book fa-fw"></i> 新图书变化通知
                                    <span class="pull-right text-muted small"><em>12 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-user fa-fw"></i> 新读者变化通知
                                    <span class="pull-right text-muted small"><em>27 minutes ago</em>
                                    </span>
                                </a>
                                <a href="#" class="list-group-item">
                                    <i class="fa fa-tasks fa-fw"></i> 今天新的计划安排
                                    <span class="pull-right text-muted small"><em>43 minutes ago</em>
                                    </span>
                                </a>
                            </div>
                            <!-- /.list-group -->
                            <a href="#" class="btn btn-default btn-block">查看详细的消息页面</a>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-4 -->
            </div>
            <!-- /.row -->
        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Morris Charts JavaScript -->
    <script src="../bower_components/raphael/raphael-min.js"></script>
    <script src="../bower_components/morrisjs/morris.min.js"></script>
    <script src="../js/morris-data.js"></script>
    
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

<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="zh-CN">
	<head>
    	<!-- 开始：meta -->
        <meta charset="utf-8"><!-- 标注为utf-8编码 -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge"><!-- 表示对IE最新的渲染 -->
        <meta name="viewport" content="width=device-width, initial-scale=1"><!-- 表示对移动设备等进行响应式设计，可以动态的设计 -->
        <meta name="description" content="这是一个图书借阅系统，也只是一个练手的毕业设计而已">
        <!-- 结束：meta -->
        
        <!-- 开始：CSS -->
        <link rel="stylesheet" href="../bower_components/bootstrap/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="../bower_components/font-awesome/css/font-awesome.min.css">
        <link rel="stylesheet" href="../css/googleapis.css">
        <link rel="stylesheet" href="../css/form-elements.css">
        <link rel="stylesheet" href="../css/login.css">
		<!-- 结束：CSS -->

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

        <title>图书借阅系统登录界面</title>
    </head>
	<body>
	<input type="hidden"  name="msg" id="msg" value="${msg}">
    <!-- 顶端目录 -->
    <div class="top-content" >
    	<div class="inner-bg">
        	<div class="container">
            	<div class="row">
                </div>
                <div class="row">
                	<div class="col-sm-6 col-sm-offset-3 form-box col-md-offset-3">
                    	<div class="form-top">
                        	<div class="form-top-left">
                            	<h3>欢迎进入图书管理系统</h3>
                                <p>请输入你的用户名和密码</p>
                            </div>
                            <div class="form-top-right">
                            <i class="glyphicon glyphicon-inbox"></i>
                            </div>
                        </div>
                        <div class="form-bottom">
                        	<form role="form" action="login!login" namespace="/" method="post" class="login-form">
                            	<div class="form-group">
                                	<label class="sr-only" for="form-username">Username</label>
                                    <input type="text" name="Code" placeholder="请输入用户名..." class="form-username form-control" id="form-username">
                                 </div>
                                 <div class="form-group">
                                 	<label class="sr-only" for="form-password">Password</label>
                                    <input type="password" name="password" placeholder="请输入密码..." class="form-password form-control" id="form-password">
                                 </div>
                                 <button type="submit" class="btn">登录</button>
                            </form>
                      	</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--js开始-->
    <script src="/js/jquery.min.js"></script>
    <script src="/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="/js/login.js"></script>
    <script src="/js/jquery.backstretch.min.js"></script>
    <script src="/bower_components/layer/layer.js" ></script>
    <!--js结束-->
    
    </body>
</html>
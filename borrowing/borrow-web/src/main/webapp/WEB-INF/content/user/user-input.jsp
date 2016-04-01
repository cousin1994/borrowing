<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta >
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>新增图书界面</title>

	<!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

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
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">新增用户</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <form role="form" id="bookinputform" action="user!save.action" namespace="/user">
                                    <input type="hidden" name="user.id" value="${user.id }">
                                        <div class="form-group">
                                        	<div class="input-group">
	                                        	<span class="input-group-addon">借阅证号</span>
	                                        	<s:textfield cssClass="form-control " type="text" id="user" name="user.code"></s:textfield>
                                        	</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">密码</span>
												<s:textfield cssClass="form-control" type="text" id="password" name="user.password"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">姓名</span>
												<s:textfield cssClass="form-control" type="text" id="name" name="user.name"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">身份证号码</span>
												<s:textfield cssClass="form-control" type="text" id="certify" name="user.certify"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">单位</span>
												<s:textfield cssClass="form-control" type="text" id="unit" name="user.unit"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">住址</span>
												<s:textfield cssClass="form-control" type="text" id="address" name="user.address"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">民族</span>
												<s:textfield cssClass="form-control" type="text" id="nation" name="user.nation" ></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">籍贯</span>
												<s:textfield cssClass="form-control" type="text" id="jg" name="user.jg"></s:textfield>
											</div>
                                        </div>
                                        <%-- <s:if test="#request.book.id !=null">
                                        <input type="hidden" name="booknumber" value="1">
                                        	<div class="form-group">
												<div class="input-group">
													<span class="input-group-addon">馆藏状态</span>
													<select class="form-control" name="book.isborrowed"> 
														<option value="0">在库</option>
														<option value="1">已预借</option>
														<option value="2">已借出</option>
													</select>
												</div>
	                                        </div>
                                        </s:if><s:else>
                                        <input name="book.isborrowed" type="hidden" value="0" >
	                                        <div class="form-group">
												<div class="input-group">
													<span class="input-group-addon">新增数量</span>
													<s:textfield cssClass="form-control" type="text" id="number" name="booknumber"></s:textfield>
												</div>
	                                        </div>
                                        </s:else> --%>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">邮编</span>
												<s:textfield cssClass="form-control" type="text" id="postcd" name="user.postcd"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">生日日期</span>
												<s:textfield cssClass="form-control" type="date" id="birthday" name="user.birthday"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">年龄</span>
												<s:textfield cssClass="form-control" type="text" id="age" name="user.age"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">email</span>
												<s:textfield cssClass="form-control" type="email" id="email" name="user.email"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">手机</span>
												<s:textfield cssClass="form-control" type="text" id="phone" name="user.phone"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">登录角色</span>
												<select class="form-control" name="user.role"> 
														<option value="0">超级管理员</option>
														<option value="1">系统管理员</option>
														<option value="2">读者</option>
													</select>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">备注</span>
												<s:textarea cssClass="form-control" type="text" id="remarks" name="user.remarks" rows="4"></s:textarea>
											</div>
                                        </div>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                            </div>
                            <!-- /.row (nested) -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
	</div> 
	<!-- /#wrapper -->
    <!-- jQuery -->
    <script src="../bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
</body>
</html>
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
                    <h1 class="page-header">新增图书</h1>
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
                                    <form role="form" action="book!save.action" namespace="/book">
                                        <div class="form-group">
                                        	<div class="input-group">
	                                        	<span class="input-group-addon">书本名字</span>
	                                        	<s:textfield cssClass="form-control" type="text" id="bookname" name="book.bname"></s:textfield>
                                        	</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">第一作者</span>
												<s:textfield cssClass="form-control" type="text" id="fauthor" name="book.fauthor"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">第二作者</span>
												<s:textfield cssClass="form-control" type="text" id="sauthor" name="book.sauthor"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">第三作者</span>
												<s:textfield cssClass="form-control" type="text" id="tauthor" name="book.tauthor"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">译者</span>
												<s:textfield cssClass="form-control" type="text" id="translator" name="book.translator"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">出版社</span>
												<s:textfield cssClass="form-control" type="text" id="publisher" name="book.publisher"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">出版日期</span>
												<s:textfield cssClass="form-control" type="date" id="publishdate" name="book.publishdate"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">类别</span>
												<s:textfield cssClass="form-control" type="text" id="type" name="book.type"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">新增数量</span>
												<s:textfield cssClass="form-control" type="text" id="number" name="booknumber"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">索书号</span>
												<s:textfield cssClass="form-control" type="text" id="ssh" name="book.ssh"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">条码号</span>
												<s:textfield cssClass="form-control" type="text" id="tmh" name="book.tmh"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">文献所属馆</span>
												<s:textfield cssClass="form-control" type="text" id="orglib" name="book.orglib"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">所在馆</span>
												<s:textfield cssClass="form-control" type="text" id="curlib" name="book.curlib"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">所在馆位置</span>
												<s:textfield cssClass="form-control" type="text" id="curlocal" name="book.curlocal"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">流通类型</span>
												<s:textfield cssClass="form-control" type="text" id="cirtype" name="book.cirtype"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">页数</span>
												<s:textfield cssClass="form-control" type="text" id="page" name="book.page"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">出版地</span>
												<s:textfield cssClass="form-control" type="text" id="publisherlocal" name="book.publisherlocal"></s:textfield>
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">是否有光盘</span>
												<span>       </span>
	                                              <input type="radio" name="book.cd" id="cd1" value="0" checked>是
	                                              <input type="radio" name="book.cd" id="cd2" value="1">否
											</div>
                                        </div>
                                        <div class="form-group">
											<div class="input-group">
												<span class="input-group-addon">简介</span>
												<s:textarea cssClass="form-control" type="text" id="intro" name="book.intro" rows="4"></s:textarea>
											</div>
                                        </div>
                                        <div class="form-group">
                                            <label>上传图片</label>
                                            <input type="file" >
                                        </div>
                                        <button type="submit" class="btn btn-default">Submit Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
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
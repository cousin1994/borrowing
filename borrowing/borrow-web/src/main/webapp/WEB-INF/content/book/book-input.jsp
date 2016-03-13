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
                                    <form role="form">
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
												<s:textfield cssClass="form-control" type="text" id="cd" name="book.cd"></s:textfield>
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
                                        <div class="form-group">
                                            <label>Text area</label>
                                            <textarea class="form-control" rows="3"></textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>Checkboxes</label>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Checkbox 1
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Checkbox 2
                                                </label>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox" value="">Checkbox 3
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Inline Checkboxes</label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox">1
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox">2
                                            </label>
                                            <label class="checkbox-inline">
                                                <input type="checkbox">3
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>Radio Buttons</label>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" checked>Radio 1
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios2" value="option2">Radio 2
                                                </label>
                                            </div>
                                            <div class="radio">
                                                <label>
                                                    <input type="radio" name="optionsRadios" id="optionsRadios3" value="option3">Radio 3
                                                </label>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>Inline Radio Buttons</label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline1" value="option1" checked>1
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline2" value="option2">2
                                            </label>
                                            <label class="radio-inline">
                                                <input type="radio" name="optionsRadiosInline" id="optionsRadiosInline3" value="option3">3
                                            </label>
                                        </div>
                                        <div class="form-group">
                                            <label>Selects</label>
                                            <select class="form-control">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label>Multiple Selects</label>
                                            <select multiple class="form-control">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                                <option>4</option>
                                                <option>5</option>
                                            </select>
                                        </div>
                                        <button type="submit" class="btn btn-default">Submit Button</button>
                                        <button type="reset" class="btn btn-default">Reset Button</button>
                                    </form>
                                </div>
                                <!-- /.col-lg-6 (nested) -->
                                <div class="col-lg-6">
                                    <!--<h1>Disabled Form States</h1>
                                     <form role="form">
                                        <fieldset disabled>
                                            <div class="form-group">
                                                <label for="disabledSelect">Disabled input</label>
                                                <input class="form-control" id="disabledInput" type="text" placeholder="Disabled input" disabled>
                                            </div>
                                            <div class="form-group">
                                                <label for="disabledSelect">Disabled select menu</label>
                                                <select id="disabledSelect" class="form-control">
                                                    <option>Disabled select</option>
                                                </select>
                                            </div>
                                            <div class="checkbox">
                                                <label>
                                                    <input type="checkbox">Disabled Checkbox
                                                </label>
                                            </div>
                                            <button type="submit" class="btn btn-primary">Disabled Button</button>
                                        </fieldset>
                                    </form>
                                    <h1>Form Validation States</h1>
                                    <form role="form">
                                        <div class="form-group has-success">
                                            <label class="control-label" for="inputSuccess">Input with success</label>
                                            <input type="text" class="form-control" id="inputSuccess">
                                        </div>
                                        <div class="form-group has-warning">
                                            <label class="control-label" for="inputWarning">Input with warning</label>
                                            <input type="text" class="form-control" id="inputWarning">
                                        </div>
                                        <div class="form-group has-error">
                                            <label class="control-label" for="inputError">Input with error</label>
                                            <input type="text" class="form-control" id="inputError">
                                        </div>
                                    </form>
                                    <h1>Input Groups</h1>
                                    <form role="form">
                                        <div class="form-group input-group">
                                            <span class="input-group-addon">@</span>
                                            <input type="text" class="form-control" placeholder="Username">
                                        </div>
                                        <div class="form-group input-group">
                                            <input type="text" class="form-control">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon"><i class="fa fa-eur"></i>
                                            </span>
                                            <input type="text" class="form-control" placeholder="Font Awesome Icon">
                                        </div>
                                        <div class="form-group input-group">
                                            <span class="input-group-addon">$</span>
                                            <input type="text" class="form-control">
                                            <span class="input-group-addon">.00</span>
                                        </div>
                                        <div class="form-group input-group">
                                            <input type="text" class="form-control">
                                            <span class="input-group-btn">
                                                <button class="btn btn-default" type="button"><i class="fa fa-search"></i>
                                                </button>
                                            </span>
                                        </div>
                                    </form> -->
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
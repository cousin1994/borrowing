<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="zh-cn">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>图书管理系统</title>

    <!-- Bootstrap Core CSS -->
    <link href="../bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="../bower_components/datatables-responsive/css/responsive.dataTables.css" rel="stylesheet">

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
	
</style>
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
                			<i class="fa fa-sign-out fa-fw"></i>
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
                            <a href="/user/user!list.action"><i class="fa fa-table fa-fw"></i> 个人资料</a>
                        </li>
                        <li>
                        	<a href="#">个人设置</a>
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
                    <h1 class="page-header">图书信息</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            图书信息
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                            <div class="dataTable_wrapper">
                                <table width="100%" class="table table-striped table-bordered table-hover" id="table">
                                    <thead>
                                        <tr>
                                            <th>图书名字</th>
                                            <th>当前状态</th>
                                            <th>能否续借</th>
                                            <th>借阅日期</th>
                                            <th>归还日期</th>
                                            <th>违约金额</th>
                                            <th>操作</th>
                                        </tr>
                                    </thead>
                                </table>
                            </div>
                            <!-- /.table-responsive -->
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
                <!-- /.col-lg-12 -->
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

    <!-- DataTables JavaScript -->
    <script src="../bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
    <script src="../bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
    <script src="../bower_components/datatables-responsive/js/dataTables.responsive.js"></script>
    
    <!-- layer javaScript -->
    <script src="/bower_components/layer/layer.js" ></script>
    
    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>
    
    
    <!-- jquery验证 -->
    <script src="/bower_components/jquery-validation-1.15.0/dist/jquery.validate.min.js"></script>
    
    <!-- 预编译模板 -->
 	<script type="text/javascript" src="/js/handlebars-v3.0.1.js"></script>
    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
	<script id="tpl" type="text/x-handlebars-template">
    {{#each func}}
    <button type="button" class="btn btn-{{this.type}} btn-sm" onclick="{{this.fn}}">{{this.name}}</button>
    {{/each}}
</script>
<script type="text/javascript">
/**
 * 
 */

    $(document).ready(function() {
    	var tpl = $("#tpl").html();

    	var template = Handlebars.compile(tpl);
    			var table = $('#table').DataTable({
        		"aLengthMenu":[10,20,40,50], // 显示多少也
                responsive: true, //响应式
                processing: true, // 过程要有个东西显示
                serverSide : true,
                stateSave : true, //允许浏览器进行缓存
            	searching : false, //禁止搜索
                ajax : "../record/record!datatableList.action",
                columns: [
                            {"data": "bookname"},
                            {"data": "state",
                            	render : function(data,type,full){
                            		if(data==0){
                            			data = "<a  href='#'  >已预借</a>";
                            		}else if(data==1){
                            			data = "<a  href='#'  >已借出</a>";
                            		}else{
                            			data = "<a  href='#'  >欠费未还</a>";
                            		}
                            		return data;
                            	}
                            },
                            {"data": "renew",
                            	render : function(data,type,full){
                            		if(data==0){
                            			data = "<a  href='#'  >能续借</a>";
                            		}else{
                            			data = "<a  href='#'  >不能续借</a>";
                            		}
                            		return data;
                            	}
                            },
                            {"data": "begin"},
                            {"data": "end"},
                            {"data": "money"},
                            {"data": "id"}
                            ],
                columnDefs: [
                            {
                              targets: 6, //表示具体需要操作的目标列，下标从0开始
                              orderable : false, 
                               render : function(data, type, full) {
                            	   if (full.renew==1){
                            		   var html = "<button type='button' class='btn btn-primary ' disabled='disabled'>续借</button>";
                            	   }else{
                            		   var html = '<button type="button" class="btn btn-primary" onclick="_yujie('+data+')">续借</button>';
                            	   }
                            	   return html;
                                }
                              }],
                language: {
                    "sProcessing": "处理中...",
                    "sLengthMenu": "显示 _MENU_ 项结果",
                    "sZeroRecords": "没有匹配结果",
                    "sInfo": "显示第 _START_ 至 _END_ 项结果，共 _TOTAL_ 项",
                    "sInfoEmpty": "显示第 0 至 0 项结果，共 0 项",
                    "sInfoFiltered": "(由 _MAX_ 项结果过滤)",
                    "sInfoPostFix": "",
                    "sSearch": "表格内搜索:",
                    "sUrl": "",
                    "sEmptyTable": "表中数据为空",
                    "sLoadingRecords": "载入中...",
                    "sInfoThousands": ",",
                    "oPaginate": {
                        "sFirst": "首页",
                        "sPrevious": "上页",
                        "sNext": "下页",
                        "sLast": "末页"
                    },
                    "oAria": {
                        "sSortAscending": ": 以升序排列此列",
                        "sSortDescending": ": 以降序排列此列"
                    }
                },
                "dom": "<'row'<'col-xs-2'l><'#mytool.col-xs-4'><'col-xs-6'f>r>" +
                "t" +
                "<'row'<'col-xs-6'i><'col-xs-6'p>>",
        initComplete: function () {
            $("#mytool").append('<button type="button" class="btn btn-default btn-sm" onclick="_add(1)" >添加图书</button>');
        }
        });
     
     
     $('#table tbody').on( 'click', 'tr', function () {
         $(this).toggleClass('selected');
     } );
     
     $('#button').click( function () {
         alert( table.rows('.selected').data().length +' row(s) selected' );
     } );
     
    });
    
    /**
     * 预借图书
     * @param name
     */
    function _yujie(data) {
    	 layer.confirm('确定要续借本图书?', {icon: 3, title:'提 示'}, function(index){
    		 $.ajax({
    			 url : '/book/book!reserve.action?sid='+data,
    			 success : function (data) {
    				 top.layer.msg("续借成功",{time:500},function(){
							top.layer.close(index);
						});
    				 $('#table').DataTable().ajax.reload();
				}
    		 });
 		    layer.close(index);
 		});
    }
    
</script>
</body>

</html>

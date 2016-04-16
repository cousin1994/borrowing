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
                ajax : "../record/record!revertlist.action?code="+'${code}',
                columns: [
                            {"data": "bookname"},
                            {"data": "state",
                            	render : function(data,type,full){
                            		if(data==0){
                            			data = "<a  href='#'  >已预借</a>";
                            		}else if(data==1){
                            			data = "<a  href='#'  >借出</a>";
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
                            	   var context = 
                            		   {
                            			   func: [
                                                  {"name": "归还", "fn": "_revert(\'" +data+ "\')", "type": "primary"},
 	                                              {"name": "同意借出", "fn": "_borrow(" + data + ")", "type": "success"}
                                              ]
                            		   };
                            	   var html = template(context);
                            	  // var html = '<button type="button" class="btn btn-primary" onclick="_revert('+data+')">归还</button> <button type="button" class="btn btn-success" onclick="_borrow('+data+')">同意借出</button>';
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
     * 归还图书
     * @param name
     */
    function _revert(data) {
    	 top.layer.confirm('确定要归还本图书?', {icon: 3, title:'提 示'}, function(index){
    		 $.ajax({
    			 url : '/record/record!revert.action?sid='+data,
    			 success : function (data) {
	    				 if(data=="success"){
	    				 top.layer.msg("归还成功",{time:1500},function(){
								top.layer.close(index);
							});
    				 }else{
    					 top.layer.msg("归还失败",{time:1500},function(){
								top.layer.close(index);
							});
    				 }
    				 $('#table').DataTable().ajax.reload();
				}
    		 });
 		    layer.close(index);
 		});
    }
    
    
    /**
     * 同意借书图书
     * @param name
     */
    function _borrow(data) {
    	 top.layer.confirm('确定要借出本图书?', {icon: 3, title:'提 示'}, function(index){
    		 $.ajax({
    			 url : '/record/record!borrow.action?sid='+data,
    			 success : function (data) {
	    				 if(data=="success"){
	    				 top.layer.msg("借书成功",{time:1500},function(){
								top.layer.close(index);
							});
    				 }else{
    					 top.layer.msg("借书失败",{time:1500},function(){
								top.layer.close(index);
							});
    				 }
    				 $('#table').DataTable().ajax.reload();
				}
    		 });
 		    layer.close(index);
 		});
    }
    
</script>
</body>

</html>

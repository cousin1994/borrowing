/**
 * 用户管理的js
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
                ajax : "/user/user!ajaxList.action",
                columns: [
                            {"data": "name"},
                            {"data": "code"},
                            {"data": "violate",
                            	render : function(data,type,full){
                            		if(data==0){
                            			data = "<a  href='#'  >正常</a>";
                            		}else{
                            			data = "<a  href='#'  >违约</a>";
                            		}
                            		return data;
                            	}},
                            {"data": "phone"},
                            {"data": "role",
                            	render : function(data,type,full){
                            		if(data==0){
                            			data = "<a  href='#'  >超级管理员</a>";
                            		}else if(data==1){
                            			data = "<a  href='#'  >系统管理员</a>";
                            		}else{
                            			data = "<a  href='#'  >普通用户</a>";
                            		}
                            		return data;
                            	}},
                            {"data": "state",
                                	render : function(data,type,full){
                                		if(data==0){
                                			data = "<a  href='#'  >正常</a>";
                                		}else{
                                			data = "<a  href='#'  >无效</a>";
                                		}
                                		return data;
                                	}},
                            {"data": "id"}
                            ],
                columnDefs: [
                            {
                              targets: 6, //表示具体需要操作的目标列，下标从0开始
                              orderable : false, //禁止排序
                               render : function(data, type, full) {
                            	   var context =
                                   {
                                       func: [
                                           {"name": "修改", "fn": "edit(\'" +data+ "\')", "type": "primary"},
                                           {"name": "删除", "fn": "del(" + data + ")", "type": "danger"},
                                           {"name": "重置密码", "fn": "reset(\'" +data+ "\')", "type": "primary"}
                                       ]
                                   };
                                   var html = template(context);
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
            $("#mytool").append('<button type="button" class="btn btn-default btn-sm" onclick="_add(1)" >添加用户</button>');
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
     * 删除数据
     * @param name
     */
    function del(data) {
    	 layer.confirm('确定要删除本数据?', {icon: 3, title:'提 示'}, function(index){
    		 $.ajax({
    			 url : '/user/user!delete.action?id='+data,
    			 success : function (data) {
    				 top.layer.msg("删除成功",{time:500},function(){
							top.layer.close(index);
						});
    				 $('#table').DataTable().ajax.reload();
				},
    		 	error : function(data){
    		 		top.layer.msg("删除失败",{time:500},function(){
						top.layer.close(index);
					});
    		 	}
    		 });
 		    layer.close(index);
 		});
    }
    
    /**
     * 修改数据
     * @param data
     */
    function edit(data){
    	var _title = "修改用户";
    	var _area = ['50%','90%'];
    	var _path = "../user/user!findById.action?sid="+data;
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
    			var _form = _body.find('#bookinputform');
    			var isok = $(_form).validate({
    				//这里是加验证的
    			}).form();
    			if(isok){
    				$.ajax({
    					type:"POST",
    					dataType:"text",
    					url:"../user/user!save.action",
    					data : _form.serialize(),
    					success:function(data){
    						if(data=="true"){
    							top.layer.msg("用户保存成功",{time:500},function(){
    								top.layer.close(index);
    								$('#table').DataTable().ajax.reload();
    							});
    						}else{
    							top.layer.msg("图书新增失败",{time:500});
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

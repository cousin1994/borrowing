/**
 * 管理员主界面中的js函数
 */



$(document).ready(function() {
//弹出提示消息中的函数
	$(function(){
		$(".close").click(function(){
			$("#myAlert").alert();
		});
	}); 
	
}
);

//新增图书
function _add() {
	var _title = "新增图书";
	var _area = ['50%','90%'];
	var _path = "book/book!creatBefor.action";
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
					url:"../book/book!save.action",
					data : _form.serialize(),
					success:function(data){
						if(data=="true"){
							top.layer.msg("图书保存成功",{time:1000},function(){
								top.layer.close(index);
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

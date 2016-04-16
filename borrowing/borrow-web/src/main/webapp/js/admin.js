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

//开启prompt
layer.config({
	extend: 'extend/layer.ext.js'
});

//新增记录
function _newrecord() {
	/*layer.open({
		  type: 1,
		  skin: 'layui-layer-demo', //样式类名
		  area: ['40%','40%'],
		  closeBtn: 0, 
		  shift: 2,
		  shadeClose: true, //开启遮罩关闭
		  content: '\<\div class="form-group">	\<\div class="input-group">	\<\span class="input-group-addon">输入旧密码\<\/span>\<\/div>\<\/div>\<\div class="input-group">\<\span class="input-group-addon">输入新密码\<\/span>\<\/div>\<\/div>'
		});*/
	var type = type;
	var _title = "新增借书记录";
	var _area = ['50%','30%'];
	var _path = "../record/record!beforadd.action";
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
			var _form = _body.find('#addrecordform');
			var isok = $(_form).validate({
				//这里是加验证的
			}).form();
			if(isok){
				$.ajax({
					type:"POST",
					dataType:"text",
					url:"../record/record!add.action",
					data : _form.serialize(),
					success:function(data){
						if(data=="success"){
							top.layer.msg("用户借书成功",{time:1500},function(){
								top.layer.close(index);
							});
						}else{
							top.layer.msg("账号或索书号错误！",{time:1500});
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


//归还
function _revert() {
	layer.prompt({
		  formType: 0,
		  value: '',
		  title: '读者账号'
		}, function(value, index, elem){
			top.layer.open({
				type : 2,
				title : "用户归还图书",
				shadeClose : false,
				shade : 0.2,
				maxmin : true,
				area : ['70%','70%'],
				content : [ "../record/record!beforrevert.action?code="+value,'yes'],//iframe的url , no代表不显示滚动条
				btn : ['关闭'],
				btn1: function(index,layero) {
					
				}
			});
		  layer.close(index);
		});
}


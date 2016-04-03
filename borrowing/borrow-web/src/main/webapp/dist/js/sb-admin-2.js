$(function() {

    $('#side-menu').metisMenu();

});

//Loads the correct sidebar on window load,
//collapses the sidebar on window resize.
// Sets the min-height of #page-wrapper to window size
$(function() {
    $(window).bind("load resize", function() {
        var topOffset = 50;
        var width = (this.window.innerWidth > 0) ? this.window.innerWidth : this.screen.width;
        if (width < 768) {
            $('div.navbar-collapse').addClass('collapse');
            topOffset = 100; // 2-row-menu
        } else {
            $('div.navbar-collapse').removeClass('collapse');
        }

        var height = ((this.window.innerHeight > 0) ? this.window.innerHeight : this.screen.height) - 1;
        height = height - topOffset;
        if (height < 1) height = 1;
        if (height > topOffset) {
            $("#page-wrapper").css("min-height", (height) + "px");
        }
    });

    var url = window.location;
    var element = $('ul.nav a').filter(function() {
        return this.href == url;
    }).addClass('active').parent().parent().addClass('in').parent();
    if (element.is('li')) {
        element.addClass('active');
    }
});

//退出按钮
function logout() {
	 layer.confirm('确定要退出系统吗?', {icon: 3, title:'提 示'}, function(index){
		    window.location.href='/login!loginout.action';
		    layer.close(index);
		});
}




//新增图书
function _add(type) {
	var type = type;
	var _title = "新增图书";
	var _area = ['50%','90%'];
	var _path = "../book/book!creatBefor.action";
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
							top.layer.msg("图书保存成功",{time:500},function(){
								top.layer.close(index);
								if(type==1){
									$('#table').DataTable().ajax.reload();
								}
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

//新增用户
function _adduser(type) {
	var type = type;
	var _title = "新增用户";
	var _area = ['50%','90%'];
	var _path = "../user/user!beforCreat.action";
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
			var _form = _body.find('#userinputform');
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
						if(data=="success"){
							top.layer.msg("用户保存成功",{time:500},function(){
								top.layer.close(index);
								if(type==1){
									$('#table').DataTable().ajax.reload();
								}
							});
						}else{
							top.layer.msg("用户保存失败",{time:500});
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
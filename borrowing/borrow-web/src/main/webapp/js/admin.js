/**
 * 管理员主界面中的js函数
 */

//退出按钮
function logout() {
	 layer.confirm('确定要退出系统吗?', {icon: 3, title:'提 示'}, function(index){
		    //do something
		    window.location.href='/login!loginout.action';
		    layer.close(index);
		});
}
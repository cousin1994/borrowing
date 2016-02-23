
jQuery(document).ready(function() {
    /*
        Fullscreen background
    */
    $.backstretch([
                    "../images/bg/1.jpg"
	              , "../images/bg/2.jpg"
	              , "../images/bg/3.jpg"
				  , "../images/bg/4.jpg"
				  , "../images/bg/5.jpg"
				  , "../images/bg/6.jpg"
				  , "../images/bg/7.jpg"
				  , "../images/bg/8.jpg"
				  , "../images/bg/9.jpg"
				  , "../images/bg/10.jpg"
				  , "../images/bg/11.jpg"
				  , "../images/bg/12.jpg"
				  , "../images/bg/13.jpg"
				  , "../images/bg/14.jpg"
				  , "../images/bg/15.jpg"
	             ], {duration: 3000, fade: 750});
    
    /*
        Form validation
    */
    $('.login-form input[type="text"], .login-form input[type="password"], .login-form textarea').on('focus', function() {
    	$(this).removeClass('input-error');
    });
    
    $('.login-form').on('submit', function(e) {
    	
/*    	$(this).find('input[type="text"], textarea').each(
    			function(){
    				if($(this).val()==""){
    					$(this).addClass('input-error');
    					layer.alert('请输入用户账号！',{icon:5});
    					e.preventDefault();
    				}
    			}
    	);*/
    	
    	$(this).find('input[type="text"], input[type="password"], textarea').each(function(){
    		if( $('#form-username').val() == "" ) {
    			e.preventDefault();
    			$('#form-username').addClass('input-error');
    			layer.alert('请输入用户账号！',{icon:5});
    		}else if( $('#form-password').val() == "" ) {
    			e.preventDefault();
    			$('#form-password').addClass('input-error');
    			layer.alert('请输入密码！',{icon:5});
    		}
    		else {
    			$(this).removeClass('input-error');
    		}
    	});
    	
    });
    
    
});

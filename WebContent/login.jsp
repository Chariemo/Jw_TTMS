<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8"/>
<title>426影院管理系统</title>
<meta name="author" content="DeathGhost" />
<link rel="stylesheet" type="text/css" href="css/style1.css" tppabs="css/style1.css" />
<style>
body{height:100%;background:#16a085;overflow:hidden;}
canvas{z-index:-1;position:absolute;}
</style>
<script src="js/jquery.js"></script>
<script src="js/verificationNumbers.js" tppabs="js/verificationNumbers.js"></script>
<script src="js/Particleground.js" tppabs="js/Particleground.js"></script>
<script>
$(document).ready(function() {
  //粒子背景特效
  $('body').particleground({
    dotColor: '#5cbdaa',
    lineColor: '#5cbdaa'
  });
  //验证码
  createCode();
  
});

function sendok(){
	if (!validate()) {
		return false;
	}
	else {
		return true;
	}
}


</script>
</head>		
<body>

<form method = "post" action = "LoginServlet" onsubmit = "return sendok();">
<dl class="admin_login">
 <dt>
  <strong>影院后台管理系统</strong>
  <em>Management System</em>
 </dt>
 <dd class="user_icon">
  <input type="text" name = "emp_no" placeholder="账号" id = "emp_no" class="login_txtbx" required="required"  
							pattern="([a-zA-Z0-9]{1,})"
							oninvalid="setCustomValidity('请输入大小写字母和数字组成的用户名')"
							oninput="setCustomValidity('')"/>
 </dd>
 <dd class="pwd_icon">
  <input type="password" name = "userpwd" placeholder="密码" id = "userpwd" class="login_txtbx" required="required"  
							pattern="(\w{6,})"
							oninvalid="setCustomValidity('请输入至少6位密码(由大小写字母、数字和_组成)'"
							oninput="setCustomValidity('')"/>
 </dd>
 <dd class="val_icon">
  <div class="checkcode">
    <input type="text" id="J_codetext" placeholder="验证码" maxlength="4" class="login_txtbx">
    <canvas class="J_codeimg" id="myCanvas" onclick="createCode()">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
  </div>
  <input type="button" value="验证码核验" class="ver_btn" onClick="validate();">
 </dd>
 <dd>
  <input type="submit" value="立即登陆" class="submit_btn"/>
 </dd>
  <dd>
 ${tip}
 </dd>
</dl>
</form>
</body>
</html>

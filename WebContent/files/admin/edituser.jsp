<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改用户信息</title>
<link rel="stylesheet" rev="stylesheet" href="/Jw_TTMS/css/style.css" type="text/css" media="all" />


<script language="JavaScript" type="text/javascript">

function check()
{
	
	
}

function init() {


	var type = "${user.type}";
	var type_obj = document.getElementById("emp_type");
	var i;

	
	for (i = 0; i < type_obj.options.length; i++) {
		if (type_obj.options[i].value == type) {
			type_obj.options[i].selected = true;
			break;
		}
	}
}


</script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody" onload = "init()">
  <form action="/Jw_TTMS/UserMgrServlet?method=update" method="post" name="fom" id="fom" onsubmit = "return check();">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >修改用户信息页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		

		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>修改用户信息</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					  <tr>
					    <td nowrap align="right" width="13%" height="50px">用户编号:</td>
					    <td width="50%">
					    <input name="emp_no" id="emp_no" type="text" size = "30" value = "${user.no}" readonly/>
					    </tr>
					  <tr>
					    <td nowrap align="right" height="50px">密码:</td>
					    <td><input name="npwd" id="npwd" type="password" size = "30" pattern="\w{6,}" value = "${user.pwd}"
							 oninvalid="setCustomValidity('请输入不少于6位的密码！')"
							 required="required"
							oninput="setCustomValidity('')"/></td>
					  </tr>
					  
					   <tr>
					    <td nowrap align="right" height="50px" >用户类型:</td>
					    <td><select name="emp_type" id = "emp_type" style="width:245px" >                      
                          <option value = "0">普通用户</option>
                          <option value = "1">管理员</option>
                          <option value = '-1'>无权限</option>
                        </select></td>
					    
					  </tr>
					  </table>
			 <br />
				</fieldset>			</TD>
		</TR>
		
		</TABLE>

	<table >
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="submit" name="Submit" value="保存" class="button"/>　	
			<input type="reset" name="Submit2" value="重置" class="button"/></TD>
		</TR>
		</table>
${result}
</div>
</form>
</body>
</html>
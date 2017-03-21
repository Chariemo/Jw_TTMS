<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<style type="text/css">
<!--
body,td,th {
	font-size: 12px;
	color: #3791cf;
}
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style>

<link href="/Jw_TTMS/user2/css/bg.css" rel="stylesheet" type="text/css" />


</head>

<body>
<!-- <form id="form1" name="form1" action="" method="post" onsubmit="return Validator.Validate(this,1)"> -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="45" valign="top"><img src="/Jw_TTMS/user2/images/register_03.gif" width="45" height="386" /></td>
    <td width="623" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><img src="/Jw_TTMS/user2/images/register_04.gif" width="623" height="135" /></td>
      </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td background="/Jw_TTMS/user2/images/register_28.gif">
          <form id="form0" name="form0" method="post" action="/Jw_TTMS/EmployeeServlet?method=add" enctype="multipart/form-data">
            <table width="100%" height="158" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center"><table width="325" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="123"  align="left"><h3>用户编号：</h3></td>
                    <td width="130" align="left"><label>
                      <input name="emp_no" id="emp_no" type="text" size = "30" placeholder="请输入大小写字母和数字,长度6-20位" pattern="[a-zA-Z0-9]{6,20}" 
							required="required" oninvalid="setCustomValidity('请输入大小写字母和数字,长度6-20位!')" 
							oninput="setCustomValidity('')" />
                     </span>
                    </label>
                   </td>                      
                  </tr>
                  <tr>
                    <td width="123"  align="left"><h3>用户名：</h3></td>
                    <td width="123" align="left"><label>
                      <input name="username" id="username" type="text" size = "30" placeholder="请输入真实姓名,10字以内" pattern="[\u4e00-\u9fa5]{2,10}"
							required="required" oninvalid="setCustomValidity('请输入真实姓名,10字以内!')"
							oninput="setCustomValidity('')" />
                            
                    </label></td>
                  </tr>
                  
                   <tr>
                    <td width="130"  align="left"><h3>用户头像：</h3></td>
                    <td width="50" align="left"><label>
                    	<input name="emp_image" id = "emp_image" type = "file">
                    </label></td>
                  </tr>
                  
                  <tr>
                    <td  align="left"><h3>手机号码：</h3></td>
                    <td align="left"><input  name="tel" id="tel" type="text" size = "30" placeholder="请输入手机号码" pattern="1[3-8][0-9]{9}" 
							required="required" oninvalid ="setCustomValidity('请输入正确手机号码!')"
							oninput="setCustomValidity('')" >
                    
                  </tr>
                  <tr>
                    <td align="left"><h3>邮箱地址:</h3></td>
                    <td align="left"><input name="email" id="email"  type = "text" size = "30" placeholder="请输入Email" required="required"  
							pattern="([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+((\.[a-z]{2,3}){1,2})"
							oninvalid="setCustomValidity('请输入正确格式Email!')"
							oninput="setCustomValidity('')" />
                  
                  </tr>
                  <tr>
                    <td align="left"><h3>住址：</h3></td>
                    <td align="left"><input name="addr" id="addr"  type="text" size = "30" placeholder="请输入地址" pattern=".{2,30}" 
							required="required" oninvalid="setCustomValidity('请输入地址!')"
							oninput="setCustomValidity('')" /></td>
                  </tr>
                
						
                </table></td>
                <td width="232" align="right" valign="top"><img src="/Jw_TTMS/user2/images/register_08.gif" width="232" height="172" /></td>
                </tr>
            </table>
                    <table width="623" height="41" border="0" cellpadding="0" cellspacing="0">
                      <tr align="center">
			<td width="201">&nbsp;</td>
                        <td width="107"><input type = "submit"  onsubmit = "return checkall();" width="82" height="23"  /></td>
                        <td width="62"><input  type = "reset" width="62" height="23"></td>
			<td width="201">&nbsp;</td>
                      </tr>
                    </table>
                    ${result}
          </form>
          </td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="9"><img src="/Jw_TTMS/user2/images/register_31.gif" width="9" height="44" /></td>
          <td background="/Jw_TTMS/user2/images/register_32.gif">&nbsp;</td>
          <td width="11"><img src="/Jw_TTMS/user2/images/register_34.gif" width="11" height="44" /></td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table></td>
    <td class="bg">&nbsp;</td>
  </tr>
</table>
<!-- </form> -->
<iframe id="ifr" name="ifr" style="display:none" ></iframe>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<head>
<base href ="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人信息</title>
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

<!-- <link href="../../user2/css/bg.css" rel="stylesheet" type="text/css" /> -->

<script type="text/javascript">

var req;
function getEmployee()
{
	var url = "/Jw_TTMS/GetEmployee";
    if (window.XMLHttpRequest)
    {
        req = new XMLHttpRequest();
    }
    else if (window.ActiveXObject)
    {
        req = new ActiveXObject("Microsoft.XMLHTTP");
    }
	
	if (req) 
	{
		//采用POST方式，异步传输
		req.open("post", url, true);
		//POST方式，必须加入如下头信息设定
		req.setRequestHeader("Content-Type","application/x-www-form-urlencoded");
		req.onreadystatechange = complete;
		req.send();
	}
}
//回调函数
function complete() 
{
	if (req.readyState == 4 && req.status == 200)
	{
		//给返回的json串加上圆括号，转变成json对象
		var json =  eval("(" + req.responseText + ")");
		document.getElementById("emp_id").value = json.emp_id;
		
		document.getElementById("username").value = json.emp_name;
		document.getElementById("tel").value = json.emp_tel;
		document.getElementById("addr").value = json.emp_addr;
		document.getElementById("email").value = json.emp_email;
	}
}

</script>
</head>

<body onload="getEmployee()">
<!-- <form id="form1" name="form1" action="../../UpdateEmp" method="post" onsubmit="checkall();"> -->
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="45" valign="top"><img src="/Jw_TTMS/user2/images/register_03.gif" width="45" height="386" /></td>
    <td width="623" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center"><h2>用户信息</h2></td>
      </tr>
    </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td background="/Jw_TTMS/user2/images/register_28.gif">
          <form id="form1" name="form1" method="post" action="/Jw_TTMS/EmployeeServlet?method=update" enctype="multipart/form-data" onsubmit = "">
            <table width="100%" height="158" border="0" cellpadding="0" cellspacing="0">
              <tr>
                <td align="center"><table width="325" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="123"  align="left"><h3>用户编号：</h3></td>
                    <td width="123" align="left"><label>
                      <input name = "emp_id" id = "emp_id" type = "hidden" >
                      <input name="emp_no" id="emp_no" type="text" value = "${emp.emp_no}" size = "30" readonly/>
                      
                    </label>
                   </td>                      
                  </tr>
                  
                  <tr>
                    <td width="130"  align="left"><h3>用户头像(可不选)：</h3></td>
                    <td width="50" align="left"><label>
                    	<input name="emp_image" id = "emp_image" type = "file">
                    </label></td>
                  </tr>
                  
                  <tr>
                    <td width="123"  align="left"><h3>用户名：</h3></td>
                    <td width="123" align="left"><label>
                      <input name="username" id="username" type="text" size = "30" pattern="[\u4e00-\u9fa5]{2,10}"
							required="required" oninvalid="setCustomValidity('请输入真实姓名,10字以内!')"
							oninput="setCustomValidity('')" />
                              
                    </label></td>
                  </tr>
                            
                  
                   <tr>
                    <td width="123"  align="left"><h3>新密码：</h3></td>
                    <td width="123" align="left"><label>
                      <input name="npwd" id="npwd" type="password" size = "30" pattern="\w{6,}" placeholder="请输入新密码， 如不需要可不填"
							 oninvalid="setCustomValidity('请输入不少于6位的密码！')"
							oninput="setCustomValidity('')"/>
                                 
                    </label></td>
                  </tr>
                  
                  
                  <tr>
                    <td  align="left"><h3>手机号码：</h3></td>
                    <td align="left"><input  name="tel" id="tel" type="text" size = "30" pattern="1[3-8][0-9]{9}" 
							required="required" oninvalid ="setCustomValidity('请输入正确手机号码!')"
							oninput="setCustomValidity('')" />
                 
                
                  </tr>
                  
                  <tr>
                    <td align="left"><h3>邮箱地址:</h3></td>
                    <td align="left"><input name="email" id="email" size = "30"  type = "text" required="required"  
							pattern="([a-zA-Z0-9_-])+@[a-zA-Z0-9_-]+((\.[a-z]{2,3}){1,2})"
							oninvalid="setCustomValidity('请输入正确格式Email!')"
							oninput="setCustomValidity('')" />
               
                  </tr>
                  
                  <tr>
                    <td align="left"><h3>住址：</h3></td>
                    <td align="left"><input name="addr" id="addr" size = "30"  type="text" pattern=".{2,30}" 
							required="required" oninvalid="setCustomValidity('请输入地址!')"
							oninput="setCustomValidity('')"/></td>
                  </tr>
                  
                    
                                  
                <!--  <tr>
                        <td align="left" width="100"><input type="radio" name="type" id="type" value="1" readonly/><h3>管理员</h3></td>
						<td align="left" width="100"><input type="radio" name="type" id="" value="type" value="0" readonly/><h3>普通员工</h3></td>
						</tr> -->
						
                </table></td>
                <td width="232" align="right" valign="top"><img src = "${emp.emp_image}" width="232" height="172" /></td>
                </tr>
            </table>
                    <table width="623" height="41" border="0" cellpadding="0" cellspacing="0">
                      <tr align="center">
			<td width="201">&nbsp;</td>
                        <td width="107"><input type = "submit"   width="82" height="23"  /></td>
                        <td width="62"><input  type = "reset"   width="62" height="23"></td>
			<td width="201">&nbsp;</td>
                      </tr>
                    </table>
                 
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
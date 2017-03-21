<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加演出厅</title>
<link rel="stylesheet" rev="stylesheet" href="/Jw_TTMS/css/style.css" type="text/css" media="all" />


<script language="JavaScript" type="text/javascript">

function check()
{
	var studio_row_count = document.getElementById("studio_row_count");
	var studio_col_count = document.getElementById("studio_col_count");
	var studio_flag = document.getElementById("studio_flag");
	if (studio_row_count.value == "") {
		alert("请选择座位行数");
		return false;
	}
	else if (studio_col_count.value == "") {
		alert("请选择座位列数");
		return false;
	}
	else if (studio_flag.value == "") {
		alert("请选择演出厅状态");
		return false;
	}
	else {
		return true;
		location.reload();
	}
		
	
}






</script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody">
  <form action="/Jw_TTMS/StudioServlet?method=add" method="post" name="fom" id="fom" onsubmit = "return check();">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >演出厅添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		
		

		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加演出厅</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:100%">
					 
					  <tr>
					    <td nowrap align="right" width="13%" height="50px">演出厅名称:</td>
					    <td width="50%"><input name="studio_name" id="studio_name" style="width:230px" type="text" size="50" 
						    placeholder="请输入由中文、英文组成的演出厅名称"  required="required"  
							pattern="[\u4e00-\u9fa5]+|([a-z]+\s?)+"
							oninvalid="setCustomValidity('请输入由中文、英文组成的演出厅名称！')"
							oninput="setCustomValidity('')"/>
				      			    
					    </tr>
					  <tr>
					    <td nowrap align="right" height="50px">座位行数:</td>
					    <td><select name="studio_row_count" id = "studio_row_count">
                          <option  value = "" selected="selected" >==请选择座位行数==</option>
                          <option value = "8">8</option>
                          <option value = "9">9</option>
                          <option value = "10">10</option>
						  <option value = "11">11</option>
						  <option value = "12">12</option>
						  <option value = "13">13</option>
                         
                        </select></td>
					    
					  </tr>
					  <tr>
					    <td nowrap align="right" height="50px">座位列数:</td>
					    <td><select name="studio_col_count" id = "studio_col_count" >
                          <option value = "" selected="selected">==请选择座位列数==</option>
                          <option value = "7">7</option>
                          <option value = "9">9</option>
                          <option value = "11">11</option>
						  <option value = "13">13</option>
						  <option value = "15">15</option>
						  <option value = "17">17</option>
                         
                        </select></td>
					    
					  </tr>
					   <tr>
					    <td nowrap align="right" height="50px" >演出厅状态:</td>
					    <td><select name="studio_flag" id = "studio_flag" >
                          <option value = "0" selected="selected">默认为未生成座位</option>
                         <!--  <option value = "0">未生成座位</option>
                          <option value = "1">已生成状态</option>
                          <option value = "-1">已损坏</option> -->
                         
                        </select></td>
					    
					  </tr>
					  <tr>
					    <td nowrap align="right" height="120px">信息:</td>
					    <td colspan="3"><textarea name = "studio_introduction" id="studio_introduction" rows="5" cols="80"></textarea></td>
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

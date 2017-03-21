<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>添加影片</title>
<link rel="stylesheet" rev="stylesheet" href="../../css/style.css" type="text/css" media="all" />


<script language="JavaScript" type="text/javascript">
<!--
function checkname() {
	var reg = /^([\u4e00-\u9fa5]+|([a-z]+\s?)+)$/;
	var name = document.getElementById("play_name");
	if (!reg.test(name.value)) {
		document.getElementById("name_tip").innerText = "请输入中文或者英文名";
		play_name.focus();
		return false;
	}
	else {
		document.getElementById("name_tip").innerText = "";
		return true;
	}
}

function checktime() {
	var reg = /^(1|8|9)\d{1,2}$/;
	var time = document.getElementById("time");
	if (!reg.test(time.value)) {
		document.getElementById("time_tip").innerText = "请正确输入影片时长";
		time.focus();
		return false;
	}
	else {
		document.getElementById("time_tip").innerText = "";
		return true;
	}
}

function checkprice() {
	var reg = /^\d{1,3}$/;
	var price = document.getElementById("price");
	if (!reg.test(price.value)) {
		document.getElementById("price_tip").innerText = "请正确输入影片票价";
		price.focus();
		return false;
	}
	else {
		document.getElementById("price_tip").innerText = "";
		return true;
	}
}

function checkrelease() {
	var release = document.getElementById("release");
	if (release.value == "") {
		document.getElementById("release_tip").innerText = "请选择计划上映时间";
		return false;
	}
	else {
		document.getElementById("release_tip").innerText = "";
		return true;
	}
	
}

function checkall() {
	if (checkname() && checktime() && checkprice() && checkrelease()) {
		alert("保存成功");
		return true;
	}
	else {
		return false;
	}
}
//-->



</script>
<style type="text/css">
<!--
.atten {font-size:12px;font-weight:normal;color:#F00;}
-->
</style>
</head>

<body class="ContentBody">
  <form action="" method="post" enctype="multipart/form-data" name="fom" id="fom" target="sypost" >
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >影片添加页面</th>
  </tr>
  <tr>
    <td class="CPanel">
		<TR>
			<TD width="100%">
				<fieldset style="height:100%;">
				<legend>添加影片</legend>
					  <table border="0" cellpadding="2" cellspacing="1" style="width:60%">
					 
					  <tr>
					    <td nowrap align="right" width="13%">影片名称:</td>
					    <td><input name="play_name" id = "play_name" style="width:150px" type="text" size="40" onblur = "checkname()" />
					    	<span id = "name_tip" style = "color.red"></span></td>
					    <td align="right" width="19%">类型:</td>
					    <td width="41%"><select name="type" id="type" size = "1">
					    	<option>动作</option>
					    	<option>喜剧</option>
					    	<option>科幻</option></select></td>
					    </tr>
					  <tr>
					    <td nowrap align="right">计划上映时间:</td>
					    <td><input name="release" id="release" type = "date" style="width:150px"/>
					    	<span id = "release_tip"></span></td>
					    	
					    <td align = "right" width = "19%">语言:</td>
					    <td> <select name = "lang" id = "lang" size = "1">	
					    		<option>汉语</option>
					    		<option>English</option>		    		
					  			</select></td>
					  			
					  </tr>
					  <tr>
					    <td nowrap align="right">剧目时长(分钟):</td>
					    <td><input name = "time" id = "time" type = "text" style="width:150px" onblur = "checktime()"></input>
					    	<span id = "time_tip"></span></td>
					    	
					  <td align="right">剧目状态:</td>
					    <td><select name="status" id="status">
					     <option>正在上映</option>
					     <option>已上映</option>
					     <option>已下线</option></select></td>  
					
					  </tr>
					  <tr>
					    <td nowrop align="right">票价(RMB):</td>
					    <td><input type = "text" name = "price" id = "price" style="width:150px" onblur = "checkprice()"></input>
					    	<span id = "price_tip"></span> </td>
					  </tr>
					  <tr>
					    <td nowrap align="right" height="120px">影片说明:</td>
					    <td colspan="3"><textarea id="textarea" name="textarea" rows="5" cols="80"></textarea></td>
					    </tr>
					  </table>
			 <br />
				</fieldset>			</TD>
		</TR>
		
		</TABLE>
	
	
	 </td>
  </tr>
  

		
		
		
		
		<TR>
			<TD colspan="2" align="center" height="50px">
			<input type="button" name="Submit" value="保存" class="button" onclick = "return checkall();"/>　
			
			<input type="reset" name="Submit2" value="重置" class="button"/></TD>
		</TR>
		</TABLE>
	
	
	 </td>
  </tr>
  
  
  
  
  </table>

</div>
</form>
</body>
</html>

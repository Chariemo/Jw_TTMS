<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="cn.edu.xupt.ttms.model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户列表</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.tabfont01 {	
	font-family: "宋体";
	font-size: 9px;
	color: #555555;
	text-decoration: none;
	text-align: center;
}
.font051 {font-family: "宋体";
	font-size: 12px;
	color: #333333;
	text-decoration: none;
	line-height: 20px;
}
.font201 {font-family: "宋体";
	font-size: 12px;
	color: #FF0000;
	text-decoration: none;
}
.button {
	font-family: "宋体";
	font-size: 14px;
	height: 37px;
}
html { overflow-x: auto; overflow-y: auto; border:0;} 
-->
</style>

<link href="/Jw_TTMS/css/css.css" rel="stylesheet" type="text/css" />
<link href="/Jw_TTMS//css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/Jw_TTMS/js/xiangmu.js"></script>
</head>
<SCRIPT language=JavaScript>

function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			obj[i].checked = true;
		}
	}
}

function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "delid"){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}

function add(){
    document.getElementById("fom").action="/Jw_TTMS/files/admin/adduser.jsp";
   document.getElementById("fom").submit();
} 

function del()
{
	document.getElementById("fom").action="/Jw_TTMS/UserMgrServlet?method=delete";
	   document.getElementById("fom").submit();
}



function on_load(){
	   
}
</SCRIPT>

<body onload= "on_load()">
<form name="fom" id="fom" method="post" action="/Jw_TTMS/UserMgrServlet?method=searchByPage">
<table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="/Jw_TTMS/images/nav04.gif">
          
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="21"><img src="/Jw_TTMS/images/ico07.gif" width="20" height="18" /></td>
			<td width="550">按用户编号查看：
              <input name="emp_no" type="text" size="24" value = "${search_emp_no}"/>	
			 <input type="submit" class="right-button02" value="查 询" /></td>
		  </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table id="subtree1" style="DISPLAY: " width="100%" border="0" cellspacing="0" cellpadding="0">

        <tr>
          <td><table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">

          	<!--  <tr>
               <td height="20"><span class="newfont07">选择：<a href="#" class="right-font08" onclick="selectAll();">全选</a>-<a href="#" class="right-font08" onclick="unselectAll();">反选</a></span>
	              <input name="Submit" type="button" class="right-button08" value="删除所选用户" onclick = "del();"/>
	              <input name="Submit2" type="button" class="right-button08" value="添加用户" onclick="add();"/></td>
          	 </tr> -->
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="9" align="center" bgcolor="#EEEEEE"class="tablestyle_title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                   
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;用户信息列表 </td>
                    </tr>
                  <tr>
				   <!--  <td width="5%" align="center" bgcolor="#EEEEEE">选择</td> -->
                    <td width="10%" align="center" bgcolor="#EEEEEE">用户编号</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">密码</td>
                    <td width="5%" align="center" bgcolor="#EEEEEE">类型</td>
     
                    <td width="10%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  
                  <%
		   		int currentPage=1;  //当前页
		   		int allCount=0;     //总记录数
		   		int allPageCount=0; //总页数
		   		User user = null;
		   		//查看request中是否有currentPage信息，如没有，则说明首次访问该页
		   		if(request.getAttribute("allUser")!=null)
		   		{
		   		    //获取Action返回的信息
		   		    currentPage=((Integer)request.getAttribute("currentPage")).intValue();
		   		    ArrayList<User> list=(ArrayList<User>)request.getAttribute("allUser");
		   		    allCount=((Integer)request.getAttribute("allCount")).intValue();
		   		    allPageCount=((Integer)request.getAttribute("allPageCount")).intValue();
			   		if(list!=null && list.size()>0)
			   		{
				   		for(int i=0;i<list.size();i++)
				   		{
				   		    if(i%2==0)
				   		        out.println("<tr class='success'>");
				   		    else
				   		    	out.println("<tr class='active'>");
		   		%>
		   		<tr align="center">
		   			
		   			<%-- <td bgcolor="#FFFFFF" height="20"><input type="checkbox" value = "<%=list.get(i).getNo()%>" name="delid"/></td>	 --%>
		   			<td bgcolor="#FFFFFF"><%=list.get(i).getNo()%></td>
		   			<td bgcolor="#FFFFFF">******</td>
		   		<%
		   		if (list.get(i).getType() == 0) {
		   		%>
		   			<td bgcolor="#FFFFFF">普通用户</td>
		   		<%
		   		}
		   		else if(list.get(i).getType() == 1) {
		   		%>
		   			<td bgcolor="#FFFFFF">管理员</td>
		   	 	<%
		   		}
		   		else {
		   		%>
		   			<td bgcolor="#FFFFFF">无权限</td>
		   		<%
		   		}
		   		%>
		   			<td bgcolor="#FFFFFF"><a href="UserMgrServlet?method=searchByNo&emp_no=<%=list.get(i).getNo()%>">编辑</a></td>		   			
		   		</tr>
		   		<%
			   			}
			   		}
		   		}
		   		%>
 
                </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
      <table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="6"><img src="/Jw_TTMS/images/spacer.gif" width="1" height="1" /></td>
        </tr>
        <tr>
          <td height="33"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="right-font08">
              <tr>
                <td width="50%">共 <span class="right-text09">${allPageCount}</span> 页 | 第 <span class="right-text09">${currentPage}</span> 页</td>
                <td width="49%" align="right">[<a href="/Jw_TTMS/UserMgrServlet?method=searchByPage&currentPage=1&emp_no=${search_emp_no}"
                 class="right-font08">首页</a> | <a href="/Jw_TTMS/UserMgrServlet?method=searchByPage&currentPage=<%=(currentPage-1)<1?1:(currentPage-1)%>&emp_no=${search_emp_no}" 
                 class="right-font08">上一页</a> | <a href="/Jw_TTMS/UserMgrServlet?method=searchByPage&currentPage=<%=(currentPage+1)>allPageCount?allPageCount:(currentPage+1)%>&emp_no=${search_emp_no}"
                 class="right-font08">下一页</a> | <a href="/Jw_TTMS/UserMgrServlet?method=searchByPage&currentPage=<%=allPageCount%>&emp_no=${search_emp_no}" 
                 class="right-font08">末页</a>] 转至：</td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input name="currentPage" type="text" class="right-textfield03" value = "${currentPage}" size="1" /></td>
                      <td width="87%"><a href = "/Jw_TTMS/UserMgrServlet?method=searchByPage&currentPage=<%=currentPage%>&emp_no=${search_emp_no}" 
                 class="right-font08">go</a>
                      <!-- <input name="Submit23222" type="button" class="right-button06" onclick = ""/> -->
                      </td>
                    </tr>
                </table></td>
              </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>
${result}
</form>

<div id="loadingmsg" style="width:100px; height:18px; top:0px; display:none;">
	
</div>

</body>
</html>

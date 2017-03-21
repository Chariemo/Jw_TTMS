<%@ page import="cn.edu.xupt.ttms.model.Studio" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>演出厅列表</title>
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
    document.getElementById("fom").action="/Jw_TTMS/files/admin/addstudio.jsp";
   document.getElementById("fom").submit();
}

function del()
{
	document.getElementById("fom").action="/Jw_TTMS/StudioServlet?method=delete";
	   document.getElementById("fom").submit();
}



function on_load(){
	   
}
</SCRIPT>

<body onload= "on_load()">
<form name="fom" id="fom" method="post" action="/Jw_TTMS/StudioServlet?method=searchByPage">
<table id="mainpage" width="100%" border="0" cellspacing="0" cellpadding="0">

  <tr>
    <td height="30"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="62" background="/Jw_TTMS/images/nav04.gif">
          
		   <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="21"><img src="/Jw_TTMS/images/ico07.gif" width="20" height="18" /></td>
			<td width="550">按名字查看：
              <input name="studio_name" type="text" size="24" value = "${search_studio_name}"/>	
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

          	 <tr>
               <td height="20"><span class="newfont07">选择：<a href="#" class="right-font08" onclick="selectAll();">全选</a>-<a href="#" class="right-font08" onclick="unselectAll();">反选</a></span>
	              <input name="Submit" type="button" class="right-button08" value="删除所选演出厅" onclick = "del();"/>
	              <input name="Submit2" type="button" class="right-button08" value="添加演出厅" onclick="add();"/></td>
          	 </tr>
              <tr>
                <td height="40" class="font42"><table width="100%" border="0" cellpadding="4" cellspacing="1" bgcolor="#464646" class="newfont03">

					                  <tr>
                    <td height="20" colspan="8" align="center" bgcolor="#EEEEEE"class="tablestyle_title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;演出厅信息列表 </td>
                    </tr>
                  <tr>
				    <td width="5%" align="center" bgcolor="#EEEEEE">选择</td>
                    <td width="10%" height="20" align="center" bgcolor="#EEEEEE"style="display:none">id</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">演出厅名称</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">行数</td>
                    <td width="5%" align="center" bgcolor="#EEEEEE">列数</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">介绍</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">状态</td>
                    <td width="10%" align="center" bgcolor="#EEEEEE">操作</td>
                  </tr>
                  
                  <%
		   		int currentPage=1;  //当前页
		   		int allCount=0;     //总记录数
		   		int allPageCount=0; //总页数
		   		Studio studio=null;
		   		//查看request中是否有currentPage信息，如没有，则说明首次访问该页
		   		if(request.getAttribute("allStudio")!=null)
		   		{
		   		    //获取Action返回的信息
		   		    currentPage=((Integer)request.getAttribute("currentPage")).intValue();
		   		    ArrayList<Studio> list=(ArrayList<Studio>)request.getAttribute("allStudio");
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
		   			<td bgcolor="#FFFFFF" height="20"><input type="checkbox" value = "<%=list.get(i).getStudio_id()%>" name="delid"/></td>
		   			<td bgcolor="#FFFFFF" style="display:none"><%=list.get(i).getStudio_id()%></td>
		   			<td bgcolor="#FFFFFF"><%=list.get(i).getStudio_name()%></td>
		   			<td bgcolor="#FFFFFF"><%=list.get(i).getRow_count()%></td>
		   			<td bgcolor="#FFFFFF"><%=list.get(i).getCol_count()%></td>
		   			<td bgcolor="#FFFFFF"><%=list.get(i).getStudio_introduction()%></td>
		   			<%
		   			if (list.get(i).getStudio_flag() == 1) {
		   			%>
		   				<td bgcolor="#FFFFFF">已生成座位</td>
		   			<%
		   			}
		   			else if (list.get(i).getStudio_flag() == 0) {
		   			%>
		   				<td bgcolor="#FFFFFF">未生成座位</td>
		   			<%
		   			}
		   			else {
		   			%>
		   				<td bgcolor="#FFFFFF">已损坏</td>	   	
		   			<%
		   			}%>		
		   			<td bgcolor="#FFFFFF"><a href="StudioServlet?method=searchById&studio_id=<%=list.get(i).getStudio_id()%>">编辑</a></td>
		   			
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
                <td width="49%" align="right">[<a href="/Jw_TTMS/StudioServlet?method=searchByPage&currentPage=1&studio_name=${search_studio_name}"
                 class="right-font08">首页</a> | <a href="/Jw_TTMS/StudioServlet?method=searchByPage&currentPage=<%=(currentPage-1)<1?1:(currentPage-1)%>&studio_name=${search_studio_name}" 
                 class="right-font08">上一页</a> | <a href="/Jw_TTMS/StudioServlet?method=searchByPage&currentPage=<%=(currentPage+1)>allPageCount?allPageCount:(currentPage+1)%>&studio_name=${search_studio_name}"
                 class="right-font08">下一页</a> | <a href="/Jw_TTMS/StudioServlet?method=searchByPage&currentPage=<%=allPageCount%>&studio_name=${search_studio_name}" 
                 class="right-font08">末页</a>] 转至：</td>
                <td width="1%"><table width="20" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td width="1%"><input name="currentPage" type="text" class="right-textfield03" value = "${currentPage}" size="1" /></td>
                      <td width="87%"><a href = "/Jw_TTMS/StudioServlet?method=searchByPage&currentPage=<%=currentPage%>&studio_name=${search_studio_name}" 
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

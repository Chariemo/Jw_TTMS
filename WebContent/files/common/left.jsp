<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2426影院管理系统 </title>
<style type="text/css">
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-image: url(Jw_TTMS/images/left.gif);
} 
</style>
<link href="/Jw_TTMS/css/css.css" rel="stylesheet" type="text/css" />
</head>
<SCRIPT language=JavaScript>

<%-- var type = '<%=request.getSession().getAttribute("type")%>';
alert(type);
 --%>

function tupian(idt){
    var nametu="xiaotu"+idt;
    var tp = document.getElementById(nametu);
    tp.src="/Jw_TTMS/images/ico05.gif";//图片ico04为白色的正方形
	
	for(var i=1;i<30;i++)
	{
	  
	  var nametu2="xiaotu"+i;
	  if(i!=idt*1)
	  {
	    var tp2=document.getElementById('xiaotu'+i);
		if(tp2!=undefined)
	    {tp2.src="/Jw_TTMS/images/ico06.gif";}//图片ico06为蓝色的正方形
	  }
	}
}

function list(idstr){
	var name1="subtree"+idstr;
	var name2="img"+idstr;
	var objectobj=document.all(name1);
	var imgobj=document.all(name2);
	
	
	//alert(imgobj);
	
	if(objectobj.style.display=="none"){
		for(i=1;i<10;i++){
			var name3="img"+i;
			var name="subtree"+i;
			var o=document.all(name);
			if(o!=undefined){
				o.style.display="none";
				var image=document.all(name3);
				//alert(image);
				image.src="/Jw_TTMS/images/ico04.gif";
			}
		}
		objectobj.style.display="";
		imgobj.src="/Jw_TTMS/images/ico03.gif";
	}
	else{
		objectobj.style.display="none";
		imgobj.src="/Jw_TTMS/images/ico04.gif";
	}
}


function person() {
	parent.mainFrame.location.href = "/Jw_TTMS/files/common/PersonalMessage.jsp";
}

</SCRIPT>

<body>
<table width="198" border="0" cellpadding="0" cellspacing="0" class="left-table01">
  <tr>
    <TD>
		<table width="100%" border="0" cellpadding="0" cellspacing="0">
		  <tr>
			<td width="207" height="55" background="/Jw_TTMS/images/nav01.gif">
				<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
				  <tr>
					<td width="30%" rowspan="2"><img src="../../${emp.emp_image}" width="40" height="40" onclick= "person()"/></td>
					<td width="70%" height="22" class="left-font01">您好，<span class="left-font02">${emp.emp_name}</td>
				  </tr>
				  <tr>
					<td height="22" class="left-font01">
					<!-- <input type = "button" value = "注销" class="left-font01" onClick = "Logout();"> -->
						[&nbsp;<a href="/Jw_TTMS/LogoutServlet" target = "_top" class="left-font01">退出</a>&nbsp;]</td>
				  </tr>
				</table>
			</td>
		  </tr>
		</table>
		
		<%
		String type = (String)request.getSession().getAttribute("type");
		if (type.equals("1")) {
			
		%>

		<!--  任务系统开始    -->
		<!-- <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img8" id="img8" src="/Jw_TTMS/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
								<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('8');" >影片管理</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree8" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu20" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="../admin/addplay.jsp" target="mainFrame" class="left-font03" onClick="tupian('20');">添加影片</a></td>
				</tr>
				<tr>
				  <td width="9%" height="21" ><img id="xiaotu21" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="mode.jsp" target="mainFrame" class="left-font03" onClick="tupian('21');">影片信息查看</a></td>
				</tr>
				
      </table> -->
		<!--  任务系统结束    -->

		




		<!--  消息系统开始    -->
		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img7" id="img7" src="/Jw_TTMS/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
								<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('7');" >座位管理</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree7" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu24" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%">
						<a href="../admin/addseat.jsp" target="mainFrame" class="left-font03" onClick="tupian('24');">添加座位
							</a></td>
				</tr>
				
				<tr>
				  <td width="9%" height="21" ><img id="xiaotu21" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="../admin/editseat.jsp" target="mainFrame" class="left-font03" onClick="tupian('21');">编辑座位</a></td>
				</tr>
      </table>
		<!--  消息系统结束    -->

		
		
        <TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img1" id="img1" src="/Jw_TTMS/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
								<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('1');" >演出厅管理</a></td>
					</tr>
					
				</table>
			</td>
          </tr>		  
        </TABLE>
		<table id="subtree1" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu22" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="../admin/addstudio.jsp" target="mainFrame" class="left-font03" onClick="tupian('22');">添加演出厅</a></td>
				</tr>
				<tr>
				  <td width="9%" height="20" ><img id="xiaotu1" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="../admin/liststudio.jsp" target="mainFrame" class="left-font03" onClick="tupian('1');">演出厅列表</a></td>
				</tr>
				
      </table>
		<!--  项目系统结束    -->

	  <!-- 管理系统开始 -->
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="8%"><img name="img5" id="img5" src="/Jw_TTMS/images/ico04.gif" width="8" height="11" /></td>
                  <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('5');">员工管理</a></td>
                </tr>
            </table></td>
          </tr>
      </table>

	  <table id="subtree5" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
        <tr>
          <td width="9%" height="20"><img id="xiaotu13" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
          <td width="91%"><a href="../admin/register.jsp" target="mainFrame" class="left-font03" onClick="tupian('13');">添加员工</a></td>
        </tr>
        
        <tr>
          <td width="9%" height="20"><img id="xiaotu14" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
          <td width="91%"><a href="../admin/listemployee.jsp" target="mainFrame" class="left-font03" onClick="tupian('14');">员工列表</a></td>
        </tr>
        
      </table>
      
      
	  <!-- 管理系统结束-->


	  <!--  售票系统开始    -->
	  <!-- <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="8%" height="12"><img name="img3" id="img3" src="/Jw_TTMS/images/ico04.gif" width="8" height="11" /></td>
                  <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('3');" >售票系统（暂不可用）</a></td>
                </tr>
            </table></td>
          </tr>
      </table>
	  
	  <table id="subtree3" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
        <tr>
          <td width="9%" height="20" ><img id="xiaotu8" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
          <td width="91%"><a href="mode.jsp" target="mainFrame" class="left-font03" onClick="tupian('8');">票务信息查看</a></td>
        </tr>
		<tr>
          <td width="9%" height="20" ><img id="xiaotu9" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
          <td width="91%"><a href="mode.jsp" target="mainFrame" class="left-font03" onClick="tupian('9');">售票</a></td>
        </tr>

      </table> -->
	
	  <!--  售票系统结束    -->

	   <!--  考勤系统开始    -->
	  <!--  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="8%" height="12"><img name="img4" id="img4" src="/Jw_TTMS/images/ico04.gif" width="8" height="11" /></td>
                  <td width="92%"><a href="javascript:" target="mainFrame" class="left-font03" onClick="list('4');" >退票系统（暂不可用）</a></td>
                </tr>
            </table></td>
          </tr>
      </table>
	  
	  <table id="subtree4" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" cellspacing="0" class="left-table02">
		<tr>
          <td width="9%" height="20" ><img id="xiaotu11" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
          <td width="91%"><a href="mode.jsp" target="mainFrame" class="left-font03" onClick="tupian('11');">票务信息查看</a></td>
        </tr>
	  	<tr>
          <td width="9%" height="20" ><img id="xiaotu12" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
          <td width="91%"><a href="mode.jsp" target="mainFrame" class="left-font03" onClick="tupian('12');">退票</a></td>
        </tr>
      </table> -->

      <!--  考勤系统结束    -->

	
		
     <!-- 系统帮助开始 -->
      <table width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
        <tr>
          <td height="29"><table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="8%"><img name="img6" id="img6" src="/Jw_TTMS/images/ico04.gif" width="8" height="11" /></td>
                <td width="92%"><a href="/Jw_TTMS/files/admin/UserMgr.jsp" target="mainFrame" class="left-font03" onClick="list('6');">登录管理</a></td>
              </tr>
          </table></td>
        </tr>
      </table>
	 <!-- 系统帮助结束-->
	<%
		}
	%>
	 <!--个人信息管理开始-->

		<TABLE width="100%" border="0" cellpadding="0" cellspacing="0" class="left-table03">
          <tr>
            <td height="29">
				<table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td width="8%"><img name="img9" id="img9" src="/Jw_TTMS/images/ico04.gif" width="8" height="11" /></td>
						<td width="92%">
								<a href="javascript:" target="mainFrame" class="left-font03" onClick="list('9');" >个人管理</a></td>
					</tr>
				</table>
			</td>
          </tr>		  
        </TABLE>

		<table id="subtree9" style="DISPLAY: none" width="80%" border="0" align="center" cellpadding="0" 
				cellspacing="0" class="left-table02">
				<tr>
				  <td width="9%" height="22" ><img id="xiaotu22" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="PersonalMessage.jsp" target="mainFrame" class="left-font03" 
						onClick="tupian('22');">个人信息</a></td>
				</tr>
				<!-- <tr>
				  <td width="9%" height="23" ><img id="xiaotu23" src="/Jw_TTMS/images/ico06.gif" width="8" height="12" /></td>
				  <td width="91%"><a href="mode.jsp" target="mainFrame" class="left-font03" 
						onClick="tupian('23');">任务信息查看</a></td>
				</tr> -->
      </table>
		<!--  个人信息结束    -->

	  </TD>
  </tr>
  
</table>
</body>
</html>

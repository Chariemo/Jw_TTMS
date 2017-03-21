<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- <%
	String type = (String) request.getSession().getAttribute("type");
	if (type.equals("-1")) {
	%>
	<jsp:forward page="/Jw_TTMS/login.jsp"></jsp:forward>
	<%
	}
%> --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>2426影院管理系统</title>
</head>
<%request.getSession().setAttribute("tip", null);%>

<frameset rows="59,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="files/common/top.jsp" name="topFrame" scrolling="no" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="213,*" frameborder="no" border="0" framespacing="0">
    <frame src="files/common/left.jsp" name="leftFrame" scrolling="no" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="files/common/mainfra.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
  </frameset>
</frameset>
<noframes><body>
</body>
</noframes></html>

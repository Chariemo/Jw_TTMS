<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="cn.edu.xupt.ttms.model.Seat" %>
    <%@ page import="cn.edu.xupt.ttms.model.Studio" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>座位编辑</title>
<link rel="stylesheet" type="text/css" href="/Jw_TTMS/css/common.css" />
<link rel="stylesheet" rev="stylesheet" href="/Jw_TTMS/css/style.css" type="text/css" media="all" />


<style type="text/css">
 .front{width: 380px;margin: 5px 32px 45px 32px;background-color: #f0f0f0;	color: #666;text-align: center;padding: 3px;border-radius: 5px;}
        .booking_area {float: right;position: relative;width:200px;height: 450px; }
        .booking_area h3 {margin: 5px 5px 0 0;font-size: 16px;}
        .booking_area p{line-height:26px; font-size:16px; color:#999}
        .booking_area p span{color:#666}
        div.seatCharts-cell {color: #1d4e31;height: 25px;width: 25px;line-height: 25px;margin: 3px;float: left;text-align: center;outline: none;font-size: 13px;}
        div.seatCharts-seat {color: #fff;cursor: pointer;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;}
        div.seatCharts-row {height: 35px;}
        div.seatCharts-seat.available {background-color: #bddeab;}
        div.seatCharts-seat.focused {background-color: #76B474;border: none;}
        div.seatCharts-seat.selected {background-color: #d145fe;}
        div.seatCharts-seat.unavailable {background-color: #eb1c0c;cursor: not-allowed;}
        div.seatCharts-container {border-right: 1px dotted #adadad;width: 400px;padding: 20px;float: left;}
        div.seatCharts-legend {padding-left: 0px;position: absolute;bottom: 16px;}
        ul.seatCharts-legendList {padding-left: 0px;}
        .seatCharts-legendItem{float:left; width:90px;margin-top: 10px;line-height: 2;}
        span.seatCharts-legendDescription {margin-left: 5px;line-height: 30px;}
        .checkout-button {display: block;width:80px; height:24px; line-height:20px;margin: 10px auto;border:1px solid #999;font-size: 14px; cursor:pointer}
        #seats_chose {max-height: 150px;overflow-y: auto;overflow-x: none;width: 200px;}
        #seats_chose li{float:left; width:72px; height:26px; line-height:26px; border:1px solid #d3d3d3; background:#f7f7f7; margin:6px; font-size:14px; font-weight:bold; text-align:center}
</style>

<script type="text/javascript" src="/Jw_TTMS/css/jquery.js"></script>
<script type="text/javascript" src="/Jw_TTMS/css/jquery.seat-charts.min.js"></script>
<script language="JavaScript" type="text/javascript">

var req;
function getStudio()
{
	document.getElementById("fom").action="/Jw_TTMS/StudioServlet?method=search&from=editseat";
	   document.getElementById("fom").submit();
}

function creatseat()
{
	var stateVal=document.getElementById("studio").value;
	var url = "/Jw_TTMS/SeatServlet?method=search";
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
		req.send("studio_id=" + stateVal);
	}
}
//回调函数
function complete() 
{
	if (req.readyState == 4 && req.status == 200)
	{
		var json =  eval("(" + req.responseText + ")");
		var row_count = json.row_count;
		var col_count = json.col_count;
		var strid = json.listids;
		
		var list = strid.split(",");
			
		$('#seat_area1').empty()
		var index = 0;
		var temp;
		var status;
		
	 	for (var r = 1; r <= row_count; r++) {
			for (var c = 1; c <= col_count; c++) {
				
				temp = list[index++].split(" ");
				value = temp[0];
				status = temp[1];
				if (value != "") {
					var checkBox="<input type='checkbox' " + 
					  " name= 'seat'" + " value=".concat(value);
				

				if (status == "1") {
					
					checkBox = checkBox + " checked = 'checked'";
				}
				
				checkBox = checkBox + ">";				
				$("#seat_area1").append(checkBox);
			}}
			$("#seat_area1").append("<br/>");
			
		} 
	}
}

function selectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "seat" && !obj[i].disabled){
			obj[i].checked = true;
		}
	}
}

function unselectAll(){
	var obj = document.fom.elements;
	for (var i=0;i<obj.length;i++){
		if (obj[i].name == "seat" && !obj[i].disabled){
			if (obj[i].checked==true) obj[i].checked = false;
			else obj[i].checked = true;
		}
	}
}

function delete1() {
	document.getElementById("fom").action="/Jw_TTMS/SeatServlet?method=delete&from=editseat";
	   document.getElementById("fom").submit();
}

</script>
</head>

<body class="ContentBody">
  <form action="/Jw_TTMS/SeatServlet?method=update&from=editseat" method="post" name="fom" id="fom" onsubmit = "">
<div class="MainDiv">
<table width="99%" border="0" cellpadding="0" cellspacing="0" class="CContent">
  <tr>
      <th class="tablestyle_title" >座位编辑页面</th>
  </tr>

		<TR>
			<TD width="100%">
	<div class="head">
    
</div>
<div class="container">
<span class="newfont07">选择：<a href="#" class="right-font08" onclick="selectAll();">全选</a>-<a href="#" class="right-font08" onclick="unselectAll();">反选</a></span>
    <div class="demo clearfix">
        <!---左边座位列表----->
        
        <div id="seat_area" class="seatCharts-container">
            <div class="front">屏幕</div>
            <div id = "seat_area1" class = "front"></div>	
            
        </div>
        <!---右边信息----->
        <div class="booking_area">
     
        <p>请选择演出厅：</p>
            <p><select name="studio" id = "studio" onchange = "creatseat()" >
            <option value = "" selected = "selected">点击查找获取演出厅</option>
            			<%
            			ArrayList<Studio> liststu = (ArrayList<Studio>) request.getAttribute("liststu");
            			if (liststu != null && liststu.size() > 0) {
            				for (int m = 0; m < liststu.size(); m++) {
            					if (liststu.get(m).getStudio_flag() == 1) {
            						%>
            						<option value = "<%=liststu.get(m).getStudio_id()%>"><%=liststu.get(m).getStudio_name()%></option>
            						<%
            					}
            				}
            			}
            			
            			%>
                     </select><span><input type="button" value="查找" class = "button" onclick = "getStudio()"/></span>
                          </p>
             	
           
          	
            <br/><br/><br/>
            
            <input type = "submit" value = "提交修改" class = "button">
            <input type = "button" value = "删除座位" class = "button" onclick = "delete1()">
           
            <p> ${result}</p>
            <div id="legend" class="seatCharts-legend"><ul class="seatCharts-legendList"><li class="seatCharts-legendItem"><div><span><input type = "checkbox" checked = "checked" disabled = "disabled"></span></div><span class="seatCharts-legendDescription">可用</span></li><li class="seatCharts-legendItem"><div><span><input type = "checkbox" disabled = "disabled"></span></div><span class="seatCharts-legendDescription">不可用</span></li></ul></div>
        </div>
    </div>
</div>			
			  
		</TD>
		</TR>
		</TABLE>

</div>
</form>
</body>
</html>

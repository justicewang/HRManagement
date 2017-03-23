<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.User" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script data-require="jquery@*" data-semver="3.1.1"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script src="Script/script.js"></script>
<link rel="stylesheet" href="css/style.css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>User table management</title>
</head>
<body>
<jsp:useBean id="datahandler" class="com.service.UserService" />
<table class="table table-bordered table-striped table-hover">
	<tr>
		<th>Username</th><th>Password</th><th>Option</th><th>Option</th>
	</tr>
	<%
		String tr = "";
		int x=0;
		for(User u :datahandler.user_list) {
			tr+="<tr id="+x+">";
			tr+="<td class='username' >"+u.getUsername()+"</td>"+"<td class='hideCls'>"+"<input class='inputname' type='text' />"+"</td>"
				+"<td class='password' >"+u.getPassword()+"</td>" +"<td class='hideCls'>"+"<input class='inputpassword' type='text' />"+"</td>"
				+"<td><a class='edit' herf='#'>"+"<img src='img/edit_icon.png' style='width:24px;height:24px' />"+"</a></td>"
				+"<td class='hideCls save'><a herf='#'>"+"<img src='img/save_icon.png' style='width:24px;height:24px' />"+"</a></td>"
				+"<td><a class='delete' herf='#'>"+"<img src='img/delete_icon.png' style='width:24px;height:24px' />"+"</a></td>"
				+"<td class='hideCls cancel'><a herf='#'>"+"<img src='img/cancel_icon.png' style='width:24px;height:24px' />"+"</a></td>";
			tr+="</tr>";
			x++;
		}
		out.print(tr);
	%>
	<tr id="add_fn_row">
		<td><input type="text" id="newname" placeholder="user name" /></td>
		<td><input type="text" id="newpassword" placeholder="password" /></td>
		<td><a id="addbutton" href="#"><img src='img/add_icon.jpg' style='width:24px;height:24px' /></a></td>
	</tr>
</table>
</body>
</html>
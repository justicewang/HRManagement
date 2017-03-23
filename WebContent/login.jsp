<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="user" class="com.model.User" />
	<jsp:setProperty name="user" property="*" />
	<jsp:useBean id="DBhandler" class="com.dao.UserDAO" />
<%
	if(DBhandler.validate(user)) {
		response.sendRedirect("view.jsp");
	}	
	else{
		String message = "username or password is not match.";
		request.getSession().setAttribute("message", message);
		response.sendRedirect("index.jsp");
	}	
%>
</body>
</html>
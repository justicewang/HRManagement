<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="datahandler" class="com.service.UserService" />
	<%
		int x = 0;
		String name = request.getParameter("name"); 
		String password = request.getParameter("password");
		x = datahandler.DeleteUser(name,password);
		if(x==1)
			response.sendRedirect("view.jsp");
		else{
			session.setAttribute("delete", "error can not delete user");
			response.sendRedirect("view.jsp");
		}	
	%>
</body>
</html>
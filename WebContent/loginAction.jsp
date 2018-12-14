<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HIP GALLARY</title>
</head>
<body>

	<%
		PrintWriter script = response.getWriter();
	
		UserDAO userDAO = new UserDAO();

		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String)session.getAttribute("userID");			
		}

		if(userID != null) {
			script.println("<script>");
			script.println("alert('이미 Login하셨습니다')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		
		int result = userDAO.login(user.getUserID(), user.getUserPassword());
		
		if(result == 1) {
			session.setAttribute("userID", user.getUserID());

			script.println("<script>");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		} else if(result == 0) {
			script.println("<script>");
			script.println("alert('Password가 틀렸습니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if(result == -1) {
			script.println("<script>");
			script.println("alert('존재하지 않는 ID입니다.')");
			script.println("history.back()");
			script.println("</script>");
		} else if(result == -2) {
			script.println("<script>");
			script.println("alert('데이터베이스 오류가 발생하였습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>
</html>
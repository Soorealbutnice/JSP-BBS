<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HIP GALLARY</title>
</head>
<body>

	<%
		PrintWriter script = response.getWriter();
	
		if(user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null
				|| user.getUserGender() == null || user.getUserEmail() == null) {
			script.println("<script>");
			script.println("alert('개인정보를 모두 입력해주세요')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			UserDAO userDAO = new UserDAO();
			int result = userDAO.join(user);
			
			if(result == -1) {
				script.println("<script>");
				script.println("alert('이미 존재하는 ID입니다.')");
				script.println("history.back();");
				script.println("</script>");
			} else {
				session.setAttribute("userID", user.getUserID());
				script.println("<script>");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
		
	%>

</body>
</html>
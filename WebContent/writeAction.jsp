<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HIP GALLARY</title>
</head>
<body>

	<%
		PrintWriter script = response.getWriter();
	
		BbsDAO bbsDAO = new BbsDAO();

		String userID = null;
		
		if(session.getAttribute("userID") == null) {
			script.println("<script>");
			script.println("alert('Login 후 Post이 가능합니다.')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} else {	
			userID = (String) session.getAttribute("userID");
			if(bbs.getBbsTitle() != null || bbs.getBbsContent() != null) {
				int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent());
				
				if(result == -1) {
					script.println("<script>");
					script.println("alert('데이터베이스 오류가 발생했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					script.println("<script>");
					script.println("location.href='bbs.jsp'");
					script.println("</script>");
				}
			} else {
				script.println("<script>");
				script.println("alert('제목과 내용을 모두 작성해주세요')");
				script.println("history.back()");
				script.println("</script>");
			}
		}

	%>

</body>
</html>
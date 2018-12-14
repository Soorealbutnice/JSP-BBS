<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsID"/>
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

		int result = bbsDAO.delete(bbs.getBbsID());
		
		if(result == 1) {
			script.println("<script>");
			script.println("alert('글이 삭제되었습니다.')");
			script.println("location.href='bbs.jsp'");			
			script.println("</script>");
		} else {
			script.println("<script>");
			script.println("alert('글 삭제를 실패하였습니다.')");
			script.println("history.back();");			
			script.println("</script>");
		}
	%>

</body>
</html>
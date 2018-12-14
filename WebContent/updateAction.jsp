<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page"/>
<jsp:setProperty name="bbs" property="bbsTitle"/>
<jsp:setProperty name="bbs" property="bbsContent"/>
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

			if(bbs.getBbsTitle() != null && bbs.getBbsContent() != null) {
				int result = bbsDAO.update(bbs.getBbsTitle(), bbs.getBbsID(), bbs.getBbsContent());
				if(result == -1) {
					script.println("<script>");
					script.println("alert('데이터베이스 오류가 발생했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					script.println("<script>");
					script.println("alert('글이 수정되었습니다.')"); 
					script.println("location.href='view.jsp?bbsID="+bbs.getBbsID()+"'");
					script.println("</script>");
				}
			} else {
				script.println("<script>");
				script.println("alert('제목과 내용을 모두 작성해주세요')");
				script.println("history.back()");
				script.println("</script>");
			}

	%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>HIP GALLARY</title>
</head>
<body>
	
	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		} 
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 글입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
	%>

	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="3" style="background-color: #eeeeee; text-align: center;">글 보기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">글 제목</td>
							<td colspan="2"><%=bbs.getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
						</tr>
						<tr>
							<td style="width: 20%;">작성자</td>
							<td colspan="2"><%=bbs.getUserID() %></td>
						</tr>
						<tr>
							<td style="width: 20%;">작성일자</td>
							<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) %></td>
						</tr>
						<tr>
							<td style="width: 20%;">글 내용</td>
							<td colspan="2" style="min-height: 200px; text-align: left;"><%=bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
						</tr>
					</tbody>
				</table> 
				<a href="bbs.jsp" class="btn btn-primary">목록</a>
				<%
					if(userID != null && userID.equals(bbs.getUserID())){
				%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
					<a href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
				<%
					}
				%>
		</div>
	</div>


	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
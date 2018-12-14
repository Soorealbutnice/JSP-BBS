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
		PrintWriter script = response.getWriter();	
	
		String userID = null;
		
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));

		Bbs bbs = new BbsDAO().getBbs(bbsID);
		
		String bbsTitle = bbs.getBbsTitle();
		String bbsContent = bbs.getBbsContent();
	%>

	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row">
			<form method="POST" action="updateAction.jsp">
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">글 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="글제목" name="bbsTitle" value="<%=bbsTitle %>" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글내용" name="bbsContent" maxlength="2048" style="height:350px;"><%=bbsContent %></textarea></td>
						</tr>
					</tbody>
				</table> 
				<input type="hidden" name="bbsID" value="<%=bbsID %>">
				<input type="submit" value="글수정" class="btn btn-primary pull-right">
			</form>
		</div>
	</div>


	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
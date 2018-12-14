<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>HIP GALLARY</title>
</head>
<body>
	<%	
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>

	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">no</th>
						<th style="background-color: #eeeeee; text-align: center;">title</th>
						<th style="background-color: #eeeeee; text-align: center;">writer</th>
						<th style="background-color: #eeeeee; text-align: center;">date</th>
					</tr>
				</thead>
				<tbody>
				<%
					BbsDAO bbsDAO = new BbsDAO();
					ArrayList<Bbs> list = bbsDAO.getList(pageNumber);
					for(int i=0; i < list.size(); i++){
						int bbsID = (Integer)list.get(i).getBbsID();
				%>
				<tr>
					<td><%= list.get(i).getBbsID() %></td>
					<td><a href="view.jsp?bbsID=<%= bbsID %>"><%= list.get(i).getBbsTitle() %></a></td>
					<td><%= list.get(i).getUserID() %></td>
					<td><%= list.get(i).getBbsDate().substring(0, 11) %></td>
				</tr>
				<% 
					}
				%>

				</tbody>
			</table> 
			<%
				if(pageNumber != 1) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber-1 %>" class="btn btn-primary btn-arrow-left">&lt;&lt;</a>
			<%
				} else {
			%>
				<a href="#" class="btn btn-secondary btn-arrow-left">&lt;&lt;</a>
			<%	
				}
				
				if(bbsDAO.nextPage(pageNumber + 1)){
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber+1 %>" class="btn btn-primary btn-arrow-right">&gt;&gt;</a>
			<%
				} else {
			%>
				<a href="#" class="btn btn-secondary btn-arrow-right">&gt;&gt;</a>
			<% 		
				}
			%>
			<%
				if(session.getAttribute("userID") != null) {
			%>
			<a href="write.jsp" class="btn btn-primary pull-right">Post</a>
			<%
				}
			%>
			
		</div>
	</div>
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
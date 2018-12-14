<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>HIP GALLARY</title>
<style>
  #columns{
    column-width:210px;
    column-gap: 15px;
  }
  #columns figure{
    display: inline-block;
    margin:0;
    margin-bottom: 15px;
  }
  #columns img{
    width:100%;
    border-radius: 25px;
    box-shadow: 2px 2px 5px rgba(0,0,0,0.8);
  }
  #columns figure {
    margin-top:11px;
  }
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>

	<div class="container">
		<div class="jumbotron" style="background-color: #e42520;">
			<div class="container">
				<h1 style="color: white;">YOUNG, WILD AND FREE</h1>
				<p>So what we get drunk. So what we smoke weed. We’re just having fun. We don’t care who sees. So what we go out. That’s how it's supposed to be Living young and wild and free</p>
			</div>
		</div>
	</div>
	<div class="container">
	 <div id="columns">
	 	<% for(int i=1; i < 14; i++) { %>
	      <figure>
	        <img src="img/<%= i %>.jpg">
	      </figure> 
	    <%} %>    
	 </div>
	 </div>
	 
	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
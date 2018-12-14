<%@ page language="java" contentType="text/html; charset=EUC-KR"
pageEncoding="EUC-KR"%>

<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<link href="https://fonts.googleapis.com/css?family=Shadows+Into+Light" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Anton" rel="stylesheet">

	<%
		String userID = null;
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		String path = request.getContextPath();
	%>
	<nav class="navbar">
		<div class="navbar-header">
			<a class="navbar-brand" href="main.jsp" style="font-size:3rem;font-family: 'Anton', sans-serif; color:#e42520;">SUPRE</a>
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				    <span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
			</button>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="active"><a href="main.jsp" style="font-size:3rem; color:#ff4500;">Main</a></li>
				<li><a href="bbs.jsp" style="font-size:3rem; color:#ff4500;">Board</a></li>
			</ul>
			
			<% 
				if(userID == null) {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown" style="font-size:3rem;">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="font-family: 'Anton', sans-serif; color:black; font-size: 2rem;">Drop<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp" style="font-family: 'Anton', sans-serif;">Login</a></li>
						<li><a href="join.jsp" style="font-family: 'Anton', sans-serif;">Join</a></li>
					</ul>
				</li>
			</ul>
			
			<%
			} else {
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown" style="font-size:3rem;">
					<a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false" style="font-family: 'Anton', sans-serif; color:black; font-size: 2rem;">MyPage<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">Logout</a></li>
					</ul>
				</li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
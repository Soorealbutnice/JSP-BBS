<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">D
<title>HIP GALLARY</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	
	<div class="container">
		<div class="col-lg-4"></div>
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top:20px;">
				<form method="POST" action="loginAction.jsp">
					<h3 style="text-align: center;">Login</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="Password" name="userPassword">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="Login">
				</form>
			</div>
		</div>
		<div class="col-lg-4"></div>
	</div>


	<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>
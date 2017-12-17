<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="stylesheet.css" type="text/css"/>
</head>
<script type="text/javascript">
function validateUser() {
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;

	if (username.length < 1) {
		window.alert("Username is empty");
		return false;
	}

	if (password.length < 1) {
		window.alert("Password is empty");
		return false;
	}

	return true;

}
</script>
<body>
<div id="content">
<div id="content">
	<h1> Login </h1>
<form action="process_login.jsp" method="POST" onsubmit="return validateUser();">
	<label for="username">Username</label>
	<input type="text" name="username">
	<br/>
	<label for="password">Password</label>
	<input type="password" name="password">
	<br/>
	<input type="submit" value="Login">
</form>
</div>
<div id="nav-bar">
<nav>
<div id="nav-link">
  <a href="index.jsp">Home</a> |
  <a href="post.jsp">Post</a> |
  <a href="demo.jsp">Demo</a> | 
  <a href="bonus.jsp">Bonus</a>
</div>
<div id="nav-logout">
	<%@include file="session.jsp" %>
</div>

</nav>
</div>
<div id="nav-footer">
<div id="nav-link">
  <a href="privacy.jsp">Privacy Policy</a>
</div>
</div>
</body>
</html>
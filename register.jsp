<!DOCTYPE html>
<html>
<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="stylesheet.css" type="text/css"/>
	<script src='https://www.google.com/recaptcha/api.js'></script>
</head>
<script type="text/javascript">
function validateUser() {
	var username = document.getElementById("username").value;
	var password = document.getElementById("password").value;
	var email = document.getElementById("email").value;

	if (username.length < 1) {
		window.alert("Username is empty");
		return false;
	}

	if (password.length < 1) {
		window.alert("Password is empty");
		return false;
	}

	if (email.length < 1) {
		window.alert("Email is empty");
		return false;
	}

	return true;

}
</script>
<body>
<div id="content">
	<h1> Register </h1>
<form action="process_register.jsp" method="POST" onsubmit="return validateUser();">
	<label for="username">Username</label>
	<input type="text" id="username" name="username">
	<br/>
	<label for="password">Password</label>
	<input type="password" id="password" name="password">
	<br/>
	<label for="email">Email</label>
	<input type="text" id="email" name="email">
	<br/>
	<label for="admin">Is Admin?</label>
	<input type="checkbox" id="admin" name="admin">
	<br/>
	<div class="g-recaptcha" data-sitekey="6LddIT0UAAAAAGaTpVkIRG2S59hZyymIvfK1LURd"></div>
	<br/>
	<input type="submit" value="Register">
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
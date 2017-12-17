<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="stylesheet.css" type="text/css"/>
</head>
<body>
<div id="content">
<h2>Various Encryption / Decryption Pages</h2>
<h2>Interesting CAPTCHA</h2>
Here we implemented Google's reCAPTCHA in our <a href="register.jsp">register</a> page. This type of captcha system actually uses an amazing system that detects whether or not your previous actions were that of a bot. If it is deemed so, you would be required to answer a CAPTCHA!
<h2>Multi-factor Authentication</h2>
Our system will actually send you an email when you register. If you enter the code here<br/> <a href="activate.jsp">Activate my Account</a> (you must set a query parameter with ?code=, this is found in the email).
<br/>
If you did not receive an email. Please click here to find your verification code: <a href="find_code.jsp">Verification code</a>
<br/>For demo purposes we will just provide the activation link there.
<br/>You will no longer be unverified!
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
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="stylesheet.css" type="text/css"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div id="content">
<h2>Various Encryption / Decryption Pages</h2>
<form action="crypto_util.jsp">
	Cipher Method:
	<select name="cipher">
		<option value="AES/CBC/PKCS5Padding">AES/CBC/PKCS5Padding</option>
		<option value="AES/ECB/PKCS5Padding">AES/ECB/PKCS5Padding</option>
		<option value="DES/CBC/PKCS5Padding">DES/CBC/PKCS5Padding</option>
		<option value="RSA/ECB/PKCS1Padding">RSA/ECB/PKCS1Padding</option>
		<option value="DESede/CBC/PKCS5Padding">DESede/CBC/PKCS5Padding</option>
	</select>
	<br/>
	Message:
	<input type="text" name="message">
	<br/>
	Key:
	<input type="text" name="key">
	<br/>
	To Encrypt or not Encrypt
	<input type="checkbox" name="encrypt" checked>
	<br/>
	<input type="submit" value="Encrypt/Decrypt">
</form>
<h2>Interesting CAPTCHA</h2>
Here we implemented Google's reCAPTCHA in our <a href="register.jsp">register</a> page. This type of captcha system actually uses an amazing system that detects whether or not your previous actions were that of a bot. If it is deemed so, you would be required to answer a CAPTCHA!
<h2>Multi-factor Authentication</h2>
Our system will actually send you an email when you register. If you enter the code here<br/> <a href="activate.jsp">Activate my Account</a> (you must set a query parameter with ?code=, this is found in the email).
<br/>
If you did not receive an email. Please click here to find your verification code: <a href="find_code.jsp">Verification code</a>
<br/>For demo purposes we will just provide the activation link there.
<br/>You will no longer be unverified!
<h2>Mobile Application</h2>
The website is responsive. I had to add a few things in order to get the layout correctly displaying. <br/>Then I created a mobile application using an embedded WebKit view! It looks pretty nice!<br/>
<img src="images/iphone1.png" style="width:20%; height:20%;"/>
<img src="images/iphone2.png" style="width:20%; height:20%;"/>
<img src="images/iphone3.png" style="width:20%; height:20%;"/>
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
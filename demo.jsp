<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="stylesheet.css" type="text/css"/>
</head>
<body>
<div id="content">
<h2>SQL Injection Attack</h2>
These attacks will prey on developers and how they write SQL statements in their code. Some developers will use concatenation of variables to a SQL statement and that could certainly lead to trouble! We will provide a demo page that does not use prepared statements.
<br/><br/>
<a href="insert_valid_demo.jsp">Insert an entry into dummy table</a></br>
<a href="select_all_delete_demo.jsp?first_name=%27%3B+DELETE+%2A+from+example+WHERE+first_name+LIKE+%27%25">Select all with condition and delete all injection</a></br>
<a href="view_dummy_table.jsp">View dummy table</a><br/>
<br/>
<br/>
A fix for this is to use prepared statements, where we insert ? for the variables. Then, we use a method that is very abstracted and sanitized to void any and all illegal input. JDBC also provides two methods that only work for read or write (not for both): <code>executeQuery()</code> and <code>executeUpdate()</code> which makes it even safer.

<h2>Cross-Site Forgery and Prevention</h2>
Our posting page has CSRF token protection. To demo this, we made another <a href="post2.jsp">post page</a>.
<br/><br/>
This one will contain an injected request that users may mistaken click. For example the green submit button that is not supposed to be there.<br/><br/>
To prevent things like this, we use a CSRF token to prevent attackers from injecting in query parameters that users may accidently click the link too therefore exposing his/her session and vulnerable to making a request they never intended to make.<br/>
<br/>
Check out your <a href="view_session.jsp">session variables</a> to see what CSRF token you have! <br/>
<i>Note: You must be logged in</i>
<h2>Web Site Defacing</h2>
<a href="deface_site.jsp">Protest on website (10 posts)</a><br/>
<a href="clean_up_protest.jsp">Clean up protest </a>
<h2>Cookies</h2>
<a href="store_last_visited.jsp">Store my last visited</a>
<br/>
<a href="view_last_visited.jsp">View cookies</a>
<br/>
<a href="clear_cookies.jsp">Clear cookies</a>
<h2>Session Management</h2>
<a href="view_session.jsp">View my session variables</a>
<br/>
<a href="reset_session.jsp">Reset my session!</a>
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
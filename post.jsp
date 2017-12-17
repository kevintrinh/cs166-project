
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="stylesheet.css" type="text/css"/>
</head>
<script type="text/javascript">
	function validatePost() {
		var title = document.getElementById("title").value;
		var content_body = document.getElementById("content_body").value;

		if (title.length < 1) {
			window.alert("Title can't be empty!");
			return false;
		}

		if (content_body.length < 1) {
			window.alert("Content cannot be empty!");
			return false;
		}

		return true;
	}
</script>
<body>
<div id="content">
	<h1> Post </h1>
	<%
if (session.getAttribute("loggedInAs") == null) {
	%>
	Please login or register to post something!
	<%
} else {
%>
<form action="process_post.jsp" onsubmit="return validatePost();" method="POST">
	<label for="title">Title</label><br/>
	<input type="text" id="title" name="title">
	<br/>
	<label for="content_body">Content</label><br/>
	<textarea type="text" id="content_body" name="content_body" rows="10"></textarea>
	<br/>
	<input type="text" name="csrfToken" style="display:none" value="<% out.print(session.getAttribute("csrfToken")); %>">
	<input type="submit" value="Post">
</form>
<%
}
%>
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
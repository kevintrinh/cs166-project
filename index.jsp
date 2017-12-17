<%@include file="database.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="stylesheet.css" type="text/css"/>
</head>
<body>
<div id="content">

<%
String selectSqlStr = "SELECT * from posts ORDER BY id DESC";
PreparedStatement stmt = con.prepareStatement(selectSqlStr);
ResultSet rs = stmt.executeQuery();
while (rs.next()) {
	%>
<div class="post">
<div class="options">
	
<%
String userId = rs.getString("userId");
String loggedInAs = (String) session.getAttribute("loggedInAs");
String isAdmin = (String) session.getAttribute("isAdmin");
if ((loggedInAs != null && userId.equals(loggedInAs)) || isAdmin != null) {
%>
<a href="process_delete.jsp?id=<% out.print(rs.getString("id")); %>">Delete</a>
<% } %>
</div>
<div class="title">
<% out.print(rs.getString("title")); %> <font style="color:gray; font-size:14px;">(<% out.print(rs.getString("userId")); %>)</font>
</div>
<% out.print(rs.getString("content")); %>
</div>


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
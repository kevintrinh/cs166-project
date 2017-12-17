<%
Cookie resetLastVisited = new Cookie("last_visited", "");
resetLastVisited.setMaxAge(0);
response.addCookie(resetLastVisited);
%>
<h1>Resetting your cookies (only for this site)</h1>
You can reset a cookie by setting its max age to be zero and adding it to the response header!
<br/>
<br/>
<a href="demo.jsp">Go back</a>
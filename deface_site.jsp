<%@include file="database.jsp" %>
<%
String title = request.getParameter("title");
String content_body = request.getParameter("content_body");
String loggedInAs = (String) session.getAttribute("loggedInAs");

String csrfToken = (String) request.getParameter("csrfToken");

String csrfTokenSession = (String) session.getAttribute("csrfToken");

String insertSqlStr = "INSERT INTO posts (title, content, userId) VALUES (?, ?, ?)";

for (int i=0; i<10; i++) {
	PreparedStatement postStatement = con.prepareStatement(insertSqlStr);
	postStatement.setString(1, "NET NEUTRALITY IS EVIL");
	postStatement.setString(2, "WE MUST GET RID OF NET NEUTRALITY!!<br/> <img src='images/net_neutrality.png'/>");
	postStatement.setString(3, "protestor");

	postStatement.executeUpdate();
}

response.sendRedirect("index.jsp");

%>
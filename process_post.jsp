<%@include file="database.jsp" %>
<%
String title = request.getParameter("title");
String content_body = request.getParameter("content_body");
String loggedInAs = (String) session.getAttribute("loggedInAs");

String csrfToken = (String) request.getParameter("csrfToken");

Integer csrfTokenSession = (Integer) session.getAttribute("csrfToken");

if (csrfToken.equals("" + csrfTokenSession)) {
String insertSqlStr = "INSERT INTO posts (title, content, userId) VALUES (?, ?, ?)";

PreparedStatement postStatement = con.prepareStatement(insertSqlStr);
postStatement.setString(1, title);
postStatement.setString(2, content_body);
postStatement.setString(3, loggedInAs);

postStatement.executeUpdate();

response.sendRedirect("index.jsp");
}

%>
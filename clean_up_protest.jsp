<%@include file="database.jsp" %>
<%
String id = request.getParameter("id");

boolean allowDelete = false;
String getUserForPostSqlStr = "DELETE FROM posts WHERE userId='protestor'";
PreparedStatement getUserStatement = con.prepareStatement(getUserForPostSqlStr);
getUserStatement.executeUpdate();
response.sendRedirect("index.jsp");

%>

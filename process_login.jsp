<%@include file="database.jsp" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

String loginSqlStr = "SELECT username, admin FROM users WHERE username=? and password = sha2(?, 256)";

PreparedStatement loginStatement = con.prepareStatement(loginSqlStr);

loginStatement.setString(1, username);
loginStatement.setString(2, password);

ResultSet loginResult = loginStatement.executeQuery();


if ( loginResult.next() ) {
session.setAttribute("loggedInAs", username);
session.setAttribute("isAdmin", loginResult.getString("admin"));
Random rand = new Random();
session.setAttribute("csrfToken", rand.nextInt(200000));
response.sendRedirect("index.jsp");
} else {
%>
<h1>Wrong information</h1>
<a href="login.jsp">Go back</a>
<%
}
%>
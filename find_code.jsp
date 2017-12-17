<%@include file="database.jsp" %>
<%

String loggedInAs = (String) session.getAttribute("loggedInAs");

String selectSqlStatement = "SELECT code from authentication WHERE userId='" + loggedInAs + "'";

Statement statement = con.createStatement();
ResultSet rs = statement.executeQuery(selectSqlStatement);
if (rs.next()) {
	%> <a href="activate.jsp?code=<% out.print(rs.getString("code")); %>">Activation link, click here.</a><%

} else {
	%><h1>You should be logged in for this to work!</h1><%
}


%>
<a href="bonus.jsp">Go back</a>
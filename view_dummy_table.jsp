<h1>Viewing dummy table!</h1>


<%@include file="database.jsp" %>
<%

String selectSqlStr = "SELECT first_name, last_name FROM example";

PreparedStatement selectStatement = con.prepareStatement(selectSqlStr);
ResultSet rs = selectStatement.executeQuery();

while(rs.next()) {
	%><b>First Name:</b><% out.print(rs.getString("first_name")); %> <br/><%
	%><b>Last Name:</b><% out.print(rs.getString("last_name"));
	%><br/><br/><%
}

%>
<br/>
<br/>
<a href="demo.jsp">Go back</a>
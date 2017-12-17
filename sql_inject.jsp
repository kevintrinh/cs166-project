<h1>Inserting an entry into dummy table!</h1>
<a href="demo.jsp">Go back</a>

<%@include file="database.jsp" %>
<%

String insertSqlStr = "INSERT INTO example (first_name, last_name) VALUES (?, ?)";

PreparedStatement postStatement = con.prepareStatement(insertSqlStr);
postStatement.setString(1, "John");
postStatement.setString(2, "Doe");

postStatement.executeUpdate();

}

%>
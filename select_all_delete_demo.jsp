<h1>Select all from table and deleting all from database</h1>
Look at the following string</br></br>
<code>
	String selectSqlStatement = "SELECT * from example WHERE first_name='" + first_name "'";
</code>
</br>
We're able to set first_name as = "'; DELETE * from example WHERE first_name LIKE '%" in order to finish the rest of the statement and adding another one. Making note of the last quotation mark as well.
</br>
</br>
This allows us to insert another statement into the SQL statement and delete all tables from database.
<br/>
<a href="demo.jsp">Go back</a>

<%@include file="database.jsp" %>
<%

String first_name = request.getParameter("first_name");
first_name = "John";
String selectSqlStatement = "SELECT * from example WHERE first_name='" + first_name + "'";

Statement statement = con.createStatement();
statement.executeQuery(selectSqlStatement);

String deleteStatement = "DELETE FROM example WHERE first_name LIKE '%'";

Statement statementDelete = con.createStatement();
statementDelete.executeUpdate(deleteStatement);

%>
<h1>Activating your account</h1>


<%@include file="database.jsp" %>
<%

String code = request.getParameter("code");


if (code != null) {

String getUserAssocWithCode = "SELECT userId from authentication WHERE code=?";

PreparedStatement getStatement = con.prepareStatement(getUserAssocWithCode);

getStatement.setString(1, code);

ResultSet getResult = getStatement.executeQuery();

if (getResult.next()) {
	String updateUser = "UPDATE users SET verified='on' WHERE username=?";
	PreparedStatement updateStatement = con.prepareStatement(updateUser);
	updateStatement.setString(1, getResult.getString("userId"));

	updateStatement.executeUpdate();
	%>
	You have been authenticated!
	<%
} else {
	%>
	Invalid code or no code provided!
<%
}

} else {
	%>
	Invalid code or no code provided! <%
}
%>
<br/>
<a href="bonus.jsp">Go back</a>
<%@include file="database.jsp" %>
<%
String id = request.getParameter("id");

boolean allowDelete = false;
String getUserForPostSqlStr = "SELECT userId from posts WHERE id=?";
PreparedStatement getUserStatement = con.prepareStatement(getUserForPostSqlStr);
getUserStatement.setInt(1, Integer.parseInt(id));

ResultSet getResult = getUserStatement.executeQuery();


if (getResult.next()) {
	String userId = getResult.getString("userId");
	String loggedInAs = (String)session.getAttribute("loggedInAs");
	if (userId.equals(loggedInAs)) {
	allowDelete = true;
}
}

String isAdmin = (String) session.getAttribute("isAdmin");

if ((isAdmin != null && isAdmin.equals("on")) || allowDelete) {
	String deleteSqlStr = "DELETE from posts WHERE id=?";

	PreparedStatement deleteStatement = con.prepareStatement(deleteSqlStr);

	deleteStatement.setString(1, id);

	deleteStatement.executeUpdate();	
	response.sendRedirect("index.jsp");
} else {
	%>
	<h1>Could not delete post! You do not own it!</h1>
	<%
}



%>
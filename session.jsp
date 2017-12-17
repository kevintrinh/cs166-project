<%@ page import = "java.sql.*, java.util.*, java.io.*" %>
<% 

Connection con2=null;
try {
Class.forName("com.mysql.jdbc.Driver");
con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs166", "root", "");
}
catch(Exception e) {
	out.print(e.getMessage());
	return;
}
String loggedInAs = (String) session.getAttribute("loggedInAs");
if (loggedInAs == null) {
%>  

<font id="username">Hi, Guest</font>
<a href="login.jsp">Login</a> | 
<a href="register.jsp">Register</a>

<% 
} else {
String verifiedSqlStr = "SELECT verified FROM users WHERE username=?";

PreparedStatement selectStatement = con2.prepareStatement(verifiedSqlStr);
selectStatement.setString(1, loggedInAs);
ResultSet resultSet = selectStatement.executeQuery();
boolean verified = false;
if (resultSet.next()) {
	if (resultSet.getString("verified") != null) {
		verified = true;
	}
}
%>

<font id="username">Hi, <% out.print(loggedInAs); %></font>
<% if (verified == false) {
%>
<font style="color:red">Unverified</font>
<%	
}
%>
<a href="logout.jsp">Logout</a>
<%
}
%>
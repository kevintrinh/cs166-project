<%@ page import = "java.sql.*, java.util.*, java.io.*" %><%		
Connection con=null;
try {
Class.forName("com.mysql.jdbc.Driver");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs166", "root", "");
}
catch(Exception e) {
	out.print(e.getMessage());
	return;
}
%>
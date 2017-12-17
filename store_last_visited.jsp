<%@ page import = "java.util.*, java.text.*" %>

<%

DateFormat df = new SimpleDateFormat("MM/dd/yyyy");
Date today = Calendar.getInstance().getTime();   
Cookie lastVisitedCookie = new Cookie("last_visited", df.format(today));
lastVisitedCookie.setMaxAge(24 * 24 * 60);
response.addCookie(lastVisitedCookie);

%>
<h1>Stored your last visited date!</h1>
<% out.print(df.format(today)); %>
<br/>
<a href="demo.jsp">Go back</a>
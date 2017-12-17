<%@ page import = "java.util.*" %>
<h1>Here is your session information</h1>
<%
Enumeration keys = session.getAttributeNames();
while (keys.hasMoreElements())
{
  String key = (String)keys.nextElement();
  out.println(key + ": " + session.getValue(key) + "<br>");
}
%>
<a href="demo.jsp">Go Back</a>
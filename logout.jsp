<%
session.setAttribute("loggedInAs", null);
session.setAttribute("isAdmin", null);
session.setAttribute("csrfToken", null);
response.sendRedirect("index.jsp");	
%>
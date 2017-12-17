<%@include file="database.jsp" %>
<%@ page import = "java.net.HttpURLConnection, java.net.URL, java.util.Random" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String email = request.getParameter("email");

String responseCaptcha = request.getParameter("g-recaptcha-response");

HttpURLConnection connection = null;

boolean validCaptcha = false;
StringBuilder result = new StringBuilder();

try {

URL url = new URL("https://www.google.com/recaptcha/api/siteverify?secret=6LddIT0UAAAAAHaHUtmdw2JnrObBu2vCttSeElEj&response=" + responseCaptcha);
connection = (HttpURLConnection) url.openConnection();
connection.setRequestMethod("GET");
connection.setRequestProperty("Content-Length", "0");
connection.connect();
InputStream in = new BufferedInputStream(connection.getInputStream());

                BufferedReader reader = new BufferedReader(new InputStreamReader(in));

                String line;
                while ((line = reader.readLine()) != null) {
                    result.append(line);
                }
if (result.toString().contains("\"success\": true")) {
	validCaptcha = true;
}

} catch (Exception e) {
	result.append(e.getMessage());
}

if (validCaptcha) {

String admin = request.getParameter("admin");

String checkExistSqlStr = "SELECT username FROM users WHERE username=?";

PreparedStatement existStatement = con.prepareStatement(checkExistSqlStr);

existStatement.setString(1, username);
ResultSet existResult = existStatement.executeQuery();


if ( existResult.next() ) {
%> 
<h1> Username is already taken! </h1>
<a href="register.jsp">Go back</a>
<%
} else {

String registerSqlStr = "INSERT INTO users (username, password, email, admin) VALUES (?, sha2(?, 256), ?, ?)";


PreparedStatement registerStatement = con.prepareStatement(registerSqlStr);

registerStatement.setString(1, username);
registerStatement.setString(2, password);
registerStatement.setString(3, email);
registerStatement.setString(4, admin);

String insertToAuthentication = "INSERT into authentication (code, userId) VALUES (?, ?)";


Random rand = new Random();
PreparedStatement authStatement = con.prepareStatement(insertToAuthentication);
authStatement.setString(1, "" + rand.nextInt(2000000));
authStatement.setString(2, username);

authStatement.executeUpdate();


registerStatement.executeUpdate();
session.setAttribute("loggedInAs", username);
session.setAttribute("isAdmin", admin);

session.setAttribute("csrfToken", "" + rand.nextInt(200000));
response.sendRedirect("index.jsp");	
}
} else {
	%>
	<h1>You failed Captcha! </h1>
	<%
}
%>
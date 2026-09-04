<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // If already logged in, skip straight to the dashboard
    if (session.getAttribute("role") != null) {
        response.sendRedirect(request.getContextPath() + "/main-menu.jsp");
        return;
    }

    // Optional error flag passed back from the login servlet, e.g. login.jsp?error=1
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental Clinic - Login</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body class="page-login">

    <div class="login-container">
        <div class="login-header">
            <h2>Sunrise Dental Clinic</h2>
            <p>Enter your credentials to access the system</p>
        </div>

        <% if ("1".equals(error)) { %>
        <div class="alert-box" style="margin-bottom: 20px;">
            Invalid username or password. Please try again.
        </div>
        <% } %>

        <form action="<%= request.getContextPath() %>/LoginServlet" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" placeholder="Enter username" required autocomplete="off">
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter password" required>
            </div>

            <button type="submit" class="btn-submit-login">Login</button>
        </form>
    </div>

</body>
</html>

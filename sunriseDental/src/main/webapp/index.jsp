
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Require login
    String role = (String) session.getAttribute("role");
    if (role == null || role.trim().isEmpty()) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental Clinic - Main Menu</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body class="page-menu">

    <header class="navbar">
        <h1>Sunrise Dental Clinic</h1>
        <div class="user-info">
            <span>Role: <strong><%= role %></strong></span>
            <a href="<%= request.getContextPath() %>/LogoutServlet" class="btn-logout">Logout</a>
        </div>
    </header>

    <main class="container">
        <div class="welcome-text">
            <h2>System Dashboard</h2>
            <p>Select a module from below to manage clinic operations.</p>
        </div>

        <div class="menu-grid">
            <a href="<%= request.getContextPath() %>/register-appointment.jsp" class="menu-card">
                <div>
                    <div class="card-icon">📅</div>
                    <div class="card-title">Register Appointment</div>
                    <div class="card-desc">Add new patient records and schedule appointment slots with available dentists.</div>
                </div>
                <div class="card-action">Open Registration &rarr;</div>
            </a>

            <a href="<%= request.getContextPath() %>/display.jsp" class="menu-card">
                <div>
                    <div class="card-icon">🔍</div>
                    <div class="card-title">Display Appointment</div>
                    <div class="card-desc">Search existing appointments by Appointment ID to view full patient histories.</div>
                </div>
                <div class="card-action">Search Records &rarr;</div>
            </a>

            <a href="<%= request.getContextPath() %>/bill.jsp" class="menu-card">
                <div>
                    <div class="card-icon">💳</div>
                    <div class="card-title">Calculate & Print Bill</div>
                    <div class="card-desc">Compute final charges based on treatment type and print structured patient receipts.</div>
                </div>
                <div class="card-action">Generate Bill &rarr;</div>
            </a>

            <a href="<%= request.getContextPath() %>/help.jsp" class="menu-card">
                <div>
                    <div class="card-icon">❓</div>
                    <div class="card-title">Help & User Guide</div>
                    <div class="card-desc">View step-by-step instructions and system guidelines for clinical staff.</div>
                </div>
                <div class="card-action">View Guide &rarr;</div>
            </a>
        </div>
    </main>

</body>
</html>

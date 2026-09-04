<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Require login
    String role = (String) session.getAttribute("role");
    if (role == null || role.trim().isEmpty()) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    // Preserve whatever the user searched for so the field doesn't clear on submit.
    // Replace the sample record below with a real DB lookup keyed on searchId.
    String searchId = request.getParameter("searchId");
    if (searchId == null) {
        searchId = "";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental Clinic - Display Appointment</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body class="page-display">

    <header class="navbar">
        <h1>Sunrise Dental Clinic</h1>
        <a href="<%= request.getContextPath() %>/main-menu.jsp" class="btn-back">&larr; Back to Main Menu</a>
    </header>

    <main class="container">
        <!-- Search Section -->
        <div class="card">
            <h2>Search Appointment Details</h2>
            <form action="<%= request.getContextPath() %>/display.jsp" method="GET" class="search-box">
                <input type="text" id="searchId" name="searchId" value="<%= searchId %>"
                       placeholder="Enter Appointment ID (e.g., APP-1001)" required autocomplete="off">
                <button type="submit" class="btn-search">Search</button>
            </form>
        </div>

        <!-- Result Section -->
        <div class="card">
            <h2>Patient Record</h2>
            <div class="details-grid">
                <div class="detail-item">
                    <span class="detail-label">Appointment ID</span>
                    <span class="detail-value">APP-1001</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Status</span>
                    <span class="detail-value"><span class="badge-status">Confirmed</span></span>
                </div>

                <div class="detail-item full-width">
                    <span class="detail-label">Patient Name</span>
                    <span class="detail-value">John Doe</span>
                </div>

                <div class="detail-item full-width">
                    <span class="detail-label">Address</span>
                    <span class="detail-value">123 Main Street, Colombo 03</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Contact Number</span>
                    <span class="detail-value">0771234567</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Assigned Dentist</span>
                    <span class="detail-value">Dr. Perera</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Treatment Type</span>
                    <span class="detail-value">Tooth Filling</span>
                </div>

                <div class="detail-item">
                    <span class="detail-label">Schedule Date & Time</span>
                    <span class="detail-value">2026-09-10 @ 10:30 AM</span>
                </div>
            </div>
        </div>
    </main>

</body>
</html>

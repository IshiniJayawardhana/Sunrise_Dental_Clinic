<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    // Require login
    String role = (String) session.getAttribute("role");
    if (role == null || role.trim().isEmpty()) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    // Preserve whatever the user searched for so the field doesn't clear on submit.
    // Replace the sample invoice below with a real DB lookup keyed on searchId.
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
    <title>Sunrise Dental Clinic - Billing & Receipt</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body class="page-bill">

    <header class="navbar">
        <h1>Sunrise Dental Clinic</h1>
        <a href="<%= request.getContextPath() %>/main-menu.jsp" class="btn-back">&larr; Back to Main Menu</a>
    </header>

    <main class="container">
        <!-- Search Panel -->
        <div class="card search-card">
            <h2>Generate Patient Bill</h2>
            <form action="<%= request.getContextPath() %>/bill.jsp" method="GET" class="search-box">
                <input type="text" name="searchId" value="<%= searchId %>"
                       placeholder="Enter Appointment ID (e.g., APP-1001)" required>
                <button type="submit" class="btn-search">Load Invoice</button>
            </form>
        </div>

        <!-- Receipt Area -->
        <div class="receipt-card">
            <div class="receipt-header">
                <h3>Sunrise Dental Clinic</h3>
                <p>No. 45, Galle Road, Colombo 03 | Tel: 011-2345678</p>
                <p><strong>OFFICIAL INVOICE / RECEIPT</strong></p>
            </div>

            <div class="meta-info">
                <div>
                    <strong>Appointment No:</strong> APP-1001<br>
                    <strong>Patient Name:</strong> John Doe
                </div>
                <div class="text-right">
                    <strong>Date:</strong> 2026-09-03<br>
                    <strong>Dentist:</strong> Dr. Perera
                </div>
            </div>

            <table class="bill-table">
                <thead>
                    <tr>
                        <th>Description</th>
                        <th class="text-right">Amount (LKR)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Consultation Fee</td>
                        <td class="text-right">2,000.00</td>
                    </tr>
                    <tr>
                        <td>Treatment Fee (Tooth Filling)</td>
                        <td class="text-right">5,000.00</td>
                    </tr>
                    <tr class="total-row">
                        <td>TOTAL AMOUNT DUE</td>
                        <td class="text-right">LKR 7,000.00</td>
                    </tr>
                </tbody>
            </table>

            <div class="actions">
                <button onclick="window.print()" class="btn-print">🖨️ Print Receipt</button>
            </div>
        </div>
    </main>

</body>
</html>

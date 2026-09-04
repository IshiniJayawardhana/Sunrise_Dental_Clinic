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
    <title>Sunrise Dental Clinic - Help & User Guide</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body class="page-help">

    <header class="navbar">
        <h1>Sunrise Dental Clinic</h1>
        <a href="<%= request.getContextPath() %>/main-menu.jsp" class="btn-back">&larr; Back to Main Menu</a>
    </header>

    <main class="container">
        <div class="card">
            <h2>System Help & Staff Instructions</h2>
            <p class="card-subtitle">Operational user guide for receptionists and clinical management staff.</p>

            <!-- Section 1 -->
            <div class="guide-section">
                <h3>📅 1. Registering a New Appointment</h3>
                <ol class="guide-steps">
                    <li>Navigate to <strong>Register Appointment</strong> from the main menu.</li>
                    <li>The system generates a unique <strong>Appointment ID</strong> automatically.</li>
                    <li>Enter complete patient details (Name, Address, Contact Number).</li>
                    <li>Select the assigned dentist, treatment type, date, and preferred time slot.</li>
                    <li>Click <strong>Save Appointment</strong> to store the record permanently.</li>
                </ol>
            </div>

            <!-- Section 2 -->
            <div class="guide-section">
                <h3>🔍 2. Searching & Displaying Appointments</h3>
                <ol class="guide-steps">
                    <li>Select <strong>Display Appointment</strong> from the main dashboard.</li>
                    <li>Input the target Appointment ID (e.g., <code>APP-1001</code>) in the search field.</li>
                    <li>Click <strong>Search</strong> to pull up full treatment and patient information.</li>
                </ol>
            </div>

            <!-- Section 3 -->
            <div class="guide-section">
                <h3>💳 3. Billing & Printing Receipts</h3>
                <ol class="guide-steps">
                    <li>Open <strong>Calculate & Print Bill</strong>.</li>
                    <li>Enter the Appointment ID to load treatment specifications.</li>
                    <li>The system automatically computes the total cost (Consultation + Treatment fee).</li>
                    <li>Click <strong>Print Receipt</strong> to print a paper receipt for the patient.</li>
                </ol>

                <div class="alert-box">
                    <strong>Standard Pricing Reference:</strong> Consultation fee is fixed at <strong>LKR 2,000.00</strong> across all visits.
                </div>

                <table class="fee-table">
                    <thead>
                        <tr>
                            <th>Treatment Type</th>
                            <th>Base Charge (LKR)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Dental Cleaning</td>
                            <td>3,500.00</td>
                        </tr>
                        <tr>
                            <td>Tooth Filling</td>
                            <td>5,000.00</td>
                        </tr>
                        <tr>
                            <td>Tooth Extraction</td>
                            <td>4,500.00</td>
                        </tr>
                        <tr>
                            <td>General Consultation / Other</td>
                            <td>3,000.00</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <!-- Section 4 -->
            <div class="guide-section">
                <h3>⚙️ 4. Common Troubleshooting</h3>
                <ul class="guide-steps">
                    <li><strong>Double-Booking Error:</strong> If a slot is occupied, assign an alternate time or dentist.</li>
                    <li><strong>Record Not Found:</strong> Double-check the ID format (must include the prefix, e.g., <code>APP-</code>).</li>
                </ul>
            </div>
        </div>
    </main>

</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
     String role = (String) session.getAttribute("role");
    if (role == null || role.trim().isEmpty()) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    int nextNumber = 1004;
    Object counter = application.getAttribute("appointmentCounter");
    if (counter != null) {
        nextNumber = (Integer) counter;
    }
    String appNumber = "APP-" + nextNumber;
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sunrise Dental Clinic - Register Appointment</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/style.css">
</head>
<body class="page-register">

    <header class="navbar">
        <h1>Sunrise Dental Clinic</h1>
        <a href="<%= request.getContextPath() %>/main-menu.jsp" class="btn-back">&larr; Back to Main Menu</a>
    </header>

    <main class="container">
        <div class="form-card">
            <h2>Register New Appointment</h2>

            <form action="<%= request.getContextPath() %>/RegisterAppointmentServlet" method="POST">
                <div class="form-grid">

                    <div class="form-group">
                        <label for="appNumber">Appointment Number</label>
                        <input type="text" id="appNumber" name="appNumber" value="<%= appNumber %>" readonly>
                    </div>

                    <div class="form-group">
                        <label for="contact">Contact Number</label>
                        <input type="tel" id="contact" name="contact" placeholder="077XXXXXXX" required>
                    </div>

                    <div class="form-group full-width">
                        <label for="patientName">Patient Name</label>
                        <input type="text" id="patientName" name="patientName" placeholder="Enter full patient name" required>
                    </div>

                    <div class="form-group full-width">
                        <label for="address">Address</label>
                        <input type="text" id="address" name="address" placeholder="Enter patient address" required>
                    </div>

                    <div class="form-group">
                        <label for="dentist">Assigned Dentist</label>
                        <select id="dentist" name="dentist" required>
                            <option value="">-- Select Dentist --</option>
                            <option value="Dr. Perera">Dr. Perera</option>
                            <option value="Dr. Fernando">Dr. Fernando</option>
                            <option value="Dr. Silva">Dr. Silva</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="treatment">Treatment Type</label>
                        <select id="treatment" name="treatment" required>
                            <option value="">-- Select Treatment --</option>
                            <option value="Cleaning">Dental Cleaning</option>
                            <option value="Filling">Tooth Filling</option>
                            <option value="Extraction">Tooth Extraction</option>
                            <option value="Consultation">General Consultation</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="appDate">Appointment Date</label>
                        <input type="date" id="appDate" name="appDate" required>
                    </div>

                    <div class="form-group">
                        <label for="appTime">Appointment Time</label>
                        <input type="time" id="appTime" name="appTime" required>
                    </div>

                </div>

                <div class="form-actions">
                    <button type="submit" class="btn-submit">Save Appointment</button>
                    <button type="reset" class="btn-reset">Clear</button>
                </div>
            </form>
        </div>
    </main>

    <script>
        // Auto-set the date input field to today's date
        document.getElementById('appDate').valueAsDate = new Date();
    </script>

</body>
</html>

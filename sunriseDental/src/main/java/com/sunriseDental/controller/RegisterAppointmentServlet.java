package com.sunriseDental.controller;

import com.sunriseDental.Dao.AppointmentStore;
import com.sunriseDental.model.Appointment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

	@WebServlet("/RegisterAppointmentServlet")
	public class RegisterAppointmentServlet extends HttpServlet {

	

	
	

	    private static final long serialVersionUID = 1L;

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String context = request.getContextPath();

	        // Must be logged in
	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("role") == null) {
	            response.sendRedirect(context + "/login.jsp");
	            return;
	        }

	        String patientName = trim(request.getParameter("patientName"));
	        String address = trim(request.getParameter("address"));
	        String contact = trim(request.getParameter("contact"));
	        String dentist = trim(request.getParameter("dentist"));
	        String treatment = trim(request.getParameter("treatment"));
	        String appDate = trim(request.getParameter("appDate"));
	        String appTime = trim(request.getParameter("appTime"));

	         if (isEmpty(patientName) || isEmpty(address) || isEmpty(contact)
	                || isEmpty(dentist) || isEmpty(treatment) || isEmpty(appDate) || isEmpty(appTime)) {
	            response.sendRedirect(context + "/register-appointment.jsp?error=1");
	            return;
	        }

	        String appointmentId = AppointmentStore.nextAppointmentId();
	        Appointment appointment = new Appointment(
	                appointmentId, patientName, address, contact,
	                dentist, treatment, appDate, appTime, "Confirmed"
	        );
	        AppointmentStore.save(appointment);

	        String encodedId = URLEncoder.encode(appointmentId, StandardCharsets.UTF_8.name());
	        response.sendRedirect(context + "/main-menu.jsp?registered=" + encodedId);
	    }

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        response.sendRedirect(request.getContextPath() + "/register-appointment.jsp");
	    }

	    private static String trim(String s) {
	        return s == null ? null : s.trim();
	    }

	    private static boolean isEmpty(String s) {
	        return s == null || s.isEmpty();
	    }
	}

	
	


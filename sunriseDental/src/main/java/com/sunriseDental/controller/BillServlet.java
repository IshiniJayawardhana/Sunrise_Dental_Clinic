package com.sunriseDental.controller;

import com.sunriseDental.Dao.AppointmentStore;
import com.sunriseDental.model.Appointment;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
	/**
	 * Looks up an appointment for bill.jsp, computes the invoice total from the
	 * fixed consultation fee plus the treatment's base charge (matching the
	 * pricing table on help.jsp), and forwards to bill.jsp to render the receipt.
	 */
	@WebServlet("/BillServlet")
	public class BillServlet extends HttpServlet {

	    private static final long serialVersionUID = 1L;

	    private static final double CONSULTATION_FEE = 2000.00;

	    // Treatment type -> base charge (LKR), matching help.jsp's pricing table
	    private static final Map<String, Double> TREATMENT_FEES = new HashMap<>();
	    static {
	        TREATMENT_FEES.put("Cleaning", 3500.00);
	        TREATMENT_FEES.put("Filling", 5000.00);
	        TREATMENT_FEES.put("Extraction", 4500.00);
	        TREATMENT_FEES.put("Consultation", 3000.00);
	    }
	    private static final double DEFAULT_TREATMENT_FEE = 3000.00; // "General Consultation / Other"

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        HttpSession session = request.getSession(false);
	        if (session == null || session.getAttribute("role") == null) {
	            response.sendRedirect(request.getContextPath() + "/login.jsp");
	            return;
	        }

	        String searchId = request.getParameter("searchId");
	        Appointment appointment = AppointmentStore.find(searchId);

	        request.setAttribute("searchId", searchId == null ? "" : searchId);
	        request.setAttribute("appointment", appointment);

	        if (appointment != null) {
	            double treatmentFee = TREATMENT_FEES.getOrDefault(appointment.getTreatmentType(), DEFAULT_TREATMENT_FEE);
	            double total = CONSULTATION_FEE + treatmentFee;

	            request.setAttribute("consultationFee", CONSULTATION_FEE);
	            request.setAttribute("treatmentFee", treatmentFee);
	            request.setAttribute("totalAmount", total);
	        }

	        RequestDispatcher dispatcher = request.getRequestDispatcher("/bill.jsp");
	        dispatcher.forward(request, response);
	    }
	}




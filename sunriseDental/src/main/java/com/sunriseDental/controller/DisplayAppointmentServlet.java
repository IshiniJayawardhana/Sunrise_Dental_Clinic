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

	/**
	 * Looks up an appointment by ID for display.jsp's search box.
	 * Sets request attributes "appointment" (null if not found) and "searchId",
	 * then forwards to display.jsp to render the result.
	 */
	@WebServlet("/DisplayAppointmentServlet")
	public class DisplayAppointmentServlet extends HttpServlet {

	    private static final long serialVersionUID = 1L;

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

	        RequestDispatcher dispatcher = request.getRequestDispatcher("/display.jsp");
	        dispatcher.forward(request, response);
	    }
	}

	


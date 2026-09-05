package com.sunriseDental.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	/**
	 * Authenticates the receptionist/admin against a hardcoded credential table
	 * and, on success, stores "username" and "role" in the session — the same
	 * two session attributes every JSP in this app checks for.
	 *
	 * DEMO ONLY: plaintext passwords in a static map are NOT acceptable for a
	 * real deployment. Replace CREDENTIALS with a lookup against your user
	 * table (with hashed passwords, e.g. BCrypt) before going to production.
	 */
	

	    private static final long serialVersionUID = 1L;

	    // username -> {password, role}
	    private static final Map<String, String[]> CREDENTIALS = new HashMap<>();
	    static {
	        CREDENTIALS.put("reception", new String[]{"reception123", "Receptionist"});
	        CREDENTIALS.put("admin", new String[]{"admin123", "Administrator"});
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	        String context = request.getContextPath();

	        String[] record = (username == null) ? null : CREDENTIALS.get(username.trim());

	        if (record != null && record[0].equals(password)) {
	            HttpSession session = request.getSession(true);
	            session.setAttribute("username", username.trim());
	            session.setAttribute("role", record[1]);
	            response.sendRedirect(context + "/main-menu.jsp");
	        } else {
	            response.sendRedirect(context + "/login.jsp?error=1");
	        }
	    }

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        // Login must be submitted via POST; a stray GET just goes back to the form.
	        response.sendRedirect(request.getContextPath() + "/login.jsp");
	    }
	}


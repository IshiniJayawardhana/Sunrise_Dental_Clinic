package com.sunriseDental.controller;


	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	import javax.servlet.http.HttpSession;
	import java.io.IOException;

	/**
	 * Invalidates the current session and sends the user back to the login page.
	 * Mapped from the "Logout" button in main-menu.jsp (and any other page's navbar).
	 */
	@WebServlet("/LogoutServlet")
	public class LogoutServlet extends HttpServlet {

	    private static final long serialVersionUID = 1L;

	    @Override
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        HttpSession session = request.getSession(false);
	        if (session != null) {
	            session.invalidate();
	        }
	        response.sendRedirect(request.getContextPath() + "/login.jsp");
	    }

	    @Override
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        doGet(request, response);
	    }
	}

}

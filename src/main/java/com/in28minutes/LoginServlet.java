package com.in28minutes;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		boolean isUserValid = UserValidationService.isUserValid(name, password);

		if (isUserValid) {
			request.setAttribute("name", name);
			request.setAttribute("password", password);

			request.getRequestDispatcher("/WEB-INF/views/welcome.jsp").forward(request, response);
		} else {
			String errorMessage = "Invalid login!";
			request.setAttribute("errorMessage", errorMessage);

			request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
		}

	}

}

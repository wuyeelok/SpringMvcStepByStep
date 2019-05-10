package com.in28minutes.login;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("name")
public class LoginController {

	@Autowired
	UserValidationService service;

	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String showLoginPage(HttpServletRequest request, ModelMap model) {

		String requestServletContextPath = request.getServletContext().getContextPath();
		String requestServletPath = request.getServletPath();
		String requestURL = request.getRequestURL().toString();
		String pathInfo = request.getPathInfo();

		model.put("requestServletContextPath", requestServletContextPath);
		model.put("requestServletPath", requestServletPath);
		model.put("requestURL", requestURL);
		model.put("pathInfo", pathInfo);

		model.put("loginJSPActive", "active");

		return "login";
	}

	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String handleLoginRequest(@RequestParam String name, @RequestParam String password, ModelMap model) {

		boolean isUserValid = service.isUserValid(name, password);
		if (isUserValid) {
			model.put("name", name);
			model.put("password", password);

			return "welcome";
		} else {
			model.put("errorMessage", "Invalid login!");
			model.put("loginJSPActive", "active");

			return "login";
		}

	}
}
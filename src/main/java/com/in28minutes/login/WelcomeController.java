package com.in28minutes.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.in28minutes.config.ConfigUtilService;
import com.in28minutes.security.SecurityUtilService;

@Controller
@SessionAttributes({ "springDispatcherURLPattern" })
public class WelcomeController {

	@Autowired
	ConfigUtilService configUtilService;

	@Autowired
	SecurityUtilService securityUtilService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String showWelcomePage(ModelMap model) {

		model.put("welcomeJSPActive", "active");

		model.put("springDispatcherURLPattern", configUtilService.getSpringDispatcherURLPattern());

		model.put("name", securityUtilService.retrieveLoggedinUserName());

		return "welcome";
	}
}
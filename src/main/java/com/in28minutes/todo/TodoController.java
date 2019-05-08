package com.in28minutes.todo;

import java.util.Date;

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
public class TodoController {

	@Autowired
	TodoService service;

	@RequestMapping(value = "/list-todos", method = RequestMethod.GET)
	public String listTodos(ModelMap model) {
		String name = String.valueOf(model.get("name"));
		model.addAttribute("todos", service.retrieveTodos(name));
		return "list-todos";
	}

	@RequestMapping(value = "/add-todo", method = RequestMethod.GET)
	public String showTodoPage() {
		return "todo";
	}

	@RequestMapping(value = "/add-todo", method = RequestMethod.POST)
	public String addTodo(@RequestParam String desc, ModelMap model, HttpServletRequest request) {
		service.addTodo(String.valueOf(model.get("name")), desc, new Date(), false);

		String requestServletPath = request.getServletPath();

		model.clear();
		return "redirect:" + requestServletPath + "/list-todos";
	}

	@RequestMapping(value = "/delete-todo", method = RequestMethod.GET)
	public String deleteTodo(@RequestParam int id, ModelMap model, HttpServletRequest request) {

		service.deleteTodo(id);

		String requestServletPath = request.getServletPath();

		model.clear();
		return "redirect:" + requestServletPath + "/list-todos";
	}
};
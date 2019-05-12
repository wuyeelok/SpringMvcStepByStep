package com.in28minutes.todo;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.in28minutes.config.ConfigUtilService;
import com.in28minutes.security.SecurityUtilService;

@Controller
@SessionAttributes({ "springDispatcherURLPattern" })
public class TodoController {

	@Autowired
	TodoService service;

	@Autowired
	ConfigUtilService configUtilService;

	@Autowired
	SecurityUtilService securityUtilService;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, false));
	}

	@RequestMapping(value = "list-todos", method = RequestMethod.GET)
	public String listTodos(ModelMap model) {
		model.addAttribute("todos", service.retrieveTodos(securityUtilService.retrieveLoggedinUserName()));

		model.put("listTodosJSPActive", "active");

		model.put("springDispatcherURLPattern", configUtilService.getSpringDispatcherURLPattern());

		model.put("name", securityUtilService.retrieveLoggedinUserName());

		return "list-todos";
	}

	@RequestMapping(value = "add-todo", method = RequestMethod.GET)
	public String showTodoPage(ModelMap model) {
		model.addAttribute("todo", new Todo(0, securityUtilService.retrieveLoggedinUserName(), "", new Date(), false));

		model.put("todoJSPActive", "active");

		model.put("springDispatcherURLPattern", configUtilService.getSpringDispatcherURLPattern());

		return "todo";
	}

	@RequestMapping(value = "add-todo", method = RequestMethod.POST)
	public String addTodo(ModelMap model, @Valid Todo todo, BindingResult result) {

		if (result.hasErrors()) {
			model.put("todoJSPActive", "active");

			return "todo";
		} else {
			service.addTodo(securityUtilService.retrieveLoggedinUserName(), todo.getDesc(), todo.getTargetDate(),
					false);

			model.clear();
			return "redirect:list-todos";
		}
	}

	@RequestMapping(value = "update-todo", method = RequestMethod.GET)
	public String updateTodo(ModelMap model, @RequestParam int id) {
		Todo todo = service.retrieveTodo(id);
		model.put("todo", todo);

		model.put("springDispatcherURLPattern", configUtilService.getSpringDispatcherURLPattern());

		return "todo";
	}

	@RequestMapping(value = "update-todo", method = RequestMethod.POST)
	public String updateTodo(ModelMap model, @Valid Todo todo, BindingResult result) {
		if (result.hasErrors()) {

			return "todo";
		} else {
			todo.setUser(securityUtilService.retrieveLoggedinUserName());
			service.updateTodo(todo);

			model.clear();
			return "redirect:list-todos";
		}
	}

	@RequestMapping(value = "delete-todo", method = RequestMethod.GET)
	public String deleteTodo(@RequestParam int id, ModelMap model) {
		service.deleteTodo(id);

		model.clear();
		return "redirect:list-todos";
	}
};
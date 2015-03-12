package com.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.service.IUserService;

@Controller
public class HomeController {
	@Autowired
	private IUserService userService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String getAllUser(ModelMap modelMap) {
		modelMap.addAttribute("userList", userService.getAllUsers());
		return "index";
	}
}

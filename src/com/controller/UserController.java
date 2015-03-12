package com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.bean.UserBean;
import com.service.IUserService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private IUserService userService;
	
	@RequestMapping(value = "/list/{userId}", method = RequestMethod.GET)
	public @ResponseBody
	UserBean getUserById(@PathVariable int userId) {
		return userService.getUserById(userId);
	}

	@RequestMapping(value = "/list/all", method = RequestMethod.GET)
	public @ResponseBody
	List<UserBean> getAllUsers() {
		return userService.getAllUsers();
	}

	@RequestMapping(value = "/list/addUser", method = RequestMethod.POST)
	public String addUser(UserBean user, RedirectAttributes attr) {
		boolean flag = userService.addUser(user);
		if (flag) {
			attr.addFlashAttribute("msg", "添加成功!");
		} else {
			attr.addFlashAttribute("msg", "添加失败!");
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/list/deleteUser", method = RequestMethod.GET)
	public String deleteUser(@RequestParam (required=true)int userId, RedirectAttributes attr) {
		boolean flag = userService.deleteUser(userId);
		if (flag) {
			attr.addFlashAttribute("msg", "删除成功!");
		} else {
			attr.addFlashAttribute("msg", "删除失败!");
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/list/updateUser", method = RequestMethod.POST)
	public String updateUser(UserBean user, RedirectAttributes attr) {
		boolean flag = userService.updateUser(user);
		if (flag) {
			attr.addFlashAttribute("msg", "修改成功!");
		} else {
			attr.addFlashAttribute("msg", "修改失败!");
		}
		return "redirect:/";
	}

}

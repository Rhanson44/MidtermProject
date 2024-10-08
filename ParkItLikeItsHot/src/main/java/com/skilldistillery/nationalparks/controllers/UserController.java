package com.skilldistillery.nationalparks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.nationalparks.data.UserDAO;
import com.skilldistillery.nationalparks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path = { "/", "home.do" })
	public String home(Model model) {
		model.addAttribute("SMOKETEST", userDAO.authenticateUser("admin", "test"));
		return "home";
	}
	
	@RequestMapping(path = "register.do", method = RequestMethod.POST)
	public String register(User user, Model model) {
		userDAO.registerUser(user);
		model.addAttribute("User", user);
		return "login";
	}

	@RequestMapping("registerForm.do")
	public String registerForm() {
		return "register";
	}
	
	@RequestMapping("account.do")
	public String accountPage(Model model, HttpSession session) {
		User user = (User)session.getAttribute("loggedInUser");
		if (user == null) {
			return "redirect:home.do";
		} else {
			model.addAttribute("user", userDAO.findUserById(user.getId()));
			return "account";
		}
	}
	
	@RequestMapping(path = "updatePassword.do", method = RequestMethod.POST)
	public String updatePassword(User user, String password, Model model) {
		if (user == null) {
			model.addAttribute("error", "User not logged in");
			return "error";
		}

		if (!userDAO.validatePassword(user.getId(), password)) {
			model.addAttribute("error", "Current password is incorrect");
			return "updatepassword";
		}

		userDAO.updatePassword(user.getId(), password);
		model.addAttribute("success", "Password updated successfully");

		return "success";
	}

}


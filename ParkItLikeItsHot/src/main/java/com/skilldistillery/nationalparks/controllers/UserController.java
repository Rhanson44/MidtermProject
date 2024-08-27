package com.skilldistillery.nationalparks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.nationalparks.data.UserDAO;
import com.skilldistillery.nationalparks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
	
	@RequestMapping(path = {"/","home.do"})
	public String home(Model model) {
		model.addAttribute("SMOKETEST", userDAO.authenticateUser("admin","test"));
		return "home";
	}
	
	@RequestMapping("registerForm.do")
	public String registerForm() {
		return "register";
	}
	
	@RequestMapping("register.do")
    public String registerUser(User user, HttpSession session) {
	   User registeredUser = userDAO.registerUser(user);
	   if(registeredUser != null) {
		   session.setAttribute("registeredUser", registeredUser);
	   }
       return "account";
    }
}

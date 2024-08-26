package com.skilldistillery.nationalparks.controllers;

import java.time.Duration;
import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.nationalparks.data.UserDAO;
import com.skilldistillery.nationalparks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class LoginController {

	@Autowired
	private UserDAO dao;

	@RequestMapping(path = "login.do", method = RequestMethod.GET)
	public String goToLogin() {

		return "login";
	}

	@RequestMapping(path = "login.do", method = RequestMethod.POST)
	public String loginUser(User user, HttpSession session) {

		user = dao.getUserByUserNameAndPassword(user.getUsername(), user.getPassword());
		LocalDateTime lt = LocalDateTime.now();

		if (dao.findUserById(user.getId()) != null) {
			session.setAttribute("loginTime", lt);
			session.setAttribute("loggedInUser", user);
			return "index";
		} else {
			return "login";
		}

	}

	@RequestMapping(path = "logout.do")
	public String logout(HttpSession session) {

		session.removeAttribute("loggedInUser");
		session.removeAttribute("loginTime");
		session.removeAttribute("timeOnSite");
		return "login";

	}

	@RequestMapping(path = "account.do")
	public String displayAcct(HttpSession session) {
		LocalDateTime loginTime = (LocalDateTime) session.getAttribute("loginTime");
		if (loginTime != null) {
			LocalDateTime now = LocalDateTime.now();
			Duration totalTime = Duration.between(loginTime, now);
			session.setAttribute("timeOnSite", totalTime);
			return "account";
		} else {
			return "login";
		}

	}
}

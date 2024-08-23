package com.skilldistillery.nationalparks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.skilldistillery.nationalparks.data.UserDAO;

@Controller
public class UserController {

	@Autowired
	private UserDAO userDAO;
}

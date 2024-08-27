package com.skilldistillery.nationalparks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.nationalparks.data.UserDAO;

@Controller
public class RegisterController {

    @Autowired
    private UserDAO userDAO;

    @PostMapping("register.do")
    public String registerUser(
            @RequestParam String username,
            @RequestParam String password,
            @RequestParam String email,
            RedirectAttributes redirectAttributes) {

        boolean registrationSuccessful = userDAO.registerUser(username, password);

        if (registrationSuccessful) {
            redirectAttributes.addFlashAttribute("message", "Registration successful. Please log in.");
            return "redirect:login.do";
        } else {
            redirectAttributes.addFlashAttribute("error", "Registration failed. Please try again.");
            return "redirect:register.html";
        }
    }
}











package com.skilldistillery.nationalparks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalparks.data.NationalParkDAO;
import com.skilldistillery.nationalparks.entities.NationalPark;
import com.skilldistillery.nationalparks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class ParkController {

	@Autowired
	private NationalParkDAO parkDAO;
	
	@RequestMapping("park.do")
	public String home(Model model) {
		model.addAttribute("parks", parkDAO.findAll());
		return "park";
	}
    @RequestMapping("comment.do")
    public String parkComments(@RequestParam("parkId") int parkId, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        NationalPark park = parkDAO.findById(parkId);
        model.addAttribute("park", park);
        model.addAttribute("comments", park.getParkComments()); 
        model.addAttribute("loggedInUser", loggedInUser);
        return "comment"; 
	
}
    @RequestMapping(value = "postComment.do", method = RequestMethod.POST)
    public String postComment(
            @RequestParam("parkId") int parkId,
            @RequestParam("content") String content,
            HttpSession session,
            Model model
    ) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "login.do"; 
        }

        NationalPark park = parkDAO.findById(parkId);
        if (park == null) {
            return "No Park found"; 
        }
		return "comment";
    }
    
}
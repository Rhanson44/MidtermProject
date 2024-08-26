package com.skilldistillery.nationalparks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.nationalparks.data.NationalParkDAO;

@Controller
public class ParkController {

	@Autowired
	private NationalParkDAO parkDAO;
	
	@RequestMapping("park.do")
	public String home(Model model) {
		model.addAttribute("NationalPark", parkDAO.findAll());
		return "park";
	}
	
}

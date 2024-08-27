package com.skilldistillery.nationalparks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalparks.data.NationalParkDAO;
import com.skilldistillery.nationalparks.entities.NationalPark;

@Controller
public class NationalParkController {
	
	@Autowired
	private NationalParkDAO parkDAO;
	
	@RequestMapping("parks.do")
	public String foundPark(Model model) {
		List<NationalPark> parks = parkDAO.findAll();
		model.addAttribute("parks", parks);
		return "park";
	}
	
}

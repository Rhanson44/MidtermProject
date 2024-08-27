package com.skilldistillery.nationalparks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalparks.data.NationalParkDAO;
import com.skilldistillery.nationalparks.entities.Animal;
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

	@RequestMapping("singlePark.do")
	public String displayAnimals(@RequestParam("parkId") int parkId, Model model) {
		NationalPark park = parkDAO.findById(parkId);

		if (park == null) {
			model.addAttribute("message", "National Park not found");
			return "error";
		}

		List<Animal> animals = park.getAnimals();
		model.addAttribute("park",park);
		model.addAttribute("animals", animals);

		return "singlePark";
	}
}

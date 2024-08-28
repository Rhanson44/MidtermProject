package com.skilldistillery.nationalparks.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.skilldistillery.nationalparks.data.NationalParkDAO;
import com.skilldistillery.nationalparks.entities.Animal;
import com.skilldistillery.nationalparks.entities.AnimalType;
import com.skilldistillery.nationalparks.entities.NationalPark;
import com.skilldistillery.nationalparks.entities.User;

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
<<<<<<< HEAD
//	@RequestMapping(path = { "success.do" }, method = RequestMethod.POST)
//	public ModelAndView newAnimal(Animal animal) {
//	    ModelAndView mv = new ModelAndView();
//
//	    
//		try {
//			
//	        
//		parkDAO.create(animal);
//		mv.setViewName("success");
//        mv.addObject("message", "Animal added successfully");
//		} catch (Exception e) {
//			
//			mv.setViewName("error");
//		mv.addObject("message", "Failed to add the animal");
//	}
//		return mv;
//	}
=======
	@RequestMapping(path = { "addAnimal.do" }, method = RequestMethod.POST)
	public ModelAndView newAnimal(@RequestParam("parkId") int parkId, Animal animal) {
		NationalPark park = parkDAO.findById(parkId);
		ModelAndView mv = new ModelAndView();
		try {
		parkDAO.create(animal);
		mv.addObject("park", park);
		mv.setViewName("success");
		
		} catch (Exception e) {
			
		mv.addObject("message", "Failed to add the animal");
	}
		return mv;
	}
>>>>>>> d0416e0a82c3be76f4301bae8030d6fb3e57d692

}

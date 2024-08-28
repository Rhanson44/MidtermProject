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
import com.skilldistillery.nationalparks.entities.NationalPark;
import com.skilldistillery.nationalparks.entities.Trail;

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
	@RequestMapping(path = "updateTrail.do", method = RequestMethod.POST)
	public ModelAndView updateTrail( Trail trail) {
		ModelAndView mv = new ModelAndView();

		try {		
			Trail updatedTrail =  parkDAO.update(trail.getId(), trail);
			System.out.println(updatedTrail);
			if (updatedTrail != null) {
				mv.addObject("trail", updatedTrail);
				mv.setViewName("redirect:singlePark.do?parkId=" + updatedTrail.getNationalParks().getId());
			} else {
				mv.addObject("message", "Failed to update the Trail.");
				mv.setViewName("error");
			}
		} catch (Exception e) {
			mv.addObject("message", "Error occurred while updating the Trail.");
			mv.setViewName("error");
			e.printStackTrace();
		}

		return mv;
	}
	@RequestMapping(path="updateTrail.do", method=RequestMethod.GET)
	public ModelAndView showUpdateForm(@RequestParam("trailId") int trailId) {
		ModelAndView mv = new ModelAndView();
//		NationalPark park = parkDAO.findById(parkId);
		Trail updateTrail = parkDAO.findByTrailId(trailId);
		mv.addObject("updatedTrail", updateTrail);
		mv.setViewName("updateTrail");
		return mv;
		
	}
	
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

//	@RequestMapping(path = { "addAnimal.do" }, method = RequestMethod.POST)
//	public ModelAndView newAnimal(@RequestParam("parkId") int parkId, Animal animal) {
//		NationalPark park = parkDAO.findById(parkId);
//		ModelAndView mv = new ModelAndView();
//		try {
//		parkDAO.create(animal);
//		mv.addObject("park", park);
//		mv.setViewName("success");
//		
//		} catch (Exception e) {
//			
//		mv.addObject("message", "Failed to add the animal");
//	}
//		return mv;
//	}


}

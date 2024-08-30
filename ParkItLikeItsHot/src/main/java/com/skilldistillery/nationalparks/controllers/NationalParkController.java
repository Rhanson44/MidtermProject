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
import com.skilldistillery.nationalparks.entities.Flora;
import com.skilldistillery.nationalparks.entities.Mountain;
import com.skilldistillery.nationalparks.entities.NationalPark;
import com.skilldistillery.nationalparks.entities.PointOfInterest;
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
	
	@RequestMapping(path = "updateAnimal.do", method = RequestMethod.POST)
	public ModelAndView updateAnimal(Animal animal) {
		ModelAndView mv = new ModelAndView();
		
		try {		
			Animal updatedAnimal =  parkDAO.updateAnimal(animal.getId(), animal);
			System.out.println(updatedAnimal);
			if (updatedAnimal != null) {
				mv.addObject("animal", updatedAnimal);
				mv.setViewName("redirect:parks.do" );
			} else {
				mv.addObject("message", "Failed to update the Animal.");
				mv.setViewName("error");
			}
		} catch (Exception e) {
			mv.addObject("message", "Error occurred while updating the Animal.");
			mv.setViewName("error");
			e.printStackTrace();
		}
		
		return mv;
	}
	@RequestMapping(path="updateAnimal.do", method=RequestMethod.GET)
	public ModelAndView showUpdateAnimalForm(@RequestParam("animalId") int animalId) {
		ModelAndView mv = new ModelAndView();
		Animal updateAnimal = parkDAO.findByAnimalId(animalId);
		mv.addObject("animalTypes", parkDAO.findAllAnimalTypes());
		mv.addObject("updatedAnimal", updateAnimal);
		mv.setViewName("updateAnimal");
		return mv;
	}
	
	@RequestMapping(path = "updateFlora.do", method = RequestMethod.POST)
	public ModelAndView updateFlora(Flora flora) {
		ModelAndView mv = new ModelAndView();
		
		try {		
			Flora updatedFlora = parkDAO.updateFlora(flora.getId(), flora);
			System.out.println(updatedFlora);
			if (updatedFlora != null) {
				mv.addObject("flora", updatedFlora);
				mv.setViewName("redirect:parks.do");
			} else {
				mv.addObject("message", "Failed to update the Flora.");
				mv.setViewName("error");
			}
		} catch (Exception e) {
			mv.addObject("message", "Error occurred while updating the Flora.");
			mv.setViewName("error");
			e.printStackTrace();
		}
		
		return mv;
	}
	@RequestMapping(path="updateFlora.do", method=RequestMethod.GET)
	public ModelAndView showUpdateFloraForm(@RequestParam("floraId") int floraId) {
		ModelAndView mv = new ModelAndView();
		Flora updateFlora = parkDAO.findByFloraId(floraId);
		mv.addObject("floraTypes", parkDAO.findAllFloraTypes());
		mv.addObject("updatedFlora", updateFlora);
		mv.setViewName("updateFlora");
		return mv;
	}

	@RequestMapping(path = "updateMountain.do", method = RequestMethod.POST)
	public ModelAndView updateMountain(Mountain mountain) {
		ModelAndView mv = new ModelAndView();
		
		try {		
			Mountain updatedMountain = parkDAO.updateMountain(mountain.getId(), mountain);
			System.out.println(updatedMountain);
			if (updatedMountain != null) {
				mv.addObject("mountain", updatedMountain);
				mv.setViewName("redirect:parks.do");
			} else {
				mv.addObject("message", "Failed to update the Mountain.");
				mv.setViewName("error");
			}
		} catch (Exception e) {
			mv.addObject("message", "Error occurred while updating the Mountain.");
			mv.setViewName("error");
			e.printStackTrace();
		}
		
		return mv;
	}
	@RequestMapping(path="updateMountain.do", method=RequestMethod.GET)
	public ModelAndView showUpdateMountainForm(@RequestParam("mountainId") int mountainId) {
		ModelAndView mv = new ModelAndView();
		Mountain updateMountain = parkDAO.findByMountainId(mountainId);
		mv.addObject("updatedMountain", updateMountain);
		mv.setViewName("updateMountain");
		return mv;
	}
	
	@RequestMapping(path = "updatePointOfInterest.do", method = RequestMethod.POST)
	public ModelAndView updatePointOfInterest(PointOfInterest pointOfInterest) {
		ModelAndView mv = new ModelAndView();
		
		try {		
			PointOfInterest updatedPointOfInterest = parkDAO.updatePointOfInterest(pointOfInterest.getId(), pointOfInterest);
			System.out.println(updatedPointOfInterest);
			if (updatedPointOfInterest != null) {
				mv.addObject("pointOfInterest", updatedPointOfInterest);
				mv.setViewName("redirect:parks.do");
			} else {
				mv.addObject("message", "Failed to update the Point Of Interest.");
				mv.setViewName("error");
			}
		} catch (Exception e) {
			mv.addObject("message", "Error occurred while updating the Point Of Interest.");
			mv.setViewName("error");
			e.printStackTrace();
		}
		
		return mv;
	}
	@RequestMapping(path="updatePointOfInterest.do", method=RequestMethod.GET)
	public ModelAndView showUpdatePointOfInterestForm(@RequestParam("poiId") int poiId) {
		ModelAndView mv = new ModelAndView();
		PointOfInterest updatePointOfInterest = parkDAO.findByPointOfInterestId(poiId);
//		mv.addObject("pointOfInterestTypes", parkDAO.findAllPointOfInterestTypes());
		mv.addObject("updatedPointOfInterest", updatePointOfInterest);
		mv.setViewName("updatePointOfInterest");
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
//
//	@RequestMapping(path = { "addAnimal.do" }, method = RequestMethod.POST)
//	public ModelAndView newAnimal(@RequestParam("animalTypeId") int animalTypeId, Animal animal) {
////		NationalPark park = parkDAO.findById(parkId);
//		ModelAndView mv = new ModelAndView();
//		try {
//		parkDAO.findByAnimalId(animalTypeId);
//		parkDAO.create(animal);
//		mv.addObject("animal", animal);
//		mv.addObject("animalTypeId", animalTypeId);
//		mv.setViewName("success");
//		
//		} catch (Exception e) {
//			
//		mv.addObject("message", "Failed to add the animal");
//	}
//		return mv;
//	}



}

package com.skilldistillery.nationalparks.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.skilldistillery.nationalparks.data.NationalParkDAO;
import com.skilldistillery.nationalparks.entities.NationalPark;
import com.skilldistillery.nationalparks.entities.NationalParkComment;
import com.skilldistillery.nationalparks.entities.PointOfInterest;
import com.skilldistillery.nationalparks.entities.PointOfInterestComment;
import com.skilldistillery.nationalparks.entities.Trail;
import com.skilldistillery.nationalparks.entities.TrailComment;
import com.skilldistillery.nationalparks.entities.User;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommentController {

    @Autowired
    private NationalParkDAO parkDAO;

    @RequestMapping("park.do")
    public String home(Model model) {
        model.addAttribute("parks", parkDAO.findAll());
        return "park";
    }

    @RequestMapping("parkComment.do")
    public String parkComments(@RequestParam("parkId") int parkId, HttpSession session, Model model) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        NationalPark park = parkDAO.findById(parkId);
        model.addAttribute("park", park);
        model.addAttribute("comments", park.getParkComments());
//        model.addAttribute("loggedInUser", loggedInUser);
        return "parkComment"; 
	
    }
    @RequestMapping("trailComment.do")
    public String trailComments(@RequestParam("trailId") int trailId, HttpSession session, Model model) {
    	User loggedInUser = (User) session.getAttribute("loggedInUser");
    	Trail trail = parkDAO.findByTrailId(trailId);
    	model.addAttribute("trail", trail);
    	model.addAttribute("comments", trail.getTrailComments());
    	model.addAttribute("loggedInUser", loggedInUser);
    	return "trailComment"; 
    	
    }
    
    @RequestMapping("poiComment.do")
    public String poiComments(@RequestParam("poiId") int poiId, HttpSession session, Model model) {
    	User loggedInUser = (User) session.getAttribute("loggedInUser");
    	PointOfInterest poi = parkDAO.findByPoiId(poiId);
    	model.addAttribute("poi", poi);
    	model.addAttribute("comments", poi.getPoiComments());
    	model.addAttribute("loggedInUser", loggedInUser);
    	return "poiComment"; 
    	
    }
    
    @RequestMapping(value = "postComment.do", method = RequestMethod.POST)
    public String postComment(
            @RequestParam("parkId") int parkId,
            @RequestParam("content") String content,
            HttpSession session,
            Model model
    ) {
        return "parkComment";
    }

    @RequestMapping(value = "postParkComment.do", method = RequestMethod.POST)
    public String postComment(@RequestParam("parkId")int parkId, NationalParkComment comment, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "login";
        }
        parkDAO.addComment(comment, parkId, loggedInUser.getId());
        return "redirect:parkComment.do?parkId=" + parkId;
    }
    
    @RequestMapping(value = "postPoiComment.do", method = RequestMethod.POST)
    public String postPoiComment(@RequestParam("poiId")int poiId, PointOfInterestComment comment, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "login";
        }
        parkDAO.addPoiComment(comment, poiId, loggedInUser.getId());
        return "redirect:poiComment.do?poiId=" + poiId;
    }


    
    @RequestMapping(value = "postTrailComment.do", method = RequestMethod.POST)
    public String postTrailComment(
        @RequestParam("trailId") int trailId,
        TrailComment comment,
        HttpSession session) { 
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "login";
        }
        if (comment == null) {
            return "error";
        }
        try {
            TrailComment savedComment = parkDAO.addTrailComment(comment, trailId, loggedInUser.getId());
            return "redirect:trailComment.do?trailId=" + savedComment.getTrail().getId();
        } catch (Exception e) {
            e.printStackTrace();
            return "error";
        }
    }
    
    @RequestMapping(value = "deleteParkComment.do", method = RequestMethod.POST)
    public String deleteComment(@RequestParam("parkId") int parkId,@RequestParam("commentId") int commentId, NationalParkComment comment, HttpSession session) {
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser == null) {
            return "login";
        }
        
        comment = parkDAO.getCommentById(commentId);
        if (comment == null || comment.getUser().getId() != loggedInUser.getId()) {
            return "error";
        }

        parkDAO.deleteComment(comment, commentId, loggedInUser.getId());
        return "redirect:parkComment.do?parkId=" + parkId;
    }
    
    @RequestMapping(value = "deleteTrailComment.do", method = RequestMethod.POST)
    public String deleteTrailComment(@RequestParam("trailId") int trailId,@RequestParam("commentId") int commentId, TrailComment comment, HttpSession session) {
    	User loggedInUser = (User) session.getAttribute("loggedInUser");
    	if (loggedInUser == null) {
    		return "login";
    	}
    	
    	comment = parkDAO.getTrailCommentById(commentId);
    	if (comment == null || comment.getUser().getId() != loggedInUser.getId()) {
    		return "error";
    	}
    	
    	parkDAO.deleteTrailComment(comment, commentId, loggedInUser.getId());
    	return "redirect:trailComment.do?trailId=" + trailId;
    }

    @RequestMapping(value = "deletePoiComment.do", method = RequestMethod.POST)
    public String deletePoiComment(@RequestParam("poiId") int poiId,@RequestParam("commentId") int commentId, PointOfInterestComment comment, HttpSession session) {
    	User loggedInUser = (User) session.getAttribute("loggedInUser");
    	if (loggedInUser == null) {
    		return "login";
    	}
    	
    	comment = parkDAO.getPoiCommentById(commentId);
    	if (comment == null || comment.getUser().getId() != loggedInUser.getId()) {
    		return "error";
    	}
    	
    	parkDAO.deletePoiComment(comment, commentId, loggedInUser.getId());
    	return "redirect:poiComment.do?poiId=" + poiId;
    }
}

package com.skilldistillery.nationalparks.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalparks.entities.Animal;
import com.skilldistillery.nationalparks.entities.NationalPark;
import com.skilldistillery.nationalparks.entities.NationalParkComment;
import com.skilldistillery.nationalparks.entities.PointOfInterest;
import com.skilldistillery.nationalparks.entities.Trail;
import com.skilldistillery.nationalparks.entities.TrailComment;
import com.skilldistillery.nationalparks.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class NationalParkDAOImpl implements NationalParkDAO {

	@PersistenceContext
	private EntityManager em;
	
	@Override
	public NationalPark findById(int id) {
		return em.find(NationalPark.class, id);
	}

	@Override
	public List<NationalPark> findAll() {
		return em.createQuery("SELECT n FROM NationalPark n", NationalPark.class).getResultList();
	}

//	@Override
//	public Animal create(Animal newAnimal) {
//		
//        newAnimal.getAnimalType()(newAnimal.getAnimalType().getId());;
//			em.persist(newAnimal);
//			em.flush();
//			return newAnimal;
//		
//		}


	@Override
	public void addComment(NationalParkComment comment, int parkId, int userId) {
		 NationalPark park = em.find(NationalPark.class, parkId);
		 User foundUser = em.find(User.class, userId);
		 comment.setNationalPark(park);
	     comment.setUser(foundUser);
		 em.persist(comment);
	}


	@Override
	public void deleteComment(NationalParkComment comment, int commentId, int userId) {
	    NationalParkComment managedComment = em.find(NationalParkComment.class, commentId);
	    if (managedComment != null) {
	        em.remove(managedComment);
	    }
	}


	@Override
	public NationalParkComment getCommentById(int commentId) {
		return em.find(NationalParkComment.class, commentId);
	}

	public Trail update(int trailId, Trail updatedTrail) {
		Trail trail = em.find(Trail.class, updatedTrail.getId());
		
		if(trail != null) {
			trail.setName(updatedTrail.getName());
			trail.setDescription(updatedTrail.getDescription());
			trail.setLatitude(updatedTrail.getLatitude());
			trail.setLongitude(updatedTrail.getLongitude());
			trail.setLengthInMiles(updatedTrail.getLengthInMiles());
			trail.setTrailDifficulty(updatedTrail.getTrailDifficulty());
		   em.merge(trail); 
		em.flush();
		}
		return trail;
	}
	
	@Override
	public Trail findByTrailId(int trailId) {
		return em.find(Trail.class, trailId);
	}
	
	public Animal update(int animalId, Animal updatedAnimal) {
		Animal animal = em.find(Animal.class, updatedAnimal.getId());
		
		if(animal != null) {
			animal.setName(updatedAnimal.getName());
			animal.setAnimalType(updatedAnimal.getAnimalType());
			animal.setEndangered(updatedAnimal.getEndangered());
			animal.setImageUrl(updatedAnimal.getImageUrl());
			em.merge(animal);
			em.flush();
		}
		return animal;
	}

	@Override
	public Animal findByAnimalId(int animalId) {
		return em.find(Animal.class, animalId);
	}



	@Override
	public TrailComment addTrailComment(TrailComment comment, int trailId, int userId) {
	    User foundUser = em.find(User.class, userId);
	    if (foundUser == null) {
	        throw new RuntimeException("User not found");
	    }
	    comment.setUser(foundUser);
	    comment.setTrail(em.find(Trail.class, trailId));
	    em.persist(comment);
	    return comment;
	}

	@Override
	public PointOfInterest findByPoiId(int poiId) {
return em.find(PointOfInterest.class, poiId);		
	}

	
	
}


package com.skilldistillery.nationalparks.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalparks.entities.Animal;
import com.skilldistillery.nationalparks.entities.AnimalType;
import com.skilldistillery.nationalparks.entities.Flora;
import com.skilldistillery.nationalparks.entities.FloraType;
import com.skilldistillery.nationalparks.entities.Mountain;
import com.skilldistillery.nationalparks.entities.NationalPark;
import com.skilldistillery.nationalparks.entities.NationalParkComment;
import com.skilldistillery.nationalparks.entities.PointOfInterest;
import com.skilldistillery.nationalparks.entities.PointOfInterestComment;
import com.skilldistillery.nationalparks.entities.PointOfInterestType;
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
	public void deletePoiComment(PointOfInterestComment comment, int commentId, int userId) {
		PointOfInterestComment managedComment = em.find(PointOfInterestComment.class, commentId);
		if (managedComment != null) {
			em.remove(managedComment);
		}
	}

	@Override
	public void deleteTrailComment(TrailComment comment, int commentId, int userId) {
		TrailComment managedComment = em.find(TrailComment.class, commentId);
		if (managedComment != null) {
			em.remove(managedComment);
		}
	}
	
	@Override
	public NationalParkComment getCommentById(int commentId) {
		return em.find(NationalParkComment.class, commentId);
	}

	@Override
	public PointOfInterestComment getPoiCommentById(int commentId) {
		return em.find(PointOfInterestComment.class, commentId);
	}
	
	@Override
	public TrailComment getTrailCommentById(int commentId) {
		return em.find(TrailComment.class, commentId);
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
	public Animal updateAnimal(int animalId, Animal updatedAnimal) {
		Animal animal = em.find(Animal.class, animalId);
		
		if(animal != null) {
			System.out.println(updatedAnimal);
			animal.setName(updatedAnimal.getName());
			animal.setAnimalType(updatedAnimal.getAnimalType());
			animal.setEndangered(updatedAnimal.getEndangered());
			animal.setImageUrl(updatedAnimal.getImageUrl());
			System.out.println(animal);
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
	public Animal update(int animalTypeId, Animal updatedAnimal) {
		return null;
	}
	
	@Override
	public List<AnimalType> findAllAnimalTypes() {
		String jpql = "SELECT t FROM AnimalType t ORDER BY t.name";
		return em.createQuery(jpql, AnimalType.class).getResultList();
	}


	@Override
	public Flora updateFlora(int floraId, Flora updatedFlora) {
		Flora flora = em.find(Flora.class, floraId);
		
		if(flora != null) {
			flora.setName(updatedFlora.getName());
			flora.setFloraType(updatedFlora.getFloraType());
			flora.setImageUrl(updatedFlora.getImageUrl());
			flora.setSpecies(updatedFlora.getSpecies());
			System.out.println(flora);
			em.merge(flora);
			em.flush();
		}
		return flora;
	}
	

	@Override
	public Flora findByFloraId(int floraId) {
		return em.find(Flora.class, floraId);
	}
	
	@Override
	public Flora update(int floraTypeId, Flora updatedFlora) {
		return null;
	}
	
	@Override
	public List<FloraType> findAllFloraTypes(){
		String jpql = "SELECT ft FROM FloraType ft ORDER BY ft.name";
		return em.createQuery(jpql, FloraType.class).getResultList();
	}



	@Override

	public PointOfInterestComment addPoiComment(PointOfInterestComment comment, int poiId, int userId) {
		User foundUser = em.find(User.class, userId);
		if (foundUser == null) {
			throw new RuntimeException("User not found");
		}
		comment.setUser(foundUser);
		PointOfInterest poi = em.find(PointOfInterest.class, poiId);
		comment.setInterests(poi);
		em.persist(comment);
		return comment;
	}

	@Override
	public PointOfInterest findByPoiId(int poiId) {
		return em.find(PointOfInterest.class, poiId);


	}
	
	@Override
	public List<Mountain> findAllMountains() {
		return em.createQuery("SELECT m FROM Mountain m", Mountain.class).getResultList();
	}

	@Override
	public Mountain findByMountainId(int mountainId) {
		return em.find(Mountain.class, mountainId);
	}
	
	@Override
	public Mountain updateMountain(int mountainId, Mountain updatedMountain) {
		Mountain mountain = em.find(Mountain.class, mountainId);
		
		if(mountain != null) {
			mountain.setName(updatedMountain.getName());
			mountain.setElevation(updatedMountain.getElevation());
			mountain.setAverageSnowfall(updatedMountain.getAverageSnowfall());
			mountain.setDescription(updatedMountain.getDescription());
			mountain.setImageUrl(updatedMountain.getImageUrl());
			System.out.println(mountain);
			em.merge(mountain);
			em.flush();
		}
		return mountain;
	}

	@Override
	public Mountain update(String mountainName, Mountain updatedMountain) {
		return null;
	}

	

	@Override
	public List<PointOfInterestType> findAllPointOfInterestTypes() {
		String jpql = "SELECT pt FROM PointOfInterestType pt ORDER BY pt.name";
		return em.createQuery(jpql, PointOfInterestType.class).getResultList();
	}
	
	@Override
	public PointOfInterest findByPointOfInterestId(int pointOfInterestId) {
		return em.find(PointOfInterest.class, pointOfInterestId);
	}

	@Override
	public PointOfInterest update(int pointOfInterestId, PointOfInterest updatedPointOfInterest) {
		return null;
	}

	@Override
	public PointOfInterest updatePointOfInterest(int poiId, PointOfInterest updatedPointOfInterest) {
		PointOfInterest pointOfInterest = em.find(PointOfInterest.class, poiId);
		
		if(pointOfInterest != null) {
			pointOfInterest.setName(updatedPointOfInterest.getName());
			pointOfInterest.setDescription(updatedPointOfInterest.getDescription());
			pointOfInterest.setLongitude(updatedPointOfInterest.getLongitude());
			pointOfInterest.setLatitude(updatedPointOfInterest.getLatitude());
			pointOfInterest.setImageUrl(updatedPointOfInterest.getImageUrl());
			System.out.println(pointOfInterest);
			em.merge(pointOfInterest);
			em.flush();
		}
		return pointOfInterest;
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

	
}


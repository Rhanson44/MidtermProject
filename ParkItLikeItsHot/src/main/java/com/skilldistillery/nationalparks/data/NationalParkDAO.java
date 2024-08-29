package com.skilldistillery.nationalparks.data;

import java.util.List;

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

public interface NationalParkDAO {

	NationalPark findById(int id);
	List<NationalPark> findAll();
	void addComment(NationalParkComment comment, int parkId, int userId);
	void deleteComment(NationalParkComment comment, int parkId, int userId);
	NationalParkComment getCommentById(int commentId);
	PointOfInterest findByPoiId(int poiId);
	Trail findByTrailId(int trailId);
	Trail update(int trailId, Trail updatedTrail);

	
	List<AnimalType> findAllAnimalTypes();
	
	Animal findByAnimalId(int animalId);
	
	Animal updateAnimal(int animalId, Animal updatedAnimal);
	
	Animal update(int animalTypeId, Animal updatedAnimal);
	
	List<FloraType> findAllFloraTypes();

	Flora findByFloraId(int floraId);
	
	Flora update(int floraId, Flora updatedFlora);

	Flora updateFlora(int floraId, Flora updatedFlora);
	
	List<Mountain> findAllMountains();
	
	Mountain findByMountainId(int mountainId);
	
	Mountain updateMountain(int mountainId, Mountain updatedMountain);
	
	Mountain update(String mountainName, Mountain updatedMountain);
	
	List<PointOfInterestType> findAllPointOfInterestTypes();

	PointOfInterest findByPointOfInterestId(int pointOfInterestId);
	
	PointOfInterest update(int pointOfInterestId, PointOfInterest updatedPointOfInterest);

	PointOfInterest updatePointOfInterest(int pointOfInterestId, PointOfInterest updatedPointOfInterest);
	

	TrailComment addTrailComment(TrailComment comment, int trailId, int id);
	PointOfInterestComment addPoiComment(PointOfInterestComment comment, int poiId, int userId);
	PointOfInterestComment getPoiCommentById(int commentId);
	void deletePoiComment(PointOfInterestComment comment, int commentId, int userId);
	void deleteTrailComment(TrailComment comment, int commentId, int userId);

	TrailComment getTrailCommentById(int commentId);
//	Animal create(Animal newAnimal);

}

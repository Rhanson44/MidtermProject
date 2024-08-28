package com.skilldistillery.nationalparks.data;

import java.util.List;

import com.skilldistillery.nationalparks.entities.Animal;
import com.skilldistillery.nationalparks.entities.NationalPark;
import com.skilldistillery.nationalparks.entities.NationalParkComment;
import com.skilldistillery.nationalparks.entities.PointOfInterest;
import com.skilldistillery.nationalparks.entities.Trail;
import com.skilldistillery.nationalparks.entities.TrailComment;

public interface NationalParkDAO {

	NationalPark findById(int id);
	
	List<NationalPark> findAll();
//	Animal create(Animal newAnimal);

	
	void addComment(NationalParkComment comment, int parkId, int userId);

	void deleteComment(NationalParkComment comment, int parkId, int userId);
//	Animal parkAnimal(Animal animal);

	NationalParkComment getCommentById(int commentId);
	PointOfInterest findByPoiId(int poiId);


	Trail findByTrailId(int trailId);


	Trail update(int trailId, Trail updatedTrail);
	
	Animal findByAnimalId(int animalId);
	
	Animal update(int animalTypeId, Animal updatedAnimal);


	TrailComment addTrailComment(TrailComment comment, int trailId, int id);

}

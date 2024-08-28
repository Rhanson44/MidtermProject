package com.skilldistillery.nationalparks.data;

import java.util.List;

import com.skilldistillery.nationalparks.entities.NationalPark;
import com.skilldistillery.nationalparks.entities.NationalParkComment;
import com.skilldistillery.nationalparks.entities.Trail;

public interface NationalParkDAO {

	NationalPark findById(int id);
	
	List<NationalPark> findAll();
//	Animal create(Animal newAnimal);

	
	void addComment(NationalParkComment comment, int parkId, int userId);

	void deleteComment(NationalParkComment comment, int parkId, int userId);
//	Animal parkAnimal(Animal animal);

	NationalParkComment getCommentById(int commentId);
	Trail findByTrailId(int trailId);


	Trail update(int trailId, Trail updatedTrail);

}

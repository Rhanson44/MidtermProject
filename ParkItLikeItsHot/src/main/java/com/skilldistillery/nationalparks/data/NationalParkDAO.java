package com.skilldistillery.nationalparks.data;

import java.util.List;


import com.skilldistillery.nationalparks.entities.Animal;
import com.skilldistillery.nationalparks.entities.NationalPark;

public interface NationalParkDAO {

	NationalPark findById(int id);
	
	List<NationalPark> findAll();
	Animal create(Animal newAnimal);


//	Animal parkAnimal(Animal animal);
	
}

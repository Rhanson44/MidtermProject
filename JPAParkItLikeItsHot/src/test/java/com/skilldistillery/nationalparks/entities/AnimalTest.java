package com.skilldistillery.nationalparks.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class AnimalTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Animal animal;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPAParkItLikeItsHot");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		animal = em.find(Animal.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(animal);
		assertEquals("American Black Bear", animal.getName());
	}
	
//	@Test
//	void np_has_animal() {
//		 assertNotNull(animal.getNationalParks());
//		 assertTrue(animal.getNationalParks().size()>0);		
//	}
	@Test
	void animal_is_an_animal_type() {
		assertNotNull(animal.getAnimalType().getName());
		assertEquals("Mammal", animal.getAnimalType().getName());
	}

}

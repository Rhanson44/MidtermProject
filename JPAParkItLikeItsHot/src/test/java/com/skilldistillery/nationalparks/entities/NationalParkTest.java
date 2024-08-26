package com.skilldistillery.nationalparks.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class NationalParkTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private NationalPark park;

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
		park = em.find(NationalPark.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(park);
		assertEquals("Rocky Mountain", park.getName());
	}
	@Test
	void test_animals_are_in_np() {
		assertNotNull(park);
		assertNotNull(park.getAnimals().size() > 0);
	}
//	@Test
//	void test_flora_are_in_np() {
//		assertNotNull(park);
//		assertNotNull(park.getFlora().size() > 0);
//	}
	@Test
	void test_poi_are_in_np() {
		assertNotNull(park);
		assertNotNull(park.getInterests().size() > 0);
	}
	@Test
	void test_mountain_are_in_np() {
		assertNotNull(park);
		assertNotNull(park.getMountains().size() > 0);
	}
	@Test
	void test_comments_are_about_np() {
		assertNotNull(park);
		assertNotNull(park.getParkComments().size() > 0);
	}
	@Test
	void test_trails_are_in_np() {
		assertNotNull(park);
		assertNotNull(park.getTrails().size() > 0);
	}
	

}

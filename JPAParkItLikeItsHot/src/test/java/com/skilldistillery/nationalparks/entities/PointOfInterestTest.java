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

class PointOfInterestTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PointOfInterest poi;

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
		poi = em.find(PointOfInterest.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(poi);
		assertEquals("Mariposa Grove", poi.getName());
	}
	@Test
	void test_interest_are_a_type() {
		assertNotNull(poi);
		assertNotNull(poi.getInterestTypes().size() > 0);
	}
	@Test
	void test_interest_have_comments() {
		assertNotNull(poi);
		assertNotNull(poi.getPoiComments().size() > 0);
	}

}

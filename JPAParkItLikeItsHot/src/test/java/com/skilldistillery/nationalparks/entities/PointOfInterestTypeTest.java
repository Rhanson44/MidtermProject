package com.skilldistillery.nationalparks.entities;

<<<<<<< HEAD
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
=======
import static org.junit.jupiter.api.Assertions.*;
>>>>>>> 63088f072074edc96b192fa257b0c75fbdcfd624

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class PointOfInterestTypeTest {
<<<<<<< HEAD
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private PointOfInterestType poiType;
=======

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PointOfInterestType poi;
>>>>>>> 63088f072074edc96b192fa257b0c75fbdcfd624

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
<<<<<<< HEAD
		poiType = em.find(PointOfInterestType.class, 1);
=======
		poi = em.find(PointOfInterestType.class, 1);
>>>>>>> 63088f072074edc96b192fa257b0c75fbdcfd624
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
<<<<<<< HEAD
=======
		poi = null;
>>>>>>> 63088f072074edc96b192fa257b0c75fbdcfd624
	}

	@Test
	void test_User_entity_mapping() {
<<<<<<< HEAD
		assertNotNull(poiType);
		assertEquals( "Visitor Center", poiType.getName());
=======
		assertNotNull(poi);
		assertEquals("Visitor Center", poi.getName());
>>>>>>> 63088f072074edc96b192fa257b0c75fbdcfd624
	}

}

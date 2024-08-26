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

class PointOfInterestTypeTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private PointOfInterestType poiType;
	
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
		poiType = em.find(PointOfInterestType.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		poiType = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(poiType);
		assertEquals( "Visitor Center", poiType.getName());
	}

}

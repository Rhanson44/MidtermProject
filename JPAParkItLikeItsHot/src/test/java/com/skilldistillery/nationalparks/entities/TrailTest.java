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

public class TrailTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private Trail trail;

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
		trail = em.find(Trail.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		trail = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(trail);
		assertEquals(45, trail.getLengthInMiles());
	}
	@Test
	void trail_has_a_user() {
		assertNotNull(trail.getUser().getPassword());
		assertEquals("admin", trail.getUser().getPassword());
	}
	@Test
	void trail_is_in_a_np() {
		assertNotNull(trail.getNationalParks().getName());
		assertEquals("Rocky Mountain",trail.getNationalParks().getName());
	}
	 @Test 
	 void test__trail_has_comments() {
		 assertNotNull(trail.getTrailComments());
		 assertTrue(trail.getTrailComments().size()>0);
	 }
}

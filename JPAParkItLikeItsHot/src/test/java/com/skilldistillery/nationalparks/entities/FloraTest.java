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

class FloraTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Flora flora;

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
		flora = em.find(Flora.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(flora);
		assertEquals("Maple Tree", flora.getName());
	}
	@Test
	void test_flora_are_in_np() {
		assertNotNull(flora);
		assertNotNull(flora.getNationalParks().size() > 0);
	}
	@Test
	void flora_is_a_flora_type() {
		assertNotNull(flora.getFloraType().getName());
		assertEquals("Tree", flora.getFloraType().getName());
	}

}

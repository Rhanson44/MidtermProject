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

class NationalParkCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private NationalParkComment npComment;

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
		npComment = em.find(NationalParkComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(npComment);
		assertEquals(1,npComment.getId() );
		
	}
		@Test
	void user_has_comment() {
		 assertNotNull(npComment.getUser());
		 assertEquals("admin",npComment.getUser().getPassword());		
	}
		@Test
		void test_comment_np_mapping() {
			assertNotNull(npComment.getNationalParks().getName());
			assertEquals("Rocky Mountain",npComment.getNationalParks().getName());
		}

}

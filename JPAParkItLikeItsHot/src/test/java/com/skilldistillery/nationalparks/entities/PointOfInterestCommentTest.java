package com.skilldistillery.nationalparks.entities;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class PointOfInterestCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private PointOfInterestComment comment;

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
		comment = em.find(PointOfInterestComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();

	}

	@Test
	void test_interest_has_comments() {
		assertNotNull(comment);
		assertEquals("1", comment.getContent());
	}

	@Test
	void poi_comments_has_interests() {
		assertNotNull(comment.getInterests().getName());
		assertEquals("Mariposa Grove", comment.getInterests().getName());
	}


}

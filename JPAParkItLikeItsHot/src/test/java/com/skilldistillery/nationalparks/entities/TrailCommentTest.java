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

public class TrailCommentTest {

	private static EntityManagerFactory emf;
	private EntityManager em;
	private TrailComment trailComment;

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
		trailComment = em.find(TrailComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(trailComment);
		assertEquals("1", trailComment.getContent());
	}
	@Test
	void comment_is_about_a_trail() {
		assertNotNull(trailComment.getTrail().getName());
		assertEquals("Alpine Ridge Trail", trailComment.getTrail().getName());
	}
	@Test
	void comment_belongs_to_a_user() {
		assertNotNull(trailComment.getUser().getPassword());
		assertEquals("admin", trailComment.getUser().getPassword());
	}
}

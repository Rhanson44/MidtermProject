package com.skilldistillery.nationalparks.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.nationalparks.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User authenticateUser(String username, String password) {
	    User user = null;
	    String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND enabled = true";
	    try {
	        user = em.createQuery(jpql, User.class)
	                .setParameter("un", username)
	                .setParameter("pw", password)
	                .getSingleResult();
	    } catch (Exception e) {
	        System.err.println("Invalid user");
	    }
	    return user;
	}

	@Override
	public User getUserByUserNameAndPassword(String username, String password) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Object findUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}
}

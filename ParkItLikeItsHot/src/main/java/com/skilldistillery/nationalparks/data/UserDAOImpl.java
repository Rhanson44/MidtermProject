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
			user = em.createQuery(jpql, User.class).setParameter("un", username).setParameter("pw", password)
					.getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid user");
		}
		return user;
	}

	@Override
	public User registerUser(User user) {
		try {
			user.setEnabled(true);
			em.persist(user);
			em.flush();
		} catch (Exception e) {
			System.err.println("Could not register user");
			e.printStackTrace();
		}
		return user;
	}
	

	@Override
	public User getUserByUserNameAndPassword(String username, String password) {
		User user = null;
		String jpql = "SELECT u FROM User u WHERE u.username = :un AND u.password = :pw AND u.enabled = true";
		try {
			user = em.createQuery(jpql, User.class).setParameter("un", username).setParameter("pw", password)
					.getSingleResult();
		} catch (Exception e) {
			System.err.println("Could not find user with the given username and password.");
		}
		return user;

	}

	@Override
	public Object findUserById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
    public boolean validatePassword(int userId, String currentPassword) {
        String jpql = "SELECT COUNT(u) FROM User u WHERE u.id = :userId AND u.password = :currentPassword";
        Long count = (Long) em.createQuery(jpql)
                                        .setParameter("userId", userId)
                                        .setParameter("currentPassword", currentPassword)
                                        .getSingleResult();
        return count != null && count > 0;
    }

	@Override
	public void updatePassword(int userId, String newPassword) {
		// TODO Auto-generated method stub
		
	}

    
   
}

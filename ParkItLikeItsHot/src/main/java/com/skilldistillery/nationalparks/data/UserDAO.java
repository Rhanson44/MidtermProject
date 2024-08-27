package com.skilldistillery.nationalparks.data;

import com.skilldistillery.nationalparks.entities.User;

public interface UserDAO {
	User authenticateUser(String username, String password);

	User getUserByUserNameAndPassword(String username, String password);

	Object findUserById(int id);
	
	User registerUser(User user);

	boolean validatePassword(int userId, String currentPassword);
    
    void updatePassword(int userId, String newPassword);
	
}

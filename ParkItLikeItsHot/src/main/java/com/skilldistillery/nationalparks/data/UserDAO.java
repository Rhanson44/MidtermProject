package com.skilldistillery.nationalparks.data;

import com.skilldistillery.nationalparks.entities.User;

public interface UserDAO {
	User authenticateUser(String username, String password);

	User getUserByUserNameAndPassword(String username, String password);

	Object findUserById(int id);
	
}

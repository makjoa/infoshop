package kr.pe.infoshop.user.service;

import java.util.HashMap;

import kr.pe.infoshop.user.model.User;

public interface UserService {
	
	User loginCheck(String id, String password);
	
	User emailCheck(String email);

	User findByUserName(String screen_name);
	
	boolean existsUsername(String screen_name);
	
	boolean existsEmail(String email);
	
	void addUser(User user);
	
	void updateUser(User user);
	
	void updateUserPoint(int setPoint);
}
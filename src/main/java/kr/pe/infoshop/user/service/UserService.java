package kr.pe.infoshop.user.service;

import kr.pe.infoshop.user.model.User;

public interface UserService {
	
	User loginCheck(User user);
	
	User emailCheck(String email);

	String findByUserId(String userId) throws Exception;
	
	void addUser(User user);
	
	void updateUser(User user);
	
	void updateUserPoint(int setPoint);
}
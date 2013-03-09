package kr.pe.infoshop.user.service.impl;


import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.pe.infoshop.user.model.User;
import kr.pe.infoshop.user.service.UserService;

@Service 
@Transactional
public class UserServiceImpl extends SqlSessionDaoSupport implements UserService {
			
	public User loginCheck(User user) {
		
		User getUser = (User)getSqlSession().selectOne("loginProcess", user);
				
		return getUser;
	}
	
	public User emailCheck(String email) {
		
		return (User) getSqlSession().selectOne("emailCheck", email);	
				
	}
	
	public String findByUserId(String userId) {			
		return (String) getSqlSession().selectOne("findByUserId", userId);
				
	}
	
	public void addUser(User user) {
		getSqlSession().insert("addUser", user);
	}
	
	public void updateUser(User user) {
		
	}
	
	public void updateUserPoint(int setPoint) {
		
		getSqlSession().update("updateUserPoint", setPoint);
	}
}

package kr.pe.infoshop.user.service.impl;


import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.pe.infoshop.user.model.User;
import kr.pe.infoshop.user.service.UserService;

@Service 
@Transactional
public class UserServiceImpl extends SqlSessionDaoSupport implements UserService {
			
	public User loginCheck(String id, String password) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("password", password);	
		return (User)getSqlSession().selectOne("user.loginProcess", map);						
	}
	
	public User emailCheck(String email) {	
		return (User) getSqlSession().selectOne("emailCheck", email);					
	}
	
	public void addUser(User user) {
		getSqlSession().insert("user.addUser", user);
	}
	
	public void updateUser(User user) {
		
	}
	
	public void updateUserPoint(int setPoint) {
		
		getSqlSession().update("updateUserPoint", setPoint);
	}

	@Override
	public User findByUserName(String username) { 
		return (User)getSqlSession().selectOne("user.findByUserName", username);
	}

	@Override
	public boolean existsUsername(String username) {
		return (boolean) getSqlSession().selectOne("user.existsUsername", username);	
	}

	@Override
	public boolean existsEmail(String email) {
		return false;
	}
}

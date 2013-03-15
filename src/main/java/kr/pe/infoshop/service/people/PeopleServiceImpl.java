package kr.pe.infoshop.service.people;

import java.util.HashMap;
import java.util.Map;

import kr.pe.infoshop.domain.player.Player;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service 
@Transactional
public class PeopleServiceImpl extends SqlSessionDaoSupport implements PeopleService {

	@Override
	public void list(Map<String, Object> map) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Player findsPlayer(int idx) {
		// TODO Auto-generated method stub
		return null;
	}

	public void createPeople(HashMap<String, String> map) {
		getSqlSession().insert("people.createPeople", map);
	}
	
	

}

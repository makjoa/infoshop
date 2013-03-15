package kr.pe.infoshop.service.people;

import java.util.HashMap;
import java.util.Map;

import  kr.pe.infoshop.domain.player.Player;

public interface PeopleService {
	
	public void list(Map<String, Object> map);
	
	public Player findsPlayer(int idx);
	
	public void createPeople(HashMap<String, String> map);
	
}

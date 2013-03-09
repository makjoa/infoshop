package kr.pe.infoshop.service.player;

import java.util.Map;

import  kr.pe.infoshop.domain.player.Player;

public interface PlayerService {
	
	public void list(Map<String, Object> map);
	
	public Player findsPlayer(int idx);
	
}

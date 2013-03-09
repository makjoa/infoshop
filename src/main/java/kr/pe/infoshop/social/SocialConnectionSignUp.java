package kr.pe.infoshop.social;

import java.util.Date;

//import com.romancecms.domain.UserInfo;

import org.springframework.social.connect.Connection;
import org.springframework.social.connect.ConnectionSignUp;

/**
 * @author 심영재
 */
public final class SocialConnectionSignUp implements ConnectionSignUp {

	@Override
	public String execute(Connection<?> connection) {
		// TODO Auto-generated method stub
		return null;
	}
/*
	@Override
	public String execute(Connection<?> connection) {
		
		// 유저 정보를 생성하고 저장
		UserInfo userInfo = new UserInfo();
		
		userInfo.setJoinDate(new Date());
		
		userInfo.setSocialUser(true);
		userInfo.setSocialDisplayName(connection.getDisplayName());
		userInfo.setSocialImageUrl(connection.getImageUrl());
		userInfo.setSocialProfileUrl(connection.getProfileUrl());
		userInfo.setSocialProviderId(connection.getKey().getProviderId());
		userInfo.setSocialProviderUserId(connection.getKey().getProviderUserId());
		userInfo.persist();
		
		return userInfo.getId().toString();
	}
*/
}

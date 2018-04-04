package com.faint.service;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.faint.domain.user;
import com.faint.persistence.UserDAO;



@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	
	@Inject
	UserDAO dao;
	// 디비에서 유저정보를 불러오는메소 이것을 AuthenticationProvider에서 인증을통함
	@Override
	public user loadUserByUsername(String email) throws UsernameNotFoundException {
		user userInfo = null;
		try {
			userInfo = dao.read1(email); //디비 정보를 불러와 유저정보 조
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

//		List<UserPermission> perms = loadPermission(userInfo.getId()); 사용자권한을 불러온다.
//		List<GrantedAuthority> auth = new ArrayList<>();
//		for (UserPermission perm : perms) {
//			auth.add(new SimpleGrantedAuthority(perm.getName()));
//		}
//		return new User(username, userInfo.getPassword(), auth);
		
		return userInfo;
	}
}

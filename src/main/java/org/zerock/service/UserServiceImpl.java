package org.zerock.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserMapper usermapper;

	@Override
	public void insert(UserVO userVO) throws Exception {
		
		usermapper.insert(userVO);
		

	}
}
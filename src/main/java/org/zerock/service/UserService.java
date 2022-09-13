package org.zerock.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.UserVO;

public interface UserService {
	
	
	// 등록
	public void insert(UserVO userVO) throws Exception;
	

	
}

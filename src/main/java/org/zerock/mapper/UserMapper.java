package org.zerock.mapper;

import javax.servlet.http.HttpSession;

import org.zerock.domain.UserVO;

public interface UserMapper {

	//회원가입
	public void insert(UserVO userVO);
	
	// 회원 로그인 체크
	//public boolean login(UserVO vo);
	
	// 회원 로그인 정보
	public UserVO login(UserVO userVO);

	public int idChk(UserVO vo);
	
	public int passChk(UserVO vo);
	
	// 회원 로그아웃
	//public void logout(HttpSession session);
	
}

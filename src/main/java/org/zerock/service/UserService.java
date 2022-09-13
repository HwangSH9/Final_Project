package org.zerock.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MemberVO;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

public interface UserService {
	
	
	
	// 등록
	public void insert(UserVO userVO) throws Exception;
	
/*	// 회원 로그인 체크
	public static boolean login(UserVO vo, HttpSession session) {
		// TODO Auto-generated method stub
		return false;
	}*/
	
	// 회원 로그인 정보
	public UserVO login(UserVO vo) throws Exception;

	// 아이디 중복체크
	public int idChk(UserVO vo) throws Exception;
	
	// 비밀번호 중복체크
	public int passChk(UserVO vo) throws Exception;
	
	
	// 회원 로그아웃
//	public void  logout(HttpSession session);
	
	
}

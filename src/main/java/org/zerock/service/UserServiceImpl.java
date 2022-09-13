package org.zerock.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.MemberCodeGen;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.zerock.controller.UserController;
import org.zerock.domain.UserVO;
import org.zerock.mapper.UserMapper;

import com.sun.istack.internal.logging.Logger;


@Service
public class UserServiceImpl implements UserService {

//	private static final Logger logger =LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserMapper usermapper;
	
	@Override
	public void insert(UserVO userVO) throws Exception {
		
		usermapper.insert(userVO);
		

	}
/*
	// 회원 로그인 체크	
	@Override
	public boolean login(UserVO vo, HttpSession session) {
		boolean result = usermapper.login(vo);
		if(result) { // 만약 true 일 경우 세선에 등록
			UserVO vo2 = viewUser(vo);
			// 세선 변수 등록
			session.setAttribute("ID", vo2.getID());
			session.setAttribute("NAME", vo2.getNAME());
		}
		return result;
	}
*/	
	// 회원 로그인 정보
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return usermapper.login(	vo);
	}

	
	// 아이디 중복 체크
		@Override
		public int idChk(UserVO vo) throws Exception {
			int result = usermapper.idChk(vo);
			return result;
		}
		
	// 비밀번호 중복 체크
			@Override
			public int passChk(UserVO vo) throws Exception {
				int result = usermapper.passChk(vo);
				return result;
			}
				
		
	// 회원 로그 아웃
	//@Override
	//public void logout(HttpSession session) {
		// 세션 변수 개별 삭제
		// session.removeAttribute("ID");
		// 세선 정보를 초기화 시킴
	//	session.invalidate();
		
	//}
}
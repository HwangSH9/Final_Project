package org.zerock.controller;


import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/user/*")
public class UserController {
	
	private static final Logger Logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired 
	public UserService service;
	
	@Inject
	BCryptPasswordEncoder pwdEncoder;
	
	@GetMapping("/signup")
	public void sign() {
		log.info("ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁget sing.do");
	}
	
	@PostMapping("/signup")
	public String UserMember(UserVO userVO) throws Exception {
		Logger.info("post register");
		int result = service.idChk(userVO);
		try {
			if(result == 1) {
				return "/member/register";
			}else if(result == 0) {
				String inputPass = userVO.getPW();
				String pwd = pwdEncoder.encode(inputPass);
				userVO.setPW(pwd);
				
				service.insert(userVO);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
			return "redirect:/";
		
	}
	
	@GetMapping("/login")
	public void login() {
		log.info("@@@@@@@@@@@@@@@@ login.do");
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(UserVO vo) throws Exception{
		
		
		
		
		return "redirect:/";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(UserVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public int idPass(UserVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}



	
}

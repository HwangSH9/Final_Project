package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.domain.UserVO;
import org.zerock.service.UserService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = "/user/*")
public class UserController {
	
	@Autowired 
	public UserService service;
	
	@GetMapping("/signup")
	public void sign() {
		log.info("get sing.do");
	}
	
	@PostMapping("/signup")
	public String UserMember(UserVO userVO) throws Exception {
		service.insert(userVO);
		log.info(userVO);
			return "redirect:/";
	}
	
	
}

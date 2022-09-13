package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.zerock.domain.UserVO;

import lombok.AllArgsConstructor;

@Controller 
@AllArgsConstructor
public class InquireController {
	
	@GetMapping("/inquire")
	public void inquire() {
	}

}


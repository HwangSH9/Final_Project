package org.zerock.mapper;

import org.zerock.domain.MemberVO;

public interface MemberMapper {

	// Page662 MemberMapper 인터페이스 생성 후 read() 추상 메서드 정의함.
	public MemberVO read(String userid);
	
	
}

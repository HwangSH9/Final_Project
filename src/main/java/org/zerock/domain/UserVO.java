package org.zerock.domain;

import java.util.Date;
import java.util.List;

import lombok.Data;

// Page660 회원 도메인 : tbl_member 테이블을 MyBatis를 이용하는
//                   코드로 처리하기 위해 코딩함
@Data
public class UserVO {
	
	private String USERCODE;         //유저코드
	private String ID;               //아이디
	private String PW;               //패스워드
	private String EMAIL;            //이메일
	private String USER_IMAGE;        //유저이미지
	private String NAME;             //이름
	private String BIRTH;            //생년월일
	private String PHONE_NUM;         //전화번호
	private String ADDRESS1;          //도로명주소
	private String ADDRESS2;          //지번주소
	private String ADDRESS3;          //상세주소

	
	
	// MemberVO 클래스는 내부적으로 여러 개의 사용자 권한을 가질 수 있는 구조로 설계합니다.
	//private List<AuthVO> authList;	
	
}

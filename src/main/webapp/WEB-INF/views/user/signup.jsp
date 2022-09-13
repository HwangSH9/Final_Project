<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="./css/style.css">
    <script src ="signUpjs.js"></script> 
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   
    <script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</head>
<style>
#header img{
    width : 700px;
    height: 230px;
}

#header p{
    font-size : 80px;
    font-family: 'Gowun Dodum', sans-serif;
    margin-top : 50px;
    margin-bottom: 2%;

}


.d_form {
    margin: .2em 0;
    font-size: 15px;
    padding: .5em;
    border: 1px solid #ccc;
    border-color: #dbdbdb #d2d2d2 #d0d0d0 #d2d2d3;
    vertical-align: middle;
    line-height: 1.25em;
    outline: 0;
    width: 20em;
    height : 50px;
    background-color : #E6E8E8;
    padding: 10px 110px 10px 14px;
    padding-top: 10px;
    padding-right: 110px;
    padding-bottom: 10px;
    padding-left: 14px;
    box-sizing: border-box;
}

.d_form.mini {
    width: 7em;
}
#container, #footer, #header {
    min-width: 220px;
    margin: 0 15px;
    margin-top: 0px;
    margin-right: 15px;
    margin-bottom: 0px;
    margin-left: 15px;
    box-sizing: border-box;
}
boby, html {
    width: 100%;
    height: 100%;
}

body {
    background-color: #E6FFFF;
}
div{
    display : block;
    
}
header{
    text-align : center;
}
select{
    font-size : 3px;
    border : 1px solid gray;
    height : 30px;
    padding : 5px;
}

#mail_Input{
    display : inline-block;
    width : 50%;
}
#mail_Select{
    width : 50%;
    font-size : 13px;
    border : 1px solid lightgray;
    

}
#text{
    margin : 5px;
    font-size : 15px;
    
}
#idError, #pwError, #pwCheckError, #nameError, #phoneNumError, #addressError, #emailError, #consentError {
    width:0px auto;
    display : inline-block;
    color : red;
    font-size : 11px;
    font-weight: normal;
    margin-left : 10px;
}
#container, #footer {
    margin: 0 auto;
    max-width: 768px;
    min-width: 460px;
}
.wrapper {
    width: 100%;
    min-width: 760px;
}

#header {
    
    position: relative;
    overflow: hidden;
    padding: 60px 0 54px;
    
}

#header .h_logo {
    display: block;
    margin: 0 auto;
    width: 240px;
    height: 44px;
    background-repeat: no-repeat;
    background-position: 0 0;
    background-size: 240px auto;
    color: transparent;
    font-size: 2em;
}
.ipin_box, .row_group {
    overflow: hidden;
    width: 100%;
}
.box{
    margin : 0px auto;
    display: block;
    position: relative;
    width: 60%;
    height: 51px;
    border: solid 1px #dadada;
    border-top-color: rgb(218, 218, 218);
    border-top-style: solid;
    border-top-width: 1px;
    border-right-color: rgb(218, 218, 218);
    border-right-style: solid;
    border-right-width: 1px;
    border-bottom-color: rgb(218, 218, 218);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-left-color: rgb(218, 218, 218);
    border-left-style: solid;
    border-left-width: 1px;
    padding: 10px 110px 10px 14px;
    padding-top: 10px;
    padding-right: 110px;
    padding-bottom: 10px;
    padding-left: 14px;
    box-sizing: border-box;
}
.box.int_id, .box.int_id input {
    background: #fff;
    outline: 0;
}
#emailBox{
    margin : 0px auto;
    display: block;
    position: relative;
    width: 60%;
    height: 51px;
    border: solid 1px #dadada;
    border-top-color: rgb(218, 218, 218);
    border-top-style: solid;
    border-top-width: 1px;
    border-right-color: rgb(218, 218, 218);
    border-right-style: solid;
    border-right-width: 1px;
    border-bottom-color: rgb(218, 218, 218);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-left-color: rgb(218, 218, 218);
    border-left-style: solid;
    border-left-width: 1px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    padding-top: 10px;
    padding-left: 14px;
    box-sizing: border-box;
    background-color : white;
}
.list {
    display : inline-black;
    margin : 0px auto;
    /*padding: 10px;*/
    width: 60%;
    font-size: 14px;
    font-weight: 700;
}
.list h3{
    display : inline-black;
}
.userInput{
    margin : 3%;
    
}
.line{
    margin-left : 20%;
/*margin : 2px;*/
}
#address input text{
    margin-left : 60%;

}
#addressButton{
    text-align : center;
    background-color : #A7E1EB;
    width :  0px auto;
    font-weight : bold;
    color : #353535;
}
#sample4_postcode{
    width : 40%;
    margin-right: 12px;
}
#sample4_roadAddress, #sample4_jibunAddress, #sample4_detailAddress, #sample4_extraAddress{
    width : 60%;
}
#sample4_detailAddress{
    background-color : white;
}
.input {
    display: inline;
}

.box {
    margin : 0px auto;
    display: block;
    width: 60%;
    height: 51px;
    padding-top: 10px;
    padding-right: 110px;
    padding-bottom: 10px;
    padding-left: 14px;
    background: #fff;
    box-sizing: border-box;

}

.int {
    display: block;
    position: relative;
    width: 100%;
    height: 29px;
    border: solid 1px #dadada;
    padding-right: 25px;
    line-height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
    box-sizing: border-box;
    z-index: 10;
}
#emailInt{
    display: block;
    /*position: relative;*/
    width: 50%;
    height: 29px;
    border: solid 1px #dadada;
    /*padding-right: 25px;*/
    line-height: 29px;
    border: none;
    background: #fff;
    font-size: 15px;
    box-sizing: border-box;

}
#btn {
    width: 100%;
    height: 50px;
}
.btn_area {
    margin: 30px 0 9px;
}

.btn_primary {
    color: #fff;
    border: solid 1px rgba(0,0,0,.08);
    border-top-color: rgba(0, 0, 0, 0.08);
    border-top-style: solid;
    border-top-width: 1px;
    border-right-color: rgba(0, 0, 0, 0.08);
    border-right-style: solid;
    border-right-width: 1px;
    border-bottom-color: rgba(0, 0, 0, 0.08);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-left-color: rgba(0, 0, 0, 0.08);
    border-left-style: solid;
    border-left-width: 1px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    background-color: #B2EBF4;
}
.btn_type {
    margin-top : 15%;
    margin-bottom : 10%;
    display: block;
    width: 100%;
    padding: 15px 0 15px;
    font-size: 18px;
    font-weight: 700;
    text-align: center;
    cursor: pointer;
    box-sizing: border-box;
}
button {
    cursor: pointer;
}
button, input, select, textarea {
    border-radius: 0;
    border-top-left-radius: 0px;
    border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
    border-bottom-left-radius: 0px;
    border: none;
    background: 0 0;
    background-image: initial;
    background-position-x: 0px;
    background-position-y: 0px;
    background-size: initial;
    background-attachment: initial;
    background-origin: initial;
    background-clip: initial;
    background-color: initial;
    /*  -webkit-appearance: none; */
    -moz-appearance: none;
     /* appearance: none; */
    outline: 0;
    text-decoration: none;
    cursor: pointer;
    -webkit-text-size-adjust: none;
}
#consentBox {
    margin: 0px auto;
    display: block;
    position: relative;
    width: 60%;
    height : 300px;
    border: solid 1px #dadada;
    border-top-color: rgb(218, 218, 218);
    border-top-style: solid;
    border-top-width: 1px;
    border-right-color: rgb(218, 218, 218);
    border-right-style: solid;
    border-right-width: 1px;
    border-bottom-color: rgb(218, 218, 218);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    border-left-color: rgb(218, 218, 218);
    border-left-style: solid;
    border-left-width: 1px;
    border-image-source: initial;
    border-image-slice: initial;
    border-image-width: initial;
    border-image-outset: initial;
    border-image-repeat: initial;
    padding-top: 10px;
    padding-left: 14px;
    box-sizing: border-box;
    background-color: white;
    overflow-y: scroll;
    
}
.select #check{
    margin-left : 40%;
    
}
.select {
    top : 30px;
    margin : 3px;
}

</style>
<body>
    <div id="wrap" class="wrapper">
        <form method ="post" name="join" id="join" action="/user/signup" >
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <!-- 회원가입 타이틀부분 -->
        <header>
            <div id="header">
                <h1 class="h_loho">
                    <span><img alt="" src="image/main.png"></span>
                    <p>회원가입</p>
                </h1>
                </div>
        </header>

        <div id="container">
            <div class="row_group">
                <div class="userInput">
        <!-- 아이디 입력 -->
                    <h3 class="list">아이디<span id="idError"></span></h3>
                    <span class="box int_id" ><input type="text" id="ID" class="int check" name = "ID"
                    maxlength="20"></span>
                    <button class="idChk" type="button" id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
                </div>
                <div class="userInput">
        <!-- 비밀번호 입력 -->
                    <h3 class="list">비밀번호<span id="pwError"></span></h3>
                    <span class="box int_id"><input type="password" id="pw" class="int check" maxlength="20" name="PW"></span></div>
        <!-- 비밀번호 재확인 입력 -->
                <div class="userInput">
                    <h3 class="list">비밀번호 재확인<span id="pwCheckError"></span></h3>
                    <span class="box int_id"><input type="password" id="pwCheck" class="int check" 
                    maxlength="20"></span>
                </div>
            </div>
                <div class="row_group">
        <!-- 성명 입력 -->
                <div class="userInput">
                    <h3 class="list">성명<span id="nameError"></span></h3>
                    <span class="box int_id"><input type="text" id="name" class="int check"
                    maxlength="20" name ="NAME"></span>
                </div>
        <!-- 전화번호 입력 -->
                <div class="userInput">
                    <h3 class="list">전화번호("-" 제외)<span id="phoneNumError"></span></h3>
                    <span class="box int_id"><input type="text" id="phoneNum" class="int check" name="PHONE_NUM"
                    maxlength="20"></span>
                </div>
        <!-- 주소 입력 -->
                <div class="userInput">
                    <h3 class="list">
                    자택주소<span id="addressError"></span>
                    </h3>
                    <div id="address" class="int_id">
                    <span>
                    <input type="text" id="sample4_postcode" class="d_form mini line addressCheck" placeholder="우편번호"  >
                    <input type="button" id="addressButton" class="d_form mini" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly>
                    </span>
                    <input type="text" id="sample4_roadAddress" class="d_form mini line" placeholder="도로명주소" name= "ADDRESS1">
                    <input type="text" id="sample4_jibunAddress" class="d_form mini line" placeholder="지번주소" name= "ADDRESS2">
                    <span id="guide" style="color:#999;display:none"></span>
                    <input type="text" id="sample4_detailAddress" class="d_form mini line addressCheck" placeholder="상세주소" name= "ADDRESS3">
                    <input type="text" id="sample4_extraAddress" class="d_form mini line" placeholder="참고주소" >
                    </div>
                </div>
                <!-- 이메일 입력 -->
                <div class="userInput">
                <h3 class="list">이메일<span id="emailError"></span></h3>
                <span class="emailInt" id="emailBox" > <input type="text" id="email" maxlength="20" class="check" name="EMAIL" > 
                <span>   @ </span> 
                    <!-- 이메일 택일 -->
                    <select id="email_Select">
                        <option>이메일 선택</option>
                        <option>naver.com</option>
                        <option>gmail.com</option>
                        <option>daum.net</option>
                        <option>hanmail.net</option>
                        <option>hotmail.com</option>
                        <option>nate.com</option>
                        <option>yahoo.co.kr</option>
                        <option>empas.com</option>
                        <option>freechal.com</option>
                        <option>lycos.co.kr</option>
                        <option>korea.com</option>
                        <option>hanmir.com</option>
                        <option>dreamwiz.com</option>
                        <option>paran.com</option>
                    </select>
                </span>
            </div>
    
            <!-- 개인정보 수집 동의 -->
                <div class="userInput">
                <h3 class="list">개인정보 수집/이용동의<span id="consentError"></span></h3>
                <div id="informationConsent">
                <span id="consentBox">
                    <h3>개인정보 처리방침<span id="consentError"></span></h3>
                    어쩌구 저쩌구 쏼라쏼라 어쩌구저쩌구
                </span>
            </div>
            <label class="select"><input type="radio" id="check" name="check" value="동의">동의</label>
            <label class="select"><input type="radio" id="noneCheck"name="check" value="비동의" checked="checked">비동의</label>
            </div>
            <div class="btn_area">
            <input type="submit" value="가입하기" id="btnJoin" class="btn_type btn_primary" >
            </div>
        </div>
    </div>
    </form>
</div>
<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cencle").on("click", function(){
				location.href = "/";
			})
			
			$("#submit").on("click", function(){
				if($("#ID").val()==""){
					alert("아이디를 입력해주세요.");
					$("#ID").focus();
					return false;
				}
				if($("#PW").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#PW").focus();
					return false;
				}
				if($("#NAME").val()==""){
					alert("성명을 입력해주세요.");
					$("#NAME").focus();
					return false;
				}
				var idChkVal = $("#idChk").val();
				if(idChkVal == "N"){
					alert("중복확인 버튼을 눌러주세요.");
				}else if(idChkVal == "Y"){
					$("#regForm").submit();
				}
			});
		})
		
		function fn_idChk(){
			$.ajax({
				url : "/idChk",
				type : "post",
				dataType : "json",
				data : {"ID" : $("#ID").val()},
				success : function(data){
					if(data == 1){
						alert("중복된 아이디입니다.");
					}else if(data == 0){
						$("#idChk").attr("value", "Y");
						alert("사용가능한 아이디입니다.");
					}
				}
			})
		}
	</script>
</body>

</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <title>팀 로그인</title>
        <link rel="stylesheet" href="./css/style.css">
        <script src="https://kit.fontawesome.com/51db22a717.js" crossorigin="anonymous"></script>
        
    </head>
    
    <style>
	:root{
	--body-background-color: #f5f6f7;
	--font-color: #4e4e4e;
	--border-gray-color : #dadada;
	--login-color: #3104c7;
	--login-border-color: #e7e7e7;
}


*{
	margin:0;
	padding:0;
}

body{
	background:var(--body-background-color);
}

.main-container{
	width:100%;
	display:flex;
	flex-direction:column;
	align-items:center;
	margin-top: 21px;
}
.main-container .main-wrap{
	width:768px;

}
.main-container .main-wrap .sel-lang-wrap .lang-select
{
	width: 96px;
	height: 30px;
	color: var(--font-color);
	border: solid 1px var(--border-gray-color);
}
.main-container .main-wrap .logo-wrap{
	padding-top:55px;
}
.main-container .main-wrap .logo-wrap img
{
	width: 231px;
	height: 44px;
}

.main-container .main-wrap header .sel-lang-wrap{
	display:flex;
	justify-content:flex-end;
}

.main-container .main-wrap header .logo-wrap{
	display:flex;	
	flex-direction: column;
	align-items: center;
}
.login-input-section-wrap{
	padding-top: 60px;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.login-input-wrap{
	width: 465px;
	height :48px;
	border: solid 1px var(	--border-gray-color );
	background: white;
}
.password-wrap{
	margin-top: 13px;
}
.login-input-wrap input{
	border: none;
	width:430px;
	margin-top: 10px;
	font-size: 14px;
	margin-left: 10px;
	height:30px;
}
.login-button-wrap {
	padding-top: 13px;
}
.login-button-wrap button{
	width: 465px;
	height :48px;
	font-size: 18px;
	background: var(--login-color);
	color: white;
	border: solid 1px var(--login-border-color);
}


.Easy-sgin-in-wrap{

	display: flex;
	flex-direction: column;
	align-items: center;
	padding-top: 40px;

}
.Easy-sgin-in-wrap h2{
	font-size: 20px;
}
.Easy-sgin-in-wrap .sign-button-list
{
	padding-top:25px;
	list-style: none;
	width: 465px;
	display: flex;
	flex-direction: column;
	align-items: center;
}
.Easy-sgin-in-wrap .sign-button-list li{
	padding-bottom: 10px;
}
.Easy-sgin-in-wrap .sign-button-list li button{
	width: 465px;
	height: 56px;
	border: solid 1px var(--border-gray-color);
	text-align: left;
	background: white;
}
.Easy-sgin-in-wrap .sign-button-list li button i{
	padding-left: 15px;
	font-size: 20px;
}
.fa-qrcode
{
	color:var(--login-color);
}
.fa-line{
	color:var(--login-color);
}
.fa-facebook-square
{
	color:#4064ac;
}
.Easy-sgin-in-wrap .sign-button-list li button span{
	padding-left: 20px;
	font-size: 18px;
}
.Easy-sgin-in-wrap .forget-msg{
	color:var(--font-color);
	font-size: 14px;
	padding-top: 10px;

}
footer{
	padding-top: 95px;
	padding-bottom: 15px;

	display:flex;
	flex-direction:column;
	align-items:center;
	width:768px;



}
.copyright-wrap{

	display: flex;
	flex-direction: column;
	align-items: center;
	height: 15px;


}
footer .copyright-wrap span img{
	width: 59px;
	
	height: 11px;
}
footer .copyright-wrap span{
	font-size: 13px;
	line-height: 15px;
}
	</style>
    <body>
        <div class="main-container">
            <div class="main-wrap">
            <header>
                <div class="sel-lang-wrap">
                    <select class="lang-select">
                        <option>한국어</option>
                    </select>
                </div>
                <div class="logo-wrap">
                    <img src="img/logo.png">
                </div>
            </header>
            <section class="login-input-section-wrap">
                <div class="login-input-wrap">	
                    <input placeholder="Username" type="text"></input>
                </div>
                <div class="login-input-wrap password-wrap">	
                    <input placeholder="Password" type="password"></input>
                </div>
                <div class="login-button-wrap">
                    <button>로그인</button>
                </div>
            </section>
            <section class="Easy-sgin-in-wrap">
                <h2>다른 로그인 방법</h2>
                <ul class="sign-button-list">
                    
                    <li><button><i class="fab fa-facebook-square"></i><span>Facebook</span></button></li>
                    <li><button><i class="fab fa-line"></i><span>line</span></button></li>
                </ul>
                <p class="forget-msg">Forgot your Username or Password? | Sign up</p>
            </section>
            <footer>
                <div class="copyright-wrap">
                <span>	<img src="img/logo.png"> Copyright © FindChild Corp. All Rights Reserved.</span>
                </div>
            </footer>
            </div>
        </div>
    </body>
</html>
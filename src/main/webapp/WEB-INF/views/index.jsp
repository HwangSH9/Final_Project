<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>3팀 미션</title>
<link rel="stylesheet" href="../resources/css/main.css">
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
   href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Icons "
   rel="stylesheet">
<link rel="stylesheet"
   href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<!-- Swiper.js -->
<link rel="stylesheet"
   href="https://unpkg.com/swiper@7/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script src="https://unpkg.com/swiper@7/swiper-bundle.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/gsap.min.js"
   integrity="sha512-H6cPm97FAsgIKmlBA4s774vqoN24V5gSQL4yBTDOY2su2DeXZVhQPxFK4P6GPdnZqM9fg1G3cMv5wD7e6cFLZQ=="
   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.9.1/ScrollToPlugin.min.js"
   integrity="sha512-agNfXmEo6F+qcj3WGryaRvl9X9wLMQORbTt5ACS9YVqzKDMzhRxY+xjgO45HCLm61OwHWR1Oblp4QSw/SGh9SA=="
   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/ScrollMagic/2.0.8/ScrollMagic.min.js"
   integrity="sha512-8E3KZoPoZCD+1dgfqhPbejQBnQfBXe8FuwL4z/c8sTrgeDMFEnoyTlH3obB4/fV+6Sg0a0XF+L/6xS4Xx1fUEg=="
   crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script defer src="../resources/js/main.js"></script>

</head>
<body>
   <header>
      <div class="inner">
         <a href="/" class="logo"> <img src="../resources/img/logo.png" alt="I dream" />
         </a>
         <div class="sub-menu">
            <ul class="menu">
               <li><a href="/user/signup">Sign In</a></li>
               <li><a href="javascrpit:void(0)">My home</a></li>
               <li><a href="javascrpit:void(0)">Login</a></li>
            </ul>
            <div class="search">
               <input type="text" /> <span class="material-icons">search</span>
            </div>
         </div>
         <ul class="main-menu">
            <li class="item">
               <div class="item__name"><a href="/inquire">실종 아동 조회</a></div>
            </li>
            <li class="item">
               <div class="item__name"><a href="/missing/list">실종 아동 등록</a></div>
            </li>
            <li class="item">
               <div class="item__name">실종아동 제보</div>
            </li>
            <li class="item">
               <div class="item__name">공지사항</div>
            </li>
            <li class="item">
               <div class="item__name">contact us</div>
               <div class="item__contents">
                  <div class="contents__menu">
                     <ul class="inner">
                        <li>
                           <h4>상세문의</h4>
                           <ul>
                              <li>찾아오시는길</li>
                              <li>문의하기</li>
                           </ul>
                        </li>
                     </ul>
                  </div>
                  <div class="contents__texture">
                     <div class="inner">
                        <h4>contact us</h4>
                        <p>찾아오시는 길과 문의를 할 수 있는 페이지 입니다.</p>
                     </div>
                  </div>
               </div>
            </li>
         </ul>
      </div>
      <!--BADGES-->
      <div class="badges">
         <div class="badge">
            <img src="../resources/img/badge1.png" alt="Badge" />
         </div>
         <div class="badge">
            <img src="../resources/img/badge2.png" alt="Badge" />
         </div>
      </div>
      <!-- Channel Plugin Scripts -->
      
      <script>
         (function() {
            var w = window;
            if (w.ChannelIO) {
               return (window.console.error || window.console.log || function() {
               })('ChannelIO script included twice.');
            }
            var ch = function() {
               ch.c(arguments);
            };
            ch.q = [];
            ch.c = function(args) {
               ch.q.push(args);
            };
            w.ChannelIO = ch;
            function l() {
               if (w.ChannelIOInitialized) {
                  return;
               }
               w.ChannelIOInitialized = true;
               var s = document.createElement('script');
               s.type = 'text/javascript';
               s.async = true;
               s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
               s.charset = 'UTF-8';
               var x = document.getElementsByTagName('script')[0];
               x.parentNode.insertBefore(s, x);
            }
            if (document.readyState === 'complete') {
               l();
            } else if (window.attachEvent) {
               window.attachEvent('onload', l);
            } else {
               window.addEventListener('DOMContentLoaded', l, false);
               window.addEventListener('load', l, false);
            }
         })();
         ChannelIO('boot', {
            "pluginKey" : "700d6c6c-4b83-41e5-98f2-e7d89467e38b"
         });
      </script>
      
      
      <!-- End Channel Plugin -->
   </header>
   <!--비쥬얼-->
   <!--VISUAL-->
   <section class="visual">
      <div class="inner">
         <div class="title fade-in">
            <img src="../resources/img/visul_title.png" alt="DELIGHTFUL START TO THE YEARS" />
            <a href="javascript:void(0)" class="btn btn--black">자세히 보기</a>
         </div>
         <div class="fade-in">
            <img src="../resources/img/child4.png" alt="child1" class="cup1 image" />
         </div>
         <div class="fade-in">
            <img src="../resources/img/child5.png" alt="child2" class="spoon" />
         </div>
      </div>
   </section>

   <!--NOTICE-->
   <section class="notice">
      <div class="bg-left"></div>
      <div class="bg-right"></div>
      <div class="inner">
         <div class="inner__left">
            <h2>안내</h2>
            <div class="swiper">
               <div class="swiper-wrapper">
                  <div class="swiper-slide">
                     <a href="javascript:void(0)">실종 아동들을 찾을수 있는 사이트입니다.</a>
                  </div>
                  <div class="swiper-slide">
                     <a href="javascript:void(0)">실종 아이를 등록하고 싶으시면 등록게시판으로</a>
                  </div>
                  <div class="swiper-slide">
                     <a href="javascript:void(0)">실종 아이의 제보하시려면 실종 아동 제보 페이지로 이동해
                        주시길 바랍니다.</a>
                  </div>
                  <div class="swiper-slide">
                     <a href="javascript:void(0)">항상 저희 사이트를 이용해주셔서 감사합니다</a>
                  </div>
               </div>
            </div>
         </div>
         <div class="inner__right"></div>

      </div>
   </section>

   <!--PROMOTION-->
   <section class="promotion">
      <div class="swiper">
         <div class="swiper-wrapper">
            <div class="swiper-slide">
               <img src="../resources/img/slide1.jpg" alt="" /> <a href="javascript:void(0)"
                  class="btn">이동하기</a>
            </div>
            <div class="swiper-slide">
               <img src="../resources/img/slide2.jpg" alt="" /> <a href="javascript:void(0)"
                  class="btn">이동하기</a>
            </div>
            <div class="swiper-slide">
               <img src="../resources/img/slide3.jpg" alt="" /> <a href="javascript:void(0)"
                  class="btn">이동하기</a>
            </div>
         </div>
      </div>
      <div class="swiper-pagination"></div>
      <div class="swiper-button-prev">
         <span class="material-icons">arrow_back</span>
      </div>
      <div class="swiper-button-next">
         <span class="material-icons">arrow_forward</span>
      </div>
   </section>

   <!--PICK YOUR FAVORITE-->
   <section class="pick-your-favorite scroll-spy">
      <div class="inner">
         <div class="text-group">
            <img src="../resources/img/favorite_text1.png" alt=""
               class="title back-to-position to-right" /> <img
               src="../resources/img/favorite_text2.png" alt=""
               class="description back-to-position to-right delay-1" />
            <div class="more back-to-position to-right delay-2">
               <a href="javascript:void(0)" class="btn btn--black">제보하러 가기</a>
            </div>
         </div>
      </div>
   </section>

   <!--FOOTER-->
   <footer>
      <div class="inner">
         <div class="btn-group">
            <a href="javascript:void(0)" class="btn btn--white">찾아오시는 길</a> <a
               href="javascript:void(0)" class="btn btn--white">제목</a> <a
               href="javascript:void(0)" class="btn btn--white">제목</a>
         </div>
         <div class="info">
            <span>사업자번호 123-45-678901</span> <span>(주)아이찾기 프로젝트</span> <span>TEL
               : 02) 1234-5678 / FAX : 02) 1234-5678</span> <span>사이트 관리자 : 김아무개</span>
         </div>
         <p class="copyright">
            &copy; <span class="this-year"></span> Find Child Company. All
            Rights Reserved.
         </p>
      </div>
   </footer>

   <!--TO TOP BUTTON-->
   <div id="to-top">
      <div class="material-icons">arrow_upward</div>
   </div>
</body>
</html>
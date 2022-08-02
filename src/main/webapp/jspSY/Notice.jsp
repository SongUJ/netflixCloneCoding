<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*"%>
<%@ page import="com.sns.dao.*"%>
<%@ page import="com.sns.dto.*"%>
<%@ page import="java.util.*"%>
<%
	int loginID = (Integer)(session.getAttribute("profileId"));
	System.out.println("Notice.jsp : " + loginID);
	int userID =1;
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="https://kit.fontawesome.com/6ebfb758c0.js" crossorigin="anonymous" ></script>
    <script src="../js/jquery-3.6.0.min.js"></script>
	<script src="../js/common-sy.js"></script>
    <title>Notice</title>
    <link rel="stylesheet" href="main.css" />
    <link rel="stylesheet" href="modal.css" />
<!-- <script>
  function modalClose(){

      $("#article-box.modal-stl").css('display','none');
      $("#post-box.modal-stl ").css('display','none');
      $("#background_btm").css('display','none');   
      $(".comm-box.modal-stl").css('display','none');
  }
  
 

         // 알림모달창에 댓글달기 버튼
      $(".fa-solid.fa-message").click(function() {
          $(".comm-box").css('display','block'); 
          $("#background_btm").css('display','block'); 
      });


      // 포스트 작성 모달창
      $("#modal-btn ").click(function() {
          $("#post-box").css('display','block');
          $("#background_btm").css('display','block');
      });



           //모달창 닫기
      $("#background_btm").click(function() {
        modalClose();  
      });

      $("#post-box .ps-button").click(function() {
          alert("포스팅 성공!")
          modalClose();
      });

      $(".comm-box .ps-button").click(function() {
            alert("댓글 작성 성공!");
            modalClose();
      });


      //마우스휠 고정
      $("#background_btm").on("wheel", function (e) {
        e.stopPropagation();
        e.preventDefault();
      });
      $("#article-box").on("wheel", function(e) {
        e.stopPropagation();
        e.preventDefault();
      });

    });

  </script>

<style>
  #article-box{
    position: absolute;
    width: 670px;
    left: 552px;
    background-color: #282828;
    top: 70px;
    border-radius: 20px;
    display:none;
    z-index: 100;
  }
</style>
<style>
  #post-box.modal-stl.comm-box {
    position: absolute;
    width: 530px;
    left:660px;

  }
  .comm-box.modal-stl{
    /* position: absolute; */
    position: fixed;
    width: 520px;
    left:630px;
    /* margin-top:80px; */
    top:230px;
    z-index:200;
    background-color: #141414;
  }
  
  #background_btm {
    background-color:rgba(0, 0, 0, 0.8);
    height:100%;
    width:100%;
    /* position: absolute; */
    position:fixed;
    top: 0;
    left: 0;
    z-index: 1;
  }

</style>

</head>


<style>
  #postModal {
    z-index:2;
    position:fixed;
    margin-left: 600px;
    
  }
</style>

<div id="background_btm" style="display:none;"></div>

포스트창 모달
<div id="postModal" >
  <div id="post-box" class="modal-stl" style="display:none; background-color: #282828;">
    <div class="profile-imgbox">
      <div class="box" style="background: #141414">
        <img class="profile" src="./images/tistory.png" />
      </div>
    </div>
    <div class="post-container">
      <div class="post-container2">
        <div class="postingbox">
          <style>
            textarea.autosize {
              min-height: 50px;
            }
          </style>

          <textarea
            class="autosize"
            onkeydown="resize(this)"
            onkeyup="resize(this)"
            placeholder="무슨 일이 일어나고 있나요?"
            style="background-color: #282828;"
          ></textarea>

          <script>
            function resize(obj) {
              obj.style.height = "1px";
              obj.style.height = 12 + obj.scrollHeight + "px";
            }
          </script>

          <div class="posting-bottom">
            <div>
              <div class="ps-button postButton"><span>posting</span></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>


   댓글 모달창
   <div class="modal-commBox">
    <div class="comm-box modal-stl" style="display:none; background-color: #060606;">
      <div class="profile-imgbox">
        <div class="box" style="background: #141414">
          <img class="profile" src="./images/tistory.png" />
        </div>
      </div>
      <div class="post-container">
        <div class="post-container2">
          <div class="postingbox">
            <style>
              textarea.autosize {
                min-height: 50px;
              }
            </style>

            <textarea
              class="autosize"
              onkeydown="resize(this)"
              onkeyup="resize(this)"
              placeholder="포스팅에 대한 당신의 생각을 전하세요."
              style="background-color: #060606;"
            ></textarea>

            <script>
              function resize(obj) {
                obj.style.height = "1px";
                obj.style.height = 12 + obj.scrollHeight + "px";
              }
            </script>

            <div class="posting-bottom">
              <div>
                <div
                  class="ps-button postButton"
                  !important
                  style="padding: 10px 10px; margin-left: 380px"
                >
                  <span>답글</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


</head>-->

    <!-- 알림창 모달 -->



    

<!--     <header >
     <div id="left-box">

      <div class="menu-container">
               <div class="imagebox imgButton"><img src="./images/netflix1.png " !important style="margin:0"  onClick="location.href='Main.jsp'"/> </div>
        <div class="menu-box menuButton"  onClick="location.href='Main.jsp'">
          <i class="fa-solid fa-house"></i><span>&nbsp;&nbsp; 홈</span>
        </div>
        <div class="menu-box menuButton" onClick="location.href='Trend.jsp'">
            <i class="fa-solid fa-hashtag"></i><span>&nbsp;&nbsp; 탐색하기</span>
          </div>
        <div class="menu-box menuButton"  onClick="location.href='Notice.jsp'">
          <i class="fa-solid fa-bell"></i> <span>&nbsp;&nbsp; 알림</span>
        </div>
        <div class="menu-box menuButton" onClick="location.href='Message.jsp'">
          <i class="fa-solid fa-envelope"></i><span>&nbsp;&nbsp; 쪽지</span>
        </div>
        <div class="menu-box menuButton" onClick="location.href='Profile.jsp'">
          <i class="fa-solid fa-user"></i><span>&nbsp;&nbsp; 프로필</span>
        </div>
        <div id="modal-btn" class="post-button postButton">posting</div>
        <div class="bottom-profile "><div class="bottom-proBox bottomButton " ><div style="float:left" class="imgbox" style="background: #BDBDBD;">
            <img class="profile" src="./images/netflix1.png">
        </div><div class="namebox">nickname</div></div></div>
        
      </div>
      </div>


      
    </header> -->
 <script>
 $(function(){

	    // 알림 모달창
	      $(".article-box.menuButton").click(function() {
	        $("#background_btm").css('display','block'); 
	        $("#article-box").css('display','block'); 
	      });
 });
 </script>   
 

 
<body style="margin: 0 auto; background-color:#141414; color:#ffffff ">
 <!-- modal -->
<style>
  #article-box{
    position: absolute;
    width: 670px;
    left: 552px;
    background-color: #282828;
    top: 70px;
    border-radius: 20px;
    display:none;
    z-index: 100;
  }
</style>

 <div id="article-box" class="modal-stl">
        <div class="pssbox">
          <div class="profile-imgbox">
            <div class="box" style="background: #141414">
              <img class="profile" src="./images/tistory.png" />
            </div>
          </div>
          <div class="namebar" style="margin-bottom: 23px">
            <span class="spannickname"> 크롱 &nbsp;&nbsp</span>
            <span class="spanid">@kk123 &#183; 5월23일</span>
          </div>
        </div>

        <div class="content-container" style="margin: 0 auto">
          <div class="postingbox" style="font-size: 20px">
            test<br />하나의 포스팅을 누르면 해당하는 포스트만이 뜨는 url<br />
            거기에는 댓글 등 더 상세히 달린다.
          </div>
          <div class="img-post">
            <img
              src="https://i.pinimg.com/originals/a6/bb/84/a6bb84114c113eb35c8417148e103199.jpg"
            />
          </div>
          <div class="bottom-bar">
            <div>
              <div class="div_bottombar">
                <i class="fa-solid fa-message"></i><span class="tab"></span>
                <i class="fa-regular fa-heart"></i><span class="tab"></span>
                <i class="fa-solid fa-arrow-up-from-bracket"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
      

      
<!--     <div id="background_btm" style="display:none;"></div> -->
    <%@ include file="ModuleMenu.jspf" %>

    <main style="float:left">
    

      <div id="home-box3">
          <div class="home-bar"><span style="font-weight: 800;">알림</span></div>
          <div style="width:665px; height:calc(100vh - 60px);">
          <div class="article-box menuButton" style="margin-top:60px;">
            <div class="notice-box">
          <div style="float:left; line-height: 55px; margin-right:35px"><i class=" fa-solid fa-bell" ></i></div> <div class="postingbox" style="line-height: 20px; font-size:18px;">
            당신의 게시물에 좋아요가 눌렸습니다<br> 두줄이 넘어간다면?</div>
          </div>
             </div>

             <div class="article-box menuButton" >
              <div class="notice-box">
            <div style="float:left; line-height: 55px; margin-right:35px"><i class=" fa-solid fa-bell " ></i></div> <div class="postingbox" style="line-height: 20px; font-size:18px;">
              크롱님이 당신의 게시물에 좋아요를 눌렸습니다<br> </div>
            </div>
               </div>

               <div class="article-box menuButton" >
                <div class="notice-box">
              <div style="float:left; line-height: 55px; margin-right:35px"><i class=" fa-solid fa-bell " ></i></div> <div class="postingbox" style="line-height: 20px; font-size:18px;">
               라이언님이 당신의 게시물에 댓글을 남겼습니다<br> </div>
              </div>
                 </div>


          </div>
   
               


<!-- 우측 바 -->
	<%@ include file="TrendRankModule.jspf" %>
    </main>
  </body>
</html>
<!--트렌드 바-->
<!-- <div class="search-bar" style="float: right">
           

            
          </div> -->

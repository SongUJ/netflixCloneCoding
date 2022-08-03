<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.uj.dao.*" %>
    <%@ page import="com.uj.dto.*" %>
    <%@ page import="com.sns.dao.*"%>
	<%@ page import="com.sns.dto.*"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="test.*" %>
<%
String driver = "oracle.jdbc.driver.OracleDriver";
String url = "jdbc:oracle:thin:@192.168.1.12:1521:xe";
String dbId = "oraclePort";
String dbPw = "1234";

Connection conn = null;
try {
	Class.forName(driver);
	conn = DriverManager.getConnection(url,dbId,dbPw);
}catch(Exception e) {
	e.printStackTrace();
}
int profileID = Integer.parseInt(request.getParameter("profile_id"));
session.setAttribute("profileId",profileID);
int memberId = (Integer)(session.getAttribute("member_id"));
PostViewDAO pDao = new PostViewDAO();
/* int memberId = pDao.alterProfile(profileID); */
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="cssUJ/netflixMovie.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<script src="./js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/55f501ae31.js"crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js" integrity="sha256-eTyxS0rkjpLEo16uXTS0uVCS4815lc40K2iVpWDvdSY=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
<script>

function addComment(data) {
	var profile
}

function movieModalClose(){
    $(".movie-detail").fadeOut(100);
    $("#background-btm").fadeOut(100);
};
function dramaModalClose(){
    $(".drama-detail").fadeOut(100);
    $("#background-btm").fadeOut(100);
};

window.onload = function() {
	setTimeout (function (){
		scrollTo(0,0);
	},100);
}

var global_yg;

$(function (){
	$("#sns").click(function (){
		/* int email = session.setAttribute("member_id"); */
		alert("준비중 입니다.");
	});
	$(".logout-tab").click(function (){
		alert("로그아웃 되었습니다.");
		location.href="jspCY/Netflix02.jsp";
	});
	$(".account-information-top").click(function (){
		location.href="jspBR/p05.account.jsp"
	});
	$(".profile-link").click(function(){
		location.href="jspBR/p01.account.jsp"
	});
	
	$(".this_button_write").click(function (){
		var jumsu = $("#jumsu").val();
    	var movieDramaId = $(".notice-board").attr('movie_drama_id');
    	var memberId = "<%=profileID%>";
    	var comment = $("#user_comment").val();
    	$(".comment-all-box").scrollTop(0);
		$(".comment-all-box").empty();
    	$.ajax({
    		type: 'get',
    		url: 'CommentWriteServlet',
    		data: {"jumsu" : jumsu , "movie_drama_id" : movieDramaId , "memberId" : memberId , "comment" : comment},
    		datatype: "json",
    		error: function(r,s,e) {
    			alert("댓글 에러!!");
    		},
    		success: function(data) {
				for(var i=0; i<=data.length-1; i++) {
					console.log(i);
					var user_grade = data[i].user_grade;
					var comment_id = data[i].comment_id;
					var profile_id = data[i].profile_id;
					var user_comment = data[i].user_comment;
					var comment_date = data[i].comment_date;
					var like_hitcount = data[i].like_hitcount;
					var unlike_hitcount = data[i].unlike_hitcount;
					
					var str =
						'<div class="comment-box" commentid='+comment_id+'>'
                            +'<div>'
                                +'<form name="myform" id="myform3" method="post" action="./save">'
                                    +'<fieldset id="comment-grade">'
                                        +'<label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">'
                                        +'<label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">'
                                        +'<label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">'
                                        +'<label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">'
                                        +'<label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">'
                                    +'</fieldset>'
                                +'</form>'
                                +'<div class="user-grade">'+user_grade+'점</div>'
                            +'</div>'
                           +'<div>'
                                +'<div class="user-comment">'+user_comment+'</div>'
                            +'</div>'
                            +'<div style="margin-bottom: 10px;">'
                                +'<div class="user-id">'+profile_id+'</div>'
                                +'<div class="comment-day">'+comment_date+'</div>'
                            +'</div>'
                            +'<div>'
                                +'<div class="cm_sympathy_area">'
                                    +'<button type="button" class="area_button_upvote">'
                                       +'<span class="plus-count"><i class="fa fa-thumbs-up" aria-hidden="true">'+like_hitcount+'</i></span>'
                                    +'</button>'
                                    +'<button type="button" class="area_button_downvote">'
                                        +'<span class="mines-count"><i class="fa fa-thumbs-down" aria-hidden="true">'+unlike_hitcount+'</i></span>'
                                    +'</button>'
                                +'</div>'
                            +'</div>'
                        +'</div>';
                        
                	$(".comment-all-box").prepend(str);
				}
			}
    	});
    	
		/* $('.comment-box-original').clone().prependTo(".comment-all-box");
		$(".comment-all-box .comment-box-original").removeClass("comment-box-original").addClass("comment-box") */
		alert("댓글이 등록 되었습니다.");  
	}); 
	
	
	
	
	
	$(window).scroll(function (){
		var height = $(window).scrollTop();
		//console.log(height);
		if(height == 0) {
			$("#header").stop().animate({
				backgroundColor : "rgba(0,0,0,0)"
			},700);
		} else {
			$("#header").stop().animate({
				backgroundColor : "rgba(0,0,0,1)"
			},50);
		}
	});
    // 메인 부분 버튼누르면 detail 모달창  aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
    $('.gray-button').click(function (){
    	var movieDramaId = $(this).attr("detailVideoId");
    	$(".list-box option:eq(0)").prop("selected", true);
    	$(".notice-board").attr('movie_drama_id', movieDramaId);
    	$(".comment-all-box").empty();
    	/* alert(movieDramaId); */
    	if(movieDramaId >=1 && movieDramaId <= 157) {
    		$('.drama-detail').fadeIn(100);
            $('#background-btm').fadeIn(100); 
            
            $.ajax({
    			type: 'get',
    			url: 'YGServlet',
    			data: { "movie_drama_id" : movieDramaId },    
    			datatype: "json",
    			error: function(r,s,e){
    				alert("에러!");
    			},
    			success: function(data){
    				global_yg = data;
    				var title = data.title;
    				var release_day = data.release_day;
    				var age = data.age;
    				var director = data.director;
    				var actor = data.actor;
    				var genre = data.genre;
    				var summary = data.summary;
    				var priview_image = data.priview_image;
    				var title_image = data.title_image;
    				var first_video = data.first_video;
    				var string_age = data.string_age;
    				var priview = data.priview;
    				$(".movie-detail-information-text").children().find('b').text(title);
    				$(".movie-explanation > .year").text(release_day);
    				$(".movie-explanation > .age-image > img").attr('src','./images/'+ age +'.jpeg');
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".trailer-video").find("img").attr('src',priview_image);
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text(director);				
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text(actor);
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text(genre);
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(3).find(".personnel").text(age + "" + string_age);
    				$(".movie-detail-personnel1:first-child > .personnel1").text(actor);
    				$(".movie-detail-personnel1:last-child > .personnel1").text(genre);
    				$(".movie-explanation > .movie-contents").text(summary);
    				$(".detail-information-container > .detail-information-main-image").attr('src',priview_image);
    				$(".detail-information-overlay-image > img").attr('src',title_image);
    				$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', first_video);
    				$(".drama-detail").children(".notice-board").children().find("h2").text(title);
    				$(".drama-detail").children(".notice-board").children(".sub-title").find(".video-year").text(release_day);
    				
    				$(".drama-round-box").empty();
    					$.ajax({
    		    			type: 'get',
    		    			url: 'Controller?command=dramaRoundBoxServletAction',
    		    			data: { "movie_drama_id" : movieDramaId },    
    		    			datatype: "json",
    		    			error: function(r,s,e){
    		    				alert("안쪽에러!!");
    		    			},
    		    			success: function(data){
    		    				global_yg = data;			
    		    				for(var i=0; i<=data.length-1; i++) {
    			    				console.log(i);
    		    					var movie_drama_id = data[i].movie_drama_id;
    		    					var episode_round = data[i].episode_round;
    		    					var episode_image = data[i].episode_image;
    		    					var episode_title = data[i].episode_title;
    		    					var episode_summary = data[i].episode_summary;
    		    					var full_video = data[i].full_video;
    		    					var play_time = data[i].play_time;
    		    					var str =
    		    						'<div class="round-bundle" moviedramaid='+ movie_drama_id +'>'
    		                                   +'<div style="height:75px; margin-top: 26px;">'
    		                                       +'<div class="drama-round">'
    		                                           +episode_round
    		                                       +'</div>'
    		                                   +'</div>'
    		                                   +'<div>'
    		                                   +'<a href='+ full_video +'>'
    		                                       	+'<img style="position:absolute;" class="round-image" src='+episode_image+'>'
    		                                       	+'<div class="round-hover-play-button">'
    		                                       		+'<svg style="position:absolute; width: 45px; height: 28px; margin-top: 10px;" fill="none" xmlns="http://www.w3.org/2000/svg" class="titleCard-playSVG">'+'<path d="M4 2.69127C4 1.93067 4.81547 1.44851 5.48192 1.81506L22.4069 11.1238C23.0977 11.5037 23.0977 12.4963 22.4069 12.8762L5.48192 22.1849C4.81546 22.5515 4 22.0693 4 21.3087V2.69127Z" fill="currentColor">'+'</path>'+'</svg>'
    		                                       	+'</div>'
    		                                   	+'</a>'
    		                                       +'<div class="titleCardList">'
    		                                           +'<span class="round-title">'
    		                                               +episode_title
    		                                           +'</span>'
    		                                           +'<span class="round-running-time">'
    		                                               +play_time
    		                                           +'</span>'
    		                                           +'<p class="round-summary">'
    		    										+episode_summary
    		                                           +'</p>'
    		                                       +'</div>'
    		                                   +'</div>'
    		                               +'</div>';
    		    					
    		    					$(".drama-round-box").prepend(str);
    		    				}
    		    				$.ajax({
    		    					type: 'get',
    		    					url: 'Controller?command=gradeServletAction',
    		    					data: {"movie_drama_id" : movieDramaId},
    		    					datatype: 'json',
    		    					error: function(r,s,e) {
    		    						alert("평점 에러!");
    		    					},
    		    					success: function(data) {
    		    							var grade = data.grade;
    		    							var participation = data.participation;
    		    							
    		    							$(".notice-board").find(".star-grade").text(grade+"점");
    		    							$(".notice-board").find(".participation").text(participation+"명 참여");
    		    					}
    		    				});
    		    			}
    		    		});
    				}
    		});
    	}else {
    		$('.movie-detail').fadeIn(100);
            $('#background-btm').fadeIn(100); 
            
            $.ajax({
    			type: 'get',
    			url: 'YGServlet',
    			data: { "movie_drama_id" : movieDramaId },    
    			datatype: "json",
    			success: function(data){
    				
    				var title = data.title;
    				var release_day = data.release_day;
    				var age = data.age;
    				var director = data.director;
    				var actor = data.actor;
    				var genre = data.genre;
    				var summary = data.summary;
    				var priview_image = data.priview_image;
    				var title_image = data.title_image;
    				var first_video = data.first_video;
    				var string_age = data.string_age;
    				var priview = data.priview;
    				$(".movie-detail-information-text").children().find('b').text(title);
    				$(".movie-explanation > .year").text(release_day);
    				$(".movie-explanation > .age-image > img").attr('src','./images/'+ age +'.jpeg');
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".trailer-video").find("img").attr('src',priview_image);
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text(director);				
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text(actor);
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text(genre);
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(3).find(".personnel").text(age + "" + string_age);
    				$(".movie-detail-personnel1:first-child > .personnel1").text(actor);
    				$(".movie-detail-personnel1:last-child > .personnel1").text(genre);
    				$(".movie-explanation > .movie-contents").text(summary);
    				$(".detail-information-container > .detail-information-main-image").attr('src',priview_image);
    				$(".detail-information-overlay-image > img").attr('src',title_image);
    				$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', first_video);
    				$(".movie-detail").children(".notice-board").children().find("h2").text(title);
    				$(".movie-detail").children(".notice-board").children(".sub-title").find(".video-year").text(release_day);
    				
    				$.ajax({
    					type: 'get',
    					url: 'Controller?command=gradeServletAction',
    					data: {"movie_drama_id" : movieDramaId},
    					datatype: 'json',
    					error: function(r,s,e) {
    						alert("평점 에러!");
    					},
    					success: function(data) {
    							var grade = data.grade;
    							var participation = data.participation;
    							
    							$(".notice-board").find(".star-grade").text(grade+"점");
    							$(".notice-board").find(".participation").text(participation+"명 참여");
    					}
    				});
    			},
    			error: function(r,s,e){
    				alert("에러!");
    			}
    		});
    	}
    	
        /* $('.movie-detail').fadeIn(100);
        $('#background-btm').fadeIn(100); */
    });
    $('.close-icon').click(function (){
        movieModalClose();
    });
    
    //프로필 상세보기 모달창
    $("#account-menu").mouseenter(function() {
        $(".caret").fadeIn(150);
    });
    $(".account-drop-down").mouseleave(function() {
        $(".caret").fadeOut(150);
    });
    
 	//영화 top 10 인덱스 번호 
 	var px_to_show;
 	var b_complete_animate_hover_preview_container = true; 
    $('.movie-rank').mouseenter(function() {
    	
    	$(".hover-priview-container").fadeIn(500);
    	
    	var idx = $(".movie-rank").index(this);
    	var px_to_show;
    	if(idx<5) {
    		px_to_show = 50 + idx*280;
    	} else if(idx>6) {
    		return; 
    	} else {
    		px_to_show = idx*275;
    	}
    	
    	$(".hover-priview-container").css('left',px_to_show+'px');
    	$(".hover-priview-container").css('display','block');
    	$(".hover-priview-container").animate({
    		opacity:1
    	});
    });
    
    $(".hover-priview-container").mouseleave(function() {
        $(".hover-priview-container").fadeOut(300);
        
    });
    
    //드라마 top 10 priview 모달창
    $(".drama-rank").mouseenter(function() {
        $(".drama-hover-priview-container").fadeIn(500);
    	var idx = $(".drama-rank").index(this);
    	var px_to_show;
    	if(idx<5) {
    		px_to_show = idx*280;
    	} else if(idx>6) {
    		return; 
    	} else {
    		px_to_show = idx*265 ;
    	}
    	
    	$(".drama-hover-priview-container").css('left',px_to_show+'px');
    	$(".drama-hover-priview-container").css('display','block');
    	$(".drama-hover-priview-container").animate({
    		opacity:1
    	});
    });
    $(".drama-hover-priview-container").mouseleave(function() {
        $(".drama-hover-priview-container").fadeOut(300);
    });

    //priview box 에서 상세보기 클릭시 movie-detail 모달창
    $('.buttonControls').click(function (){
    	$('html').scrollTop(0);
        $('.movie-detail').fadeIn(100);
        $('#background-btm').fadeIn(100);
    });
    $('.close-icon').click(function (){
        movieModalClose()
    });

    //priview box 에서 상세보기 클릭시 drama-detail 모달창
    $('.drama-buttonControls').click(function (){
        /* $('html').scrollTop(0); */
        $('.drama-detail').fadeIn(100);
        $('#background-btm').fadeIn(100);
    });
    $('.close-icon').click(function (){
        dramaModalClose()
    });

    /* $('.detail-information-overlay').mousewheel(function (e){
        alert("왼쪽화면!");
        e.preventDefault();
        e.stopPropagation();
    });
    $('.notice-board').mousewheel(function (e){
        alert("오른쪽화면!");
        e.preventDefault();
        e.stopPropagation();
    }); */

    //댓글 등록
    
    
    $(".focus-visible").on("keyup",function(key){
    	if(key.keyCode==13) {
    		
    	}
    });
    
    $(".drama-rank").click(function (){
    	var movieDramaId = $(this).find(".boxart-image").attr("movieDramaId");
    	$(".list-box option:eq(0)").prop("selected", true);
    	$(".comment-all-box").empty();
    	$(".notice-board").attr('movie_drama_id', movieDramaId); 
    	$('html').scrollTop(0);
        $('.drama-detail').fadeIn(100);
        $('#background-btm').fadeIn(100); 
        $.ajax({
			type: 'get',
			url: 'YGServlet',
			data: { "movie_drama_id" : movieDramaId },    
			datatype: "json",
			error: function(r,s,e){
				alert("에러!");
			},
			success: function(data){
				global_yg = data;
				var title = data.title;
				var release_day = data.release_day;
				var age = data.age;
				var director = data.director;
				var actor = data.actor;
				var genre = data.genre;
				var summary = data.summary;
				var priview_image = data.priview_image;
				var title_image = data.title_image;
				var first_video = data.first_video;
				var string_age = data.string_age;
				var priview = data.priview;
				$(".movie-detail-information-text").children().find('b').text(title);
				$(".movie-explanation > .year").text(release_day);
				$(".movie-explanation > .age-image > img").attr('src','./images/'+ age +'.jpeg');
				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".trailer-video").find("img").attr('src',priview_image);
				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text(director);				
				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text(actor);
				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text(genre);
				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(3).find(".personnel").text(age + "" + string_age);
				$(".movie-detail-personnel1:first-child > .personnel1").text(actor);
				$(".movie-detail-personnel1:last-child > .personnel1").text(genre);
				$(".movie-explanation > .movie-contents").text(summary);
				$(".detail-information-container > .detail-information-main-image").attr('src',priview_image);
				$(".detail-information-overlay-image > img").attr('src',title_image);
				$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', first_video);
				$(".drama-detail").children(".notice-board").children().find("h2").text(title);
				$(".drama-detail").children(".notice-board").children(".sub-title").find(".video-year").text(release_day);
				
				$(".drama-round-box").empty();
					$.ajax({
		    			type: 'get',
		    			url: 'Controller?command=dramaRoundBoxServletAction',
		    			data: { "movie_drama_id" : movieDramaId },    
		    			datatype: "json",
		    			error: function(r,s,e){
		    				alert("안쪽에러!!");
		    			},
		    			success: function(data){
		    				global_yg = data;			
		    				for(var i=0; i<=data.length-1; i++) {
			    				console.log(i);
		    					var movie_drama_id = data[i].movie_drama_id;
		    					var episode_round = data[i].episode_round;
		    					var episode_image = data[i].episode_image;
		    					var episode_title = data[i].episode_title;
		    					var episode_summary = data[i].episode_summary;
		    					var full_video = data[i].full_video;
		    					var play_time = data[i].play_time;
		    					var str =
		    						'<div class="round-bundle" moviedramaid='+ movie_drama_id +'>'
		                                   +'<div style="height:75px; margin-top: 26px;">'
		                                       +'<div class="drama-round">'
		                                           +episode_round
		                                       +'</div>'
		                                   +'</div>'
		                                   +'<div>'
		                                   +'<a href='+ full_video +'>'
		                                       	+'<img style="position:absolute;" class="round-image" src='+episode_image+'>'
		                                       	+'<div class="round-hover-play-button">'
		                                       		+'<svg style="position:absolute; width: 45px; height: 28px; margin-top: 10px;" fill="none" xmlns="http://www.w3.org/2000/svg" class="titleCard-playSVG">'+'<path d="M4 2.69127C4 1.93067 4.81547 1.44851 5.48192 1.81506L22.4069 11.1238C23.0977 11.5037 23.0977 12.4963 22.4069 12.8762L5.48192 22.1849C4.81546 22.5515 4 22.0693 4 21.3087V2.69127Z" fill="currentColor">'+'</path>'+'</svg>'
		                                       	+'</div>'
		                                   	+'</a>'
		                                       +'<div class="titleCardList">'
		                                           +'<span class="round-title">'
		                                               +episode_title
		                                           +'</span>'
		                                           +'<span class="round-running-time">'
		                                               +play_time
		                                           +'</span>'
		                                           +'<p class="round-summary">'
		    										+episode_summary
		                                           +'</p>'
		                                       +'</div>'
		                                   +'</div>'
		                               +'</div>';
		                        
		    					
		    					$(".drama-round-box").prepend(str);
		    					
		    					$.ajax({
		    						type: 'get',
		    						url: 'Controller?command=gradeServletAction',
		    						data: {"movie_drama_id" : movieDramaId},
		    						datatype: 'json',
		    						error: function(r,s,e) {
		    							alert("평점 에러!");
		    						},
		    						success: function(data) {
		    								var grade = data.grade;
		    								var participation = data.participation;
		    								
		    								$(".notice-board").find(".star-grade").text(grade+"점");
		    								$(".notice-board").find(".participation").text(participation+"명 참여");
		    						}
		    					});
		    				}
		    			}
		    		});
				}
		});
    });
    
    $(".movie-rank").click(function (){
    	var movieDramaId = $(this).find(".boxart-image").attr("movieDramaId");
    	$(".list-box option:eq(0)").prop("selected", true);
    	$(".notice-board").attr('movie_drama_id', movieDramaId);
    	$(".comment-all-box").empty();
    	$('html').scrollTop(0);
        $('.movie-detail').fadeIn(100);
        $('#background-btm').fadeIn(100); 
        
        $(".movie-detail-information-text").children().find('b').text('');
		$(".movie-explanation > .year").text('');
		$(".movie-explanation > .age-image > img").attr('src',''); 
		$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text('');
		$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text('');
		$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text('');
		$(".movie-detail-personnel1:first-child > .personnel1").text('');
		$(".movie-detail-personnel1:last-child > .personnel1").text('');
		$(".movie-explanation > .movie-contents").text('');
		$(".detail-information-container > .detail-information-main-image").attr('src','');
		$(".detail-information-overlay-image > img").attr('src','');
		$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', ''); 
		$.ajax({
			type: 'get',
			url: 'YGServlet',
			data: { "movie_drama_id" : movieDramaId },    
			datatype: "json",
			success: function(data){
				
				var title = data.title;
				var release_day = data.release_day;
				var age = data.age;
				var director = data.director;
				var actor = data.actor;
				var genre = data.genre;
				var summary = data.summary;
				var priview_image = data.priview_image;
				var title_image = data.title_image;
				var first_video = data.first_video;
				var string_age = data.string_age;
				var priview = data.priview;
				$(".movie-detail-information-text").children().find('b').text(title);
				$(".movie-explanation > .year").text(release_day);
				$(".movie-explanation > .age-image > img").attr('src','./images/'+ age +'.jpeg');
				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".trailer-video").find("img").attr('src',priview_image);
				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text(director);				
				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text(actor);
				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text(genre);
				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(3).find(".personnel").text(age + "" + string_age);
				$(".movie-detail-personnel1:first-child > .personnel1").text(actor);
				$(".movie-detail-personnel1:last-child > .personnel1").text(genre);
				$(".movie-explanation > .movie-contents").text(summary);
				$(".detail-information-container > .detail-information-main-image").attr('src',priview_image);
				$(".detail-information-overlay-image > img").attr('src',title_image);
				$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', first_video);
				$(".movie-detail").children(".notice-board").children().find("h2").text(title);
				$(".movie-detail").children(".notice-board").children(".sub-title").find(".video-year").text(release_day);
				
				$.ajax({
					type: 'get',
					url: 'Controller?command=gradeServletAction',
					data: {"movie_drama_id" : movieDramaId},
					datatype: 'json',
					error: function(r,s,e) {
						alert("평점 에러!");
					},
					success: function(data) {
							var grade = data.grade;
							var participation = data.participation;
							
							$(".notice-board").find(".star-grade").text(grade+"점");
							$(".notice-board").find(".participation").text(participation+"명 참여");
					}
				});
			},
			error: function(r,s,e){
				alert("에러!");
			}
		});
    });
    
    $(document).on("click",".area_button_upvote",function (){
    	var commentId = $(this).parent().parent().parent().attr("commentId");
    	var memberId = "<%=profileID%>"
    	var movieDramaId = $(".notice-board").attr('movie_drama_id');
    	
    	$.ajax({
    		type:'get',
    		url:'LikeServlet',
    		data:{"commentId": commentId , "member_id": memberId},
    		datatype:"json",
    		success: function(data) {
    			$(".comment-box").each(function(index, item){
    				/* console.log($(item).attr("commentId"));  */
    				if($(item).attr("commentId") == commentId) {
    					if(data.like == "1") {
	    					/* alert("들어옴!!"); */
	    					alert("좋아요 했습니다.");
	    					var likeUp = $(item).find(".fa-thumbs-up");
	    					/* console.log(likeUp.html()); */ 
	    					likeUp = parseInt(likeUp.html()) + 1;
	    					/* alert(likeUp);  */
	    					$(item).find(".fa-thumbs-up").text(likeUp);
    					}else if(data.like=="-1"){
   	    					/* alert("들어옴!!"); */
   	    					alert("좋아요 취소.");
   	    					var likeDown = $(item).find(".fa-thumbs-up");
   	    					/* console.log(likeUp.html()); */ 
   	    					likeDown = parseInt(likeDown.html()) - 1;
   	    					/* alert(likeUp);  */
   	    					$(item).find(".fa-thumbs-up").text(likeDown);
    					}
    				}
    			});
    		},
    	});
    });  
    
    $(document).on("click",".area_button_downvote",function (){
    	var commentId = $(this).parent().parent().parent().attr("commentId");
    	var memberId = "<%=profileID %>"
    	/* alert(commentId); */ 
    	$.ajax({
    		type:'get',
    		url:'UnLikeServlet',
    		data:{"commentId": commentId , "member_id": memberId},
    		datatype:"json",
    		success: function(data) {
    			$(".comment-box").each(function(index, item){
    				/* console.log($(item).attr("commentId"));  */
    				if($(item).attr("commentId") == commentId) {
    					if(data.unlike == "1") {
	    					/* alert("들어옴!!"); */
	    					/* alert("싫어요 했습니다."); */
	    					var unLikeUp = $(item).find(".fa-thumbs-down");
	    					/* console.log(likeUp.html()); */ 
	    					unLikeUp = parseInt(unLikeUp.html()) + 1;
	    					/* alert(likeUp);  */
	    					$(item).find(".fa-thumbs-down").text(unLikeUp);
    					}else if(data.unlike == "-1"){
   	    					/* alert("들어옴!!"); */
   	    					/* alert("싫어요 취소."); */
   	    					var unLikeDown = $(item).find(".fa-thumbs-down");
   	    					/* console.log(likeUp.html()); */ 
   	    					unLikeDown = parseInt(unLikeDown.html()) - 1;
   	    					/* alert(likeUp);  */
   	    					$(item).find(".fa-thumbs-down").text(unLikeDown);
    					}
    				}
    			});
    		},
    	});
    }); 
    
    //무한스크롤
    var pageNum = 1;
    var g_b;
    function request_one_page() {
    	if(pageNum == 1) {
 		   $(".movie-scroll").empty();
 		   $(".drama-scroll").empty();
     	}   
    	
    	$.ajax({
    		type: 'get',
    		url: 'Controller?command=movieScrollServletAction',
    		data:{"page":pageNum},
    		datatype: "json",
    		error:function(r,s,e) {
    			alert("에러!");
    		},
    		success: function(d) {
    			g_b = d;
    			for(var i=0; i<=8; i++) {
    				console.log(i);
    				var movie_drama_id = d[i].movie_drama_id;
    				var poster_image = d[i].poster_image;
    				var str = 
                    	'<div class="normal-image1" moviedramaid='+movie_drama_id+'>'
    					+'<img class="gubun-image" gubun="drama" src='+poster_image+'>'
    					+'</div>';
                	$(".movie-scroll").append(str);
    			}
    			pageNum += 1;
    			
    			$.ajax({
    	    		type: 'get',
    	    		url: 'Controller?command=dramaScrollServletAction',
    	    		data:{"page":pageNum},
    	    		datatype: "json",
    	    		error:function(r,s,e) {
    	    			alert("에러!");
    	    		},
    	    		success: function(d) {
    	    			g_b = d;
    	    			for(var i=0; i<=8; i++) {
    	    				/* console.log(i); */
    	    				var movie_drama_id = d[i].movie_drama_id;
    	    				var poster_image = d[i].poster_image;
    	    				var str = 
    	                    	'<div class="normal-image1" moviedramaid='+movie_drama_id+'>'
    	    					+'<img class="gubun-image" gubun="drama" src='+poster_image+'>'
    	    					+'</div>';
    	                	$(".drama-scroll").append(str);
    	    			}
    	    			pageNum += 1;
    	    			
    	    		}
    	    	});
    		}
    	});
    }
    $(function (){
    	$(window).scroll(function (){
    		if($(window).scrollTop() == $(document).height()-$(window).height()) {
    			request_one_page();
    		}
    	});
    });
    request_one_page(); 
    
    $(".normal-image").click(function (){
    	var movieDramaId = $(this).attr("movieDramaId");
    	alert(movieDramaId);
    	$(".list-box option:eq(0)").prop("selected", true);
    	$(".comment-all-box").empty();
    	$(".notice-board").attr('movie_drama_id', movieDramaId); 
    	
    	if(movieDramaId >= 158 && movieDramaId <= 402) {
    		$('html').scrollTop(0);
            $('.movie-detail').fadeIn(100);
            $('#background-btm').fadeIn(100); 
            
            $(".movie-detail-information-text").children().find('b').text('');
    		$(".movie-explanation > .year").text('');
    		$(".movie-explanation > .age-image > img").attr('src',''); 
    		$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text('');
			$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text('');
			$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text('');
			$(".movie-detail-personnel1:first-child > .personnel1").text('');
    		$(".movie-detail-personnel1:last-child > .personnel1").text('');
    		$(".movie-explanation > .movie-contents").text('');
    		$(".detail-information-container > .detail-information-main-image").attr('src','');
    		$(".detail-information-overlay-image > img").attr('src','');
    		$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', ''); 
    		$.ajax({
    			type: 'get',
    			url: 'YGServlet',
    			data: { "movie_drama_id" : movieDramaId },    
    			datatype: "json",
    			success: function(data){
    				
    				var title = data.title;
    				var release_day = data.release_day;
    				var age = data.age;
    				var director = data.director;
    				var actor = data.actor;
    				var genre = data.genre;
    				var summary = data.summary;
    				var priview_image = data.priview_image;
    				var title_image = data.title_image;
    				var first_video = data.first_video;
    				var string_age = data.string_age;
    				var priview = data.priview;
    				$(".movie-detail-information-text").children().find('b').text(title);
    				$(".movie-explanation > .year").text(release_day);
    				$(".movie-explanation > .age-image > img").attr('src','./images/'+ age +'.jpeg');
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".trailer-video").find("img").attr('src',priview_image);
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text(director);				
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text(actor);
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text(genre);
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(3).find(".personnel").text(age + "" + string_age);
    				$(".movie-detail-personnel1:first-child > .personnel1").text(actor);
    				$(".movie-detail-personnel1:last-child > .personnel1").text(genre);
    				$(".movie-explanation > .movie-contents").text(summary);
    				$(".detail-information-container > .detail-information-main-image").attr('src',priview_image);
    				$(".detail-information-overlay-image > img").attr('src',title_image);
    				$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', first_video);
    				$(".movie-detail").children(".notice-board").children().find("h2").text(title);
    				$(".movie-detail").children(".notice-board").children(".sub-title").find(".video-year").text(release_day);
    				
    				$.ajax({
    					type: 'get',
    					url: 'Controller?command=gradeServletAction',
    					data: {"movie_drama_id" : movieDramaId},
    					datatype: 'json',
    					error: function(r,s,e) {
    						alert("평점 에러!");
    					},
    					success: function(data) {
    							var grade = data.grade;
    							var participation = data.participation;
    							
    							$(".notice-board").find(".star-grade").text(grade+"점");
    							$(".notice-board").find(".participation").text(participation+"명 참여");
    					}
    				});
    			},
    			error: function(r,s,e){
    				alert("에러!");
    			}
    		});
    	} else {
    		$('html').scrollTop(0);
            $('.drama-detail').fadeIn(100);
            $('#background-btm').fadeIn(100); 
            
            $(".movie-detail-information-text").children().find('b').text('');
    		$(".movie-explanation > .year").text('');
    		$(".movie-explanation > .age-image > img").attr('src',''); 
    		$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text('');
			$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text('');
			$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text('');
			$(".movie-detail-personnel1:first-child > .personnel1").text('');
    		$(".movie-detail-personnel1:last-child > .personnel1").text('');
    		$(".movie-explanation > .movie-contents").text('');
    		$(".detail-information-container > .detail-information-main-image").attr('src','');
    		$(".detail-information-overlay-image > img").attr('src','');
    		$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', ''); 
    		$.ajax({
    			type: 'get',
    			url: 'YGServlet',
    			data: { "movie_drama_id" : movieDramaId },    
    			datatype: "json",
    			success: function(data){
    				
    				var title = data.title;
    				var release_day = data.release_day;
    				var age = data.age;
    				var director = data.director;
    				var actor = data.actor;
    				var genre = data.genre;
    				var summary = data.summary;
    				var priview_image = data.priview_image;
    				var title_image = data.title_image;
    				var first_video = data.first_video;
    				var string_age = data.string_age;
    				var priview = data.priview;
    				$(".movie-detail-information-text").children().find('b').text(title);
    				$(".movie-explanation > .year").text(release_day);
    				$(".movie-explanation > .age-image > img").attr('src','./images/'+ age +'.jpeg');
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".trailer-video").find("img").attr('src',priview_image);
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text(director);				
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text(actor);
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text(genre);
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(3).find(".personnel").text(age + "" + string_age);
    				$(".movie-detail-personnel1:first-child > .personnel1").text(actor);
    				$(".movie-detail-personnel1:last-child > .personnel1").text(genre);
    				$(".movie-explanation > .movie-contents").text(summary);
    				$(".detail-information-container > .detail-information-main-image").attr('src',priview_image);
    				$(".detail-information-overlay-image > img").attr('src',title_image);
    				$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', first_video);
    				$(".drama-detail").children(".notice-board").children().find("h2").text(title);
    				$(".drama-detail").children(".notice-board").children(".sub-title").find(".video-year").text(release_day);
    				
    				$(".drama-round-box").empty();
    				$.ajax({
		    			type: 'get',
		    			url: 'Controller?command=dramaRoundBoxServletAction',
		    			data: { "movie_drama_id" : movieDramaId },    
		    			datatype: "json",
		    			error: function(r,s,e){
		    				alert("안쪽에러!!");
		    			},
		    			success: function(data){
		    				global_yg = data;			
		    				for(var i=0; i<=data.length-1; i++) {
			    				console.log(i);
		    					var movie_drama_id = data[i].movie_drama_id;
		    					var episode_round = data[i].episode_round;
		    					var episode_image = data[i].episode_image;
		    					var episode_title = data[i].episode_title;
		    					var episode_summary = data[i].episode_summary;
		    					var full_video = data[i].full_video;
		    					var play_time = data[i].play_time;
		    					var str =
		    						'<div class="round-bundle" moviedramaid='+ movie_drama_id +'>'
		                                   +'<div style="height:75px; margin-top: 26px;">'
		                                       +'<div class="drama-round">'
		                                           +episode_round
		                                       +'</div>'
		                                   +'</div>'
		                                   +'<div>'
		                                   +'<a href='+ full_video +'>'
		                                       	+'<img style="position:absolute;" class="round-image" src='+episode_image+'>'
		                                       	+'<div class="round-hover-play-button">'
		                                       		+'<svg style="position:absolute; width: 45px; height: 28px; margin-top: 10px;" fill="none" xmlns="http://www.w3.org/2000/svg" class="titleCard-playSVG">'+'<path d="M4 2.69127C4 1.93067 4.81547 1.44851 5.48192 1.81506L22.4069 11.1238C23.0977 11.5037 23.0977 12.4963 22.4069 12.8762L5.48192 22.1849C4.81546 22.5515 4 22.0693 4 21.3087V2.69127Z" fill="currentColor">'+'</path>'+'</svg>'
		                                       	+'</div>'
		                                   	+'</a>'
		                                       +'<div class="titleCardList">'
		                                           +'<span class="round-title">'
		                                               +episode_title
		                                           +'</span>'
		                                           +'<span class="round-running-time">'
		                                               +play_time
		                                           +'</span>'
		                                           +'<p class="round-summary">'
		    										+episode_summary
		                                           +'</p>'
		                                       +'</div>'
		                                   +'</div>'
		                               +'</div>';
		    					$(".drama-round-box").prepend(str);
		    				}
		    				$.ajax({
		    					type: 'get',
		    					url: 'Controller?command=gradeServletAction',
		    					data: {"movie_drama_id" : movieDramaId},
		    					datatype: 'json',
		    					error: function(r,s,e) {
		    						alert("평점 에러!");
		    					},
		    					success: function(data) {
		    							var grade = data.grade;
		    							var participation = data.participation;
		    							
		    							$(".notice-board").find(".star-grade").text(grade+"점");
		    							$(".notice-board").find(".participation").text(participation+"명 참여");
		    					}
		    				});
		    			}
		    		});
    			},
    			error: function(r,s,e){
    				alert("에러!");
    			}
    		});
    	}
    });
    
    $(document).on("click",".normal-image1",function (){
    	var movieDramaId = $(this).attr("movieDramaId");
    	var gubun = $(this).children().attr("gubun");
    	$(".list-box option:eq(0)").prop("selected", true);
    	$(".comment-all-box").empty();
    	$(".notice-board").attr('movie_drama_id', movieDramaId); 
		
    	if(gubun == "movie") {
    		$('html').scrollTop(0);
            $('.movie-detail').fadeIn(100);
            $('#background-btm').fadeIn(100); 
            
            $(".movie-detail-information-text").children().find('b').text('');
    		$(".movie-explanation > .year").text('');
    		$(".movie-explanation > .age-image > img").attr('src',''); 
    		$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text('');
			$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text('');
			$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text('');
			$(".movie-detail-personnel1:first-child > .personnel1").text('');
    		$(".movie-detail-personnel1:last-child > .personnel1").text('');
    		$(".movie-explanation > .movie-contents").text('');
    		$(".detail-information-container > .detail-information-main-image").attr('src','');
    		$(".detail-information-overlay-image > img").attr('src','');
    		$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', ''); 
    		$.ajax({
    			type: 'get',
    			url: 'YGServlet',
    			data: { "movie_drama_id" : movieDramaId },    
    			datatype: "json",
    			success: function(data){
    				
    				var title = data.title;
    				var release_day = data.release_day;
    				var age = data.age;
    				var director = data.director;
    				var actor = data.actor;
    				var genre = data.genre;
    				var summary = data.summary;
    				var priview_image = data.priview_image;
    				var title_image = data.title_image;
    				var first_video = data.first_video;
    				var string_age = data.string_age;
    				var priview = data.priview;
    				$(".movie-detail-information-text").children().find('b').text(title);
    				$(".movie-explanation > .year").text(release_day);
    				$(".movie-explanation > .age-image > img").attr('src','./images/'+ age +'.jpeg');
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".trailer-video").find("img").attr('src',priview_image);
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text(director);				
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text(actor);
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text(genre);
    				$(".movie-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(3).find(".personnel").text(age + "" + string_age);
    				$(".movie-detail-personnel1:first-child > .personnel1").text(actor);
    				$(".movie-detail-personnel1:last-child > .personnel1").text(genre);
    				$(".movie-explanation > .movie-contents").text(summary);
    				$(".detail-information-container > .detail-information-main-image").attr('src',priview_image);
    				$(".detail-information-overlay-image > img").attr('src',title_image);
    				$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', first_video);
    				$(".movie-detail").children(".notice-board").children().find("h2").text(title);
    				$(".movie-detail").children(".notice-board").children(".sub-title").find(".video-year").text(release_day);
    			
    				$.ajax({
    					type: 'get',
    					url: 'Controller?command=gradeServletAction',
    					data: {"movie_drama_id" : movieDramaId},
    					datatype: 'json',
    					error: function(r,s,e) {
    						alert("평점 에러!");
    					},
    					success: function(data) {
    							var grade = data.grade;
    							var participation = data.participation;
    							
    							$(".notice-board").find(".star-grade").text(grade+"점");
    							$(".notice-board").find(".participation").text(participation+"명 참여");
    					}
    				});
    			},
    			error: function(r,s,e){
    				alert("에러!");
    			}
    		});
    	}else {
    		$('html').scrollTop(0);
            $('.drama-detail').fadeIn(100);
            $('#background-btm').fadeIn(100); 
            
            $(".movie-detail-information-text").children().find('b').text('');
    		$(".movie-explanation > .year").text('');
    		$(".movie-explanation > .age-image > img").attr('src',''); 
    		$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text('');
			$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text('');
			$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text('');
			$(".movie-detail-personnel1:first-child > .personnel1").text('');
    		$(".movie-detail-personnel1:last-child > .personnel1").text('');
    		$(".movie-explanation > .movie-contents").text('');
    		$(".detail-information-container > .detail-information-main-image").attr('src','');
    		$(".detail-information-overlay-image > img").attr('src','');
    		$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', ''); 
    		$.ajax({
    			type: 'get',
    			url: 'YGServlet',
    			data: { "movie_drama_id" : movieDramaId },    
    			datatype: "json",
    			success: function(data){
    				
    				var title = data.title;
    				var release_day = data.release_day;
    				var age = data.age;
    				var director = data.director;
    				var actor = data.actor;
    				var genre = data.genre;
    				var summary = data.summary;
    				var priview_image = data.priview_image;
    				var title_image = data.title_image;
    				var first_video = data.first_video;
    				var string_age = data.string_age;
    				var priview = data.priview;
    				$(".movie-detail-information-text").children().find('b').text(title);
    				$(".movie-explanation > .year").text(release_day);
    				$(".movie-explanation > .age-image > img").attr('src','./images/'+ age +'.jpeg');
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".trailer-video").find("img").attr('src',priview_image);
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(0).find(".personnel").text(director);				
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(1).find(".personnel").text(actor);
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(2).find(".personnel").text(genre);
    				$(".drama-detail").children(".detail-information-overlay").children(".movie-explanation-container").children(".movie-detail-information-text").children("div").eq(3).find(".personnel").text(age + "" + string_age);
    				$(".movie-detail-personnel1:first-child > .personnel1").text(actor);
    				$(".movie-detail-personnel1:last-child > .personnel1").text(genre);
    				$(".movie-explanation > .movie-contents").text(summary);
    				$(".detail-information-container > .detail-information-main-image").attr('src',priview_image);
    				$(".detail-information-overlay-image > img").attr('src',title_image);
    				$(".detail-information-overlay-buttoms > a.overlay-play-button").attr('href', first_video);
    				$(".drama-detail").children(".notice-board").children().find("h2").text(title);
    				$(".drama-detail").children(".notice-board").children(".sub-title").find(".video-year").text(release_day);
    				
    				$(".drama-round-box").empty();
    				$.ajax({
		    			type: 'get',
		    			url: 'Controller?command=dramaRoundBoxServletAction',
		    			data: { "movie_drama_id" : movieDramaId },    
		    			datatype: "json",
		    			error: function(r,s,e){
		    				alert("안쪽에러!!");
		    			},
		    			success: function(data){
		    				global_yg = data;			
		    				for(var i=0; i<=data.length-1; i++) {
			    				console.log(i);
		    					var movie_drama_id = data[i].movie_drama_id;
		    					var episode_round = data[i].episode_round;
		    					var episode_image = data[i].episode_image;
		    					var episode_title = data[i].episode_title;
		    					var episode_summary = data[i].episode_summary;
		    					var full_video = data[i].full_video;
		    					var play_time = data[i].play_time;
		    					var str =
		    						'<div class="round-bundle" moviedramaid='+ movie_drama_id +'>'
		                                   +'<div style="height:75px; margin-top: 26px;">'
		                                       +'<div class="drama-round">'
		                                           +episode_round
		                                       +'</div>'
		                                   +'</div>'
		                                   +'<div>'
		                                   +'<a href='+ full_video +'>'
		                                       	+'<img style="position:absolute;" class="round-image" src='+episode_image+'>'
		                                       	+'<div class="round-hover-play-button">'
		                                       		+'<svg style="position:absolute; width: 45px; height: 28px; margin-top: 10px;" fill="none" xmlns="http://www.w3.org/2000/svg" class="titleCard-playSVG">'+'<path d="M4 2.69127C4 1.93067 4.81547 1.44851 5.48192 1.81506L22.4069 11.1238C23.0977 11.5037 23.0977 12.4963 22.4069 12.8762L5.48192 22.1849C4.81546 22.5515 4 22.0693 4 21.3087V2.69127Z" fill="currentColor">'+'</path>'+'</svg>'
		                                       	+'</div>'
		                                   	+'</a>'
		                                       +'<div class="titleCardList">'
		                                           +'<span class="round-title">'
		                                               +episode_title
		                                           +'</span>'
		                                           +'<span class="round-running-time">'
		                                               +play_time
		                                           +'</span>'
		                                           +'<p class="round-summary">'
		    										+episode_summary
		                                           +'</p>'
		                                       +'</div>'
		                                   +'</div>'
		                               +'</div>';
		    					$(".drama-round-box").prepend(str);
		    				}
		    				$.ajax({
		    					type: 'get',
		    					url: 'Controller?command=gradeServletAction',
		    					data: {"movie_drama_id" : movieDramaId},
		    					datatype: 'json',
		    					error: function(r,s,e) {
		    						alert("평점 에러!");
		    					},
		    					success: function(data) {
		    							var grade = data.grade;
		    							var participation = data.participation;
		    							
		    							$(".notice-board").find(".star-grade").text(grade+"점");
		    							$(".notice-board").find(".participation").text(participation+"명 참여");
		    					}
		    				});
		    			}
		    		});
    			},
    			error: function(r,s,e){
    				alert("에러!");
    			}
    		});
    	}
    });
    $(".list-box").on("change",function (){
    	var movieDramaId = $(".notice-board").attr('movie_drama_id');
		/* alert(this.value); */
		if(this.value == "최신순") {
			/* alert("최신순!"); */ 
			$(".comment-all-box").scrollTop(0);
			$(".comment-all-box").empty();
			$.ajax({
				type: 'get',
				url: 'Controller?command=GradeBoardRecentServletAction',
				data: { "movie_drama_id" : movieDramaId },    
				datatype: "json",
				success: function(data) {
					for(var i=0; i<=data.length-1; i++) {
						console.log(i);
						var user_grade = data[i].user_grade;
						var comment_id = data[i].comment_id;
						var profile_id = data[i].profile_id;
						var user_comment = data[i].user_comment;
						var comment_date = data[i].comment_date;
						var like_hitcount = data[i].like_hitcount;
						var unlike_hitcount = data[i].unlike_hitcount;
						
						var str =
							'<div class="comment-box" commentid='+comment_id+'>'
                                +'<div>'
                                    +'<form name="myform" id="myform3" method="post" action="./save">'
                                        +'<fieldset id="comment-grade">'
                                            +'<label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">'
                                            +'<label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">'
                                            +'<label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">'
                                            +'<label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">'
                                            +'<label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">'
                                        +'</fieldset>'
                                    +'</form>'
                                    +'<div class="user-grade">'+user_grade+'점</div>'
                                +'</div>'
                               +'<div>'
                                    +'<div class="user-comment">'+user_comment+'</div>'
                                +'</div>'
                                +'<div style="margin-bottom: 10px;">'
                                    +'<div class="user-id">'+profile_id+'</div>'
                                    +'<div class="comment-day">'+comment_date+'</div>'
                                +'</div>'
                                +'<div>'
                                    +'<div class="cm_sympathy_area">'
                                        +'<button type="button" class="area_button_upvote">'
                                           +'<span class="plus-count"><i class="fa fa-thumbs-up" aria-hidden="true">'+like_hitcount+'</i></span>'
                                        +'</button>'
                                        +'<button type="button" class="area_button_downvote">'
                                            +'<span class="mines-count"><i class="fa fa-thumbs-down" aria-hidden="true">'+unlike_hitcount+'</i></span>'
                                        +'</button>'
                                    +'</div>'
                                +'</div>'
                            +'</div>';
                            
                    	$(".comment-all-box").prepend(str);
					}
				},
				error:function(r,s,e) {
					alert("리스트박스 에러!");
				}
			});
		} else if(this.value == "공감순") {
			/* alert("공감순!"); */
			$(".comment-all-box").scrollTop(0);
			$(".comment-all-box").empty();
			$.ajax({
				type: 'get',
				url: 'Controller?command=userCommentDataSympathyServletAction',
				data: { "movie_drama_id" : movieDramaId },    
				datatype: "json",
				success: function(data) {
					for(var i=0; i<=data.length-1; i++) {
						console.log(i);
						var user_grade = data[i].user_grade;
						var comment_id = data[i].comment_id;
						var profile_id = data[i].profile_id;
						var user_comment = data[i].user_comment;
						var comment_date = data[i].comment_date;
						var like_hitcount = data[i].like_hitcount;
						var unlike_hitcount = data[i].unlike_hitcount;
						
						var str =
							'<div class="comment-box" commentid='+comment_id+'>'
                                +'<div>'
                                    +'<form name="myform" id="myform3" method="post" action="./save">'
                                        +'<fieldset id="comment-grade">'
                                            +'<label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">'
                                            +'<label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">'
                                            +'<label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">'
                                            +'<label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">'
                                            +'<label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">'
                                        +'</fieldset>'
                                    +'</form>'
                                    +'<div class="user-grade">'+user_grade+'점</div>'
                                +'</div>'
                               +'<div>'
                                    +'<div class="user-comment">'+user_comment+'</div>'
                                +'</div>'
                                +'<div style="margin-bottom: 10px;">'
                                    +'<div class="user-id">'+profile_id+'</div>'
                                    +'<div class="comment-day">'+comment_date+'</div>'
                                +'</div>'
                                +'<div>'
                                    +'<div class="cm_sympathy_area">'
                                        +'<button type="button" class="area_button_upvote">'
                                           +'<span class="plus-count"><i class="fa fa-thumbs-up" aria-hidden="true">'+like_hitcount+'</i></span>'
                                        +'</button>'
                                        +'<button type="button" class="area_button_downvote">'
                                            +'<span class="mines-count"><i class="fa fa-thumbs-down" aria-hidden="true">'+unlike_hitcount+'</i></span>'
                                        +'</button>'
                                    +'</div>'
                                +'</div>'
                            +'</div>';
                            
                    	$(".comment-all-box").prepend(str);
					}
				},
				error:function(r,s,e) {
					alert("리스트박스 에러!");
				}
			});
		} else {
			var memberId = "<%=(Integer)(session.getAttribute("profileId")) %>";
			$(".comment-all-box").scrollTop(0);
			$(".comment-all-box").empty();
			$.ajax({
				type: 'get',
				url: 'Controller?command=gradeBoardMyCommentServletAction',
				data: { "movie_drama_id" : movieDramaId , "member_id" : memberId},    
				datatype: "json",
				success: function(data) {
					global_yg = data;
					for(var i=0; i<=data.length-1; i++) {
						console.log(i);
						var user_grade = data[i].user_grade;
						var comment_id = data[i].comment_id;
						var profile_id = data[i].profile_id;
						var user_comment = data[i].user_comment;
						var comment_date = data[i].comment_date;
						var like_hitcount = data[i].like_hitcount;
						var unlike_hitcount = data[i].unlike_hitcount;
						
						var str =
							'<div class="comment-box" commentid='+comment_id+'>'
                                +'<div>'
                                    +'<form name="myform" id="myform3" method="post" action="./save">'
                                        +'<fieldset id="comment-grade">'
                                            +'<label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">'
                                            +'<label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">'
                                            +'<label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">'
                                            +'<label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">'
                                            +'<label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">'
                                        +'</fieldset>'
                                    +'</form>'
                                    +'<div class="user-grade">'+user_grade+'점</div>'
                                    +'<div class="delite-icon" style="display:inline-block; float:right; cursor:pointer;">'
                                    	+'<svg style="outline:none; color: white;" width="15" height="15" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="Hawkins-Icon1 Hawkins-Icon-Standard" data-uia="previewModal-closebtn" role="button" aria-label="close" tabindex="0">'
                                    		+'<path fill-rule="evenodd" clip-rule="evenodd" d="M2.29297 3.70706L10.5859 12L2.29297 20.2928L3.70718 21.7071L12.0001 13.4142L20.293 21.7071L21.7072 20.2928L13.4143 12L21.7072 3.70706L20.293 2.29285L12.0001 10.5857L3.70718 2.29285L2.29297 3.70706Z" fill="currentColor">'
                                    	+'</path></svg>'
                                    +'</div>'
                                +'</div>'
                               +'<div>'
                                    +'<div class="user-comment">'+user_comment+'</div>'
                                +'</div>'
                                +'<div style="margin-bottom: 10px;">'
                                    +'<div class="user-id">'+profile_id+'</div>'
                                    +'<div class="comment-day">'+comment_date+'</div>'
                                +'</div>'
                                +'<div>'
                                    +'<div class="cm_sympathy_area">'
                                        +'<button type="button" class="area_button_upvote">'
                                           +'<span class="plus-count"><i class="fa fa-thumbs-up" aria-hidden="true">'+like_hitcount+'</i></span>'
                                        +'</button>'
                                        +'<button type="button" class="area_button_downvote">'
                                            +'<span class="mines-count"><i class="fa fa-thumbs-down" aria-hidden="true">'+unlike_hitcount+'</i></span>'
                                        +'</button>'
                                    +'</div>'
                                +'</div>'
                            +'</div>';
                            
                    	$(".comment-all-box").prepend(str);
					}
				},
				error:function(r,s,e) {
					alert("내가 쓴 글 에러!");
				}
			});
		}
	});
    
    $(document).on("click",".delite-icon",function (){
    	var commentId = $(this).parents().parents().attr("commentid");
    	var movieDramaId = $(".notice-board").attr('movie_drama_id');
    	var memberId = "<%=profileID%>"
    	
    	$(".comment-all-box").scrollTop(0);
    	
    	$.ajax({
			type: 'get',
			url: 'DeliteServlet',
			data: {"comment_id" : commentId, "movie_drama_id" : movieDramaId, "member_id" : memberId},    
			datatype: "json",
			success: function(data) {
				$(".comment-all-box").empty();
				for(var i=0; i<=data.length-1; i++) {
				var user_grade = data[i].user_grade;
				var comment_id = data[i].comment_id;
				var profile_id = data[i].profile_id;
				var user_comment = data[i].user_comment;
				var comment_date = data[i].comment_date;
				var like_hitcount = data[i].like_hitcount;
				var unlike_hitcount = data[i].unlike_hitcount;
				
				var str =
					'<div class="comment-box" commentid='+comment_id+'>'
                    +'<div>'
                        +'<form name="myform" id="myform3" method="post" action="./save">'
                            +'<fieldset id="comment-grade">'
                                +'<label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">'
                                +'<label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">'
                                +'<label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">'
                                +'<label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">'
                                +'<label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">'
                            +'</fieldset>'
                        +'</form>'
                        +'<div class="user-grade">'+user_grade+'점</div>'
                        +'<div class="delite-icon" style="display:inline-block; float:right; cursor:pointer;">'
                        	+'<svg style="outline:none; color: white;" width="15" height="15" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="Hawkins-Icon1 Hawkins-Icon-Standard" data-uia="previewModal-closebtn" role="button" aria-label="close" tabindex="0">'
                        		+'<path fill-rule="evenodd" clip-rule="evenodd" d="M2.29297 3.70706L10.5859 12L2.29297 20.2928L3.70718 21.7071L12.0001 13.4142L20.293 21.7071L21.7072 20.2928L13.4143 12L21.7072 3.70706L20.293 2.29285L12.0001 10.5857L3.70718 2.29285L2.29297 3.70706Z" fill="currentColor">'
                        	+'</path></svg>'
                        +'</div>'
                    +'</div>'
                   +'<div>'
                        +'<div class="user-comment">'+user_comment+'</div>'
                    +'</div>'
                    +'<div style="margin-bottom: 10px;">'
                        +'<div class="user-id">'+profile_id+'</div>'
                        +'<div class="comment-day">'+comment_date+'</div>'
                    +'</div>'
                    +'<div>'
                        +'<div class="cm_sympathy_area">'
                            +'<button type="button" class="area_button_upvote">'
                               +'<span class="plus-count"><i class="fa fa-thumbs-up" aria-hidden="true">'+like_hitcount+'</i></span>'
                            +'</button>'
                            +'<button type="button" class="area_button_downvote">'
                                +'<span class="mines-count"><i class="fa fa-thumbs-down" aria-hidden="true">'+unlike_hitcount+'</i></span>'
                            +'</button>'
                        +'</div>'
                    +'</div>'
                +'</div>';
                    
            	$(".comment-all-box").prepend(str);
				}
			},
			error:function(r,s,e) {
				alert("내가 쓴 글 삭제 에러!");
			}
		});
    	alert("삭제되었습니다."); 
    });
    
    
    $("#new-content-button").click(function (){
    	/* int email = (int)(session.getAttribute("member_id")); */
    	
    	alert("준비중 입니다.");
    });
});
</script>
<%-- <%
	String sql = "select gb.profile_id,gb.user_comment,gb.comment_date,gb.like_hitcount,gb.unlike_hitcount from grade_board gb, profile p, movie_drama_main mdm where gb.profile_id = p.profile_id and gb.movie_drama_id = mdm.movie_drama_id and mdm.movie_drama_id=? order by comment_date desc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1,158);
	ResultSet rs = pstmt.executeQuery();
%> --%>
<title>넷플릭스</title>
</head>

<body>
    <div class="window">
    	<div id="background-btm" style="display: none;"></div>
        <div class="home">
		  <div>
            <div class="movie-detail">
                <div class="detail-information">
                    <div class="detail-information-container">
                    
                        <img class="detail-information-main-image" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABavNZ4hIlIR-4zgMvmXH1TodAyEzYoNNmyVLQoZnKxCrCMbOpCW2BbUdJQI7GD6tpnAFIsxaRusmRA1XV2zAxdZ3VDtK7jQYMgsL.webp?r=f13https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/E8vDc_W8CLv7-yMQu8KMEC7Rrr8/AAAABavNZ4hIlIR-4zgMvmXH1TodAyEzYoNNmyVLQoZnKxCrCMbOpCW2BbUdJQI7GD6tpnAFIsxaRusmRA1XV2zAxdZ3VDtK7jQYMgsL.webp?r=f13" width="100%" height="100%">
                    </div>
                </div>
                <div class="detail-information-overlay">
                    <div class="detail-information-overlay-image">
                        <img src="https://occ-0-4342-993.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABT111c9ZNZBrT4W5WerPFx3kI7cEr2Oab0IwpF4MgB4KNiIN2iM-WBN6Iml9gSnayaCbWliUFpnQCLaMv3cjo0wz-RsjssRu1mIoF5KWre3wD8OE2yPVq7Q2bSC97YdGG_ZJZtvaL0wszkH-6h-b1-w2aTRenXHJkPHo0TGLFCQD.webp?r=ddc" width="100%" height="100%">
                    </div>
                    <div class="detail-information-overlay-buttoms">
                        <a class="overlay-play-button" href="https://www.netflix.com/watch/81094067?trackId=255824129&tctx=0%2C0%2CNAPA%40%40%7Cc89e0000-96df-4e3a-a71d-df8d1e5d8b54-512194782_titles%2F1%2F%2F%EC%8A%B9%EB%A6%AC%ED%98%B8%2F0%2F0%2CNAPA%40%40%7Cc89e0000-96df-4e3a-a71d-df8d1e5d8b54-512194782_titles%2F1%2F%2F%EC%8A%B9%EB%A6%AC%ED%98%B8%2F0%2F0%2Cunknown%2C%2Cc89e0000-96df-4e3a-a71d-df8d1e5d8b54-512194782%7C1%2C%2C">
                            <img class="play-button-image" src="./images/playbutton.png">
                        </a>
                        <button class="overlay-dib-button">
                            <i class="fal fa-plus fa-3x"></i>
                        </button>
                    </div>
                    <div class="movie-explanation-container">
                        <div class="movie-explanation-box">
                            <div class="movie-explanation-set-left">
                                <div class="movie-explanation">
                                    <h3 class="year">2021</h3>
                                    <div class="age-image"><img src="./images/12.jpeg" width="30px" height="30px"></div>
                                    <h3 class="runing-time">2시간 16분</h3>
                                    <div class="movie-contents">
                                        우주에서 쓰레기를 주우며 산다. 꿈은 아득하기만 하다. 2092년, 기댈 곳 없는 낙오자 넷. 그들이 천진한 인간형 로봇을 손에 넣는다. 때가 왔다, 위험한 거래를 개시한다!
                                    </div>
                                </div>
                            </div>
                            <div class="movie-explanation-set-right">
                                <div class="movie-actor-genre">
                                    <div class="movie-detail-personnel1">출연 : <span class="personnel1">송중기, 김태리, 진선규,</span></div>
                                    <div class="movie-detail-personnel1">장르 : <span class="personnel1">SF 영화, 액션 & 어드벤처</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="watched-contents-text">
                            <h2>함께 시청된 콘텐츠</h2>
                        </div>
                        <div class="watched-video">
                            <img class="watched-video-image" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABZoIjkUHvp_hQ1xjxLkugLNXwzLImgal-Nqcpt1d1dE2ohm_nuR4gwRHqY2EWbcP2fIFCncTf7hxP_BwDswLDb_kalfEljlWc3r8MI1obVpPKVM8-rxj8AjJ1kBfVsTu80NA.jpg?r=13e" width="236px" height="136px" style="margin-right: 11.5px;">
                            <div class="watched-video-box">
                                <img class="watched-video-age" src="./images/18Gray.png">
                                <h3 style="color: white; margin-top: 15px;">2020</h3>
                                <img class="watched-video-dib" src="./images/dibGray.png" style="background-color: #2f2f2f;">
                            </div>
                            <div class="watched-video-explanation-box">
                                <div class="watched-video-explanation">일주일 후면 신호가 켜진다. 범죄 발생을 막기 위해, 개인의 머릿속을 통제하려는 정부. 자유가 사라지기 전에, 베테랑 은행 강도가 일생일대의 마지막 범죄를 계획한다.</div>
                            </div>
                        </div>
                        <div class="watched-video">
                            <img class="watched-video-image" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABbNlxVVrWUEzSlxfDPJzg6IMPNpSFHsgAlMzfTxZEmjjGAWuGAedJy-NUi-ukiOJ8M4503aAtL4P3XQRZloyvCICrNQbl1_PJ7yhWv6B7zreK4X9uOyAQVXR4v8bvoOoVxCP.jpg?r=dc6" width="236px" height="136px" style="margin-right: 11.5px;">
                            <div class="watched-video-box">
                                <img class="watched-video-age" src="./images/15Gray.png">
                                <h3 style="color: white; margin-top: 15px;">2020</h3>
                                <img class="watched-video-dib" src="./images/dibGray.png" style="background-color: #2f2f2f;">
                            </div>
                            <div class="watched-video-explanation-box">
                                <div class="watched-video-explanation">갑작스러운 대재앙으로 혼란한 나라. 임신한 약혼녀를 구해야 한다! 하늘길은 막혔고, 이동 수단은 자동차뿐. 젊은 변호사가 예비 장인과 서부로 위험한 여정을 떠난다.</div>
                            </div>
                        </div>
                        <div class="watched-video">
                            <img class="watched-video-image" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABQLI7Z80VQUTOMItLtllKiWoSyLHns9JszKddSUirC10i8XAsabElcSKGJjBJbwM9QyJHND2XY6xCe7T49_2Z7HgIyvyyoEWwAse9FQbDHMLtR6QbXUxeyfoYzVPX8x0qomQ.jpg?r=7a7" width="236px" height="136px">
                            <div class="watched-video-box">
                                <img class="watched-video-age" src="./images/15Gray.png">
                                <h3 style="color: white; margin-top: 15px;">2021</h3>
                                <img class="watched-video-dib" src="./images/dibGray.png" style="background-color: #2f2f2f;">
                            </div>
                            <div class="watched-video-explanation-box">
                                <div class="watched-video-explanation">평범한 시민들과 슈퍼히어로가 공존하는 현재의 파리. 일반인에게 초능력을 부여하는 약물의 등장과 함께 사건이 줄을 잇자 두 경찰이 수사에 나선다. 무책임한 힘의 범람을 막아야한다.</div>
                            </div>
                        </div>
                        <div class="watched-video1">
                            <img class="watched-video-image" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABeegt8cWOjo9mmP0Tj-1w_trgjvA972-G3AitlLPIxw7Xgf_e0jB3jK5tmwDHls_0itJGSTiy98Zu6I891DLJ2G6uxjVzujMX7c.webp?r=a59" width="236px" height="136px" style="margin-right: 11.5px;">
                            <div class="watched-video-box">
                                <img class="watched-video-age" src="./images/12Gray.png">
                                <h3 style="color: white; margin-top: 15px;">2004</h3>
                                <img class="watched-video-dib" src="./images/dibGray.png" style="background-color: #2f2f2f;">
                            </div>
                            <div class="watched-video-explanation-box">
                                <div class="watched-video-explanation">《스타트렉》의 프리퀄 작품으로, 우주를 탐험하는 아처 선장과 선원들이 새로운 외계 종족을 만나면서 인류의 혁신을 확장하는 다양한 기술을 발견한다.</div>
                            </div>
                        </div>
                        <div class="watched-video1">
                            <img class="watched-video-image" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABXBhezlcvw1PUEzqFkSW5CDR2DIJINXIlzG3UFIJy299aFFlWnXvTqbPGsZYI6nkUsHNdo8Lh8Fy7xqDOxhkE4YoTxa7kAw4AHg.webp?r=dac" width="236px" height="136px" style="margin-right: 11.5px;">
                            <div class="watched-video-box">
                                <img class="watched-video-age" src="./images/18Gray.png">
                                <h3 style="color: white; margin-top: 15px;">2013</h3>
                                <img class="watched-video-dib" src="./images/dibGray.png" style="background-color: #2f2f2f;">
                            </div>
                            <div class="watched-video-explanation-box">
                                <div class="watched-video-explanation">부자들이 초호화 우주 도시로 이주한 사이, 지구에 남겨진 이들의 삶은 점점 더 황폐해진다. 2154년을 배경으로 펼쳐지는 디스토피아 스릴러 영화.</div>
                            </div>
                        </div>
                        <div class="watched-video1">
                            <img class="watched-video-image" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABQalmi3yC_mf1f3s8N1MjYghtn5SDCbFMHF4aDINmMbUn7UYnpt2V8SL0QUI39oFGXZw1ryWCPMMtFJGpE_uDmlrpAksr4qUjB8.webp?r=62b" width="236px" height="136px">
                            <div class="watched-video-box">
                                <img class="watched-video-age" src="./images/15Gray.png">
                                <h3 style="color: white; margin-top: 15px;">2015</h3>
                                <img class="watched-video-dib" src="./images/dibGray.png" style="background-color: #2f2f2f;">
                            </div>
                            <div class="watched-video-explanation-box">
                                <div class="watched-video-explanation">핵전쟁으로 황폐해진 세상을 정처 없이 떠돌던 맥스. 독재자를 피해 도망치는 여전사와 독재자의 다섯 여인을 도와주게 되면서 사막의 질주를 시작한다.</div>
                            </div>
                        </div>
                        <div class="trailer-text">
                            <h2>예고편 및 다른 영상</h2>
                        </div>
                        <div class="trailer-video">
                            <img class="priview-image" style="width:341px; height:192px;" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/9pS1daC2n6UGc3dUogvWIPMR_OU/AAAABU7H-KttkzXtzLu6CpMcKCWjnp31niMLILrPM0hLuGHEwpnWjHqY6uBYUycbCs1B7OCYh4VAmu4NMXcMvMohF9qsZQG0LGXflNpBDBg6CKI9lA4NR4dXkX2S.webp?r=212">
                            <div class="titleCard">
                                <svg style="margin-left: 15px; margin-top: 15px" class="titleCard-playSVG" width="40" height="40" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 2.69127C4 1.93067 4.81547 1.44851 5.48192 1.81506L22.4069 11.1238C23.0977 11.5037 23.0977 12.4963 22.4069 12.8762L5.48192 22.1849C4.81546 22.5515 4 22.0693 4 21.3087V2.69127Z" fill="currentColor"></path></svg>
                            </div>
                            <h3 class="trailer-text1">예고편</h3>
                        </div>
                        <!-- <div class="trailer-video2">
                            <img class="priview-image" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/9pS1daC2n6UGc3dUogvWIPMR_OU/AAAABbXbe0un-PsodD81bw7ln-oVF7kShyKOqWUnyjfLzqyQEtCN9HCHVgnxjO5fQouZItsUIai5r4NBwQ94EcPO2-7YjGGk_ROYBcYbuKXAi9yLouiiStTrPdlX.webp?r=456" style="border-radius: 5px;">
                            <div class="titleCard">
                                <svg style="margin-left: 15px; margin-top: 15px" class="titleCard-playSVG" width="40" height="40" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 2.69127C4 1.93067 4.81547 1.44851 5.48192 1.81506L22.4069 11.1238C23.0977 11.5037 23.0977 12.4963 22.4069 12.8762L5.48192 22.1849C4.81546 22.5515 4 22.0693 4 21.3087V2.69127Z" fill="currentColor"></path></svg>
                            </div>
                            <h3 class="trailer-text1">예고편2</h3>
                        </div> -->
                        <div class="movie-detail-information-text">
                            <h2><b>승리호</b> 상세 정보</h2>
                            <div class="movie-detail-personnel">감독 : <span class="personnel">조성희</span></div>
                            <div class="movie-detail-personnel">출연 : <span class="personnel">송중기, 김태리, 진선규, 유해진, 리처드 아미티지, 박예린</span></div>
                            <div class="movie-detail-personnel">각복 : <span class="personnel">조성희, 윤승민, 유강서애</span></div>
                            <div class="movie-detail-personnel">장르 : <span class="personnel">SF 영화, 액션 & 어드벤처</span></div>
                            <div class="movie-detail-personnel">영화 특징 : <span class="personnel">흥미진진</span></div>
                            <div class="movie-detail-personnel">관람등급 : <span class="personnel">12세이상관람가</span></div>
                        </div>
                    </div>
                </div>
                <div class="notice-board">
                    <div class="title-area">
                        <div class="title-text"><h2>승리호</h2></div>
                        <div class="close-icon"><svg style="outline:none; color: white;" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="Hawkins-Icon1 Hawkins-Icon-Standard" data-uia="previewModal-closebtn" role="button" aria-label="close" tabindex="0"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.29297 3.70706L10.5859 12L2.29297 20.2928L3.70718 21.7071L12.0001 13.4142L20.293 21.7071L21.7072 20.2928L13.4143 12L21.7072 3.70706L20.293 2.29285L12.0001 10.5857L3.70718 2.29285L2.29297 3.70706Z" fill="currentColor"></path></svg></div>
                    </div>
                    <div class="sub-title">
                        <span class="video-type">영화</span>
                        <span class="video-year">2020</span>
                    </div>
                    <div class="cm-content-wrap">
                        <div class="grade-text">
                            평점
                        </div>
                        <div class="grade-box">
                            <div class="user-grade-sum-box">
                                <h3 style="text-align: center; color: white;">네티즌 평점</h3>
                                <div class="star-grade" style="margin-top:50px; font-size: 3.6rem; color: black; text-align: center; color: white;"></div>
                                <!-- <form style="text-align: center;" name="myform" id="myform" method="post" action="./save">
                                    <fieldset>
                                        <label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">
                                        <label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">
                                        <label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">
                                        <label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">
                                        <label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">
                                    </fieldset>
                                </form> -->
                                <div class="participation" style="margin-top:50px; color: white; text-align: center;"></div>
                            </div>
                            <div class="age-satisfaction-box">
                                <h3 style="color: white; text-align: center; border-bottom: solid 1px gray; padding-bottom: 10px;">나이별 만족도</h3>
                                <div class="graph-box">
                                    <div style="width: 363px; height: 175px;">
                                        <canvas id="myChart"></canvas>
                                    </div>
                                    <script type="text/javascript">
                                        var context = document.getElementById('myChart').getContext('2d');
                                        var myChart = new Chart(context,
                                                {
                                                    type : 'bar', // 차트의 형태
                                                    data : { // 차트에 들어갈 데이터
                                                        labels : [
                                                        //x 축
                                                        '10대', '20대', '30대', '40대', '50대'],
                                                        datasets : [ { //데이터
                                                            label : '', //차트 제목
                                                            fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                                                            data : [ 21, 19, 25, 20, 23 //x축 label에 대응되는 데이터 값
                                                            ],
                                                            backgroundColor : [
                                                            //색상
                                                            'rgba(255, 99, 132, 0.2)',
                                                                    'rgba(54, 162, 235, 0.2)',
                                                                    'rgba(255, 206, 86, 0.2)',
                                                                    'rgba(75, 192, 192, 0.2)',
                                                                    'rgba(255, 159, 64, 0.2)' ],
                                                            borderColor : [
                                                            //경계선 색상
                                                            'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
                                                                    'rgba(255, 206, 86, 1)',
                                                                    'rgba(75, 192, 192, 1)',
                                                                    'rgba(255, 159, 64, 1)' ],
                                                            borderWidth : 1
                                                        //경계선 굵기
                                                        } /* ,
                                                                                {
                                                                                    label: 'test2',
                                                                                    fill: false,
                                                                                    data: [
                                                                                        8, 34, 12, 24
                                                                                    ],
                                                                                    backgroundColor: 'rgb(157, 109, 12)',
                                                                                    borderColor: 'rgb(157, 109, 12)'
                                                                                } */
                                                        ]
                                                    },
                                                    options : {
                                                        scales : {
                                                            yAxes : [ {
                                                                ticks : {
                                                                    beginAtZero : true
                                                                }
                                                            } ]
                                                        }
                                                    }
                                                });
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cm-content-area">
                        <div class="netizens-text" style="font-size: 22px; color: white; padding: 20px 0; text-align: center; border-bottom: solid 1px gray;">
                            관람객 / 네티즌
                        </div>
                        <div style="font-size: 22px; color: white; padding: 40px 0 20px 0; text-align: center;">별점을 선택해주세요.</div>
                        <form style="text-align: center;" name="myform" id="netizens-grade" method="post" action="./save">
                            <!-- <fieldset class="starpoint-box">
                                <label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1" class="star-radio">
                                <label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2" class="star-radio">
                                <label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3" class="star-radio">
                                <label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4" class="star-radio">
                                <label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5" class="star-radio">
                            </fieldset> -->
                            <select id="jumsu" style="width:100px;">
                            	<option selected>1</option>
                            	<option>2</option>
                            	<option>3</option>
                            	<option>4</option>
                            	<option>5</option>
                            	<option>6</option>
                            	<option>7</option>
                            	<option>8</option>
                            	<option>9</option>
                            	<option>10</option>
                            </select>
                        </form>
                        <div class="cm_form_intro_box"> 
                            <div class="area_input_box"> 
                                <input type="text" class="this_input_write" placeholder="감상평을 등록해주세요."> 
                            </div> 
                            <button type="submit" class="this_button_write">등록</button> 
                        </div>
                        <div class="list-container">
                            <div class="list-container">
                            <!-- <h3 class="list-select-box" style="color: white; margin-left: 15px;">최신순</h3> -->
                           	<!--<i style="color: white;" class="fa fa-chevron-down"></i>  -->
                           	
                        	<select class="list-box">
                        		<option class="select" selected>선택</option>
                            	<option class="new">최신순</option>
                           	 	<option class="sympathy">공감순</option>
                           	 	<option class="myComment">내가 작성한 글</option>
                        	</select>
                        </div>
                        </div>
                        
                        <div class="comment-all-box">
                        <%-- <%
                        CommentBoxDao cDao = new CommentBoxDao();
                        ArrayList<CommentBoxDto> cDto = cDao.userCommentData();
                        for(CommentBoxDto commentBox : cDto) {
                        %>
                            <div class="comment-box" commentId="<%=commentBox.getCommentId() %>">
                                <div>
                                    <form name="myform" id="myform3" method="post" action="./save">
                                        <fieldset id="comment-grade">
                                            <label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">
                                            <label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">
                                            <label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">
                                            <label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">
                                            <label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">
                                        </fieldset>
                                    </form>
                                    <div class="user-grade">0</div>
                                </div>
                                <div>
                                    <div class="user-comment"><%=commentBox.getUserComment() %></div>
                                </div>
                                <div style="margin-bottom: 10px;">
                                    <div class="user-id"><%=commentBox.getProfileId() %></div>
                                    <div class="comment-day"><%=commentBox.getCommentDate() %></div>
                                </div>
                                <div>
                                    <div class="cm_sympathy_area" >
                                        <button type="button" class="area_button_upvote">
                                            <span class="plus-count"><i class="fa fa-thumbs-up"><%=commentBox.getLikeHitCount() %></i></span>
                                        </button>
                                        <button type="button" class="area_button_downvote">
                                            <span class="mines-count"><i class="fa fa-thumbs-down"><%=commentBox.getUnlikeHitCount() %></i></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                			<%
                        	}
                        	%>  --%>
                        </div>
                        <!-- <div style="display:none;">
	                        <div class="comment-box-original">
                                <div>
                                    <form name="myform" id="myform3" method="post" action="./save">
                                        <fieldset id="comment-grade">
                                            <label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">
                                            <label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">
                                            <label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">
                                            <label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">
                                            <label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">
                                        </fieldset>
                                    </form>
                                    <div class="user-grade">0</div>
                                </div>
                                <div>
                                    <div class="user-comment">ㅎ</div>
                                </div>
                                <div style="margin-bottom: 10px;">
                                    <div class="user-id">YG</div>
                                    <div class="comment-day">2022-06-17</div>
                                </div>
                                <div>
                                    <div class="cm_sympathy_area">
                                        <button type="button" class="area_button_upvote">
                                            <span class="plus-count"><i class="fas fa-thumbs-up">0</i></span>
                                        </button>
                                        <button type="button" class="area_button_downvote">
                                            <span class="mines-count"><i class="fas fa-thumbs-down">0<</i></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                    	</div> -->
                    </div>    
                </div>
            </div>
            <div class="drama-detail">
                <div class="detail-information">
                    <div class="detail-information-container">
                        <img class="detail-information-main-image" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/9pS1daC2n6UGc3dUogvWIPMR_OU/AAAABdNrCCpzFOFMCgYUi-2mdo-MHIKetZmEyG-wmbN36GLopUiQIkaKtt971hPfSwqHOHAqoyAwUJ0OIZ_Cz-lfkw18I2IDH23PQbp9JGLakLY8yUQlbLx6SPTnwA.webp?r=ccb" width="100%" height="100%">
                    </div>
                </div>
                <div class="detail-information-overlay">
                    <div class="detail-information-overlay-image">
                        <img src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABWy-j8WQFXYA5UwfDQoM1-2QEe4jfMyE02lNP8z7tOCu3hurT6_vBURObMFdSnOduOoIxiKiepL34xv0rNxU1ic-wsCkY7lo8GNBxhbKqkY.webp?r=88d" width="100%" height="100%">
                    </div>
                    <div class="detail-information-overlay-buttoms">
                        <a class="overlay-play-button" href="https://www.netflix.com/watch/81094067?trackId=255824129&tctx=0%2C0%2CNAPA%40%40%7Cc89e0000-96df-4e3a-a71d-df8d1e5d8b54-512194782_titles%2F1%2F%2F%EC%8A%B9%EB%A6%AC%ED%98%B8%2F0%2F0%2CNAPA%40%40%7Cc89e0000-96df-4e3a-a71d-df8d1e5d8b54-512194782_titles%2F1%2F%2F%EC%8A%B9%EB%A6%AC%ED%98%B8%2F0%2F0%2Cunknown%2C%2Cc89e0000-96df-4e3a-a71d-df8d1e5d8b54-512194782%7C1%2C%2C">
                            <img class="play-button-image" src="./images/playbutton.png">
                        </a>
                        <button class="overlay-dib-button">
                            <i class="fal fa-plus fa-3x"></i>
                        </button>
                    </div>
                    <div class="movie-explanation-container">
                        <div class="movie-explanation-box">
                            <div class="movie-explanation-set-left">
                                <div class="movie-explanation">
                                    <h3 class="year">2022</h3>
                                    <div class="age-image"><img src="./images/15.jpeg" width="30px" height="30px"></div>
                                    <h3 class="runing-time">시즌 1개</h3>
                                    <div class="movie-contents">
                                        IMF 외환위기가 터지면서 꿈을 접어야 할 처지에 놓인 나희도. 하지만 순순히 물러선다면 희도가 아니다. 두고 보라고, 어떻게든 펜싱부가 있는 학교로 전학 가고 말 테니.
                                    </div>
                                </div>
                            </div>
                            <div class="movie-explanation-set-right">
                                <div class="movie-actor-genre">
                                    <div class="movie-detail-personnel1">출연 : <span class="personnel1">김태리, 남주혁, 김지연,</span></div>
                                    <div class="movie-detail-personnel1">장르 : <span class="personnel1">로맨틱한 드라마, 한국 드라마</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="watched-contents-text">
                            <h2>회차</h2>
                        </div>
                        <div class="drama-round-box">
                        <%-- <%
                        	String sql3 ="select episode_round,episode_image,episode_title,episode_summary,full_video,play_time from movie_drama_episode where movie_drama_id = 1 order by episode_round";
                        	pstmt = conn.prepareStatement(sql3);
                        	rs = pstmt.executeQuery();
                        	
                        	while(rs.next()) {
                        		String episodeRound = rs.getString("episode_round");
                        		String episodeImage = rs.getString("episode_image");
                        		String episodeTitle = rs.getString("episode_title");
                        		String episodeSummary = rs.getString("episode_summary");
                        		String fullVideo = rs.getString("full_video");
                        		String playTime = rs.getString("play_time");
                        %> --%>
                            <div class="round-bundle">
                                <div style="height:75px; margin-top: 26px;">
                                    <div class="drama-round">
                                    </div>
                                </div>
                                <div>
                                	<a href="">
                                    	<img style="position:absolute;" class="round-image" src="">
                                    	<div class="round-hover-play-button">
                                    		<svg style="position:absolute; width: 45px; height: 28px;" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="titleCard-playSVG"><path d="M4 2.69127C4 1.93067 4.81547 1.44851 5.48192 1.81506L22.4069 11.1238C23.0977 11.5037 23.0977 12.4963 22.4069 12.8762L5.48192 22.1849C4.81546 22.5515 4 22.0693 4 21.3087V2.69127Z" fill="currentColor"></path></svg>
                                    	</div>
                                	</a>
                                    <div class="titleCardList">
                                        <span class="round-title">
                                        </span>
                                        <span class="round-running-time">
                                        </span>
                                        <p class="round-summary">
                                        </p>
                                    </div>
                                </div>
                            </div>
                                        <%-- <%
                        					}
                                        %> --%>
                        </div>
                        <div class="trailer-text">
                            <h2>예고편 및 다른 영상</h2>
                        </div>
                        <div class="trailer-video">
                            <img src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/9pS1daC2n6UGc3dUogvWIPMR_OU/AAAABc4i_kwdJVNWkGpIHtCZ3-edq9sLYoUM2wZWItEpLiTP5qYmd1S2mNMv5p_k27zd38_Tx7S_j-jRNlS25sQQyZ1XM-FWsN5Exm80WxT19GcAFSQJyAdzh7wP.webp?r=e57" style="border-radius: 5px; width:341px; height:192px;">
                            <div class="titleCard">
                                <svg style="margin-left: 15px; margin-top: 15px" class="titleCard-playSVG" width="40" height="40" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 2.69127C4 1.93067 4.81547 1.44851 5.48192 1.81506L22.4069 11.1238C23.0977 11.5037 23.0977 12.4963 22.4069 12.8762L5.48192 22.1849C4.81546 22.5515 4 22.0693 4 21.3087V2.69127Z" fill="currentColor"></path></svg>
                            </div>
                            <h3 class="trailer-text1">예고편</h3>
                        </div>
                        <!-- <div class="trailer-video2">
                            <img src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/9pS1daC2n6UGc3dUogvWIPMR_OU/AAAABf_KoJdOgwVtBtCx4RSWQoysFnTlum6NwdiTJFuTU_qtuQ-hNGkbM7pUoa1x45GVcyEVE-TBnAXEAVKKmO_5wkXZIMHrfBB_RDYwFI8krvGOOyw4GJA6sSaY.webp?r=cab" style="border-radius: 5px;">
                            <div class="titleCard">
                                <svg style="margin-left: 15px; margin-top: 15px" class="titleCard-playSVG" width="40" height="40" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M4 2.69127C4 1.93067 4.81547 1.44851 5.48192 1.81506L22.4069 11.1238C23.0977 11.5037 23.0977 12.4963 22.4069 12.8762L5.48192 22.1849C4.81546 22.5515 4 22.0693 4 21.3087V2.69127Z" fill="currentColor"></path></svg>
                            </div>
                            <h3 class="trailer-text1">예고편2</h3>
                        </div> -->
                        <div class="movie-detail-information-text">
                            <h2><b>스물다섯 스물하나</b> 상세 정보</h2>
                            <div class="movie-detail-personnel">크리에이터 : <span class="personnel">정지현, 권도은</span></div>
                            <div class="movie-detail-personnel">출연 : <span class="personnel">김태리, 남주혁, 김지연, 최현욱, 이주명</span></div>
                            <div class="movie-detail-personnel">장르 : <span class="personnel">로맨틱한 드라마, 한국 드라마, 드라마</span></div>
                            <div class="movie-detail-personnel">관람등급 : <span class="personnel">15세이상관람가</span></div>
                        </div>
                    </div>
                </div>
                <div class="notice-board">
                    <div class="title-area">
                        <div class="title-text"><h2>스물다섯 스물하나</h2></div>
                        <div class="close-icon"><svg style="outline:none; color: white;" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="Hawkins-Icon1 Hawkins-Icon-Standard" data-uia="previewModal-closebtn" role="button" aria-label="close" tabindex="0"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.29297 3.70706L10.5859 12L2.29297 20.2928L3.70718 21.7071L12.0001 13.4142L20.293 21.7071L21.7072 20.2928L13.4143 12L21.7072 3.70706L20.293 2.29285L12.0001 10.5857L3.70718 2.29285L2.29297 3.70706Z" fill="currentColor"></path></svg></div>
                    </div>
                    <div class="sub-title">
                        <span class="video-type">드라마</span>
                        <span class="video-year">2020</span>
                    </div>
                    <div class="cm-content-wrap">
                        <div class="grade-text">
                            평점
                        </div>
                        <div class="grade-box">
                            <div class="user-grade-sum-box">
                                <h3 style="text-align: center; color: white;">네티즌 평점</h3>
                                <div class="star-grade" style="margin-top:50px; font-size: 3.6rem; color: black; text-align: center; color: white;"></div>
                                <!-- <form style="text-align: center;" name="myform" id="myform" method="post" action="./save">
                                    <fieldset>
                                        <label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">
                                        <label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">
                                        <label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">
                                        <label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">
                                        <label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">
                                    </fieldset>
                                </form> -->
                                <div class="participation" style="margin-top:50px; color: white; text-align: center;"></div>
                            </div>
                            <div class="age-satisfaction-box">
                                <h3 style="color: white; text-align: center; border-bottom: solid 1px gray; padding-bottom: 10px;">나이별 만족도</h3>
                                <div class="graph-box">
                                    <div style="width: 363px; height: 175px;">
                                        <canvas id="drama-chart"></canvas>
                                    </div>
                                    <script type="text/javascript">
                                        var context = document.getElementById('drama-chart').getContext('2d');
                                        var myChart = new Chart(context,
                                                {
                                                    type : 'bar', // 차트의 형태
                                                    data : { // 차트에 들어갈 데이터
                                                        labels : [
                                                        //x 축
                                                        '10대', '20대', '30대', '40대', '50대'],
                                                        datasets : [ { //데이터
                                                            label : '', //차트 제목
                                                            fill : false, // line 형태일 때, 선 안쪽을 채우는지 안채우는지
                                                            data : [ 21, 19, 25, 20, 23 //x축 label에 대응되는 데이터 값
                                                            ],
                                                            backgroundColor : [
                                                            //색상
                                                            'rgba(255, 99, 132, 0.2)',
                                                                    'rgba(54, 162, 235, 0.2)',
                                                                    'rgba(255, 206, 86, 0.2)',
                                                                    'rgba(75, 192, 192, 0.2)',
                                                                    'rgba(255, 159, 64, 0.2)' ],
                                                            borderColor : [
                                                            //경계선 색상
                                                            'rgba(255, 99, 132, 1)', 'rgba(54, 162, 235, 1)',
                                                                    'rgba(255, 206, 86, 1)',
                                                                    'rgba(75, 192, 192, 1)',
                                                                    'rgba(255, 159, 64, 1)' ],
                                                            borderWidth : 1
                                                        //경계선 굵기
                                                        } /* ,
                                                                                {
                                                                                    label: 'test2',
                                                                                    fill: false,
                                                                                    data: [
                                                                                        8, 34, 12, 24
                                                                                    ],
                                                                                    backgroundColor: 'rgb(157, 109, 12)',
                                                                                    borderColor: 'rgb(157, 109, 12)'
                                                                                } */
                                                        ]
                                                    },
                                                    options : {
                                                        scales : {
                                                            yAxes : [ {
                                                                ticks : {
                                                                    beginAtZero : true
                                                                }
                                                            } ]
                                                        }
                                                    }
                                                });
                                    </script>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="cm-content-area">
                        <div class="netizens-text" style="font-size: 22px; color: white; padding: 20px 0; text-align: center; border-bottom: solid 1px gray;">
                            관람객 / 네티즌
                        </div>
                        <div style="font-size: 22px; color: white; padding: 40px 0 20px 0; text-align: center;">별점을 선택해주세요.</div>
                        <form style="text-align: center;" name="myform" id="netizens-grade" method="post" action="./save">
                            <!-- <fieldset class="starpoint-box">
                                <label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1" class="star-radio">
                                <label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2" class="star-radio">
                                <label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3" class="star-radio">
                                <label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4" class="star-radio">
                                <label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5" class="star-radio">
                            </fieldset> -->
                            <select id="jumsu" style="width:100px;">
                            	<option selected>1</option>
                            	<option>2</option>
                            	<option>3</option>
                            	<option>4</option>
                            	<option>5</option>
                            	<option>6</option>
                            	<option>7</option>
                            	<option>8</option>
                            	<option>9</option>
                            	<option>10</option>
                            </select>
                        </form>
                        <div class="cm_form_intro_box"> 
                            <div class="area_input_box"> 
                                <input type="text" class="this_input_write" placeholder="감상평을 등록해주세요."> 
                            </div> 
                            <button onclick="tCR('a=nco_x0a*A.tabregistration&amp;r=1&amp;i=1800009D_00000095B94E');" type="button" class="this_button_write">등록</button> 
                        </div>
                        <div class="list-container">
                            <!-- <h3 class="list-select-box" style="color: white; margin-left: 15px;">최신순</h3> -->
                           	<!--<i style="color: white;" class="fa fa-chevron-down"></i>  -->
                           	
                        	<select class="list-box">
                            	<option class="select" selected>선택</option>
                            	<option class="new">최신순</option>
                           	 	<option class="sympathy">공감순</option>
                           	 	<option class="myComment">내가 작성한 글</option>
                        	</select>
                        </div>
                        <div class="comment-all-box">
                            <div class="comment-box">
                                <div>
                                    <form name="myform" id="myform3" method="post" action="./save">
                                        <fieldset id="comment-grade">
                                            <label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">
                                            <label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">
                                            <label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">
                                            <label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">
                                            <label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">
                                        </fieldset>
                                    </form>
                                    <div class="user-grade">0</div>
                                </div>
                                <div>
                                    <div class="user-comment">ddㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁ</div>
                                </div>
                                <div style="margin-bottom: 10px;">
                                    <div class="user-id">ueju****</div>
                                    <div class="comment-day">2022.05.15. 05:09</div>
                                </div>
                                <div>
                                    <div class="cm_sympathy_area">
                                        <button type="button" class="area_button_upvote">
                                            <span class="plus-count"><i class="fas fa-thumbs-up">0</i></span>
                                        </button>
                                        <button type="button" class="area_button_downvote">
                                            <span class="mines-count"><i class="fas fa-thumbs-down">0</i></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>    
                </div>
            </div>
            
             <%
			ArrayList<MainRandomDto> mRList = (ArrayList<MainRandomDto>)request.getAttribute("mRList");
            for(MainRandomDto mRDto : mRList) {
			%>
            <img class="main-img"
                src="<%=mRDto.getPriviewImage() %>"
                width="100%" height="100%">
            <div class="overlay">
                <div class="banner">
                    <img class="titleImage"
                        src="<%=mRDto.getTitleImage() %>"></img>
                    <div class="summary"><%=mRDto.getSummary() %></div>
                    <div class="buttons">
                        <div class="play-box">
                            <a class="white-button"
                                href="<%=mRDto.getFirstVideo() %>">
                                <i class="fas fa-play"></i>
                                재생
                            </a>
                        </div>
                        <div class="detail-box">
                            <div class="gray-button" detailVideoId="<%=mRDto.getMovieDramaId() %>">
                                <i class="fa fa-info-circle"></i>
                                상세 정보
                            </div>
                        </div>
                    </div>
                    <div class="extra">
                        <!-- <button class="replay-button">
                            <i class="fa fa-redo fa-lg"></i>
                        </button> -->
                        <p class="rating">
                            <!-- <img src="images/12.png" width="30"> -->
                            <h2 style="position: absolute; margin-left: 22px; margin-top: 25px"><%=mRDto.getAge() %>+</h2>
            <%
			}
			%>
                        </p>
                    </div>
                </div>
                <div class="contents">
                    <div class="contents-list">
                        <h2 class="top-movie">TOP 10 영화</h2>
                        <div class="swiper mySwiper" style="overflow:initial;">
	                        <div class="swiper-wrapper">
		                        <div style="display:flex" class="swiper-slide">
		                        	<div gubun="movie" class="movie-rank" style="display: flex;" >
		                                <svg id="rank-1" width="100%" height="100%" viewBox="-20 0 70 154" class="svg-icon">
		                                    <path stroke="#595959" stroke-linejoin="square" stroke-width="4"
		                                        d="M35.377 152H72V2.538L2 19.362v30.341l33.377-8.459V152z"></path>
		                                </svg>
		                                <%
		                                	VideoIdDao vIDao = new VideoIdDao();
		                                	ArrayList<VideoIdDto> top1Movie = vIDao.top1Movie();
		                                	for(VideoIdDto tDto : top1Movie) {
		                                %>
		                                <div class="boxart-image" movieDramaId="<%=tDto.getMovieDramaId() %>">
		                                    <img src="<%=tDto.getPosterImage() %>"
		                                        alt="" width="100%" height="100%">
		                                </div>
		                                <%} %>
		                            </div>
		                            <div gubun="movie" class="movie-rank" style="display: flex;">
		                                <svg id="rank-2" width="100%" height="100%" viewBox="0 0 80 154" class="svg-icon">
		                                    <path stroke="#595959" stroke-linejoin="square" stroke-width="4"
		                                        d="M3.72 152H113v-30.174H50.484l4.355-3.55 29.453-24.012c5.088-4.124 9.748-8.459 13.983-13.004 4.16-4.464 7.481-9.339 9.972-14.629 2.449-5.203 3.678-11.113 3.678-17.749 0-9.428-2.294-17.627-6.875-24.645-4.597-7.042-10.941-12.494-19.07-16.376C77.803 3.957 68.496 2 58.036 2 47.591 2 38.37 4.023 30.347 8.06c-8.015 4.032-14.457 9.578-19.352 16.654-4.492 6.493-7.389 13.803-8.693 21.952h34.055c1.236-3.52 3.398-6.52 6.459-8.97 3.54-2.834 8.277-4.224 14.147-4.224 5.93 0 10.552 1.537 13.76 4.681 3.181 3.12 4.791 7.024 4.791 11.594 0 4.151-1.16 7.934-3.468 11.298-2.192 3.194-5.987 7.124-11.405 11.84L3.72 122.465V152z">
		                                    </path>
		                                </svg>
		                                <%
		                                	ArrayList<VideoIdDto> top2Movie = vIDao.top2Movie();
	                                		for(VideoIdDto tDto : top2Movie) {
		                                %>
		                                <div class="boxart-image" movieDramaId="<%=tDto.getMovieDramaId() %>">
		                                    <img src="<%=tDto.getPosterImage() %>"
		                                        alt="" width="100%" height="100%">
		                                </div>
		                                <%} %>
		                            </div>
		                            <div gubun="movie" class="movie-rank"" style="display: flex;">
		                                <svg id="rank-3" width="100%" height="100%" viewBox="0 0 80 154" class="svg-icon">
		                                    <path stroke="#595959" stroke-linejoin="square" stroke-width="4"
		                                        d="M3.809 41.577h33.243c1.3-2.702 3.545-4.947 6.674-6.72 3.554-2.015 7.83-3.01 12.798-3.01 5.555 0 10.14 1.11 13.723 3.376 3.839 2.427 5.782 6.283 5.782 11.315 0 4.553-1.853 8.395-5.473 11.38-3.547 2.926-8.18 4.37-13.821 4.37H41.44v28.366h16.77c5.572 0 10.275 1.227 14.068 3.711 4.02 2.633 6.071 6.581 6.071 11.616 0 5.705-1.943 9.975-5.853 12.562-3.658 2.42-8.292 3.61-13.863 3.61-5.205 0-9.82-.94-13.827-2.836-3.698-1.75-6.32-4.272-7.785-7.529H2.33c2.096 12.089 7.761 21.65 17.028 28.78C29.242 148.175 42.594 152 59.476 152c10.706 0 20.175-1.783 28.42-5.337 8.185-3.528 14.575-8.486 19.208-14.884 4.595-6.346 6.896-13.938 6.896-22.837 0-6.952-1.93-13.494-5.81-19.666-3.815-6.07-9.68-10.367-17.683-12.908l-5.46-1.735 5.353-2.04c6.659-2.538 11.667-6.338 15.083-11.412 3.431-5.096 5.142-10.806 5.142-17.181 0-8.471-2.262-15.778-6.787-21.985-4.574-6.275-10.7-11.17-18.408-14.696C77.683 3.775 69.109 2 59.687 2 44.084 2 31.515 5.816 21.91 13.415c-9 7.119-15.025 16.486-18.101 28.162z">
		                                    </path>
		                                </svg>
		                                <%
		                                	ArrayList<VideoIdDto> top3Movie = vIDao.top3Movie();
                                			for(VideoIdDto tDto : top3Movie) {
		                                %>
		                                <div class="boxart-image" movieDramaId="<%=tDto.getMovieDramaId() %>">
		                                    <img src="<%=tDto.getPosterImage() %>"
		                                        alt="" width="100%" height="100%">
		                                </div>
		                                <%} %>
		                            </div>
		                            <div gubun="movie" class="movie-rank" style="display: flex;">
		                                <svg id="rank-4" width="100%" height="100%" viewBox="0 0 81 154" class="svg-icon">
		                                    <path stroke="#595959" stroke-linejoin="square" stroke-width="4"
		                                        d="M72 152h35.333v-30.977H128V92.497h-20.667V2H69.89L2 92.712v28.311h70V152zM36.202 92.188l35.93-47.998v47.998h-35.93z">
		                                    </path>
		                                </svg>
		                                <%
			                                ArrayList<VideoIdDto> top4Movie = vIDao.top4Movie();
	                            			for(VideoIdDto tDto : top4Movie) {
		                                %>
		                                <div class="boxart-image" movieDramaId="<%=tDto.getMovieDramaId() %>">
		                                    <img src="<%=tDto.getPosterImage() %>"
		                                        alt="" width="100%" height="100%">
		                                </div>
		                                <%} %>
		                            </div>
		                            <div gubun="movie" class="movie-rank" style="display: flex;">
		                                <svg id="rank-5" width="100%" height="100%" viewBox="0 0 81 154" class="svg-icon">
		                                    <path stroke="#595959" stroke-linejoin="square" stroke-width="4"
		                                        d="M105.588 32.174V2H13.534l-8.3 88.357h32.463c2.145-2.362 4.866-4.254 8.143-5.675 3.585-1.554 7.543-2.328 11.859-2.328 6.247 0 11.418 1.745 15.418 5.255 4.061 3.564 6.104 8.37 6.104 14.265 0 6.041-2.044 10.89-6.121 14.387-3.999 3.43-9.162 5.132-15.401 5.132-4.299 0-8.17-.694-11.601-2.095-3.11-1.268-5.577-2.946-7.368-5.042H2.592c3.308 11.593 9.782 20.623 19.46 27.164C32.472 148.464 45.64 152 61.602 152c10.12 0 19.294-1.99 27.548-5.966 8.198-3.949 14.711-9.718 19.572-17.335 4.844-7.59 7.278-16.95 7.278-28.123 0-9.182-2.013-17.314-6.032-24.431-4.02-7.118-9.514-12.7-16.51-16.775-6.99-4.072-14.849-6.109-23.612-6.109-11.06 0-20.099 3.483-27.234 10.461l-3.892 3.806 3.273-35.354h63.595z">
		                                    </path>
		                                </svg>
		                                <%
			                                ArrayList<VideoIdDto> top5Movie = vIDao.top5Movie();
	                            			for(VideoIdDto tDto : top5Movie) {
		                                %>
		                                <div class="boxart-image" movieDramaId="<%=tDto.getMovieDramaId() %>">
		                                    <img src="<%=tDto.getPosterImage() %>"
		                                        alt="" width="100%" height="100%">
		                                </div>
		                                <%} %>
		                            </div>
		                            <div gubun="movie" class="movie-rank" style="display: flex;">
		                                <svg id="rank-6" width="100%" height="100%" viewBox="0 0 81 154" class="svg-icon">
		                                    <path stroke="#595959" stroke-linejoin="square" stroke-width="4"
		                                        d="M79.482 38.192h35.551c-3.284-10.945-8.963-19.573-17.048-25.938C89.323 5.434 77.531 2 62.545 2 50.756 2 40.35 4.86 31.277 10.577c-9.064 5.712-16.198 14.09-21.412 25.178C4.63 46.893 2 60.425 2 76.365c0 14.416 2.356 27.344 7.059 38.798 4.667 11.368 11.573 20.34 20.734 26.956C38.904 148.7 50.225 152 63.816 152a61.513 61.513 0 0019.922-3.278 53.546 53.546 0 0017.378-9.792c5.154-4.33 9.255-9.64 12.314-15.947 3.042-6.273 4.57-13.556 4.57-21.868 0-8.812-2.062-16.636-6.182-23.51-4.134-6.897-9.643-12.293-16.55-16.212-6.905-3.917-14.48-5.874-22.76-5.874-14.546 0-25.34 4.55-32.569 13.63l-4.003 5.03.443-6.413c.874-12.636 3.56-21.85 8.168-27.654 4.69-5.907 10.885-8.9 18.421-8.9 4.26 0 7.826.734 10.685 2.24 2.445 1.287 4.396 2.867 5.829 4.74zM62.605 123c-5.825 0-10.902-1.894-15.136-5.655C43.173 113.528 41 108.603 41 102.71c0-5.881 2.164-10.864 6.44-14.818C51.674 83.975 56.762 82 62.604 82c5.847 0 10.906 1.98 15.074 5.905C81.878 91.859 84 96.837 84 102.71c0 5.885-2.131 10.805-6.35 14.622-4.167 3.77-9.214 5.668-15.045 5.668z">
		                                    </path>
		                                </svg>
		                                <%
			                                ArrayList<VideoIdDto> top6Movie = vIDao.top6Movie();
	                            			for(VideoIdDto tDto : top6Movie) {
		                                %>
		                                <div class="boxart-image" movieDramaId="<%=tDto.getMovieDramaId() %>">
		                                    <img src="<%=tDto.getPosterImage() %>"
		                                        alt="" width="100%" height="100%">
		                                </div>
		                                <%} %>
		                            </div>
		                       </div>
		                       <div style="display:flex" class="swiper-slide">
		                            <div gubun="movie" class="movie-rank" style="display: flex; margin-left: 31px;">
		                                <svg id="rank-7" width="100%" height="100%" viewBox="0 0 78 154" class="svg-icon">
		                                    <path stroke="#595959" stroke-linejoin="square" stroke-width="4"
		                                        d="M113,2 L2,2 L2,33.4022989 L75.9665929,33.4022989 L21.22571,152 L60.28102,152 L113,32.7672283 L113,2 Z">
		                                    </path>
		                                </svg>
		                                <%
			                                ArrayList<VideoIdDto> top7Movie = vIDao.top7Movie();
	                            			for(VideoIdDto tDto : top7Movie) {
		                                %>
		                                <div class="boxart-image" movieDramaId="<%=tDto.getMovieDramaId() %>">
		                                    <img src="<%=tDto.getPosterImage() %>"
		                                        alt="" width="100%" height="100%">
		                                </div>
		                                <%} %>
		                            </div>
		                            <div gubun="movie" class="movie-rank" style="display: flex;">
		                                <svg id="rank-8" width="100%" height="100%" viewBox="0 0 77 154" class="svg-icon">
		                                    <path stroke="#595959" stroke-linejoin="square" stroke-width="4"
		                                        d="M59.5 152c11.335 0 21.358-1.72 30.077-5.15 8.637-3.397 15.361-8.258 20.213-14.586 4.805-6.267 7.21-13.876 7.21-22.899 0-7.326-2.261-14.07-6.813-20.29-4.548-6.214-10.837-10.658-18.922-13.35l-5.4-1.799 5.338-1.975c7.238-2.678 12.572-6.683 16.066-12.018 3.53-5.388 5.284-11.178 5.284-17.414 0-7.912-2.133-14.839-6.405-20.84-4.3-6.042-10.403-10.825-18.345-14.351C79.816 3.78 70.386 2 59.5 2S39.184 3.781 31.197 7.328c-7.942 3.526-14.044 8.309-18.345 14.351-4.272 6.001-6.405 12.928-6.405 20.84 0 6.236 1.755 12.026 5.284 17.414 3.494 5.335 8.828 9.34 16.066 12.018l5.338 1.975-5.4 1.798c-8.085 2.693-14.374 7.137-18.922 13.351C4.261 95.295 2 102.04 2 109.365c0 9.023 2.405 16.632 7.21 22.899 4.852 6.328 11.576 11.19 20.213 14.586 8.72 3.43 18.742 5.15 30.077 5.15zm.5-89c-5.6 0-10.334-1.515-14.125-4.56C41.985 55.313 40 51.183 40 46.21c0-5.244 1.976-9.518 5.875-12.65C49.666 30.515 54.4 29 60 29s10.334 1.515 14.125 4.56C78.025 36.694 80 40.968 80 46.212c0 4.973-1.985 9.103-5.875 12.228C70.334 61.485 65.6 63 60 63zm-.5 62c-6.255 0-11.556-1.613-15.836-4.856-4.41-3.343-6.664-7.816-6.664-13.25 0-5.298 2.258-9.698 6.664-13.038C47.944 90.613 53.245 89 59.5 89c6.255 0 11.556 1.613 15.836 4.856 4.406 3.34 6.664 7.74 6.664 13.038 0 5.434-2.254 9.907-6.664 13.25C71.056 123.387 65.755 125 59.5 125z">
		                                    </path>
		                                </svg>
		                                <%
			                                ArrayList<VideoIdDto> top8Movie = vIDao.top8Movie();
	                            			for(VideoIdDto tDto : top8Movie) {
		                                %>
		                                <div class="boxart-image" movieDramaId="<%=tDto.getMovieDramaId() %>">
		                                    <img src="<%=tDto.getPosterImage() %>"
		                                        alt="" width="100%" height="100%">
		                                </div>
		                                <%} %>
		                            </div>
		                            <div gubun="movie" class="movie-rank" style="display: flex;">
		                                <svg id="rank-9" width="100%" height="100%" viewBox="0 0 71 154" class="svg-icon">
		                                    <path stroke="#595959" stroke-linejoin="square" stroke-width="4"
		                                        d="M40.0597376,115.807692 L4.47328474,115.807692 C7.45109332,126.586242 13.4362856,135.15497 22.4670906,141.582071 C32.2129251,148.518048 44.5640134,152 59.5759717,152 C78.2141671,152 92.5105725,145.697944 102.6454,133.074799 C112.853557,120.360322 118,101.543854 118,76.5769231 C118,62.1603327 115.678843,49.3016297 111.046669,37.9886125 C106.453069,26.7698049 99.6241767,17.9802976 90.5435117,11.5767831 C81.5017862,5.20072813 70.1375399,2 56.3957597,2 C49.4158116,2 42.68229,3.15952329 36.1849549,5.47966815 C29.7045526,7.79376647 23.8782903,11.1932931 18.6948526,15.6846002 C13.5316746,20.1583529 9.45923583,25.508367 6.46782377,31.7491046 C3.4928156,37.95562 2,45.0644366 2,53.0961538 C2,61.9117395 4.02797967,69.7019439 8.0788911,76.5056791 C12.1434539,83.3323424 17.5832537,88.6925139 24.4218542,92.6108203 C31.2518358,96.5241882 38.8590885,98.4807692 47.2791519,98.4807692 C55.0853554,98.4807692 61.6095996,97.3619306 66.8547126,95.1478231 C72.0569983,92.9517941 76.4513169,89.5970183 80.0605818,85.0622151 L84.0584687,80.039134 L83.6207883,86.4440446 C82.74746,99.2241219 80.0984349,108.438199 75.5533003,114.10687 C70.9310132,119.871766 64.7726909,122.788462 57.2438163,122.788462 C52.8691399,122.788462 49.1904302,122.100251 46.212535,120.692834 C43.5930338,119.454801 41.5307848,117.825945 40.0597376,115.807692 Z M57.5,31 C63.3657106,31 68.4419893,32.9364861 72.6299874,36.7826253 C76.8609583,40.6682294 79,45.6186068 79,51.5 C79,57.3813932 76.8609583,62.3317706 72.6299874,66.2173747 C68.4419893,70.0635139 63.3657106,72 57.5,72 C51.6342894,72 46.5580107,70.0635139 42.3700126,66.2173747 C38.1390417,62.3317706 36,57.3813932 36,51.5 C36,45.6186068 38.1390417,40.6682294 42.3700126,36.7826253 C46.5580107,32.9364861 51.6342894,31 57.5,31 Z">
		                                    </path>
		                                </svg>
		                                <%
			                                ArrayList<VideoIdDto> top9Movie = vIDao.top9Movie();
	                            			for(VideoIdDto tDto : top9Movie) {
		                                %>
		                                <div class="boxart-image" movieDramaId="<%=tDto.getMovieDramaId() %>">
		                                    <img src="<%=tDto.getPosterImage() %>"
		                                        alt="" width="100%" height="100%">
		                                </div>
		                                <%} %>
		                            </div>
		                            <div gubun="movie" class="movie-rank" style="display: flex;">
		                                <svg id="rank-10" width="100%" height="100%" viewBox="0 0 140 154" class="svg-icon">
		                                    <path stroke="#595959" stroke-linejoin="square" stroke-width="4"
		                                        d="M34.757 151.55h35.869V2.976L2 19.687v30.14l32.757-8.41v110.132zm105.53 3.45c12.394 0 23.097-3.12 32.163-9.353 9.093-6.25 16.11-15.047 21.066-26.43C198.5 107.766 201 94.196 201 78.5c0-15.698-2.5-29.266-7.484-40.716-4.955-11.384-11.973-20.18-21.066-26.431C163.384 5.119 152.681 2 140.287 2c-12.393 0-23.096 3.12-32.162 9.353-9.093 6.25-16.11 15.047-21.066 26.43-4.984 11.45-7.484 25.02-7.484 40.717 0 15.698 2.5 29.266 7.484 40.716 4.955 11.384 11.973 20.18 21.066 26.431 9.066 6.234 19.769 9.353 32.162 9.353zm0-31.368c-7.827 0-13.942-4.147-18.15-12.178-4.053-7.736-6.047-18.713-6.047-32.954s1.994-25.218 6.047-32.954c4.208-8.03 10.323-12.178 18.15-12.178 7.827 0 13.943 4.147 18.15 12.178 4.053 7.736 6.048 18.713 6.048 32.954s-1.995 25.218-6.047 32.954c-4.208 8.03-10.324 12.178-18.15 12.178z">
		                                    </path>
		                                </svg>
		                                <%
			                                ArrayList<VideoIdDto> top10Movie = vIDao.top10Movie();
	                            			for(VideoIdDto tDto : top10Movie) {
		                                %>
		                                <div class="boxart-image" movieDramaId="<%=tDto.getMovieDramaId() %>">
		                                    <img src="<%=tDto.getPosterImage() %>"
		                                        alt="" width="100%" height="100%">
		                                </div>
		                                <%} %>
		                            </div>
		                        </div>
                        	</div>
                        	<div class="swiper-button-box">
                        		<div class="swiper-button-next" style="right:60px;"></div>
      							<div class="swiper-button-prev" style="left:-40px";></div>
      						</div>
                        </div>
                    </div>
                    <!-- <div class="hover-priview-container">
                        <div class="priview-box">
                            <div class="hover-priview" href="https://www.netflix.com/watch/81094067?trackId=255824129&tctx=0%2C0%2CNAPA%40%40%7C500b0d55-0e81-43cf-b603-e261e3a10231-7109618_titles%2F1%2F%2F%EC%8A%B9%EB%A6%AC%ED%98%B8%2F0%2F0%2CNAPA%40%40%7C500b0d55-0e81-43cf-b603-e261e3a10231-7109618_titles%2F1%2F%2F%EC%8A%B9%EB%A6%AC%ED%98%B8%2F0%2F0%2Cunknown%2C%2C500b0d55-0e81-43cf-b603-e261e3a10231-7109618%7C1%2CtitlesResults%2C81094067" target="_blank">
                                <img class="hover-priview-img" src="https://occ-0-4342-993.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABRnAD5GLn8CRTyHgXrCFg7xBO-zp3ZKbLmOF9y-HJgqyyD9NhD_0GF7WvD6XBhSNftfFrTzIQf8S7dr77nEJxI0qfMXWfS_pWGMMSzAD1vHt04zJ4ZWKCEaZhGWx.jpg?r=4fa" width="100%" height="100%">
                            </div>
                            <div class="button-container">
                                <div class="box-information">
                                    <a class="primary-button" tabindex="0" toolkitsize="small" listid="GPS_0E85D5A41276BEAEA170340BFDFCD4-A3F87CB3ABAB23-56C897381A_p_1655091994492" ranknum="3" requestid="9d8ed131-f7ff-4c20-8c93-43fa28954bef-893251948" rownum="3" trackid="15035895" data-uia="play-button" role="link" aria-label="재생" href="https://www.netflix.com/watch/81094067?trackId=255824129&tctx=0%2C0%2CNAPA%40%40%7Cc89e0000-96df-4e3a-a71d-df8d1e5d8b54-512194782_titles%2F1%2F%2F%EC%8A%B9%EB%A6%AC%ED%98%B8%2F0%2F0%2CNAPA%40%40%7Cc89e0000-96df-4e3a-a71d-df8d1e5d8b54-512194782_titles%2F1%2F%2F%EC%8A%B9%EB%A6%AC%ED%98%B8%2F0%2F0%2Cunknown%2C%2Cc89e0000-96df-4e3a-a71d-df8d1e5d8b54-512194782%7C1%2C%2C">
                                        <div style="margin-left:8px; margin-top: 7px;" class="color-primary" tabindex="-1" type="button">
                                            <div class="ltr-1ksxkn9">
                                                <div class="small ltr-18dhnor" role="presentation">
                                                    <svg style="color: black;" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="Hawkins-Icon Hawkins-Icon-Standard">
                                                        <path d="M4 2.69127C4 1.93067 4.81547 1.44851 5.48192 1.81506L22.4069 11.1238C23.0977 11.5037 23.0977 12.4963 22.4069 12.8762L5.48192 22.1849C4.81546 22.5515 4 22.0693 4 21.3087V2.69127Z" fill="currentColor">

                                                        </path>
                                                    </svg>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                    <div class="ltr">
                                        <div class="ptrack-content" data-ui-tracking-context="%7B%22lolomo_id%22:%22GPS_0E85D5A41276BEAEA170340BFDFCD4_p_1655091994492%22,%22list_id%22:%22GPS_0E85D5A41276BEAEA170340BFDFCD4-A3F87CB3ABAB23-56C897381A_p_1655091994492%22,%22location%22:%22homeScreen%22,%22rank%22:3,%22request_id%22:%229d8ed131-f7ff-4c20-8c93-43fa28954bef-893251948%22,%22row%22:3,%22track_id%22:15035895,%22video_id%22:17672132,%22supp_video_id%22:1,%22appView%22:%22addToMyListButton%22,%22usePresentedEvent%22:true%7D" data-tracking-uuid="d45c9085-3180-43e0-bbbe-068593399c94">
                                            <div aria-label="내가 찜한 콘텐츠에 추가" class="color-supplementary hasIcon round ltr-1f1y58d" data-uia="add-to-my-list" type="button">
                                                <div class="ltr-1ksxkn9">
                                                    <div class="small ltr-18dhnor" role="presentation">
                                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="Hawkins-Icon Hawkins-Icon-Standard">
                                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M11 2V11H2V13H11V22H13V13H22V11H13V2H11Z" fill="currentColor">

                                                            </path>
                                                        </svg>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="buttonControls">
                                        <div style="margin-left:8px; margin-top: 8px;" aria-label="expand to detail modal" class="color-supplementary hasIcon round ltr-1f1y58d" data-uia="expand-to-detail-button" type="button">
                                            <div class="ltr-1ksxkn9">
                                                <div class="small ltr-18dhnor" role="presentation">
                                                    <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="Hawkins-Icon Hawkins-Icon-Standard">
                                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M19.293 7.29297L12.0001 14.5859L4.70718 7.29297L3.29297 8.70718L11.293 16.7072C11.4805 16.8947 11.7349 17.0001 12.0001 17.0001C12.2653 17.0001 12.5196 16.8947 12.7072 16.7072L20.7072 8.70718L19.293 7.29297Z" fill="currentColor">

                                                        </path>
                                                    </svg>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="age-container">
                                <div class="age-information">
                                    <span class="age">
                                        <img src="images/12.png">
                                    </span>
                                    <span class="running-time">
                                        1시간 43분
                                    </span>
                                </div>
                            </div>
                            <div class="lower-container">
                                <div class="genre-information">
                                    <span class="genre">
                                        <span>SF 영화 • 액션 & 어드벤처</span>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div> -->
                </div>
            </div>
		  </div>
        </div>
        <div class="background-fill" style="background: #141414; height: 101px; width: 1780px;position: absolute;">
        	
        </div>
        <div class="main-s">
            <div class="main-viewing-contents">
                <h2 class="viewing-contends">시청 중인 콘텐츠</h2>
                <div class="viewing-list">
	                <div class="swiper mySwiper2" style="overflow:initial;">
	                	<div class="swiper-button-all-box">
		                	<div class="swiper-button-next-box">
		                  		<div class="swiper-button-next"></div>
		                	</div>
		                	<div class="swiper-button-prev-box">
			     				<div class="swiper-button-prev"></div>
		                	</div>
	                	</div>
		                <div class="swiper-wrapper" style="width:1680px;">
		                <%
		                	ArrayList<VideoIdDto> viewingContents = vIDao.viewingContents();
		                	
		                	for(VideoIdDto vIDto : viewingContents) {
		                %>
			                <div class="swiper-slide">
			                    <div id="viewing-contents" class="normal-image" movieDramaId="<%=vIDto.getMovieDramaId() %>">
			                        <img src="<%=vIDto.getPosterImage() %>"
			                            alt="">
			                    </div>
			                </div>
			            <%
			              	}
			            %>
		                </div>
	                </div>
                </div>
            </div>
        </div>
        <div class="main-th">
            <div class="main-viewing-contents">
                <h2 class="viewing-contends">로맨스 영화</h2>
                <div class="viewing-list">
	                <div class="swiper mySwiper4" style="overflow:initial;">
	                	<div class="swiper-button-all-box">
		                	<div class="swiper-button-next-box">
		                  		<div class="swiper-button-next"></div>
		                	</div>
		                	<div class="swiper-button-prev-box">
			     				<div class="swiper-button-prev"></div>
		                	</div>
	                	</div>
		                <div class="swiper-wrapper" style="width:1680px;">
						<%
							ArrayList<VideoIdDto> rMList = vIDao.romanceMovie();
							for(VideoIdDto rMDto : rMList) {
						%>
							<div class="swiper-slide">
			                    <div id="viewing-contents" class="normal-image" movieDramaId="<%=rMDto.getMovieDramaId() %>">
			                        <img src="<%=rMDto.getPosterImage() %>"
			                            alt="">
			                    </div>
			                </div>
						<%
							}
						%>
		                </div>
	                </div>
                </div>
            </div>
        </div>        
		<div class="main-th">
            <div class="main-viewing-contents">
                <h2 class="viewing-contends">애니메이션</h2>
                <div class="viewing-list">
	                <div class="swiper mySwiper5" style="overflow:initial;">
	                	<div class="swiper-button-all-box">
		                	<div class="swiper-button-next-box">
		                  		<div class="swiper-button-next"></div>
		                	</div>
		                	<div class="swiper-button-prev-box">
			     				<div class="swiper-button-prev"></div>
		                	</div>
	                	</div>
		                <div class="swiper-wrapper" style="width:1680px;">
						<%
							ArrayList<VideoIdDto> aniList = vIDao.animationMovie();
							for(VideoIdDto aniDto : aniList) {
						%>
							<div class="swiper-slide">
			                    <div id="viewing-contents" class="normal-image" movieDramaId="<%=aniDto.getMovieDramaId() %>">
			                        <img src="<%=aniDto.getPosterImage() %>"
			                            alt="">
			                    </div>
			                </div>
						<%
						} 
						%>
		                </div>
	                </div>
                </div>
            </div>
        </div>
		<div class="main-th">
            <div class="main-viewing-contents">
                <h2 class="viewing-contends">SF 어드벤처</h2>
                <div class="viewing-list">
	                <div class="swiper mySwiper6" style="overflow:initial;">
	                	<div class="swiper-button-all-box">
		                	<div class="swiper-button-next-box">
		                  		<div class="swiper-button-next"></div>
		                	</div>
		                	<div class="swiper-button-prev-box">
			     				<div class="swiper-button-prev"></div>
		                	</div>
	                	</div>
		                <div class="swiper-wrapper" style="width:1680px;">
						<%
							ArrayList<VideoIdDto> adList = vIDao.adventureMovie();
							for(VideoIdDto adDto : adList) {
						%>
							<div class="swiper-slide">
			                    <div id="viewing-contents" class="normal-image" movieDramaId="<%=adDto.getMovieDramaId() %>">
			                        <img src="<%=adDto.getPosterImage() %>"
			                            alt="">
			                    </div>
			                </div>
						<%
							}
						%>
		                </div>
	                </div>
                </div>
            </div>
        </div>
		<div class="main-th">
            <div class="main-viewing-contents">
                <h2 class="viewing-contends">코미디 영화</h2>
                <div class="viewing-list">
	                <div class="swiper mySwiper7" style="overflow:initial;">
	                	<div class="swiper-button-all-box">
		                	<div class="swiper-button-next-box">
		                  		<div class="swiper-button-next"></div>
		                	</div>
		                	<div class="swiper-button-prev-box">
			     				<div class="swiper-button-prev"></div>
		                	</div>
	                	</div>
		                <div class="swiper-wrapper" style="width:1680px;">
						<%
							ArrayList<VideoIdDto> coList = vIDao.adventureMovie();
							for(VideoIdDto coDto : coList) {
						%>
							<div class="swiper-slide">
			                    <div id="viewing-contents" class="normal-image" movieDramaId="<%=coDto.getMovieDramaId() %>">
			                        <img src="<%=coDto.getPosterImage() %>"
			                            alt="">
			                    </div>
			                </div>
						<%
							}
						%>
		                </div>
	                </div>
                </div>
            </div>
        </div>
		<div class="main-th">
            <div class="main-viewing-contents">
                <h2 class="viewing-contends">액션 스릴러</h2>
                <div class="viewing-list">
	                <div class="swiper mySwiper8" style="overflow:initial;">
	                	<div class="swiper-button-all-box">
		                	<div class="swiper-button-next-box">
		                  		<div class="swiper-button-next"></div>
		                	</div>
		                	<div class="swiper-button-prev-box">
			     				<div class="swiper-button-prev"></div>
		                	</div>
	                	</div>
		                <div class="swiper-wrapper" style="width:1680px;">
						<%
		                	ArrayList<VideoIdDto> actionMovie = vIDao.actionMovie();
		                	
		                	for(VideoIdDto vIDto : actionMovie) {
		                %>
							<div class="swiper-slide">
			                    <div id="viewing-contents" class="normal-image">
			                        <img src="<%=vIDto.getPosterImage() %>"
			                            alt="">
			                    </div>
					        </div>
						<%
							}
						%>
		                </div>
	                </div>
                </div>
            </div>
        </div>       
        
        <div class="main-last" style="width: 1777px;height: 386px;position: relative;background: #141414;">
            <div class="main-dib-contents">
                <h2 class="dib-contents">내가 찜한 콘텐츠</h2>
                <div class="dib-list">
	                <div class="swiper mySwiper3" style="overflow:initial;">
	                	<div class="swiper-button-all-box">
		                	<div class="swiper-button-next-box">
		                  		<div class="swiper-button-next"></div>
		                	</div>
		                	<div class="swiper-button-prev-box">
			     				<div class="swiper-button-prev"></div>
		                	</div>
	                	</div>
      					<div class="swiper-wrapper" style="width:1680px;">
      					<%
      						ArrayList<VideoIdDto> dibContents = vIDao.dibContents();
      						for(VideoIdDto dDto : dibContents) {
      					%>
		                    <div class="swiper-slide">
			                    <div class="normal-image" movieDramaId="<%=dDto.getMovieDramaId() %>">
			                        <img src="<%=dDto.getPosterImage() %>"
			                            alt="">
			                    </div>
			                </div>
			            <%} %>
      					</div>
	                </div>
                </div>
            </div>
        </div>
        <div class="lower">
            <div class="lower-icon">
                <div class="sns-icon">
                    <div class="facebook-icon">
                        <a class="icons" href="https://www.facebook.com/NetflixKR" target="_blank">
                            <i class="fab fa-facebook-f"></i>
                        </a>
                    </div>
                    <div class="instagram-icon">
                        <a class="icons" href="https://www.instagram.com/netflixkr/" target="_blank">
                            <i class="fab fa-instagram"></i>
                        </a>
                    </div>
                    <div class="twitter-icon">
                        <a class="icons" href="https://twitter.com/netflixkr" target="_blank">
                            <i class="fab fa-twitter"></i>
                        </a>
                    </div>
                    <div class="youtube-icon">
                        <a class="icons" href="https://www.youtube.com/channel/UCiEEF51uRAeZeCo8CJFhGWw/featured"
                            target="_blank">
                            <i class="fab fa-youtube"></i>
                        </a>
                    </div>
                </div>
                <table class="lower-table">
                    <tr>
                        <td nowrap class="lower-table-td"><a class="lower-icon-hover">
                                자막 및 음성
                            </a></td>
                        <td class="lower-table-td"><a class="lower-icon-hover">
                                화면 해설
                            </a></td>
                        <td class="lower-table-td"><a class="lower-icon-hover">
                                고객 센터
                            </a></td>
                        <td class="lower-table-td"><a class="lower-icon-hover">
                                기프트 카드
                            </a></td>
                    </tr>
                    <tr>
                        <td class="lower-table-td"><a class="lower-icon-hover">
                                미디어 센터
                            </a></td>
                        <td class="lower-table-td"><a class="lower-icon-hover">
                                투자 정보(IR)
                            </a></td>
                        <td class="lower-table-td"><a class="lower-icon-hover">
                                입사 정보
                            </a></td>
                        <td class="lower-table-td"><a class="lower-icon-hover">
                                이용 약관
                            </a></td>

                    </tr>
                    <tr>
                        <td class="lower-table-td"><a class="lower-icon-hover">
                                개인 정보
                            </a></td>
                        <td class="lower-table-td"><a class="lower-icon-hover">
                                법적 고지
                            </a></td>
                        <td class="lower-table-td"><a class="lower-icon-hover">
                                쿠키 설정
                            </a></td>
                        <td class="lower-table-td"><a class="lower-icon-hover">
                                회사 정보
                            </a></td>

                    </tr>
                    <tr>
                        <td class="lower-table-td"><a class="lower-icon-hover" aria-colspan="4">
                                문의하기
                            </a></td>
                    </tr>
                </table>
                <table class="lower-table-s">
                    <tr>
                        <td class="lower-table-s-td">
                            <a class="lower-hover">
                                서비스 코드
                            </a>
                        </td>
                    </tr>
                </table>
                <div class="lower-text-contatin">
                    <p class="lower-text">
                        넷플릭스서비시스코리아 유한회사 통신판매업신고번호: 제2018-서울종로-0426호 전화번호: 080-001-9587
                    </p>
                    <p class="lower-text">
                        대표: 레지널드 숀 톰프슨
                    </p>
                    <p class="lower-text">
                        이메일 주소: korea@netflix.com
                    </p>
                    <p class="lower-text">
                        주소: 대한민국 서울특별시 종로구 우정국로 26, 센트로폴리스 A동 20층 우편번호 03161
                    </p>
                    <p class="lower-text">
                        사업자등록번호: 165-87-00119
                    </p>
                    <p class="lower-text">
                        클라우드 호스팅: Amazon Web Services Inc.
                    </p>
                    <p class="lower-text">

                    </p>
                </div>
            </div>
        </div>
    </div>
    </div>

    <header>
        <div id="header" style="position: fixed; top:0; z-index: 3; background-image: linear-gradient(to bottom,rgba(0,0,0,.7) 10%,rgba(0,0,0,0));">
            <div class="header-list">
                <a href="netflix.jsp" target="_self">
                    <div class="logo"><img class="logo-image" src="images/logo.png"></div>
                </a>
                <ul class="tabbed-primary-navigation">
                    <li class="navigation-menu">
                        <a class="menu-trigger" role="button" aria-haspopup="ture" tabindex="0">메뉴</a>
                    </li>
                    <li class="navigation-tab">
                        <a class="current-active" href="index.jsp?profile_id=<%=profileID %>">홈</a>
                    </li>
                    <li id="series-button" class="navigation-tab">
                        <a class="current-active" href="index1.jsp?profile_id=<%=profileID %>">시리즈</a>
                    </li>
                    <li id="movie-button" class="navigation-tab">
                        <a style="color:white; pointer-events: none;" class="current-active" href="netflixMovie.jsp"><b>영화</b></a>
                    </li>
                    <li id="new-content-button" class="navigation-tab">
                        <a class="current-active">NEW!요즘 뜨는 콘텐츠</a>
                    </li>
                    <li id="dib-button" class="navigation-tab">
                        <a class="current-active" href="index3.jsp?profile_id=<%=profileID %>">영화관 검색</a>
                    </li>
                </ul>
                <div class="menu">
                    <div class="tab">
                        <form action="netflixSearch.jsp">
	                        <div class="nav-element">
	                            <div class="searchBox" style="margin-top: 8px; margin-left: 7px;">
	                                <div class="searchInput">
	                                    <!-- <svg style="margin-left: 6px;" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="search-icon">
	                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M13 11C13 13.7614 10.7614 16 8 16C5.23858 16 3 13.7614 3 11C3 8.23858 5.23858 6 8 6C10.7614 6 13 8.23858 13 11ZM14.0425 16.2431C12.5758 17.932 10.4126 19 8 19C3.58172 19 0 15.4183 0 11C0 6.58172 3.58172 3 8 3C12.4183 3 16 6.58172 16 11C16 11.9287 15.8417 12.8205 15.5507 13.6497L24.2533 18.7028L22.7468 21.2972L14.0425 16.2431Z" fill="currentColor"></path>
	                                    </svg> -->
	                                    <label for="searchInput" id="searchInput-label" class="visually-hidden"></label>
		                                <input style="outline: none; font-size: 15px; height: 12px; padding-bottom: 10px; border:0 solid black" autocomplete='off' type="text" id="searchInput" name="searchInput" placeholder="제목, 사람, 장르" data-search-input="true" dir="ltr" data-uia="search-box-input" aria-labelledby="searchInput-label" maxlength="80" value="" class="focus-visible" data-focus-visible-added="" style="opacity: 1; transition-duration: 300ms;">
	                                    <input type="hidden" name="profile_id" value='<%=profileID%>'/>
	                                    <div class="searchIcon">
	                                        <input class="searchTab" type="submit" value="" tabindex="0" aria-label="검색" data-uia="search-box-launcher">
	                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="search-icon">
	                                                <path fill-rule="evenodd" clip-rule="evenodd" d="M13 11C13 13.7614 10.7614 16 8 16C5.23858 16 3 13.7614 3 11C3 8.23858 5.23858 6 8 6C10.7614 6 13 8.23858 13 11ZM14.0425 16.2431C12.5758 17.932 10.4126 19 8 19C3.58172 19 0 15.4183 0 11C0 6.58172 3.58172 3 8 3C12.4183 3 16 6.58172 16 11C16 11.9287 15.8417 12.8205 15.5507 13.6497L24.2533 18.7028L22.7468 21.2972L14.0425 16.2431Z" fill="currentColor"></path>
	                                            </svg>
	                                        </input>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
                        </form>
                        <!-- <button class="searchTab"><i class="fa-solid fa-magnifying-glass"></i></button> -->
                        <button class="notifications-item"><i class="fa-solid fa-bell"></i></button>
                        <div id="account-menu" style="width: 60px; cursor: pointer;">
                            <div class="account-menu-item"><a class="login-profile">
                            <%
                            	/* int profileID = (int)(session.getAttribute("profileId"));
                            	System.out.print("profileID : " + profileID); */
                            	
                            	ArrayList <ProfileDTO> pList = pDao.viewProfile(profileID);
                            		for(ProfileDTO profile : pList){
                            %>
                                    <img style="width:30px;" class="login-profile-image"
                                        src="images/<%=profile.getProfileImg()%>"></a>
                            <% } %>    
                            </div>
                            <a class="profile-menu">
                                <i class="fas fa-sort-down"></i>
                            </a>
                        </div>
                    </div>
                    <div class="caret">
                        <role role="menu" tabindex="0" class="account-drop-down">
                            <div class="ptrack-content1">
                                <ul class="profiles">
                                    <%-- <%
                                	//프로필 아이디로 멤버아이디 뽕아서 세션값 대신에 넣어주기
                                	
                                	
                                	/* ProfilesDao pDao = new ProfilesDao();
                                	ArrayList<ProfilesDto> pList = pDao.profiles(email);
                                	for(ProfilesDto pfDto : pList) { 
                                	conn = DBConnection.getConnection(); */
                            		ArrayList<ProfilesDto> profile = new ArrayList<ProfilesDto>();
                            		String sql5 ="select member_id, profile_id,nickname,profile_img from profile where profile_id=? order by profile_id";
                            		PreparedStatement pstmt = conn.prepareStatement(sql5);
                            		pstmt.setInt(1, memberId); 
                            		/* pstmt.setString(1, email); */
                            		ResultSet rs = pstmt.executeQuery();
                            		
                            		while(rs.next()) {
                            			int profile_id = rs.getInt("profile_id");
                            			String nickname = rs.getString("nickname");
                            			String photo = rs.getString("profile_img");
                                	%>
                                    <li class="sub-menu-item-top" profileID="<%=profile_id%>" onclick="location.href ='jspSY/Main.jsp'">
                                        <div class="account-menu-item1"><a class="login-profile">
                                                <img style="width:34px;" class="sub-profile-image"
                                                    src="images/<%=photo%>"></a>
                                        </div>
                                        <span class="profile-name"><%=nickname %></span>
                                    </li>
                                    <%
                                	} 
                                    %>--%>
                                    <!-- <li class="sub-menu-item">
                                        <div class="account-menu-item1"><a class="login-profile">
                                                <img class="sub-profile-image"
                                                    src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABQJ0k9TCK_OsiG5fNh6aJCJHg3ljwC08BkulgTBgXPQm3HENI84hLCxJrE1WnG9oZDM15F4f2RBLH0Em-FXAcAW80T2mqCI.png?r=215"></a>
                                        </div>
                                        <span class="profile-name">송일화</span>
                                    </li>
                                    <li class="sub-menu-item">
                                        <div class="account-menu-item1"><a class="login-profile">
                                                <img class="sub-profile-image"
                                                    src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABbixeApBW3-Nl2SD40H-NBGKmv-eneU73h6hBcupBZNKnIWKbGO_18HrX2MQBnAL0_JYocPH62UHd58T1ZGF-l0Yoil7sHE.png?r=f71"></a>
                                        </div>
                                        <span class="profile-name">송진석</span>
                                    </li>
                                    <li class="sub-menu-item">
                                        <div class="account-menu-item1"><a class="login-profile">
                                                <img class="sub-profile-image"
                                                    src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABSitqq49ifW_TwDbOmzmKBnxZ6bPnoiLbB9o9B9Ktw8BC7fe9trNQwyHiqhjKv1J_MzoiPVs9Zy37vkuV4g4QS1-k5SYCz4.png?r=f80"></a>
                                        </div>
                                        <span class="profile-name">송현정</span>
                                    </li> -->
                                    <li class="profile-link">
                                        <a class="sub-menu-link-icon">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                                class="Hawkins-Icon Hawkins-Icon-Standard">
                                                <path fill-rule="evenodd" clip-rule="evenodd"
                                                    d="M22.2071 7.79285L15.2071 0.792847L13.7929 2.20706L20.7929 9.20706L22.2071 7.79285ZM13.2071 3.79285C12.8166 3.40232 12.1834 3.40232 11.7929 3.79285L2.29289 13.2928C2.10536 13.4804 2 13.7347 2 14V20C2 20.5522 2.44772 21 3 21H9C9.26522 21 9.51957 20.8946 9.70711 20.7071L19.2071 11.2071C19.5976 10.8165 19.5976 10.1834 19.2071 9.79285L13.2071 3.79285ZM17.0858 10.5L8.58579 19H4V14.4142L12.5 5.91417L17.0858 10.5Z"
                                                    fill="currentColor"></path>
                                            </svg>
                                            <span class="profile-name">프로필 관리</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="account-container">
                                <ul class="account">
                                    <li class="account-information-top">
                                        <div class="account-information-item">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="Hawkins-Icon Hawkins-Icon-Standard"><path fill-rule="evenodd" clip-rule="evenodd" d="M9.00011 8C9.00011 6.34315 10.3433 5 12.0001 5C13.657 5 15.0001 6.34315 15.0001 8C15.0001 9.65685 13.657 11 12.0001 11C10.3433 11 9.00011 9.65685 9.00011 8ZM12.0001 3C9.23869 3 7.00011 5.23858 7.00011 8C7.00011 10.7614 9.23869 13 12.0001 13C14.7615 13 17.0001 10.7614 17.0001 8C17.0001 5.23858 14.7615 3 12.0001 3ZM5.98069 21.1961C6.46867 18.7563 8.61095 17 11.0991 17H12.9011C15.3893 17 17.5316 18.7563 18.0195 21.1961L19.9807 20.8039C19.3057 17.4292 16.3426 15 12.9011 15H11.0991C7.65759 15 4.69447 17.4292 4.01953 20.8039L5.98069 21.1961Z" fill="currentColor"></path></svg>
                                        </div>
                                        <span class="profile-name">계정</span>
                                    </li>
                                    <li class="account-information">
                                        <div class="account-information-item">
                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="Hawkins-Icon Hawkins-Icon-Standard"><path fill-rule="evenodd" clip-rule="evenodd" d="M3 12C3 7.02944 7.02944 3 12 3C16.9706 3 21 7.02944 21 12C21 16.9706 16.9706 21 12 21C7.02944 21 3 16.9706 3 12ZM12 1C5.92487 1 1 5.92487 1 12C1 18.0751 5.92487 23 12 23C18.0751 23 23 18.0751 23 12C23 5.92487 18.0751 1 12 1ZM12 8.5C10.6831 8.5 10 9.24303 10 10H8C8 7.75697 10.0032 6.5 12 6.5C13.9968 6.5 16 7.75697 16 10C16 11.3487 14.9191 12.2679 13.8217 12.68C13.5572 12.7793 13.3322 12.9295 13.1858 13.0913C13.0452 13.2467 13 13.383 13 13.5V14H11V13.5C11 12.0649 12.1677 11.1647 13.1186 10.8076C13.8476 10.5339 14 10.1482 14 10C14 9.24303 13.3169 8.5 12 8.5ZM13.5 16.5C13.5 17.3284 12.8284 18 12 18C11.1716 18 10.5 17.3284 10.5 16.5C10.5 15.6716 11.1716 15 12 15C12.8284 15 13.5 15.6716 13.5 16.5Z" fill="currentColor"></path></svg>
                                        </div>
                                        <span class="profile-name">고객 센터</span>
                                    </li>
                                </ul>
                            </div>
                            <div class="logout-container">
                                <span class="logout-tab">넷플릭스에서 로그아웃</span>
                            </div>
                        </role>
                    </div>
                </div>
            </div>
        </div>
        <%--</div> --%>
    </header>
    <script>
    var swiper = new Swiper(".mySwiper", {
    	/* slidesPerView : 6, 
  	  slidesPerGroup : 6, */
  	  loop: true,
  	  speed:600,
  	  touchRatio: 0,
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
      pagination: {
          el: '.swiper-pagination',
          type: 'progressbar',
          clickable: true,
        },
      observer: true,
	  observeParents: true,
    });
    
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
    
      /* var swiper1 = new Swiper(".mySwiper1", {
        navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
        pagination: {
          el: ".swiper-pagination",
          type: "progressbar",
        },
        observer: true,
		observeParents: true,
      });  */
    
    //ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  
      
      var swiper2 = new Swiper(".mySwiper2", {
    	  slidesPerView : 6, 
    	  spaceBetween : 6,
    	  slidesPerGroup : 6,
      	  touchRatio: 0,
      	  speed:600,
      	  loop: true,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          pagination: {
            el: ".swiper-pagination",
            type: "progressbar",
          },
          observer: true,
  		observeParents: true,
        });
      var swiper3 = new Swiper(".mySwiper3", {
    	  slidesPerView : 6, 
    	  spaceBetween : 6,
    	  slidesPerGroup : 6,
      	  touchRatio: 0,
      	  speed:600,
      	  loop: true,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          pagination: {
            el: ".swiper-pagination",
            type: "progressbar",
          },
          observer: true,
  		observeParents: true,
        });
      var swiper4 = new Swiper(".mySwiper4", {
    	  slidesPerView : 6, 
    	  spaceBetween : 6,
    	  slidesPerGroup : 6,
      	  touchRatio: 0,
      	  speed:600,
      	  loop: true,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          pagination: {
            el: ".swiper-pagination",
            type: "progressbar",
          },
          observer: true,
  		observeParents: true,
        }); 
      var swiper5 = new Swiper(".mySwiper5", {
    	  slidesPerView : 6, 
    	  spaceBetween : 6,
    	  slidesPerGroup : 6,
      	  touchRatio: 0,
      	  speed:600,
      	  loop: true,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          pagination: {
            el: ".swiper-pagination",
            type: "progressbar",
          },
          observer: true,
  		observeParents: true,
        }); 
      var swiper6 = new Swiper(".mySwiper6", {
    	  slidesPerView : 6, 
    	  spaceBetween : 6,
    	  slidesPerGroup : 6,
      	  touchRatio: 0,
      	  speed:600,
      	  loop: true,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          pagination: {
            el: ".swiper-pagination",
            type: "progressbar",
          },
          observer: true,
  		observeParents: true,
        }); 
      var swiper7 = new Swiper(".mySwiper7", {
    	  slidesPerView : 6, 
    	  spaceBetween : 6,
    	  slidesPerGroup : 6,
      	  touchRatio: 0,
      	  speed:600,
      	  loop: true,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          pagination: {
            el: ".swiper-pagination",
            type: "progressbar",
          },
          observer: true,
  		observeParents: true,
        }); 
      var swiper8 = new Swiper(".mySwiper8", {
    	  slidesPerView : 6, 
    	  spaceBetween : 6,
    	  slidesPerGroup : 6,
      	  touchRatio: 0,
      	  speed:600,
      	  loop: true,
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
          pagination: {
            el: ".swiper-pagination",
            type: "progressbar",
          },
          observer: true,
  		observeParents: true,
        }); 
    </script>
</body>

</html>
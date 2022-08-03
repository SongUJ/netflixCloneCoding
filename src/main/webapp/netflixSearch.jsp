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
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="cssUJ/netflixSearch.css">
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
    		data: {"movie_drama_id" : movieDramaId , "memberId" : memberId , "comment" : comment},
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
<title>Netflix</title>
</head>

<body>
    <div>
    	<div id="background-btm" style="display: none;"></div>
        <div class="home">
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
                                <div style="margin-top:50px; font-size: 2.6rem; color: black; text-align: center; color: white;">0.0</div>
                                <!-- <form style="text-align: center;" name="myform" id="myform" method="post" action="./save">
                                    <fieldset>
                                        <label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">
                                        <label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">
                                        <label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">
                                        <label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">
                                        <label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">
                                    </fieldset>
                                </form> -->
                                <div style="margin-top:50px; color: white; text-align: center;">0명 참여</div>
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
                        <%-- <%						// YGYGYGYG
                        	DramaRoundDao dRDao = new DramaRoundDao();
                        	ArrayList<DramaRoundDto> dRDtoList = dRDao.dramaRoundBox();
                        	for(DramaRoundDto dRDto : dRDtoList) {  
                        %> --%>
                             <div class="round-bundle" movieDramaId="">
                                <div style="height:75px; margin-top: 26px;">
                                    <div class="drama-round">
                                    </div>
                                </div>
                                <div>
                                	<a href="">
                                    	<img style="position:absolute;" class="round-image" src="">
                                    	<div class="round-hover-play-button">
                                    		<svg style="position:absolute; width: 45px; height: 28px;" fill="none" xmlns="http://www.w3.org/2000/svg" class="titleCard-playSVG"><path d="M4 2.69127C4 1.93067 4.81547 1.44851 5.48192 1.81506L22.4069 11.1238C23.0977 11.5037 23.0977 12.4963 22.4069 12.8762L5.48192 22.1849C4.81546 22.5515 4 22.0693 4 21.3087V2.69127Z" fill="currentColor"></path></svg>
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
                            <img style="width:341px; height:192px;" src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/9pS1daC2n6UGc3dUogvWIPMR_OU/AAAABc4i_kwdJVNWkGpIHtCZ3-edq9sLYoUM2wZWItEpLiTP5qYmd1S2mNMv5p_k27zd38_Tx7S_j-jRNlS25sQQyZ1XM-FWsN5Exm80WxT19GcAFSQJyAdzh7wP.webp?r=e57" style="border-radius: 5px;width:341px;height:192px;">
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
                                <div style="font-size: 2.6rem; color: black; text-align: center; color: white;">0.0</div>
                                <form style="text-align: center;" name="myform" id="myform" method="post" action="./save">
                                    <fieldset>
                                        <label for="rate1">⭐</label><input type="radio" name="rating" value="1" id="rate1">
                                        <label for="rate2">⭐</label><input type="radio" name="rating" value="2" id="rate2">
                                        <label for="rate3">⭐</label><input type="radio" name="rating" value="3" id="rate3">
                                        <label for="rate4">⭐</label><input type="radio" name="rating" value="4" id="rate4">
                                        <label for="rate5">⭐</label><input type="radio" name="rating" value="5" id="rate5">
                                    </fieldset>
                                </form>
                                <div style="color: white; text-align: center;">0명 참여</div>
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
                        <%--     <%
                        ArrayList<CommentBoxDto> cSDto = cDao.userCommentData();
                        for(CommentBoxDto commentBox : cSDto) {
                        %> --%>
                            <div class="comment-box" commentId="">
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
                                    <div class="user-comment"></div>
                                </div>
                                <div style="margin-bottom: 10px;">
                                    <div class="user-id"></div>
                                    <div class="comment-day"></div>
                                </div>
                                <div>
                                    <div class="cm_sympathy_area">
                                        <button type="button" class="area_button_upvote">
                                            <span class="plus-count"><i class="fa fa-thumbs-up"></i></span>
                                        </button>
                                        <button type="button" class="area_button_downvote">
                                            <span class="mines-count"><i class="fa fa-thumbs-down"></i></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                			<%-- <%
                        	}
                        	%>  --%>
                        </div>
                    </div>    
                </div>
            </div>
        <div class="main-fourth">
            <div class="main-all-contents">
                <h1 class="all-contents">검색된 콘텐츠</h1>
                <div class="all-list">
                <%
                	String search = request.getParameter("searchInput");
					VideoIdDao vIDao = new VideoIdDao();
					ArrayList<VideoIdDto> searchContents = vIDao.searchContents(search);
					for(VideoIdDto dDto : searchContents) {
				%>
                    <div class="normal-image" movieDramaId="<%=dDto.getMovieDramaId() %>" style="display:inline-block;">
                        <img src="<%=dDto.getPosterImage() %>" style="display:inline-block;"
                            alt="">
                    </div>
                <%} %>
                </div>
            </div>
        </div>
        <!-- <div class="lower">
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
        </div> -->
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
                        <a class="current-active" href="index2.jsp?profile_id=<%=profileID %>">영화</a>
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
                        <form action="index4.jsp">
	                        <div class="nav-element">
	                            <div class="searchBox" style="margin-top: 8px; margin-left: 7px;">
	                                <div class="searchInput">
	                                    <!-- <svg style="margin-left: 6px;" width="24" height="24" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="search-icon">
	                                        <path fill-rule="evenodd" clip-rule="evenodd" d="M13 11C13 13.7614 10.7614 16 8 16C5.23858 16 3 13.7614 3 11C3 8.23858 5.23858 6 8 6C10.7614 6 13 8.23858 13 11ZM14.0425 16.2431C12.5758 17.932 10.4126 19 8 19C3.58172 19 0 15.4183 0 11C0 6.58172 3.58172 3 8 3C12.4183 3 16 6.58172 16 11C16 11.9287 15.8417 12.8205 15.5507 13.6497L24.2533 18.7028L22.7468 21.2972L14.0425 16.2431Z" fill="currentColor"></path>
	                                    </svg> -->
	                                    <label for="searchInput" id="searchInput-label" class="visually-hidden"></label>
		                                <input style="outline: none; font-size: 15px; height: 12px; padding-bottom: 10px; 
		                                border:0 solid black" autocomplete='off' type="text" id="searchInput" name="searchInput" 
		                                placeholder="제목, 사람, 장르" data-search-input="true" dir="ltr" data-uia="search-box-input" 
		                                aria-labelledby="searchInput-label" maxlength="80" value="" class="focus-visible" 
		                                data-focus-visible-added="" style="opacity: 1; transition-duration: 300ms;"/>
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
                                    <!-- <li class="sub-menu-item-top">
                                        <div class="account-menu-item1"><a class="login-profile">
                                                <img class="sub-profile-image"
                                                    src="https://occ-0-3077-988.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABaOp5XDwGEnoSMiltCus2bBm1m3b9QII1NJWx-_KGhW2fX0qD9ik2uySIJadltOaHQOA6vYURWHWU1j-ut8sp582lWuty6o.png?r=a13"></a>
                                        </div>
                                        <span class="profile-name">송현지</span>
                                    </li>
                                    <li class="sub-menu-item">
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
        </div>
    </header>
</body>

</html>
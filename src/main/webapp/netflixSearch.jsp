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

<style>
body,
html {
 width: 100vw;
 height: 100vh;
 margin: 0;
}
a {
text-decoration: none;
}
.home {
 /*position: relative;*/
 /* overlay가 home(부모) 박스안에 들어가게됨. relative를 안주면 body범위로 나가게됨*/
 position: relative;
}
.area_button_upvote {
width: 60px;
height: 30px;
border-radius: 10px;
}
.area_button_downvote {
width: 60px;
height: 30px;
border-radius: 10px;
}

img {
 display: block;
 /* vertical-align: bottom; */
 cursor : pointer;
}

.main-img {
 width: 1777px;
 height: 880px;
 background: linear-gradient(
  to bottom,
  rgba(0, 0, 0, 0.8) 0,
  rgba(0, 0, 0, 0) 60%,
  rgba(0, 0, 0, 0.8) 100%
 );
}

.main-img:before {
 bottom: 0;
 width: 30%;
}

.overlay {
 position: absolute;
 /* position:absolute는 overlay가 video 위에 있을 수 있게 해줌 */
 top: 0;
 left: 0;
 width: calc(100% - 100px);
 padding: 0 50px;
}

#header {
 /* display: flex; */
 background-color: transparent;
 width: 1777px;
 /* padding: 20px 50px; */
 height: 68px;
}

#header.header--dark {
 background-color: black;
}

.header-list {
 display: flex;
 padding-top: 16px;
 padding-left: 50px;
}

.logo {
 color: red;
 margin-right: 26px;
 line-height: 36px;
 padding-top: 5px;
}

.logo-image {
 width: 94px;
}

.nav {
 display: flex;
 color: white;
 padding-left: 15px;
 line-height: 35px; /* 위 아래 간격 */
}

.nav-item {
 padding: 0 10px;
}

.menu {
 display: flex;
 margin-left: auto;
 margin-right: 75px;
 color: white;
 line-height: 20px;
}

.tab {
 display: flex;
 margin-left: 10px;
 /* background-color: black; */
}

.login-profile-image {
 border-radius: 4px;
}

.profile-menu {
 margin-top: 5px;
 margin-left: 10px;
 display: inline-block;
 cursor: pointer;
 position: absolute;
}

/* .search {
 display: none;
 width: 275px;
 height: 35px;
 border: solid 0.5px white;
 background-color: black;
} */
.searchTab {
 color: white;
 font-size: 1.2em;
 border: none;
 display: inline-block;
 cursor: pointer;
 background: 0 0;
 padding: 0 5px;
 /* transform: rotate(-14deg); */
}

.titls-searchTab {
 color: white;
 font-size: 1.2em;
 border: none;
 display: inline-block;
 cursor: pointer;
 background: 0 0;
 padding: 2px 13px 5px 8px;
 /* transform: rotate(-14deg); */
}

.search-cuver {
 background-color: black;
 padding-top: 10px;
 width: 220px;
 border: none;
 border-right: 0px;
 border-top: 0px;
 boder-left: 0px;
 boder-bottom: 0px;
 outline: none;
 color: white;
 font-size: 16px;
 position: relative;
}

.close {
 color: white;
 /* color: black; */
 display: inline;
 /* position: absolute; */
 font-size: 23px;
 cursor: pointer;
 padding-left: 210px;
}

.notifications-item {
 color: white;
 font-size: 1.2em;
 border: none;
 cursor: pointer;
 background: 0 0;
 padding: 0 20px;
}

.account-menu-item {
 color: white;
 font-size: 1.5em;
 border: none;
 cursor: pointer;
 border: none;
 background: 0 0;
 /* padding: 8px 0 0 20px; */
 padding-left: 2px;
 display: inline-block;
}

.sub-profile-image {
 display: flex;
 border-radius: 3px;
}

.profile-name {
 display: flex;
 cursor: pointer;
 padding-left: 10px;
 font-size: 13px;
}

span.profile-name:hover {
 text-decoration: underline;
 cursor: pointer;
}

.profile-link {
 display: flex;
 padding-top: 15px;
 padding-left: 7px;
}

.sub-menu-link-icon {
 display: flex;
}

.caret {
 position: absolute;
 margin-top: 39px;
 /* margin-right: 60px; */
 /* width: 180px; */
 /* height: 370px; */
 color: white;
 border: none;
 cursor: pointer;
 background-color: black;
 margin-left: 232px;
 display: none;
}

.account-drop-down {
 position: absolute;
}

.ptrack-content {
 padding: 7px 6px 1px 8px;
}
.ptrack-content1 {
 padding: 0 6px 1px 8px;
 background-color: black;
}

.profiles {
 padding: 0;
 display: block;
}

.sub-menu-item-top {
 line-height: 32px;
 padding-top: 17px;
 cursor: pointer;
 display: flex;
}

.sub-menu-item {
 line-height: 32px;
 /* padding: 5px 10px; */
 /* display: block; */
 /* display: inline; */
 padding-top: 10px;
 cursor: default;
 display: flex;
}

.banner {
 color: white;
 top: 0;
 bottom: 35%;
 left: 4%;
 width: 44%;
 z-index: 10;
}

.titleImage {
 padding-top: 210px;
 padding-botton: 25px;
 width: 80%;
 /* height: auto; */
}

.summary {
 margin-bottom: 0;
 padding: 5px 135px 5px 0;
}

.buttons {
 display: flex;
 margin-right: 5px;
 padding-top: 30px;
}

.white-button {
 color: black;
 background-color: white;
 padding: 14px 31px;
 border-radius: 4px;
 font-size: 20px;
 text-decoration: none;
 font-weight: bold;
}

a.white-button:hover {
 background-color: white;
 opacity: 0.7;
}

.gray-button {
 color: white;
 background-color: rgba(109, 109, 110, 0.7);
 padding: 14px 31px;
 border-radius: 4px;
 font-size: 20px;
 margin-left: 10px;
 text-decoration: none;
 font-weight: bold;
 margin-top: -13px;
 cursor: pointer;
}

div.gray-button:hover {
 background-color: rgba(109, 109, 110, 0.7);
 opacity: 0.7;
}

.extra {
 margin-top: -10px;
 position: absolute;
 display: flex;
 right: 0;
 width: 140px;
 height: 63px;
}

.replay-button {
 /* display: inline-block; */
 margin-top: 11px;
 color: white;
 border: 1px solid white;
 border-radius: 50%;
 padding: 5px 17px;
 margin-right: 10px;
 background-color: white;
 background-color: rgba(255, 255, 255, 0);
 width: 10%;
 height: 35px;
}

.fa-lg {
 margin-left: -8px;
}

.rating {
 background-color: rgba(51, 51, 51, 0.6);
 border-left: 3px solid white;
 padding-left: 10px;
 width: 100%;
}

.tabbed-primary-navigation {
 margin: 0;
 padding: 0;
 display: flex;
}

.menu-trigger {
 display: flex;
}

li {
 list-style-type: none;
}

.current-active {
 font-size: 14px;
 color: #e5e5e5;
 cursor: pointer;
  -webkit-transition: color .4s;
}

a.current-active:hover {
 color: gray;
}

.movie > img {
 width: 341px;
}

@media screen and (min-width: 885px) {
 .navigation-menu {
  display: none;
  padding-top: 10px;
  padding-left: 18px;
 }
}

@media screen and (max-width: 885px) {
 .navigation-tab {
  display: block;
  display: none;
 }
}

.navigation-tab {
 padding-left: 20px;
 padding-top: 10px;
}
/* @media screen and (min-width: 1330px) {
 .navigation-tab {
  padding-left: 20px;
 }
} */
.top-movie {
 color: white;
 font-size: 1.4vw;
}

.list > img {
 border-radius: 0.2vw;
}

.contents {
 width: auto;
 height: 300px;
 /* position: absolute; */
 padding-top: 80px;
 /* position: relative; */
}

.contents-list {
 z-index: 3;
 position: absolute;
}

.list {
 display: flex;
}

.svg-icon {
 width: 140px;
 height: 200px;
 cursor: pointer;
}

.boxart-image {
 width: 140px;
 height: 200px;
 cursor: pointer;
}

.hover-priview-container {
 position: absolute;
 z-index: 2;
 margin-top: -25px;
 display: none;
 z-index: 3;
}
.drama-hover-priview-container {
 position: absolute;
 z-index: 2;
 margin-top: -25px;
 display: none; 
 z-index: 3;
 margin-top: 54px;
}

.priview-box {
}

.hover-priview {
 background-color: #181818;
 /* opacity: 0.7; */
 width: 358px;
 height: 198px;
 position: static;
 cursor: pointer;
 border-top-left-radius: 4px;
 border-top-right-radius: 4px;
}

.hover-priview-img {
 border-top-left-radius: 4px;
 border-top-right-radius: 4px;
}

.button-container {
}

.box-information {
 background-color: #181818;
 /* opacity: 0.7; */
 width: 318px;
 height: 60px;
 position: static;
 /* border-bottom-left-radius: 4px;
 border-bottom-right-radius: 4px; */
 padding: 20px 20px 0 20px;
}
.primary-button {
 display: inline-block;
 color: white;
 width: 40px;
 height: 40px;
 border-radius: 50%;
 cursor: pointer;
 margin-right: 4px;
 background-color: white;
}
.primary-button:hover {
 background-color: gray;
}
.ltr {
 display: inline-block;
 color: white;
 width: 40px;
 height: 40px;
 border-radius: 50%;
 border: solid 2px gray;
 margin-right: 173px;
 cursor: pointer;
}
.ltr:hover {
 border: 2px solid white;
}
.buttonControls {
 display: inline-block;
 color: white;
 width: 40px;
 height: 40px;
 border-radius: 50%;
 border: solid 2px gray;
 cursor: pointer;
}
.buttonControls:hover {
 border: 2px solid white;
}
.drama-buttonControls {
 display: inline-block;
 color: white;
 width: 40px;
 height: 40px;
 border-radius: 50%;
 border: solid 2px gray;
 cursor: pointer;
}
.drama-buttonControls:hover {
 border: 2px solid white;
}

.age-contatiner {
}

.age-information {
 background-color: #181818;
 /* opacity: 0.7; */
 width: 318px;
 height: 40px;
 position: static;
 /* border-bottom-left-radius: 4px;
       border-bottom-right-radius: 4px; */
 padding: 10px 20px 10px 20px;
}

.age {
 width: 40px;
 height: 40px;
 display: inline-block;
}

.age > img {
 width: 100%;
 height: 100%;
}

.running-time {
 font-size: 20px;
 color: white;
 padding-left: 10px;
 padding-bottom: 5px;
}

.genre-information {
 background-color: #181818;
 /* opacity: 0.7; */
 width: 318px;
 height: 40px;
 position: static;
 border-bottom-left-radius: 4px;
 border-bottom-right-radius: 4px;
 padding: 10px 20px 10px 20px;
}

.genre {
 color: white;
 font-size: 20px;
}

.main {
 width: 1777px;
 height: 350px;
 background-color: black;
 position: static;
}

.main-contents {
 position: absolute;
}

.top-drama {
 margin-top: 101px;
 color: white;
 margin-left: 50px;
}

.top-drama-list {
 display: flex;
 margin-left : 50px;
}

.main-s {
 width: 1777px;
 height: 265px;
 background-color: black;
 position: relative;
}

.main-viewing-contents {
 position: absolute;
}

.viewing-contends {
 margin-top: 65px;
 color: white;
 margin-left:50px;
}

.viewing-list {
 display: flex;
 margin-left:50px;
 cursor:pointer;
}

.normal-image {
 padding-right: 5px;
 margin-bottom: 65px;
}

.normal-image > img {
 width: 271px;
 height: 155px;
}

.main-th {
 width: 1777px;
 height: 265px;
 background-color: black;
 position: relative;
}

.main-dib-contents {
 position: absolute;
}
.main-dib-contents:hover >.contents-slider2 {
	display:block;
}

.dib-contents {
 margin-top: 65px;
 color: white;
 margin-left: 50px;
}

.dib-list {
 display: flex;
 margin-left:50px;
 cursor:pointer;
}

.main-fourth {
 width: 1777px;
 height: 1000px;
 background-color: black;
 position: relative;
 padding-bottom: 140px;
}

.main-all-contents {
 position: absolute;
 background: black;
 width: 1777px;
}

.all-contents {
 margin-top: 100px;
 margin-bottom: 40px;
 color: white;
 padding-left: 50px;
}
 .comment-all-box::-webkit-scrollbar {
    width: 10px;
  }
  .comment-all-box::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
  }
  .comment-all-box::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
 .drama-round-box::-webkit-scrollbar {
    width: 10px;
  }
  .drama-round-box::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
  }
  .drama-round-box::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }

.all-list {
 padding-left: 50px;
}

.lower {
 width: 1777px;
 height: 435px;
 background-color: #141414;
}

.lower-icon {
 margin: 0 345px;
 padding: 0 55px;
}

.sns-icon {
 padding-left: 12px;
 font-size: 25px;
 display: flex;
 /* margin-bottom: 1em; */
}

.facebook-icon {
 margin-right: 35px;
}

.instagram-icon {
 margin-right: 35px;
}

.twitter-icon {
 margin-right: 35px;
}

.youtube-icon {
 margin-right: 35px;
}

.icons {
 color: white;
}

a.icons:hover {
 color: gray;
}

table {
 font-size: 13px;
}

tr {
}

.lower-table-td {
 padding: 12.5px 180px 12.5px 0;
 /* margin-bottom: 16px;*/
 color: gray;
}

.lower-table {
 padding: 5px 0;
}

a.lower-icon-hover:hover {
 text-decoration: underline;
 cursor: pointer;
}

.lower-hover {
 border: solid 1px gray;
 padding: 8.5px 6.5px;
}

a.lower-hover:hover {
 color: white;
 cursor: pointer;
}

.lower-table-s {
 margin-top: 15px;
 margin-bottom: 22px;
}

.lower-table-s-td {
 color: gray;
}

.lower-text-contain {
 margin-top: 32px;
}

.lower-text {
 color: gray;
 font-size: 11px;
}

.account-container {
 background-color: black;
 width: 160px;
 height: 90px;
 padding: 0 10px 0 10px;
 border-top: solid 1px gray;
 display: flex;
}

.account {
 padding: 0;
 display: block;
 padding-left: 7px;
}

.account-information-top {
 line-height: 32px;
 cursor: pointer;
 display: flex;
}

.account-information {
 line-height: 32px;
 cursor: default;
 display: flex;
}

.logout-container {
 background-color: black;
 width: 160px;
 height: 45px;
 padding: 0 10px 0 10px;
 border-top: solid 1px gray;
 display: flex;
 padding-left: 10px;
}

.logout-tab {
 display: flex;
 cursor: pointer;
 padding-left: 20px;
 padding-top: 14px;
 font-size: 13px;
 cursor: pointer;
}

span.logout-tab:hover {
 text-decoration: underline;
}

.movie-detail {
 display: none;
 z-index: 4;
}
.drama-detail {
 display: none;
 z-index: 4;
}

.detail-information {
 position: absolute;
 z-index: 4;
}

.detail-information-container {
 width: 830px;
 height: 490px;
 padding-left: 50px;
 padding-top: 30px;
}

.detail-information-main-image {
 border-top-right-radius: 5px;
 border-top-left-radius: 5px;
 background: linear-gradient(
  to bottom,
  rgba(0, 0, 0, 0.8) 0,
  rgba(0, 0, 0, 0) 60%,
  rgba(0, 0, 0, 0.8) 100%
 );
}

.detail-information-overlay {
 position: absolute;
 z-index: 4;
 margin-top: 220px;
}

.detail-information-overlay-image {
 width: 347px;
 height: 138px;
 padding: 30px 0 0 100px;
}

.overlay-play-button {
 display: inline-block;
 height: 61px;
}

.play-button-image {
 width: 122px;
 height: 44px;
 padding-left: 100px;
 padding-top: 25px;
}
.play-button-image:hover {
 color: white;
 opacity: 0.7;
}

.overlay-dib-button {
 display: inline-block;
 width: 45px;
 height: 45px;
 border-radius: 50%;
 background-color: rgba(42, 42, 42, 0.6);
 border-color: rgba(255, 255, 255, 0.5);
 color: white;
 cursor: pointer;
 margin-left: 5px;
}
.overlay-dib-button:hover {
 border: 2px solid white;
}

.movie-explanation-container {
 background-color: #181818;
 position: static;
 width: 740px;
 height: 1805px;
 margin-left: 50px;
 margin-top: 53px;
 padding: 0 45px;
 border-bottom-left-radius: 5px;
 border-bottom-right-radius: 5px;
}

.movie-explanation-set-left {
}

.movie-explanation {
 display: inline-block;
 color: white;
 width: 470px;
 float: left;
}

.year {
 display: inline-block;
 margin-right: 10px;
}

.age-image {
 display: inline-block;
 margin-right: 10px;
 margin-top: 17px;
}

.runing-time {
 display: inline-block;
}

.movie-contents {
 margin-top: 23px;
}

.movie-actor-genre {
 display: inline-block;
 color: white;
 margin-left: 33px;
 margin-top: 15px;
 width:235px;
}

.movie-genre {
 margin-top: 20px;
 margin-bottom: 20px;
}

.watched-contents-text {
 margin-top: 100px;
 color: white;
}

.watched-video {
 display: inline-block;
}

.watched-video1 {
 margin-top: 20px;
 display: inline-block;
}

.watched-video-image {
 border-top-left-radius: 5px;
 border-top-right-radius: 5px;
}

.watched-video-box {
 padding: 20px;
 background-color: #2f2f2f;
 display: flex;
 height: 55px;
 width: 196px;
}

.watched-video-age {
 width: 35px;
 height: 35px;
 margin-right: 10px;
 margin-top: 7px;
}

.watched-video-dib {
 height: 50px;
 margin-left: 62px;
}

.watched-video-explanation-box {
 height: 160px;
 width: 196px;
 background-color: #2f2f2f;
 padding: 0 20px 0 20px;
 border-bottom-left-radius: 5px;
 border-bottom-right-radius: 5px;
}

.watched-video-explanation {
 color: white;
}

.trailer-text {
 color: white;
 margin-top: 60px;
}

.trailer-video {
 display: inline-block;
 height: 193px;
 cursor: pointer;
}
.trailer-video:hover > .titleCard {
 display: block;
}

.priview-image {
}
.titleCard {
 width: 70px;
 height: 70px;
 background-color: black;
 position: absolute;
 background-color: rgba(0, 0, 0, 0.6);
 margin-top: -130px;
 margin-left: 136px;
 border-radius: 50%;
 border: solid 1px white;
 display: none;
}
.titleCard-playSVG {
 color: white;
 margin-top: 10px;
 margin-left: 12px;
}

.trailer-video2 {
 width: 340px;
 height: 193px;
 display: inline-block;
 margin-left: 54px;
 cursor: pointer;
}
.trailer-video2:hover > .titleCard {
 display: block;
}

.trailer-text1 {
 color: white;
}

.movie-detail-information-text {
 margin-top: 50px;
 color: white;
}

.movie-detail-personnel {
 color: #777;
 font-size: 14px;
 margin-bottom: 10px;
 width:235px;
}

.personnel {
 color: white;
 font-size: 14px;
}

.movie-detail-personnel1 {
 color: #777;
 margin-bottom: 10px;
}

.personnel1 {
 color: white;
 width:235px;
}

.notice-board {
 width: 810px;
 height: 2264px;
 background-color: black;
 position: absolute;
 float: right;
 margin-left: 897px;
 z-index: 4;
 margin-top: 30px;
 border-radius: 5px;
 padding: 10px;
 border: solid 1px gray;
}

.notice-board-img {
}

.title-area {
 color: white;
 margin-left: 10px;
 padding-left: 10px;
}

.title-text {
 display: inline-block;
}

.close-icon {
 display: inline-block;
 float: right;
 width: 36px;
 height: 36px;
 margin: 10px 15px 0 0;
 cursor: pointer;
}

.Hawkins-Icon1 {
 padding: 8px 10px 10px 8px;
}

.sub-title {
 color: white;
 margin-left: 10px;
}

.video-type {
 border-right: solid 1px white;
 padding: 0 10px 0 10px;
}

.video-title {
 border-right: solid 1px white;
 padding: 0 10px 0 10px;
}

.video-year {
 padding: 0 10px 0 10px;
}

.cm-content-wrap {
 border: solid 1px gray;
 background-color: #121212;
 border-radius: 5px;
 margin-top: 20px;
 width: 810px;
 height: 350px;
}

.grade-text {
 padding: 16px 0 16px 0;
 color: white;
 text-align: center;
 border-bottom: solid 1px gray;
 font-size: 22px;
}

.user-grade-sum-box {
 background-color: #121212;
 width: 383px;
 height: 244px;
 display: inline-block;
 border-radius: 5px;
 border: solid 1px gray;
 float: left;
 margin-left: 15px;
 margin-top: 23px;
}

.age-satisfaction-box {
 float: right;
 background-color: #121212;
 display: inline-block;
 width: 383px;
 height: 244px;
 border-radius: 5px;
 border: solid 1px gray;
 margin-right: 15px;
 margin-top: 23px;
}

#myform fieldset {
 display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
 border: 0; /* 필드셋 테두리 제거 */
}

#myform input[type="radio"] {
 display: none; /* 라디오박스 감춤 */
}

#myform label {
 font-size: 3em; /* 이모지 크기 */
 color: transparent; /* 기존 이모지 컬러 제거 */
 text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

.cm-content-area {
 background-color: #121212;
 border: solid 1px gray;
 border-radius: 5px;
 margin-top: 15px;
 width: 810px;
 height: 1788px;
}

#netizens-grade fieldset {
 display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
 border: 0; /* 필드셋 테두리 제거 */
}

#netizens-grade input[type="radio"] {
 display: none; /* 라디오박스 감춤 */
}

#netizens-grade label {
 font-size: 3em; /* 이모지 크기 */
 color: transparent; /* 기존 이모지 컬러 제거 */
 text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

#netizens-grade label:hover {
 text-shadow: 0 0 0 #a00;
}

#netizens-grade label:hover ~ label {
 text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
}

#netizens-grade fieldset {
 display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
 direction: rtl; /* 이모지 순서 반전 */
 border: 0; /* 필드셋 테두리 제거 */
}

.cm_form_intro_box {
 padding: 20px 0;
 border-bottom: solid 1px gray;
}

.area_input_box {
 display: inline-block;
}

.this_input_write {
 width: 700px;
 height: 35px;
 margin-left: 15px;
 font-size: 17px;
 outline: none;
}

.this_button_write {
 display: inline-block;
 height: 35px;
 width: 68px;
}

.nav-element {
 -webkit-text-size-adjust: 100%;
 color: #fff;
 -webkit-font-smoothing: antialiased;
 user-select: none;
 cursor: default;
 word-break: keep-all;
 font-family: "Netflix Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
 line-height: 1.4;
 font-size: 14px;
 letter-spacing: 0 !important;
 margin-right: 15px;
 background-color: black;
 width: 275px;
 border: solid 1px white;
 /* display: none; */
}

#searchInput {
 background-color: black;
 width: 225px;
 color: white;
}
.searchIcon {
 display: flex;
 position: absolute;
 margin-left: 220px;
 margin-top: -29px;
}

.list-select-box {
 display: inline-block;
 cursor: pointer;
}

.fa-chevron-down {
 display: inline-block;
 cursor: pointer;
}

.list-box {
 width: 80px;
 height: 40px;
 border: solid 1px white;
 border-radius: 5px;
 background-color:black;
 color : white;
 font-size : 15px;
 margin: 15px;
 outline : none;
}

.list-list1 {
 padding: 10px 0;
 text-align: center;
 border-bottom: solid 1px gray;
}

.list-list2 {
 padding: 10px 0;
 text-align: center;
}

.list-list1:hover {
 background-color: gray;
 cursor: pointer;
}

.list-list2:hover {
 background-color: gray;
 cursor: pointer;
}

.comment-all-box {
overflow-y: scroll;
 overflow-x: hidden;
 height:1403px;
}
.comment-box {
 width: 780px;
 /* height: 200px; */
 height: auto;
 border: solid 1px gray;
 margin: 0 14px 14px 14px;
}

#myform3 {
 display: inline-block;
 height: 45px;
}

#myform3 fieldset {
 display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
 border: 0; /* 필드셋 테두리 제거 */
}

#myform3 input[type="radio"] {
 display: none; /* 라디오박스 감춤 */
}

#myform3 label {
 font-size: 3em; /* 이모지 크기 */
 color: transparent; /* 기존 이모지 컬러 제거 */
 text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}

#comment-grade > label {
 font-size: 15px;
}

#comment-grade {
 margin: 10px 0 20px 0;
}

.user-grade {
 color: white;
 font-size: 15px;
 display: inline-block;
 /* margin-top: 28px; */
 /* margin-bottom: 20px; */
}

.user-comment {
 color: white;
 margin-left: 10px;
 height: auto;
 margin-bottom: 10px;
}

.user-id {
 color: white;
 margin-left: 10px;
 display: inline-block;
 border-right: solid 1px gray;
 padding-right: 15px;
}

.comment-day {
 color: white;
 margin-left: 10px;
 display: inline-block;
}

.cm_sympathy_area {
 margin-left: 10px;
 margin-bottom: 20px;
}

.graph-box {
 width: 383px;
 height: 190px;
}
#background-btm {
 background-color: rgba(0, 0, 0, 0.6);
 height: 100%;
 width: 100%;
 position: fixed;
 top: 0;
 left: 0;
 z-index: 2;
}

.contents-slider {
 display: none;
}
.contents-slider-left {
 width: 50px;
 height: 200px;
 position: absolute;
 margin-top: 734px;
 background-color: rgba(20, 20, 20, 0.5);
 cursor: pointer;
 z-index: 1;
 float: left;
}
.contents-slider-right {
 width: 50px;
 height: 200px;
 position: absolute;
 margin-top: 734px;
 background-color: rgba(20, 20, 20, 0.5);
 cursor: pointer;
 z-index: 4;
 margin-left: 1727px;
}
.fa-chevron-left {
 font-size: 40px;
 margin-top: 80px;
 margin-left: 12px;
 color: white;
 display: inline-block;
}
.fa-chevron-right {
 font-size: 40px;
 margin-top: 80px;
 margin-left: 12px;
 color: white;
 display: inline-block;
}
.home:hover > .contents-slider {
 display: block;
}
.contents-slider1 {
 display: none;
 position: absolute;
}
.contents-slider-left1 {
 width: 50px;
 height: 200px;
 position: absolute;
 background-color: rgba(20, 20, 20, 0.5);
 cursor: pointer;
 z-index: 1;
}
.contents-slider-right1 {
 width: 50px;
 height: 200px;
 position: absolute;
 background-color: rgba(20, 20, 20, 0.5);
 cursor: pointer;
 z-index: 4;
 margin-left: 1727px;
}
.main-contents:hover > .contents-slider1 {
 display: block;
}
.contents-slider2 {
 display: none;
 position: absolute;
}
.contents-slider-left2 {
 width: 50px;
 height: 152px;
 position: absolute;
 background: rgba(20, 20, 20, 0.5);
 cursor: pointer;
 z-index: 1;
}
.contents-slider-right2 {
 width: 50px;
 height: 152px;
 position: absolute;
 background: rgba(20, 20, 20, 0.5);
 cursor: pointer;
 z-index: 4;
 margin-left: 1727px;
}
.fa-angle-left {
font-size: 40px;
 margin-top: 56px;
 margin-left: 12px;
 color: white;
 display: inline-block;
}
.fa-angle-right {
font-size: 40px;
 margin-top: 56px;
 margin-left: 18px;
 color: white;
 display: inline-block;
}
.main-viewing-contents:hover > .contents-slider2 {
 display: block;
}
.drama-round-box::-webkit-scrollbar {
    width: 10px;
  }
  .drama-round-box::-webkit-scrollbar-thumb {
    background-color: #2f3542;
    border-radius: 10px;
  }
  .drama-round-box::-webkit-scrollbar-track {
    background-color: grey;
    border-radius: 10px;
    box-shadow: inset 0px 0px 5px white;
  }
.drama-round-box {
 width: 785px;
 height: 810px;
 border-bottom: 2px solid #404040;
 border-top: 1px solid #404040;
 overflow-y:scroll;
 overflow-x:hidden;
 position:relative;
}
.round-bundle {
 width: 740px;
 height: 104px;
 border-bottom: 1px solid #404040;
 display: flex;
 margin-top: 30px;
}

.drama-round {
 color: #d2d2d2;
 font-size: 1.5em;
 display: inline-block;
 padding: 0 15px;
}
.round-image {
	width: 133px;
	height: 75px;
	border-radius: 4px;
}
.round-image:hover ~ .round-hover-play-button {
    	display:block;
} 
.round-hover-play-button {
width: 45px;
    height: 45px;
    background-color: rgba(30,30,20,.5);
    border: 1px solid white;
    position: absolute;
    border-radius: 50%;
    margin-left: 41px;
    margin-top: 16px;
    display: none;
}

.titleCardList {
 flex: 0 0 70%;
 font-size: 1em;
 width: 550px;
 margin-left: 130px;
}
.round-title {
 color: #fff;
 font-size: 1em;
 font-weight: 700;
 margin-left: 16px;
}
.round-running-time {
 color: #fff;
 font-size: 1em;
 font-weight: 700;
 float: right;
}
.round-summary {
 padding: 0 1em 1em;
 margin: 0;
 color: #d2d2d2;
 padding: 1em 0 0 1em;
}

</style>
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
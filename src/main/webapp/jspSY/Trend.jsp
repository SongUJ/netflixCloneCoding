<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.sns.dao.*"%>
<%@ page import="com.sns.dto.*"%>
<%@ page import="java.util.*"%>
<%
	int loginID = (Integer)(session.getAttribute("profileId")); 
	System.out.println("Trend.jsp : " + loginID);
	int userID =1;
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js" integrity="sha256-eTyxS0rkjpLEo16uXTS0uVCS4815lc40K2iVpWDvdSY=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/6ebfb758c0.js"
	crossorigin="anonymous"></script>
<script>
    	var loginID = '<%=(Integer)(session.getAttribute("profileId"))%>'; /* 전역변수로 만들어서 js.에서 변수 사용  */
    	
    	$(function() {
    		
    	    let y = new Date();
    	    y.setDate(y.getDate()-1);
    	    let str = y.getFullYear() + "-"
    	    + ("0" + (y.getMonth() + 1)).slice(-2) + "-"
    	    + ("0" + y.getDate()).slice(-2);
    	    $("#date").attr("max",str);
    	    $("#mybtn").click(function() {
	    	    $(".movie_rank").empty(); 
    	        let d = $("#date").val(); //YYYY-MM-DD
    	        const regex = /-/g;
    	        let d_str = d.replace(regex,"") // YYYYMMDD

    	        let url = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=5328b84349af95da10e62a9cd56dc6a7&targetDt="+d_str
    	        // ajax로 json 데이터 가져오기
    	         $.getJSON(url, function(data) {
    	             let movieList = data.boxOfficeResult.dailyBoxOfficeList;
    	             /* $("div").append(d+" 박스 오피스 순위<br>"); */
    	             for(let i in movieList){
    	                 /* $("div").append("<span id= '"+movieList[i].movieCd + "'>" +(parseInt(i)+1) + " " + movieList[i].movieNm+"/"+movieList[i].audiAcc + "명 " + "</span><hr>" ); */
    	            	 var str = 
	    	                 '<div class="article-box menuButton" id='+movieList[i].movieCd+'>'
		    	 				+'<div class="notice-box">'
		    	 					+'<div class="rank-box1">'
		    	 						+'<i class="fa-solid fa-'+(parseInt(i)+1)+' fa-lg"></i>'
		    	 					+'</div>'
		    	 					+'<div class="postingbox st">'+movieList[i].movieNm+'</div>'
		    	 				+'</div>'
		    	 			+'</div>';
		    	 			
		    	 			$(".movie_rank").append(str);
    	             } 
    	            });
    	    });
    	    
    	    $(document).on("click", ".article-box", function(){ 
    	        var d = $(this);
    	        let movieCd = d.attr("id");
    	        let url = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=5328b84349af95da10e62a9cd56dc6a7&movieCd="+movieCd;  // +movieCd;    // =20124079
    	        $(".movieInformation").empty(); 
    	        $.getJSON(url,function(res){
    	            let movie = res.movieInfoResult.movieInfo;
    	            d.append("<hr class=movieInformation>");
    	            d.append("개봉일 : "+movie.openDt+"<br>");
    	            d.append("감독 : "+movie.directors[0].peopleNm+"<br>");
    	            d.append("주연 : "+movie.actors[0].peopleNm+", "+movie.actors[1].peopleNm+", "+movie.actors[2].peopleNm);
    	            d.append("<hr>");

    	        });
    	   		
    	   	});
    	});
</script>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/common-sy.js"></script>
<title>Trend</title>
<link rel="stylesheet" href="main.css" />
<link rel="stylesheet" href="modal.css" />

 

<body style="margin: 0 auto; background-color: #141414; color: #ffffff">
    <%@ include file="ModuleMenu.jspf" %>

	<div id="background_btm" style="display: none;"></div>

	<main style="float: left">


		<div id="home-box2">

			<div class="home-bar">
				<span style="font-weight: 800;">트렌드</span>
			</div>
			<div style="width: 665px; height: 410px;">
				<div class="trend-imgbox zoom">
					<div class="hot-content">Now Hot Content!</div>
				</div>
			</div>
			<div class="pm-box" !important style="width: 665px; box-sizing: border-box;">
				<!-- <div class="seriesRank   pm-button">시리즈</div> -->
				<span style="line-height:2;margin-left:-50px;">일별 박스오피스</span>
				<div class="movieRank  pm-button">
					<input type="date" id="date"><button id="mybtn">확인</button>
					<!-- <div id="boxoffice">
					    박스 오피스 순위<br>
					</div> -->
				</div>
			</div>
			
		<div class="movie_rank">	
			<!-- <div class="article-box menuButton">
				<div class="notice-box">
					<div class="rank-box1">
						<i class="fa-solid fa-1 fa-lg"></i>
					</div>
					<div class="postingbox st">승리호</div>
				</div>
			</div>
			<div class="article-box menuButton">
				<div class="notice-box">
					<div class="rank-box1">
						<i class="fa-solid fa-2 fa-lg"></i>
					</div>
					<div class="postingbox st">셀럽은 회의중</div>
				</div>
			</div>
			<div class="article-box menuButton">
				<div class="notice-box">
					<div class="rank-box1">
						<i class="fa-solid fa-3 fa-lg"></i>
					</div>
					<div class="postingbox st">리틀 포레스트</div>
				</div>
			</div>
			<div class="article-box menuButton">
				<div class="notice-box">
					<div class="rank-box1">
						<i class="fa-solid fa-4 fa-lg"></i>
					</div>
					<div class="postingbox st">해적</div>
				</div>
			</div>
			<div class="article-box menuButton">
				<div class="notice-box">
					<div class="rank-box1">
						<i class="fa-solid fa-5 fa-lg"></i>
					</div>
					<div class="postingbox st">새콤달콤</div>
				</div>
			</div> -->
		</div>	
		
		<!-- <div class="series_rank" style="display:none">	
			<div class="article-box menuButton">
				<div class="notice-box">
					<div class="rank-box1">
						<i class="fa-solid fa-1 fa-lg"></i>
					</div>
					<div class="postingbox st" >안나라수나마라</div>
				</div>
			</div>
			<div class="article-box menuButton">
				<div class="notice-box">
					<div class="rank-box1">
						<i class="fa-solid fa-2 fa-lg"></i>
					</div>
					<div class="postingbox st">스물다섯 스물하나</div>
				</div>
			</div>
			<div class="article-box menuButton">
				<div class="notice-box">
					<div class="rank-box1">
						<i class="fa-solid fa-3 fa-lg"></i>
					</div>
					<div class="postingbox st">또오해영</div>
				</div>
			</div>
			<div class="article-box menuButton">
				<div class="notice-box">
					<div class="rank-box1">
						<i class="fa-solid fa-4 fa-lg"></i>
					</div>
					<div class="postingbox st">왜오수재인가</div>
				</div>
			</div>
			<div class="article-box menuButton">
				<div class="notice-box">
					<div class="rank-box1">
						<i class="fa-solid fa-5 fa-lg"></i>
					</div>
					<div class="postingbox st">갯마을 차차차</div>
				</div>
			</div>
		</div>	 -->
		
		
<!--  해시태그가 달린 실시간 트렌드 글 -->
		
	
				<div class="notice-box">
					<div>
						<div style="line-height: 50px; font-size: 25px; font-weight: 800; color: red; padding:10px; "> Netflix Now</div>
					</div>
				</div>
	

			<%
				ArrayList<PostViewDTO> trendList = postViewDao.getTrendPost();
				for(PostViewDTO trend :trendList){
			%>
	
			<div class="article-box" style="overflow: hidden; height: auto;" bno=<%=trend.getPostID()%>>
				<input type="hidden" name="post_id">
					<div class="profile-imgbox "onclick="location.href ='Profile.jsp?profile_id=<%=trend.getProfileID()%>&member_id=<%=loginId%>'">
						<div class="box" style="background: #141414;">
							<img class="profile" src="../images/<%=trend.getProfileImg()%>" onclick=>
						</div>
					</div>

					<div class="namebar">
						<span class="spannickname"><%=trend.getNickname() %> &nbsp;</span>
						<span class="spanid"> <%=trend.getWriteDate() %></span>
					</div>
					<div class="content-container">
						<div class="postingbox"
							onclick="location.href ='Posting.jsp?post_id=<%=trend.getPostID()%>'"><%=trend.getContent() %></div>
							
				<!-- 파일 업로드 내용이 있으면/없으면 -->
				<% 
               		if(trend.getImgFile() !=null) {
                %>

						<div class="img-post">
							<img src="../images/<%=trend.getImgFile()%>">
						</div>
						<% } %>

						<div class="bottom-bar">
							<div>
								<div class="div_bottombar">
									<i class="fa-solid fa-message"></i><span class="tab"></span>
				 	<% 
					 	if(postViewDao.likeIt(trend.getPostID(),loginID )) {		
					 		
                    %>
                   		<i class="fa-solid fa-heart"></i>
                    <% 	} else { %>
                    
        		            	<i class="fa-regular fa-heart"></i>
                    <% } %> 
									<span class="heart_count" style="font-size:13px"><%=trend.getLikeCnt()%></span>
									<span class="tab"></span> 
									<i class="fa-solid fa-arrow-up-from-bracket"></i>
								</div>
							</div>
						</div>

					</div>
				</div>
				<% } %>
			</div>
		</div>  


<!-- -----------------우측 트렌드 랭킹 바---------------------------- -->
  <%@ include file="TrendRankModule.jspf" %>



		</main>
	</body>
</html>

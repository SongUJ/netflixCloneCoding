<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="./js/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.min.js" integrity="sha256-eTyxS0rkjpLEo16uXTS0uVCS4815lc40K2iVpWDvdSY=" crossorigin="anonymous"></script>
<title>Insert title here</title>
<script>
$(function(){
	$(document).ready(function (){
		$(".all-list").empty();
	});
	var g_1;
	$("#search").click(function(){
		var search = $("#searchSS").val();
		if(!search) {
			alert("먼저 검색어를 입력해주세요.");
			return false;
		} 
		$(".all-list").empty();
		if(search) {
			$.ajax({
				type:'get',
				url:'MovieSearchApiServlet',
				data:{'search' : search },
				datatype: "json",
				error:function(r,s,e) {
	    			alert("Movie Api 에러!");
	    		},
				cache: false,
				async: false,
				success: function(result) {
					g_1 = result;
					for(var i=0; i<=result.length-1; i++) {
						var actor = result[i].actor;
						var image = result[i].image;
						var director = result[i].director;
						var subtitle = result[i].subtitle;
						var link = result[i].link;
						var title = result[i].title;
						var pubDate = result[i].pubDate;
						var userRating = result[i].userRating;
						 
						var str = 
							'<div class="movie-box1" style="border:1px solid gray;width:400px;height:200px;display:inline-block;margin-right: 40px;margin-left: 40px;margin-top: 50px;border-radius:10px;color:white;">'
								+'<div style="line-height:25px; display:inline-block; width:255px;">'
									+'<div class="title">'+title+'</div>'
									+'<div class="sub-title">'+subtitle+'</div>'
									+'<div class="pubDate">개봉 : '+pubDate+'</div>'
									+'<div class="userRating">평점 : '+userRating+'</div>'
									+'<div class="actor">출연 : '+actor+'</div>'
									+'<div class="director">감독 : '+director+'</div>'
			                	+'</div>'
			                	+'<div style="margin-top:23px;display:inline-block;">'
			                		+'<a href='+link+'>'
										+'<img class="movieImage" src="'+image+'">' 	
			                		+'</a>'
								+'</div>'
		                	+'</div>';
							
						$(".all-list").prepend(str);
					}
				}
			})
		}
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
 width: 1677px;
 height: 3000px;
 background-color: #141414;
 position: absolute; 
 padding: 0 50px;
 padding-bottom: 140px;
}

.main-all-contents {
 /* position: absolute; */
}

.all-contents {
 margin-top: 100px;
 margin-bottom: 40px;
 color: white;
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
.all-list {
 border:1px solid white;
 width:1000px;
 height:auto;
 text-align:center;
 margin:auto;
 margin-top:50px;
 border-radius:10px;
 overflow-x:hidden;
 overflow-y:auto;
 
}
.movie-box1 {
 border:1px solid gray;
 width:400px;
 height:200px;
 display:inline-block;
 margin-right: 40px;
 margin-left: 40px;
 margin-bottom: 50px;
 border-radius:10px;
 color:white;
}

</style>
</head>
<body>
<div>
    <div class="home">
        <div class="main-fourth">
            <div class="main-all-contents">
                <h1 class="all-contents">영화 검색</h1>
                <div style="text-align:center;">
	                <input type="text" name="search" id="searchSS" value="" style="width:180px; height:24px;" placeholder="검색어 입력">
					<button id="search">영화 검색하기</button>
                </div>
                <div class="box-create">
	                <div class="all-list">
	                	<div class="movie-box1" style="border:1px solid gray;width:400px;height:200px;display:inline-block;margin-right: 40px;margin-left: 40px;margin-top: 50px;border-radius:10px;color:white;">
		                	<div style="line-height:25px; display:inline-block; width:255px;">
								<div class="title"></div>
								<div class="sub-title"></div>
								<div class="pubDate"></div>
								<div class="userRating"></div>
								<div class="actor"></div>
								<div class="director"></div>
		                	</div>
		                	<div style="margin-top:23px;display:inline-block;">
								<img class="movieImage" onclick="location.href=''"; src=""> 	
		                	</div>
	                	</div>
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
                        <a class="current-active" <%-- href="index.jsp?profile_id=<%= profileID %>" --%>>홈</a>
                    </li>
                    <li id="series-button" class="navigation-tab">
                        <a class="current-active" <%-- href="index1.jsp?profile_id=<%= profileID  %>" --%>>시리즈</a>
                    </li>
                    <li id="movie-button" class="navigation-tab">
                        <a class="current-active" <%-- href="index2.jsp?profile_id=<%= profileID  %>" --%>>영화</a>
                    </li>
                    <li id="new-content-button" class="navigation-tab">
                        <a class="current-active">NEW!요즘 뜨는 콘텐츠</a>
                    </li>
                    <li id="dib-button" class="navigation-tab">
                        <a style="color:white;" class="current-active" href="netflixDib.jsp">영화관 검색</a>
                    </li>
                </ul>
            </div>
        </div>
        </div>
    </header>
</div>
</body>
</html>
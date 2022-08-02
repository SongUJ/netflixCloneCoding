<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import ="com.sns.dao.*" %>
<%@ page import ="com.sns.dto.*" %>
<%@ page import ="java.util.*"  %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script src="https://kit.fontawesome.com/6ebfb758c0.js"
	crossorigin="anonymous"></script>
<script src="../js/jquery-3.6.0.min.js"></script>
<script src="../js/common-sy.js"></script>
<title>Posting</title>
<%	
	int postID = Integer.parseInt(request.getParameter("post_id"));
	int loginID = (Integer)(session.getAttribute("profileId")); 
	System.out.println("Posting.jsp : " + loginID);
	int userID =1;
%>

<link rel="stylesheet" href="main.css" />
<link rel="stylesheet" href="modal.css" />


<script>
      //모달창 닫기
      function modalClose(){
          $("#post-box.modal-stl ").fadeOut();
          $("#background_btm").fadeOut();
          $(".comm-box.modal-stl").fadeOut();
          $(".posting_menu").css('display','none');
          $(".fa-solid.fa-xmark").css('display','none');
         
      }
      
      /* function addCommentOnAjax(data) {
    	  var profileImg = data.profile_img;
    	  var commentID = data.comment_id;
    	  var nickname = data.nickname;
    	  var writeDate = data.writedate;
    	  var comments = data.comments;
    	  var str = '<div class="article-box" style="overflow: hidden; height: auto;">'
    	  	+'<div class="profile-imgbox">'
			+'	<div class="box" style="background: #141414;">'
			+'		<img class="profile" src="../images/'+profileImg+'">'
			+'	</div>'
			+'</div>'
			+'<div class="namebar" style="width:51s0px;">'
			+'	<i class="fa-solid fa-xmark" style="float:right" onclick="location.href =\'CommentDel.jsp?comment_id='+commentID +'\'"></i>'
			+'	<span class="spannickname"> '+nickname+'&nbsp;'
			+'	</span> <span class="spanid">'+writeDate+'</span>'
			+'</div>'
			+'<div class="content-container">'
			+'	<div class="postingbox">'+comments+'</div>'
			+'</div>'
			+'</div>';
			//alert(str);
			$("#home-box5").append(str);
      }	 */
      
      $(function(){
        
          //포스팅 모달창
          $(".post-button").click(function() {
            $("#post-box").css('display','block');
            $("#background_btm").css('display','block');
          });

          //댓글 모달창
          $(".fa-solid.fa-message").click(function() {
        	var bno = $(this).parent().parent().parent().parent().parent().attr("bno");
        	//alert('bno : ' + bno);
        	$("#hidden_bno").val(bno);
            $(".comm-box").css('display','block');
            $("#background_btm").css('display','block');
          });
          
          //bno찾기
          $(".comment-button").click(function() {
          	var bno = $(this).parent().parent().parent().parent().parent().attr("bno");
          	/* alert('bno : ' + bno); */
          	$("#hidden_bno2").val(bno);
          });
			
          //포스팅메뉴 모달창
           $(".fa-solid.fa-ellipsis").click(function() {
            $(".posting_menu").css('display','block');
            $("#background_btm").css('display','block');
            $("#background_btm").css('background-color','rgba(0, 0, 0, 0.0)');
            
          });

          
          //모달창 닫기
          $("#background_btm").click(function() {
            modalClose();   
          });

          $("#post-box .ps-button").click(function() {
            alert("포스팅 성공!")
            modalClose();
          });
          
          
          /* $(".comm-box .ps-button").click(function() {
           	var comments = $("#textarea_comments").val();
	    	var postID = $("#hidden_bno").val();
	    	//alert(postID);
	    	//alert(comments);
	    	
	    	$.ajax({
	    		type: 'post',
	    		url: 'CommentServlet',
	    		data: {"postID":postID, "comments":comments},
	    		datatype: "json",
	    		success: function(data) {
	    			addCommentOnAjax(data);
	    		},
	    		error: function(r,s,e) {
	    			alert("댓글 AJAX error");
	    			alert(r);
	    			alert(s);
	    			alert(e);
	    		}
	    	});

			modalClose();
		}); */
       
         /*
         $("comment-box .comment-button").click(function() {
       
                var comments = $("#textarea_comments2").val();
      	    	var postID = $("#hidden_bno2").val();
      	    	alert(postID);
      	    	alert(comments);
      	    	
      	    	$.ajax({
      	    		type: 'post',
      	    		url: 'CommentServlet',
      	    		data: {"postID":postID, "comments":comments},
      	    		datatype: "json",
      	    		success: function(data) {
      	    			
      	    			addCommentOnAjax(data);
      	    		},
      	    		error: function(r,s,e) {
      	    			alert("error");
      	    			alert(r);
      	    			alert(s);
      	    			alert(e);
      	    		}
      	    	});

      			modalClose();
      		});
           */

          //마우스 휠 고정
          $("#post-box").on("wheel", function(e) {
            e.stopPropagation();
            e.preventDefault();
          });
          $(".comm-box").on("wheel", function(e) {
            e.stopPropagation();
            e.preventDefault();
          });
          $("#background_btm").on("wheel", function (e) {
            e.stopPropagation();
            e.preventDefault();
          });         
        });   

</script>
<style>
#post-box.modal-stl.comm-box {
	position: absolute;
	width: 530px;
	left: 630px;
}

.comm-box.modal-stl {
	/* position: absolute; */
	position: fixed;
	width: 530px;
	left: 630px;
	/* margin-top:80px; */
	top: 80px;
	z-index: 2;
	border-radius: 20px;
}

#background_btm {
	background-color: rgba(0, 0, 0, 0.8);
	height: 100%;
	width: 100%;
	/* position: absolute; */
	position: fixed;
	top: 0;
	left: 0;
	z-index: 1;
}

#postModal {
	z-index: 2;
	position: fixed;
	margin-left: 600px;
}

.menubox_del {
	width: 236px;
	height: 20px;
	padding: 16px 16px 16px 16px;
	font-size: 17px;
	font-wieght: 500;
}

.menubox_modify {
	width: 236px;
	height: 20px;
	padding: 16px 16px 16px 16px;
	font-size: 17px;
	font-wieght: 500;
}

.posting_menu {
	width: 170px;
	height: 105px;
	border: 2px solid #afafaf;
	z-index: 1;
	position: absolute;
	top: 100px;
	left: 960px;
	background-color: #282828;
	border-radius: 10px;
}
</style>

</head>

<body style="margin: 0 auto; background-color: #141414; color: #ffffff">
	<%@ include file="ModuleMenu.jspf" %>
	<main style="float: left">
	
	<!--메뉴박스 모달창 -->
	<div class="posting_menu" style="display: none">
		<div class="menubox_del" onclick="location.href ='PostDel.jsp?post_id=<%=postID%>'">삭제하기</div>
		<div class="menubox_modify"  onclick="location.href ='PostModify.jsp?post_id=<%=postID%>'">수정하기</div>
	</div>
	
	<div class="main-box">
		<div id="home-box5">
			<div class="home-bar"><span style="font-weight: 800;">Posting</span></div>
				<% 
					ArrayList<PostViewDTO> thisPost= postViewDao.thisPost(postID);
						for(PostViewDTO post : thisPost) {
				%>
			<div class="big-container" bno=<%=post.getPostID()%>><input type="hidden" name="post_id">
				<div class="article-box" style="overflow: hidden; height: auto; margin-top:30px;" bno=<%=post.getPostID()%>>
				<input type="hidden" name="post_id">
					<div class="profile-imgbox">
						<div class="box" style="background: #141414;">
							<img class="profile" src="../images/<%=post.getProfileImg()%>">
						</div>
					</div>

					<div class="namebar">
						<span class="spannickname"><%=post.getNickname() %> &nbsp;</span>
						<span class="spanid"> <%=post.getWriteDate() %></span>
						<i class="fa-solid fa-ellipsis" style="float: right;"> </i>
					</div>
					<div class="content-container">
						<div class="postingbox" onclick="location.href ='Posting.jsp?post_id=<%=post.getPostID()%>'"><%=post.getContent() %></div>
							
				<!-- 파일 업로드 내용이 있으면/없으면 -->
				<% 
               		if(post.getImgFile() !=null) {
                %>
					<div class="img-post">
						<img src="../images/<%=post.getImgFile()%>">
					</div>
				<% } %>
					<div class="bottom-bar">
						<div>
							<div class="div_bottombar">
								<i class="fa-solid fa-message"></i><span class="tab"></span>
				<% 
				 	if(postViewDao.likeIt(post.getPostID(),loginID )) {		
				%>
                  				<i class="fa-solid fa-heart"></i>
				<% 	} else { %>
                   
       		            		<i class="fa-regular fa-heart"></i>
				<% } %> 
								<span class="heart_count" style="font-size:13px"><%=post.getLikeCnt()%></span>
								<span class="tab"></span> 
								<i class="fa-solid fa-arrow-up-from-bracket"></i>
							</div>
						</div>
					</div>

					</div>
				</div>
				<% } %>
		


<!-------------------------  댓글달기----------------------->
	<div class="comment-box">
		<div class="post-box" style="overflow: hidden; height: auto; margin-top: 0; margin-bottom: 0; margin-left: 20px;">
			<%
				for(ProfileDTO profile : profileList) {
			%>
				<div class="profile-imgbox">
					<div class="box" style="background: #141414;">
						<img class="profile" src="../images/<%=profile.getProfileImg()%>">
					</div>
				</div>			
				<div class="namebar"><span class="spannickname"> <%=profile.getNickname() %> </span></div>
			<% } %>	
				<div class="post-container">
					<div class="post-container2 ">
						<div class="postingbox" style="font-size: 15px; width: 390px; padding-right: 10px;">
							<form action="CommentsAct.jsp">	
								<textarea id="textarea_comments2" class="autosize" onkeydown="resize(this)" name="comments"
									onkeyup="resize(this)" placeholder="댓글을 달아 생각을 나눠보세요!"></textarea>
								<script>
			                      function resize(obj) {
			                        obj.style.height = "1px";
			                        obj.style.height = (12+obj.scrollHeight)+"px";
			                      }
			                     </script>
								<input type="hidden" name="post_id" id="hidden_bno2" />
						</div>
						<div class="comment-button postButton">
						<input type="submit" value="답글">
							</form>	
						</div>		
					</div>
				</div>
			</div>
	</div>
</div>	

	<!-- 구분선 -->
	<div style="border-top: 0.5px solid #7e7d7d; border-bottom: 0.5px solid #7e7d7d; width: 665px; height: 10px;"></div>

	<!--달린댓글보기  -->
	<%
		CommentDAO commentDao = new CommentDAO();
		ArrayList<CommentDTO> cList = commentDao.comments(postID);
			for(CommentDTO comment : cList){
	 %>

		<div class="article-box" style="overflow: hidden; height: auto;">
			<div class="profile-imgbox">
				<div class="box" style="background: #141414;">
					<img class="profile" src="../images/<%=comment.getProfileImg()%>">
				</div>
			</div>

			<div class="namebar" style="width:51s0px;">
				<i class="fa-solid fa-xmark" style="float:right" onclick="location.href ='CommentDel.jsp?comment_id=<%=comment.getCommentID()%>&post_id=<%=comment.getPostID()%>'"></i>
				<span class="spannickname"> <%=comment.getNickname()%> &nbsp;</span> 
				<span class="spanid"><%=comment.getWriteDate()%></span>
			</div>
			<div class="content-container">
				<div class="postingbox"><%=comment.getComments()%></div>
			</div>
		</div>

	<% } %>

<!-- 우측 바 -->
	<%@ include file="TrendRankModule.jspf" %>
		</main>
	</body>
</html>
<!--트렌드 바-->
<!-- <div class="search-bar" style="float: right">
           

            
          </div> -->

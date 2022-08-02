      //모달창 닫기
      function modalClose(){
          $("#post-box.modal-stl ").fadeOut();
          $("#background_btm").fadeOut();
          $(".comm-box.modal-stl").fadeOut();
          $("#p-box4").css('display','none')
          $("#p-box3").css('display','none')
          $("#p-box2").css('display','none')
          $("#p-box1").css('display','none')
          $("#article-box.modal-stl").css('display','none');
          
         
      }
      
      $(function(){
        
    	  //메뉴 이동
    	  $(".menu-box1").click(function(){
    		  $("#home-box1").css('display','block');
    		  $("#home-box2").css('display','none');
    		  $("#home-box3").css('display','none');
    		  $("#home-box4").css('display','none');
    	  });
    	  $(".menu-box2").click(function(){
    		  $("#home-box2").css('display','block');
    		  $("#home-box1").css('display','none');
    		  $("#home-box3").css('display','none');
    		  $("#home-box4").css('display','none');
    	  });
    	  $(".menu-box3").click(function(){
    		  $("#home-box3").css('display','block');
    		  $("#home-box1").css('display','none');
    		  $("#home-box2").css('display','none');
    		  $("#home-box4").css('display','none');
    	  });
    	  $(".menu-box5").click(function(){
    		  $("#home-box4").css('display','block');
    		  $("#home-box2").css('display','none');
    		  $("#home-box3").css('display','none');
    		  $("#home-box1").css('display','none');
    	  });
    	  
    	  
          //포스팅 모달창
          $("#modal-btn ").click(function() {
            $("#post-box").css('display','block');
            $("#background_btm").css('display','block');
          });

          //댓글 모달창
          $(".fa-solid.fa-message").click(function() {
        	var bno = $(this).parent().parent().parent().parent().parent().attr("bno");
  /*       	alert('bno : ' + bno); */
        	$("#hidden_bno").val(bno);
            $(".comm-box").css('display','block');
            $("#background_btm").css('display','block');
          });
          
         
         
          //좋아요 기능
          $(".fa-solid.fa-heart,.fa-regular.fa-heart").click(function() {
			alert("좋아요기능 들어옴");
        	var bno = $(this).parent().parent().parent().parent().parent().attr("bno");
        	alert('bno : ' + bno + "loginID가 안나와...");
        	
        	alert("loginID : " + loginID);
        
         	
        	$.ajax({
				type:'get',
				url:'../LikeManageServlet',
				data:{"postID": bno , "loginId": loginID},
				datatype:"json",
				success:function(jsonObj){
					alert("좋아요가 반영됨! -> jsonObj.like=" + jsonObj.like );
					/* 빈 하트이면 채운하트로 채운하트이면 빈하트로*/
					
					$(".article-box").each(function(index, item) {
						if($(item).attr('bno')==bno) {
							alert("찾음!");
							if(jsonObj.like==1) {
								$(item).find(".div_bottombar").find('.fa-regular.fa-heart').attr('class','fa-solid fa-heart');
								var cnt = Number($(item).find(".div_bottombar").find('.heart_count').text());
								$(item).find(".div_bottombar").find('.heart_count').text(cnt+1);
							} else if(jsonObj.like==-1) {
								$(item).find(".div_bottombar").find('.fa-solid.fa-heart').attr('class','fa-regular fa-heart');
								var cnt = Number($(item).find(".div_bottombar").find('.heart_count').text());
								$(item).find(".div_bottombar").find('.heart_count').text(cnt-1);
							}
						}
					});
				},				
				error:function(r,s,e){
					alert("좋아요error");
				}
			});  
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
            alert("댓글작성 성공!")
            modalClose();
          });
          
        //프로필 설정 모달창 띄우기
          $(".profile-settingButton").click(function() {
            $("#p-box1").css('display','block');
            $("#background_btm").css('display','block');
          });

          //넘어가기 누르면 이전화면 none다음화면 block
          $("#pb-button1").click(function() {
            $("#p-box1").css('display','none');
            $("#p-box2").css('display','block');
            $("#background_btm").css('display','block');
          });
          $("#pb-button2").click(function() {
            $("#p-box2").css('display','none');
            $("#p-box3").css('display','block');
            $("#background_btm").css('display','block');
          });
          $("#pb-button3").click(function() {
            $("#p-box3").css('display','none');
            $("#p-box4").css('display','block');
            $("#background_btm").css('display','block');
          });

          //프로필 업데이트 완료
          $("#update-btn").click(function(){
              alert("프로필 설정 완료!")
              modalClose();
            });
          
          
          //모달 외 화면을 눌러 모달창 닫기
          $("#background_btm").click(function() {
            modalClose();   
          });

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
          
        //영화/시리즈 순위보기
		$(".movieRank ").click(function() {
			$(".movie_rank").css('display','block');
			$(".series_rank").css('display','none');
		});
         
		$(".seriesRank ").click(function() {
			$(".movie_rank").css('display','none');
			$(".series_rank").css('display','block');
		}); 
		
/*		
		 //Notion page 알림 모달창
      $(".article-box.menuButton").click(function() {
			alert("!!");
        $("#background_btm").css('display','block'); 
        $("#article-box").css('display','block'); 
      });
          */
       
          /* $(".trend-box").click(function() {
            var str = $(this).find(".trendspan").text();   
            $(".search-bar > div > input[type='text']").val(str);
          }); */
          

          
        });   

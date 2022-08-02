<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	 <!-- <link rel="stylesheet" href="../css/p01.account.css"/> -->
	<script src="https://kit.fontawesome.com/e7325946e1.js" crossorigin="anonymous"></script>
<%@ page import="com.sns.dao.*"%>
<%@ page import="com.sns.dto.*"%>
<%@ page import="java.util.*"%>

<title>프로필관리</title>
<script src="../js/jquery-3.6.0.min.js"></script>
</head>
<style>

body {
    background-color: #141414;
    margin: 0;
}


.top-bar {
    position: fixed;
    padding: 0 22px;
    top: 0;
    left: 0;
    right: 0;
    z-index: 20;
    width: 100%;
    background-image: linear-gradient(to bottom, rgba(0,0,0,0.7) 10%, rgba(0,0,0,0));/*탑바 그라데이션*/
    height: 68px;
}


.logo {
    position: absolute;
    left: 45px;
    top: 0;
    text-decoration: none;
    padding: 18px 0;
    font-size: 32px;
    display: inline-block;
    vertical-align: middle;
    cursor: pointer;
    width: 120px;
    height: 32px;
}

.svg--netflix-logo {
    fill: #e50914;
}




.pinning-header .main-header .logo {
    font-size: 25px;
}

.pinning-header .main-header .logo {
    text-decoration: none;
    /* font-size: 1.8em; */
    color: #E50914;
    display: inline-block;
    vertical-align: middle;
    cursor: pointer;
    /* margin-right: 5px; */
}



/*------------------------------------------------------*/

.profile-gate-label {
    /*프로필 관리 텍스트*/
    width: 100%;
    color: #fff;
    font-size: 3.5vw;
    font-weight: unset;
    text-align: center;
    /* position: absolute; */
    /* top: 237px; */
    display: block;


}

/* .list-profiles .choose-profile {
    margin: 2em 0;
    
} */


.choose-profile {
    margin: 2em 0;
    opacity: 1;
    transition: opacity 400ms ease-out;
    /* position: absolute; */
    /* left: 453px; */
    /* width: 100%; */
    /* display: inline; */
    /* display: flex;
    text-align: center; */


}
.profile-icon {
    filter: brightness(50%);
    
  }

.svg-edit-overlay:hover {
    border: 2px solid gray;
    border-radius: 4px;
    
} 

.profile-edit-mode:hover{
    object-fit:cover;     
    transform:scale(1.4);        
    transition: 0.2s; 
  
}



.profile .profile-icon:hover{
    border: 2px solid #fff;
    border-radius: 4px;
    transform: scale(1.2);
    transition: all 0.2s linear;
}

image:hover {
    transform: scale(1.2);
    transition: all 0.2s linear;
}




.list-profiles {
    max-width: 80%;
    
}


.profiles-gate-container .centered-div {
    z-index: 100;
    position: absolute;
    top: -104px;
    left: 0;
    right: 0;
    bottom: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.profiles-gate-container li.profile {
    width: 10vw;
    max-width: 200px;
    min-width: 84px;
}

.list-profiles .choose-profile {
    margin: 2em 0;
}

.profiles-gate-container ul {
    padding: 0;
}

.profile .profile-icon {
    height: 10vw;
    width: 10vw;
    max-height: 200px;
    max-width: 200px;
    min-height: 84px;
    min-width: 84px;
    box-sizing: border-box;
    position: relative;
    text-decoration: none;
    background-repeat: no-repeat;
    background-size: cover;
    background-color: #333;
    border-radius: 4px;
    border: none;
    margin-right: 20px;

}

.list-profiles .avatar-wrapper {
    position: relative;
}

.list-profiles .svg-edit-overlay {
    /*솔드아웃 ,크림 프로필 연필아이콘*/
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    color: #fff;
    display: flex;
    -webkit-box-align: center;
    align-items: center;
    -webkit-box-pack: center;
    justify-content: center;
}

.list-profiles .svg-edit-overlay .svg-icon-edit {
    width: 3rem;
    height: 3rem;
    max-width: 70px;
    max-height: 70px;
}

.profiles-gate-container .profile-name {
    line-height: 1.2em;
    min-height: 1.8em;
    color: #808080;
    display: block;
    text-align: center;
    font-size: 1.3vw;
    margin: 0.6em 0;
    text-overflow: ellipsis;
    overflow: hidden;
    
}

a {
    text-decoration: none;
    cursor: pointer;
    color: #fff;
}

.profiles-gate-container .addProfileIcon {
    font-size: 5vw;
    color: #808080;
    text-align: center;
    text-decoration: none;
    height: 10vw;
    width: 10vw;
    max-height: 200px;
    max-width: 200px;
    min-height: 84px;
    min-width: 84px;
    display: flex;
    align-items: center;
    justify-content: center;
}

li {
    float: left;
    margin-right: 25px;
    list-style: none;

}

.profile-button.preferred-action {
    background: #fff;
    color: #000;
    border: 1px solid #fff;
    font-weight: bold;
}

.profile-button {
    display: block;
    margin: 2em 0 1em 0;
    font-size: 1.2vw;
    border: 1px solid #808080;
    color: #808080;
    padding: 0.5em 1.5em;
    letter-spacing: 2px;
    cursor: pointer;
    background-color: transparent;
    text-decoration:none;
}
.profile-button:hover{
    transform:scale(1.1);        
    transition: 0.2s;
    
}
</style>
<body>
    <div class="hearder-top">
        <div class="top-bar">
            <div class="logo" float:left>
                <a href="">
                    <svg viewBox="0 0 111 30" class="svg--netflix-logo" aria-hidden="true" focusable="false">
                        <g id="netflix-logo">
                            <path
                                d="M105.06233,14.2806261 L110.999156,30 C109.249227,29.7497422 107.500234,29.4366857 105.718437,29.1554972 L102.374168,20.4686475 L98.9371075,28.4375293 C97.2499766,28.1563408 95.5928391,28.061674 93.9057081,27.8432843 L99.9372012,14.0931671 L94.4680851,-5.68434189e-14 L99.5313525,-5.68434189e-14 L102.593495,7.87421502 L105.874965,-5.68434189e-14 L110.999156,-5.68434189e-14 L105.06233,14.2806261 Z M90.4686475,-5.68434189e-14 L85.8749649,-5.68434189e-14 L85.8749649,27.2499766 C87.3746368,27.3437061 88.9371075,27.4055675 90.4686475,27.5930265 L90.4686475,-5.68434189e-14 Z M81.9055207,26.93692 C77.7186241,26.6557316 73.5307901,26.4064111 69.250164,26.3117443 L69.250164,-5.68434189e-14 L73.9366389,-5.68434189e-14 L73.9366389,21.8745899 C76.6248008,21.9373887 79.3120255,22.1557784 81.9055207,22.2804387 L81.9055207,26.93692 Z M64.2496954,10.6561065 L64.2496954,15.3435186 L57.8442216,15.3435186 L57.8442216,25.9996251 L53.2186709,25.9996251 L53.2186709,-5.68434189e-14 L66.3436123,-5.68434189e-14 L66.3436123,4.68741213 L57.8442216,4.68741213 L57.8442216,10.6561065 L64.2496954,10.6561065 Z M45.3435186,4.68741213 L45.3435186,26.2498828 C43.7810479,26.2498828 42.1876465,26.2498828 40.6561065,26.3117443 L40.6561065,4.68741213 L35.8121661,4.68741213 L35.8121661,-5.68434189e-14 L50.2183897,-5.68434189e-14 L50.2183897,4.68741213 L45.3435186,4.68741213 Z M30.749836,15.5928391 C28.687787,15.5928391 26.2498828,15.5928391 24.4999531,15.6875059 L24.4999531,22.6562939 C27.2499766,22.4678976 30,22.2495079 32.7809542,22.1557784 L32.7809542,26.6557316 L19.812541,27.6876933 L19.812541,-5.68434189e-14 L32.7809542,-5.68434189e-14 L32.7809542,4.68741213 L24.4999531,4.68741213 L24.4999531,10.9991564 C26.3126816,10.9991564 29.0936358,10.9054269 30.749836,10.9054269 L30.749836,15.5928391 Z M4.78114163,12.9684132 L4.78114163,29.3429562 C3.09401069,29.5313525 1.59340144,29.7497422 0,30 L0,-5.68434189e-14 L4.4690224,-5.68434189e-14 L10.562377,17.0315868 L10.562377,-5.68434189e-14 L15.2497891,-5.68434189e-14 L15.2497891,28.061674 C13.5935889,28.3437998 11.906458,28.4375293 10.1246602,28.6868498 L4.78114163,12.9684132 Z"
                                id="Fill-14">
                            </path>
                        </g>
                    </svg>
                </a>
            </div>
		</div>
        <!--탑 바 -->
		</div><!--해더 탑-->
        <div class="pinning-header on-profiles-gate">
            <div class="pinning-header-container" style="top: 0px;position: relative;background: transparent;">
                <div class="main-header on-profiles-gate menu-navigation" role="navigation">
                    <a aria-label="넷플릭스" class="logo icon-logoUpdate" href="/browse">
                    </a>
                </div>
            </div>
        </div>

    <div class="profiles-gate-container">
		<div class="centered-div list-profiles-container"> <!--프로필 전체 박스-->
			<div class="list-profiles">
				<h1 class="profile-gate-label">프로필 관리</h1>
				<ul class="choose-profile"> <!--프로필 이미지들 박스-->
				<% 
					int memberID = (Integer)(session.getAttribute("member_id"));
					/* int memberId = Integer.parseInt(request.getParameter("memberId")); */
					PostViewDAO postViewDao = new PostViewDAO();
					ArrayList<StartProfileDTO> pList = postViewDao.startProfile(memberID);
					 
						for(StartProfileDTO profile :pList){
							int profile_id =profile.getProfileID();
				%>
					<!-- 크림 프로필 박스-->
					<li class="profile"><div> 
							<a class="profile-link" tabindex="0" onclick="location.href='../index.jsp?profile_id=<%=profile_id%>'"
								data-uia="action-select-profile+primary"><div
									class="avatar-wrapper">
									<div class="profile-icon profile-edit-mode"
										data-profile-guid="LWO42JP6PFCNNFICWA6HOVA6F4"
										 style="background-image: url('../images/<%=profile.getProfileImg()%>')">
									</div>
									 <div class="svg-edit-overlay">
										<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
											xmlns="http://www.w3.org/2000/svg"
											class="svg-icon svg-icon-edit">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M22.2071 7.79285L15.2071 0.792847L13.7929 2.20706L20.7929 9.20706L22.2071 7.79285ZM13.2071 3.79285C12.8166 3.40232 12.1834 3.40232 11.7929 3.79285L2.29289 13.2928C2.10536 13.4804 2 13.7347 2 14V20C2 20.5522 2.44772 21 3 21H9C9.26522 21 9.51957 20.8946 9.70711 20.7071L19.2071 11.2071C19.5976 10.8165 19.5976 10.1834 19.2071 9.79285L13.2071 3.79285ZM17.0858 10.5L8.58579 19H4V14.4142L12.5 5.91417L17.0858 10.5Z"
												fill="currentColor"></path></svg>
									</div>
								</div>
								<span class="profile-name" ><%=profile.getNickname() %></span>
							
								</a>
								
							<div class="profile-children"></div>
						</div>
						</li>
					<%	
						
						 }
					%>
					<li class="profile">
                        <a class="link"  >
                            <div class="addProfileIcon profile-icon ">  <!--프로필 추가-->
                    <i class="fa-solid fa-circle-plus"></i>
                    </div>
                </a>
							<span class="profile-name">프로필 추가</span>
                        </li>
				</ul><!--프로필 이지미들 박스-->
			</div>
			<span data-uia="profile-button"><a href="#"
				class="profile-button preferred-action">완료</a></span>
		</div> <!--프로필 전체 박스-->
	</div>


</body>

</html>
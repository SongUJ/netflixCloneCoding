<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="css/p02.account.css">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="../js/jquery-3.6.0.min.js"></script>
    <title>프로필 변경</title>
    <script>
    $(function (){
    	$(".avatar-edit-icon").click(function (){
    		alert("준비중 입니다.");
    	});
    });
    </script>
</head>

<body>
    <div class="hearder-top">
        <div class="top-bar">
            <div class="logo" float:left>
                <a href="https://www.netflix.com/browse">
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
            <!--탑 바 -->
            <div class="pinning-header on-profiles-gate">
                <div class="pinning-header-container" style="top: 0px;position: relative;background: transparent;">
                    <div class="main-header on-profiles-gate menu-navigation" role="navigation">
                        <a aria-label="넷플릭스" class="logo icon-logoUpdate" href="/browse">
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!--넷플릭스 로고-->
        </div>


        <div class="profiles-gate-container">
            <div class="centered-div">
        
                <!--프로필변경 전체 -->
                <div class="profile-actions-container">
                    <h1>프로필 변경</h1>

                    <div class="profile-metadata profile-entry">
                        <!--보더 top,bottom-->

                        <div class="main-profile-avatar">
                            <!--프로필 이미지 -->

                            <div class="avatar-box">
                                <img src="https://occ-0-3076-993.1.nflxso.net/dnm/api/v6/K6hjPJd6cR6FpVELC5Pd6ovHRSk/AAAABcie5YsV5Mo8p4S6FjS--ksoKB32RtbqEBOefLal0UQb8X5uxOWn8Cd17fh_kH2WHu8x_s8c_f9fhysaZXDihIEdedPto4cH22vX.png?r=869"
                                    alt="" class="css-1etmbqw">
                                        <a class="avatar-edit-icon-tag" href="">
                                    <button class="avatar-edit-icon" href="" aria-label="프로필 이미지 변경" >

                                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                            xmlns="http://www.w3.org/2000/svg" class="svg-icon svg-icon-edit">
                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                            d="M22.2071 7.79285L15.2071 0.792847L13.7929 2.20706L20.7929 9.20706L22.2071 7.79285ZM13.2071 3.79285C12.8166 3.40232 12.1834 3.40232 11.7929 3.79285L2.29289 13.2928C2.10536 13.4804 2 13.7347 2 14V20C2 20.5522 2.44772 21 3 21H9C9.26522 21 9.51957 20.8946 9.70711 20.7071L19.2071 11.2071C19.5976 10.8165 19.5976 10.1834 19.2071 9.79285L13.2071 3.79285ZM17.0858 10.5L8.58579 19H4V14.4142L12.5 5.91417L17.0858 10.5Z"
                                            fill="currentColor">
                                        </path>
                                    </svg>
                            </button>
                            </a>
                            </div>
                        </div>
                        <!--프로필이미지 왼쪽 -->

                        <div class="profile-edit-parent">
                            <!--텍스트들-->
                            <div class="profile-edit-inputs">
                                <!--1-->
                                <label for="profile-name-entry" id="profile-name-entry-label" class="visually-hidden">
                                    <!--프로필 이름-->
                                </label>
                                <input type="text" class="" id="profile-name-entry"
                                    aria-labelledby="profile-name-entry-label" placeholder="이름" value="크림">



                                <div class="profile-entry-dropdowns">
                                    <div class="profileDropDown">
                                        <h2 class="profileDropDown-label" id="profileLanguageDropDown-header">언어</h2>
                                        
                                        <div class="label" role="button" aria-haspopup="true" tabindex="0"
                                        aria-expanded="false" aria-labelledby="profileLanguageDropDown-header">
                                        
                                        <div class="nfDropDown theme-lakira">  <!--언어변경-->
                                            <select class="label">
                                                <option value="korean">한국어</option>
                                                <option value="English"> English</option>
                                                <option value="日本語"> 日本語</option>
                                                <option value="中文"> 中文</option>
                                            </select>
                                                <span class="arrow"></span>
                                            </div>
                                            <!--언어변경-->
                                        </div>

                                    </div>
                                </div>
                            </div>
                            <!--텍스트들-->




                            <div class="profile-entry-restrictions">
                                <!--2-->
                                <h2 class="profile-entry-header">관람등급 설정:</h2>
                                <div>
                                    <!---->
                                    <ul>
                                        <li class="profile-maturity-label">모든 관람등급</li>
                                    </ul>
                                    <p>이 프로필에서는 <b>모든 관람등급</b>의 콘텐츠가 표시됩니다.</p>
                                </div>
                                <div><a data-uia="profile-edit-button" class="profile-button" href="#"
                                        aria-label="관람등급 설정 변경">수정</a>
                                </div>

                            </div>
                            <!--1-->


                            <div class="profile-entry-autoplay">
                                <!--3-->
                                <h2 class="profile-entry-header">자동 재생 설정</h2>
                                <div class="autoplay-option">
                                    <!--체크 1-->
                                    <input type="checkbox" id="nextEpisode-profile" checked="">
                                    <label for="nextEpisode-profile" role="checkbox" aria-checked="true"
                                        aria-labelledby="nextEpisode-marker" tabindex="0">
                                        <!--체크박스--> <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                            xmlns="http://www.w3.org/2000/svg" class="svg-icon svg-icon-check-mark">
                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                d="M8.68239 19.7312L23.6824 5.73115L22.3178 4.26904L8.02404 17.6098L2.70718 12.293L1.29297 13.7072L7.29297 19.7072C7.67401 20.0882 8.28845 20.0988 8.68239 19.7312Z"
                                                fill="currentColor">

                                            </path>
                                        </svg>
                                    </label>
                                    <span class="nextEpisode-marker" id="nextEpisode-marker">
                                        모든 디바이스에서 시리즈의 다음 화 자동 재생</span>
                                </div>
                                <!--체크1-->

                                <div class="autoplay-option">
                                    <!--체크 1-1-->
                                    <input type="checkbox" id="videomerch-profile" checked="">
                                    <label for="videomerch-profile" role="checkbox" aria-checked="true"
                                        aria-labelledby="videomerch-marker" tabindex="0">
                                        <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                            xmlns="http://www.w3.org/2000/svg" class="svg-icon svg-icon-check-mark">
                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                d="M8.68239 19.7312L23.6824 5.73115L22.3178 4.26904L8.02404 17.6098L2.70718 12.293L1.29297 13.7072L7.29297 19.7072C7.67401 20.0882 8.28845 20.0988 8.68239 19.7312Z"
                                                fill="currentColor">

                                            </path>
                                        </svg>
                                    </label>
                                    <span class="videomerch-marker" id="videomerch-marker">모든 디바이스에서 탐색 중 미리보기 자동 재생</span>
                                </div>
                                <!--체크1-1-->
                            </div>
                            <!--3-->
                        </div>
                        <!--2-->
                    </div>
                    <!--프로필 변경 텍스트-->


                    <a href="p01.account.jsp">
                        <button  class="profile-button preferred-action">저장</button>
                        <button  class="profile-button">취소</button>
                    </a>
                </div>
                <!--프로필변경 전체-->
            </div>
            <!--보더 top,bottom-->
        </div>

</body>

</html>
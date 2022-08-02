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
$(function (){
	$('#loading > span').text((++cnt) + '/' + '10');
	$('#app > #loading').css({display: 'flex'});

	$('#loading > span').empty();
	$('#app > #loading').css({display: 'none'});
	
	const movieItemArray = new Array(10);
	const deferreds = new Array(10);
	/* .. something .. */
	$.when.apply(this, deferreds).done(() => {
	   $('#loading > span').empty();
	   movieItemArray.forEach((item, idx) => {
	       $('.movieItems').append(item);
	   });
	   // last-callback
	   if (callback) callback();
	});
	
	const jqxhr = $.ajax({
        url: 'http://ync.jupiterflow.com/jquery/searchMovieInfo' +
            `?key=${serviceKey}` +
            `&movieCd=${movieCd}`,
        type: 'get',
        dataType: 'xml'
    }).then((data) => {
        const renderData = {
            movieCd: movieCd,
            movieNm: $(data).find('movieNm').text(),
            movieNmEn: $(data).find('movieNmEn').text(),
            showTm: $(data).find('showTm').text(),
            openDt: $(data).find('openDt').text().replace(/(\d{4})(\d{2})(\d{2})/g, '$1년 $2월 $3일'),
            nations: [],
            genres: [],
            directors: [],
            imgsrc: $(data).find('imgSrc').text(),
            naverMovieSrc: $(data).find('naverMovieSrc').text()
        };
    /* .. something .. */
    // Mustache 탬플릿을 이용해 HTML 렌더링한 결과를 영화 목록 배열에 순위에 맞게끔 저장
    movieItemArray[idx] = Mustache.render(movieItem, renderData);
    });
	/* .. something .. */
	$.when.apply(this, deferreds).done(() => {
	/* .. */
	// 영화 목록 배열(movieArray)을 바탕으로 순차적으로 append(출력)
	movieItemArray.forEach((item, idx) => {
	$('.movieItems').append(item);
	});
	/* .. */
	});
});
</script>
</head>
<body>
<div id="loading"><img src="static/images/loading.svg"><span></span></div>
</body>
</html>
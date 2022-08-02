$(function () {
    $("#profile_0 > .profile-header").click(function () {
        if($("#profile_0 > .profile-links").css('display')=='block') {
	        $("#profile_0 > .profile-links").slideUp(500);
	        $("#profile_0 button > svg").css('transform', 'rotate(0deg)');
        } else {
        	$("#profile_0 > .profile-links").slideDown(500);
	        $("#profile_0 button > svg").css('transform', 'rotate(180deg)');
        }
    });
    $("#profile_1 > .profile-header").click(function () {
        if($("#profile_1 > .profile-links").css('display')=='block') {
	        $("#profile_1 > .profile-links").slideUp(500);
	        $("#profile_1 button > svg").css('transform', 'rotate(0deg)');
        } else {
        	$("#profile_1 > .profile-links").slideDown(500);
	        $("#profile_1 button > svg").css('transform', 'rotate(180deg)');
        }
    });

	//드롭다운
//	$(".current-profile").mouseenter(function() {
//		//$(".profiles-container").css("display", "block");
//		$(".profiles-container").slideDown(400);
//		$(".current-profile .trigger").show();
//		//var idx = $(this).index();
//		//if ($(".profiles-container").is(":visible")) {
//		//if ($(".profiles-container").css("display")!="none") {
//		//	$(".profiles-container").css("display", "none");
//		//} else {
//		//	$(".profiles-container").css("display", "block");
//		//}
//	});
//	$(".profiles-container").mouseleave(function() {
//		$(".profiles-container").slideUp(200);
//		$(".current-profile .trigger").hide();
//	});
	
	
});

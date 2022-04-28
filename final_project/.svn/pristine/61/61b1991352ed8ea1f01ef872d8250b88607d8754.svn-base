<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<style>
.clock {
    color: #2daab8;
    font-size: 50px;
    letter-spacing: 3px;
}
</style>

<script>

$(function(){
	showTime();
	
	function showTime(){
	    var date = new Date();
	    var h = date.getHours(); // 0 - 23
	    var m = date.getMinutes(); // 0 - 59
	    var s = date.getSeconds(); // 0 - 59
	    var session = "AM";
	    
	    if(h == 0){
	        h = 12;
	    }
	    
	    if(h > 12){
	        h = h - 12;
	        session = "PM";
	    }
	    
	    h = (h < 10) ? "0" + h : h;
	    m = (m < 10) ? "0" + m : m;
	    s = (s < 10) ? "0" + s : s;
	    
	    var time = h + ":" + m + ":" + s + " " + session;
	    document.getElementById("MyClockDisplay").innerText = time;
	    document.getElementById("MyClockDisplay").textContent = time;
	    
	    setTimeout(showTime, 1000);
	}
	
	$.ajax({
		url:"/rsvToday",
		method: "post",
		data: {empCd:"${loginUser.empCd}"},
		dataType:"html",
		traditional:"true",
		beforeSend: function (jqXHR, settings) {
			/* ajax 사용시 헤더에 스프링시큐리티 토큰 설정 */
			var token = '${_csrf.token}'
			var header = '${_csrf.headerName}'
			jqXHR.setRequestHeader(header, token);
		},
		success: function(res) {
			var html = $("<div>").html(res);
			var contents = html.find("div#ajaxData").html();
			$("#rsvToday").html(contents);
		}
	});
	
})
</script>

<style>
.main_content_iner{
	background-image: url("/resources/upload/main.jpg");
	background-size: cover;
}
.timeBox{
	display: inline-block;
	float: left;
	margin: 10px;
}
.nameBox{
	display: inline-block;
	float: right;
	margin-top: 43px;
	margin-right: 20px;
}
.rsvToday{
	display: block;
	clear: both;
	float:right;
	margin: 15px;
	height: 300px;
	overflow: auto;
}
#tbl{
	width: 100%;
}
#tbl th, #tbl td{
	text-align: center;
}
</style>

<!-- 본문 컨텐츠 시작 -->
<div class="main_content_iner">
	<div class="container-fluid p-0">
	
		<div class="timeBox">
			<h2>${serverTime}</h2>
			<div id="MyClockDisplay" class="clock"></div>
		</div>
		<sec:authorize access='hasAnyRole("ROLE_DOCTOR","ROLE_NURSE","ROLE_ENGI","ROLE_WONMU")'>
		<div class="nameBox">
			<h2 class="nameText" align="right">${loginUser.empNm}님</h2>
			<h3 class="nameText" align="right">오늘도 환자를 위해 힘써주세요</h3>
		</div>
		</sec:authorize>
		<sec:authorize access='hasRole("ROLE_ADMIN")'>
		<div class="nameBox">
			<h2 class="nameText" align="right">${loginUser.empNm} 모드</h2>
		</div>
		</sec:authorize>
		<sec:authorize access='hasRole("ROLE_DOCTOR")'>
		<div class="rsvToday">
			<h2>금일 예약 명단</h2>
			<div id="rsvToday">
			
			</div>
		</div>
		</sec:authorize>
		
	</div>
</div>


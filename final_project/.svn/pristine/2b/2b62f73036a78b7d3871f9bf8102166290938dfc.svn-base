<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="/resources/js/chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet" href="/resources/css/yearpicker.css">
<script src="/resources/js/yearpicker.js"></script>




<style>
input[type="date"]::-webkit-calendar-picker-indicator { 

background-image: url("../resources/img/calendar-icon.png");
} 

.weekCanvas{
	height: 400px;
}

.white_box{
	height: 95%;
}

#yearChart{
	margin-top: 10%;
}

.ui-datepicker table{
    display: none;
}

.nav-item{
width: 5%;
font-weight: bold;

}
</style>
<h2>통계</h2>
<ul class="nav nav-tabs">
  <li class="nav-item">
	<a class="nav-link active stats navBtn" id="patientBtn" aria-current="page" href="#">환자</a>    
  </li>
  <li class="nav-item">
    <a class="nav-link active stats navBtn" id="salesBtn" aria-current="page" href="#">매출</a>
  </li>
  <li class="nav-item">
    <a class="nav-link active stats navBtn" id="diseaseBtn" aria-current="page" href="#">기타</a>
  </li>
<!--   <li class="nav-item"> -->
<!--     <a class="nav-link active stats navBtn" id="symptomBtn" aria-current="page" href="#">증상</a> -->
<!--   </li> -->
 </ul>
 
<input id="todayPntCnt" value="${statsVO.pntCnt}" hidden="true"/>

<div class="row">

<div class="col-12 includeJSP" id="patientJSP">
<jsp:include page="patient.jsp" flush="true"/>
</div>
<div class="col-12 includeJSP" id="salesJSP" style="display: none;">
<jsp:include page="sales.jsp" flush="true"/>
</div>
<div class="col-12 includeJSP" id="diseaseJSP" style="display: none;">
<jsp:include page="disease.jsp" flush="true"/>
</div>
<div class="col-12 includeJSP" id="symptomJSP" style="display: none;">
<jsp:include page="symptom.jsp" flush="true"/>
</div>
	
</div>


<script>
//실행되면 nav버튼 클릭되어있고, 환자차트 화면 나오게
$('.navBtn').css('background', 'white');
$('#patientBtn').css('background', '#f5dcf7');
var ct_todayChart = document.getElementById('todayChart').getContext('2d');
var ct_weekChart = document.getElementById('weekChart').getContext('2d');
var ct_monthChart = document.getElementById('monthChart').getContext('2d');
var ct_yearChart = document.getElementById('yearChart').getContext('2d');
var ct_todaySales = document.getElementById('todaySales').getContext('2d');
var ct_weekSales = document.getElementById('weekSales').getContext('2d');
var ct_monthSales = document.getElementById('monthSales').getContext('2d');
var ct_yearSales = document.getElementById('yearSales').getContext('2d');
var ct_mainDisease = document.getElementById('mainDisease').getContext('2d');
var ct_docterSales = document.getElementById('docterSales').getContext('2d');

dayChart_m(ct_todayChart);
weekChart_m(ct_weekChart);
monthChart_m(ct_monthChart);
yearChart_m(ct_yearChart);

var selectDate;
var sec1,sec2,sec3;
var amount = [];
var secAmount = [];

//금일 부서별 환자 수
function dayChart_m(ct_m,sec){
	if(!sec){
		sec1 = ${todaydeptVO.sec1};
		sec2 = ${todaydeptVO.sec2};
		sec3 = ${todaydeptVO.sec3};
	}else{
		sec1 = sec[0];
		sec2 = sec[1];
		sec3 = sec[2];
	}
	var todayChart = new Chart(ct_m, {
	    type: 'horizontalBar',
	    data: {
	        labels: ["내과", "외과", "정형외과"], 
	        datasets: [{
	            label: '# of Votes',
	            data: [sec1,sec2,sec3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
};

//최근 일주일 환자 수
function weekChart_m(ct_w,amount){
	var todayPntCnt = $('#todayPntCnt').val();
	var today_pnt, dayAgo1_pnt, dayAgo2_pnt, dayAgo3_pnt, dayAgo4_pnt, dayAgo5_pnt, dayAgo6_pnt;
	
	var week = [${week}];
	var today = ${today};
	
	if(!amount){
		today_pnt = ${statsVO.today};
		dayAgo1_pnt = ${statsVO.dayAgo1};
		dayAgo2_pnt = ${statsVO.dayAgo2};
		dayAgo3_pnt = ${statsVO.dayAgo3};
		dayAgo4_pnt = ${statsVO.dayAgo4};
		dayAgo5_pnt = ${statsVO.dayAgo5};
		dayAgo6_pnt = ${statsVO.dayAgo6};
	}else{
		today_pnt = amount[0];
		dayAgo1_pnt = amount[1];
		dayAgo2_pnt = amount[2];
		dayAgo3_pnt = amount[3];
		dayAgo4_pnt = amount[4];
		dayAgo5_pnt = amount[5];
		dayAgo6_pnt = amount[6];
	}
var weekChart = new Chart(ct_w, {
    type: 'bar',
    data: {
        labels: ["오늘", week[0][0], week[0][1], week[0][2],week[0][3],week[0][4],week[0][5]], //월화수목금토일
        datasets: [{
            label: '# of Votes',
            data: [today_pnt, dayAgo1_pnt, dayAgo2_pnt, dayAgo3_pnt, dayAgo4_pnt, dayAgo5_pnt, dayAgo6_pnt],
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
};	

// 월별 환자 수
function monthChart_m(ct_m,secAmount){
	if(!secAmount){
		 sec1 = ${monthVO.sec1};
		 sec2 = ${monthVO.sec2};
		 sec3 = ${monthVO.sec3};
	}else{
		sec1 = secAmount[0];
		sec2 = secAmount[1];
		sec3 = secAmount[2];
	}
	
	var monthChart = new Chart(ct_m, {
	    type: 'pie',
	    data: {
	        labels: ["내과", "외과", "정형외과"],
	        datasets: [{
	            label: '# of Votes',
	            data: [sec1,sec2,sec3],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
};  


// 연간 환자 수
function yearChart_m(ct_m, res){
	var year = [];
	var cnt = [];
	var yearMap = JSON.parse('${yearMap}');
	
   if(res != 'undefined' && res != null) {
	   for(var i = 0; i < res.length; i++){
			year.push(res[i].년도);
			cnt.push(res[i].결과);
			}
	   }else{
		for(var i = 0; i < yearMap.length; i++){
			year.push(yearMap[i].년도);
			cnt.push(yearMap[i].결과);
			}
	   }
	var yearChart = new Chart(ct_m, {
	    type: 'line',
	    data: {
	        labels: [year[0], year[1], year[2], year[3], year[4]], 
	        datasets: [{
	            label: '# of Votes',
	            data: [cnt[0], cnt[1], cnt[2], cnt[3], cnt[4]],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
}

function selectMonth(p){
	secAmount = [];
	if(p.id == "selectMonthSales"){
		selectDate = p.value.replaceAll("-", "");
		data = {};
		data["selectDate"] = selectDate;
		$.ajax({
			url:"/stats/monthAmount",
			data: data,
			method:"get",
			dataType:"json",
			success: function(res){
				secAmount.push(res.sec1);
				secAmount.push(res.sec2);
				secAmount.push(res.sec3);

				monthChart_m(ct_monthSales,secAmount);
			}
		});
	}else{
	selectDate = p.value.replaceAll("-", "");
	data= {};
	data["selectDate"] = selectDate;
	
	$.ajax({
		url:"/stats/month",
		data: data,
		method:"get",
		dataType:"json",
		success: function(res){
			sec1 = res.sec1;
			sec2 = res.sec2;
			sec3 = res.sec3;
			// 월별 환자 수
			var ct_m = document.getElementById('monthChart').getContext('2d');
			var monthChart = new Chart(ct_m, {
			    type: 'pie',
			    data: {
			        labels: ["내과", "외과", "정형외과"], //월화수목금토일
			        datasets: [{
			            label: '# of Votes',
			            data: [sec1,sec2,sec3],
			            backgroundColor: [
			                'rgba(255, 99, 132, 0.2)',
			                'rgba(54, 162, 235, 0.2)',
			                'rgba(255, 206, 86, 0.2)',
			                'rgba(75, 192, 192, 0.2)',
			                'rgba(153, 102, 255, 0.2)',
			                'rgba(255, 159, 64, 0.2)'
			            ],
			            borderColor: [
			                'rgba(255, 99, 132, 1)',
			                'rgba(54, 162, 235, 1)',
			                'rgba(255, 206, 86, 1)',
			                'rgba(75, 192, 192, 1)',
			                'rgba(153, 102, 255, 1)',
			                'rgba(255, 159, 64, 1)'
			            ],
			            borderWidth: 1
			        }]
			    },
			    options: {
			        scales: {
			            yAxes: [{
			                ticks: {
			                    beginAtZero: true
			                }
			            }]
			        }
			    }
			});
		}
	});
  }
}

function yearChartM_m(ct_m, res){
	// 월별 통계
	var yearChart = new Chart(ct_m, {
	    type: 'bar',
	    data: {
	        labels: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"], 
	        datasets: [{
	            label: '# of Votes',
	            data: [res["1월"],res["2월"],res["3월"],res["4월"],res["5월"],res["6월"],res["7월"],res["8월"],res["9월"],res["10월"],res["11월"],res["12월"]],
	            backgroundColor: [
	                'rgba(255, 99, 132, 0.2)',
	                'rgba(54, 162, 235, 0.2)',
	                'rgba(255, 206, 86, 0.2)',
	                'rgba(75, 192, 192, 0.2)',
	                'rgba(153, 102, 255, 0.2)',
	                'rgba(255, 159, 64, 0.2)'
	            ],
	            borderColor: [
	                'rgba(255, 99, 132, 1)',
	                'rgba(54, 162, 235, 1)',
	                'rgba(255, 206, 86, 1)',
	                'rgba(75, 192, 192, 1)',
	                'rgba(153, 102, 255, 1)',
	                'rgba(255, 159, 64, 1)'
	            ],
	            borderWidth: 1
	        }]
	    },
	    options: {
	        scales: {
	            yAxes: [{
	                ticks: {
	                    beginAtZero: true
	                }
	            }]
	        }
	    }
	});
};

$(function(){
	
	// 환자버튼 클릭하면 nav버튼 클릭되어있고, 환자차트 화면 나오게
	$('#patientBtn').on("click", function(){
		$('.navBtn').css('background', 'white');
		$('#patientBtn').css('background', '#f5dcf7');
		$('.includeJSP').css('display','none');
		$('#patientJSP').css('display','block');
		
		$('.sDate').val("");
		$('.eDate').val("");
		
		dayChart_m(ct_todayChart);
		weekChart_m(ct_weekChart);
		monthChart_m(ct_monthChart);
	});
	
	//매출탭 클릭 시 
	$('#salesBtn').on("click", function(){
		$('.navBtn').css('background', 'white');
		$('#salesBtn').css('background', '#f5dcf7');
		$('.includeJSP').css('display','none');
		$('#salesJSP').css('display','block');
		
		$('.sDate').val("");
		$('.eDate').val("");
		
		sec = [];
		$.ajax({
			url:"/stats/deptAmount",
// 			data: data,
			method:"get",
			dataType:"json",
			success: function(res){
				sec.push(res.sec1);
				sec.push(res.sec2);
				sec.push(res.sec3);
				dayChart_m(ct_todaySales,sec);
			}
		});
		
		$.ajax({
			url:"/stats/weekAmount",
// 			data: data,
			method:"get",
			dataType:"json",
			success: function(res){
				amount.push(res.today);
				amount.push(res.dayAgo1);
				amount.push(res.dayAgo2);
				amount.push(res.dayAgo3);
				amount.push(res.dayAgo4);
				amount.push(res.dayAgo5);
				amount.push(res.dayAgo6);
				
				weekChart_m(ct_weekSales,amount);
			}
		});
		
		$.ajax({
			url:"/stats/monthAmount",
// 			data: data,
			method:"get",
			dataType:"json",
			success: function(res){
				secAmount.push(res.sec1);
				secAmount.push(res.sec2);
				secAmount.push(res.sec3);

				monthChart_m(ct_monthSales,secAmount);
			}
		});
		
// 		$.ajax({
// 			url:"/stats/yearAmount",
// 			data: data,
// 			method:"get",
// 			dataType:"json",
// 			success: function(res){
// 				yearChart_m(ct_yearSales, res);
// 			}
// 		});
		
		$.ajax({
			url:"/stats/selectYearSales",
// 			data: data,
			method:"get",
			dataType:"json",
			success: function(res){
				result = JSON.parse(res);
				yearChart_m(ct_yearSales, result);
			}
		})
	});
	
	// 질병탭 클릭 시
	$('#diseaseBtn').on("click", function(){
		$('.navBtn').css('background', 'white');
		$('#diseaseBtn').css('background', '#f5dcf7');
		$('.includeJSP').css('display','none');
		$('#diseaseJSP').css('display','block');
		
		$('.sDate').val("");
		$('.eDate').val("");
		
		$.ajax({
			url:"/stats/selectDiseaseRank",
// 			data:data,
			method:"get",
			dataType:"json",
			success: function(res){
				data = JSON.parse(res);
				length = Object.keys(data[0]).length;
// 				length = data[0].length;
				
				disNm = [];
				disSum = [];
		    		for(var i = 0; i < length; i++){
		    			disNm.push(data[i].질병명);
			    		disSum.push(data[i].합계);
			    	}
	    		var ct_mainDisease = document.getElementById('mainDisease').getContext('2d');
				var diseaseChart = new Chart(ct_mainDisease, {
				    type: 'bar',
				    data: {
// 				        labels: ["내과", "외과", "정형외과"], 
				        labels: disNm, 
				        datasets: [{
				            label: '# of Votes',
// 				            data: [1,2,3],
				            data: disSum,
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)',
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				        scales: {
				            yAxes: [{
				                ticks: {
				                    beginAtZero: true
				                }
				            }]
				        }
				    }
				});
			}
		})
	});
	
	$('#symptomBtn').on("click", function(){
		$('.navBtn').css('background', 'white');
		$('#symptomBtn').css('background', '#f5dcf7');
		$('.includeJSP').css('display','none');
		$('#symptomJSP').css('display','block');
	});
	$('.yearpicker').yearpicker();	
	
	
	$('#selectMonth').val(new Date().toISOString().slice(0, 7));
	$('#selectMonthSales').val(new Date().toISOString().slice(0, 7));
	$('#selectYear').val("년도 선택");
	$('#selectYearSales').val("년도 선택");
	
	
	// 연도선택 버튼 클릭 시
	$('.yearpicker').on('change',function(){
		// 매출탭에서 연도 선택 시 매출 통계
		if(this.id == "selectYearSales"){
			var selectYear = $(this).val();
			data= {};
			data["selectYear"] = selectYear;
			
			$.ajax({
				url:"/stats/yearAmount",
				data: data,
				method:"get",
				dataType:"json",
				success: function(res){
					yearChartM_m(ct_yearSales,res);
				}
			});
			
		}else{
			// 기본은 환자 연간 통계 차트에 출력
		var selectYear = $(this).val();
		data= {};
		data["selectYear"] = selectYear;
		
		$.ajax({
			url:"/stats/year",
			data: data,
			method:"get",
			dataType:"json",
			success: function(res){
				yearChartM_m(ct_yearChart,res);
			}
		  });
		};
	});
	
	// 검색 시작기간과 종료기간을 선택했을 시 
	$('.eDate').on('change', function(){
		sdate = $(this).siblings('.sDate').val();
		edate = $(this).val();
		id = $(this).attr('id');
		data = {};
			data["startDate"] = sdate.replaceAll("-", "");
			data["endDate"] = edate.replaceAll("-", "");
		if(sdate > edate){
			alert("종료일은 시작일 이후여야 합니다.다시 선택 해주세요.")
			$(this).val("");
		}
		// 질병탭에서 기간을 선택했을 경우
		if(id == "diseaseEdate"){
		$.ajax({
			url:"/stats/selectDiseaseRank",
			data:data,
			method:"get",
			dataType:"json",
			success: function(res){
				resData = JSON.parse(res);
				console.log(resData);
				console.log(resData.length);
				length = resData.length;
				
				disNm = [];
				disSum = [];
		    		for(var i = 0; i < length; i++){
		    			disNm.push(resData[i].질병명);
			    		disSum.push(resData[i].합계);
			    	}
	    		var ct_mainDisease = document.getElementById('mainDisease').getContext('2d');
				var diseaseChart = new Chart(ct_mainDisease, {
				    type: 'bar',
				    data: {
// 				        labels: ["내과", "외과", "정형외과"], 
				        labels: disNm, 
				        datasets: [{
				            label: '# of Votes',
// 				            data: [1,2,3],
				            data: disSum,
				            backgroundColor: [
				                'rgba(255, 99, 132, 0.2)',
				                'rgba(54, 162, 235, 0.2)',
				                'rgba(255, 206, 86, 0.2)',
				                'rgba(75, 192, 192, 0.2)',
				                'rgba(153, 102, 255, 0.2)',
				                'rgba(255, 159, 64, 0.2)'
				            ],
				            borderColor: [
				                'rgba(255, 99, 132, 1)',
				                'rgba(54, 162, 235, 1)',
				                'rgba(255, 206, 86, 1)',
				                'rgba(75, 192, 192, 1)',
				                'rgba(153, 102, 255, 1)',
				                'rgba(255, 159, 64, 1)'
				            ],
				            borderWidth: 1
				        }]
				    },
				    options: {
				        scales: {
				            yAxes: [{
				                ticks: {
				                    beginAtZero: true
				                }
				            }]
				        }
				    }
				});
			}
		})
		// 매출 탭에서 기간 선택 시
	   }else if(id == "salesEDate"){
		   sec = [];
		   $.ajax({
				url:"/stats/deptAmount",
	 			data: data,
				method:"get",
				dataType:"json",
				success: function(res){
					resData = JSON.parse(res);
					sec.push(resData.SEC1);
					sec.push(resData.SEC2);
					sec.push(resData.SEC3);
					dayChart_m(ct_todaySales,sec);
				}
			});
	   } //else if(id == "salesEDate") 끝
	   // 환자탭에서 기간 선택 시 
	   else if(id == "patientEdate"){
		   sec = [];
		   $.ajax({
				url:"/stats/selectDatePatient",
	 			data: data,
				method:"get",
				dataType:"json",
				success: function(res){
					resData = JSON.parse(res);
					sec.push(resData.SEC1);
					sec.push(resData.SEC2);
					sec.push(resData.SEC3);
					dayChart_m(ct_todayChart,sec);
				}
			});
	   }
		//기타탭에서 기간 선택 시
		else if(id == "docterEdate"){
			if($('#doctorName').text() == ""){
				alert("먼저 조회할 의사를 선택해주세요.");
				$('#docterSdate').val("");
				$('#docterEdate').val("");
			}
			data={};
			data["startDate"] = $('#docterSdate').val().replaceAll("-","");
			data["endDate"] = $('#docterEdate').val().replaceAll("-","");
			data["empCd"] = $('#doctorName').val();
			
			 $.ajax({
					url:"/stats/selectDoctorSales",
		 			data: data,
					method:"get",
					dataType:"json",
					success: function(res){
						resData = JSON.parse(res);
						amount = resData.SUM;
						
						var salesChart = new Chart(ct_docterSales, {
						    type: 'pie',
						    data: {
						        labels: ["총 매출"],
						        datasets: [{
						            label: '# of Votes',
						            data: [amount],
						            backgroundColor: [
						                'rgba(255, 99, 132, 0.2)',
						                'rgba(54, 162, 235, 0.2)',
						                'rgba(255, 206, 86, 0.2)',
						                'rgba(75, 192, 192, 0.2)',
						                'rgba(153, 102, 255, 0.2)',
						                'rgba(255, 159, 64, 0.2)'
						            ],
						            borderColor: [
						                'rgba(255, 99, 132, 1)',
						                'rgba(54, 162, 235, 1)',
						                'rgba(255, 206, 86, 1)',
						                'rgba(75, 192, 192, 1)',
						                'rgba(153, 102, 255, 1)',
						                'rgba(255, 159, 64, 1)'
						            ],
						            borderWidth: 1
						        }]
						    },
						    options: {
						        scales: {
						            yAxes: [{
						                ticks: {
						                    beginAtZero: true
						                }
						            }]
						        }
						    }
						});
					}
			 });
			
			
			
		}
	})
	
	// 의사조회 부서선택 시 
	$('#selectSec').on('change', function(){
		secCd = $(this).val();
		secName = $("#selectSec option:checked").text();
		data = {};
		
		data["secCd"]=secCd; 
		$.ajax({
			url:"/stats/selectSec",
			data:data,
			method:"get",
			dataType:"json",
			traditional:true,
			success: function(res){
				data = res;
				str = "";
				for(i = 0; i < data.length; i++){
					str += '<tr role="row" class="odd">' 
					str += '<th scope="row" tabindex="0" class="sorting_1">'+data[i].empCd+'</th>'
					str += '<td><img src="../resources/upload/empPic.'+data[i].empPic + '"</td>'
					str += '<td><button class="btn btn-outline-success selectDoctorBtn" type="button" value="'+ data[i].empCd + '">'+data[i].empNm + '</button></td>'
					str += '<td>' + data[i].secNm + '</td>'
					str += '<td>' + data[i].position + '</td>'
					str += '</tr>';
				}
				$('#doctorSales').append(str);
			}
		});		
		
		$('#exampleModalLabel').text(secName + " 직원목록");
		$('#writeModal').modal("show");
	})
	
	// 동적생성된 의사이름 버튼 클릭 시 
	$(document).on("click",".selectDoctorBtn",function(){
		
			empNm = $(this).text();
			empCd = $(this).val();
			
			$('#doctorName').text(empNm);
			$('#doctorName').val(empCd);
			$('#doctorName').attr("hidden", false);
			$('#doctorSales').empty();
			$('#writeModal').modal("hide");
	});
});


</script>
<!----------------- 직원등록  Modal 시작-------------------->
		<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="exampleModalLabel"></h2>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">
						<div id="ajaxTable">
<div class="QA_table mb_30 list" id="dept">

<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
	<table class="table lms_table_active dataTable no-footer dtr-inline" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width: 1175px;">
		<thead>
		<tr role="row">
			<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 99px;" aria-sort="ascending" aria-label="title: activate to sort column descending">사번</th>
			<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 141px;" aria-label="Category: activate to sort column ascending">  </th>
			<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 141px;" aria-label="Category: activate to sort column ascending">이름</th>
			<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 130px;" aria-label="Lesson: activate to sort column ascending">부서</th>
			<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 76px;" aria-label="Enrolled: activate to sort column ascending">직급</th>
		</tr>
		</thead>
		
		<tbody id="doctorSales">

		</tbody>
		</table>
		</div>
		</div>
		</div>
	</div>
  </div>
 </div>
</div>
<!----------------- 직원등록 Modal 끝-------------------->

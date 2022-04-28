<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/fullcalendar/main.css">
<script src="/resources/fullcalendar/main.js"></script>
<script src="/resources/fullcalendar/ko.js"></script>

<script>
var ymd;
var mySchedule;

$(function(){
	loadSchedule();
	
	$("#subBtn").on("click",function(){
		var stTime = $("#stTime").val().replaceAll(':','').replaceAll('-','').replaceAll('T','') + '00';
		var endTime = $("#endTime").val().replaceAll(':','').replaceAll('-','').replaceAll('T','') + '00';
		$("#scdStTime").val(stTime);
		$("#scdEndTime").val(endTime);
		var form1 = $("#insertSchedule").serialize();
		
		$.ajax({
			url:'/schedule/insertSchedule',
			data: form1,
			type: 'post',
			success: function(data){
				if(data > 0){
					swal('등록 완료','','success');
					fn_closeInsertModal();
					loadSchedule();
				}
			}
		})
		
	})
	
	$("#stTime").on('change',function(){
		$("#endTime").val($("#stTime").val());
	})
	
	$("#dStTime").on('change',function(){
		$("#dEndTime").val($("#dStTime").val());
	})
	
	$(".close").on('click',function(){
		fn_closeInsertModal();
		fn_closeDetailModal();
	})
	
	$(".closebtn").on('click',function(){
		fn_closeInsertModal();
		fn_closeDetailModal();
	})
	
	$("#modifyBtn").on('click',function(){
		swal({
			title: '내용을 수정 하시겠습니까?',
			icon: 'info',
			buttons: {
				confirm: {
					text: '확인',
					value: true,
					className: 'btn btn-success'
				},
				cancle: {
					text: '취소',
					value: false,
					className: 'btn btn-danger'
				}
			}
		}).then((result) => {
			if(result){
				var stTime = $("#dStTime").val().replaceAll(':','').replaceAll('-','').replaceAll('T','') + '00';
				var endTime = $("#dEndTime").val().replaceAll(':','').replaceAll('-','').replaceAll('T','') + '00';
				$("#dScdStTime").val(stTime);
				$("#dScdEndTime").val(endTime);
				var form1 = $("#modifySchedule").serialize();
				$.ajax({
					url:'/schedule/modifySchedule',
					data: form1,
					type:'post',
					success:function(data){
						if(data > 0){
							swal('수정 완료','','success');
							fn_closeDetailModal();
							loadSchedule();
						}
					}
				})
			}
		});
	})
	
	$("#deleteBtn").on('click',function(){
		swal({
			title: '일정을 삭제 하시겠습니까?',
			icon: 'info',
			buttons: {
				confirm: {
					text: '확인',
					value: true,
					className: 'btn btn-success'
				},
				cancle: {
					text: '취소',
					value: false,
					className: 'btn btn-danger'
				}
			}
		}).then((result) => {
			if(result){
				var form1 = $("#modifySchedule").serialize();
				$.ajax({
					url:'/schedule/deleteSchedule',
					data: form1,
					type:'post',
					success:function(data){
						if(data > 0){
							swal('삭제 완료','','success');
							fn_closeDetailModal();
							loadSchedule();
						}
					}
				})
			}
		})
	})
	
	function loadSchedule(){
		var events;
		$.ajax({
			url:'/schedule/viewSchedule',
			data:{empCd:"${loginUser.empCd}"},
			type:'post',
			beforeSend: function (jqXHR, settings) {
				/* ajax 사용시 헤더에 스프링시큐리티 토큰 설정 */
				var token = '${_csrf.token}'
				var header = '${_csrf.headerName}'
				jqXHR.setRequestHeader(header, token);
			},
			async:false,
			success:function(data){
				myschedule = data;
				events = data.map(function(obj){
					return{
						title: obj.scdNm + "_" + obj.scdNo,
						start: obj.scdStTime.substring(0,8) + "T" + obj.scdStTime.substring(8),
						end	 : obj.scdEndTime.substring(0,8) + "T" + obj.scdEndTime.substring(8),
					}
				})
			}
		})
		
	    var calendarEl = document.getElementById('calendar');
	    var calendar = new FullCalendar.Calendar(calendarEl, {
	      headerToolbar:{
	    	start:'prevYear prev next nextYear',
	    	center:'title',
	    	end:'today'
	      },
	      buttonText:{
	    	  today:'오늘',
	    	  prev:'이전달',
	    	  next:'다음달',
	    	  prevYear:'작년',
	    	  nextYear:'내년',
	    	  month:'월',
	    	  day:'일'
	      },
	      selectable:true,
	      dateClick:function(info){
//	     	  ymd = info.date.toLocaleDateString().replaceAll(' ','0').replaceAll('.','');
	    	  if(info.date.getTime() < new Date().getTime()){
	    	  	interval = new Date().getTime() - info.date.getTime();
	    	  	interval = Math.floor(interval / (1000*60*60*24))
	    	  	
	    		if(interval > 0){
	    			swal('이전 날짜 입니다.','','warning');
	    			return false;
	    		}
	    	  }
	    	  const offset = new Date().getTimezoneOffset() * 60000;

	    	  const today = new Date(Date.now() - offset);
	    	  document.getElementById('stTime').value = 
	    		  today.toISOString().slice(0,-8);
	    	  document.getElementById('endTime').value = 
	    		  today.toISOString().slice(0,-8);
	    	  
	    	  $("#exampleModal").modal('show');
	      },
	      locale: 'ko',
	      initialView: 'dayGridMonth',
	      events: events,
	      eventClick: function(info){
	    	 fn_viewDetail(info.event.title.split("_")[1]);
	      }
	    });
	    calendar.render();
	}
    
	function fn_viewDetail(scdNo){
		$.each(myschedule,function(i,v){
			if(v.scdNo == scdNo){
				$("#dscdNo").val(scdNo);
				$("#dScdNm").val(v.scdNm);
				$("#dEmpCd").val(v.empCd);
				$("#dScdCont").val(v.scdCont);
				var sdt = v.scdStTime.substring(0,4) + '-' + v.scdStTime.substring(4,6) + '-' + v.scdStTime.substring(6,8)  
							+ "T" + v.scdStTime.substring(8,10) + ':' + v.scdStTime.substring(10,12) + ':'+v.scdStTime.substring(12,14);
				var edt = v.scdEndTime.substring(0,4) + '-' + v.scdEndTime.substring(4,6) + '-' + v.scdEndTime.substring(6,8)  
							+ "T" + v.scdEndTime.substring(8,10) + ':' + v.scdEndTime.substring(10,12) + ':'+v.scdEndTime.substring(12,14);			
				$("#dStTime").val(sdt);
				$("#dEndTime").val(edt);
				$("#detailModal").modal('show');
			}
		})
	}
	
})
  
	
	function fn_closeInsertModal(){
		$("#scdNm").val('');
		$("#scdCont").val('');
		$("#endTime").val('');
		$("#exampleModal").modal('hide');
	}
	
	function fn_closeDetailModal(){
		$("#detailModal").modal('hide');
	}

</script>

<style>
label textarea{
	vertical-align: middle;
}
</style>

<div class="main_content_iner">
	<div class="container-fluid p-0">
	
		<div class="col-lg-12">
			<div class="white_box mb_30">
				<div class="box_header ">
					<div class="main-title">
						<h3 class="mb-0">일정</h3>
					</div>
				</div>
				<div id='calendar'></div>
			</div>
		</div>
		
	</div>
</div>

<!-- 일정 등록 Modal --> 
 <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document"> 
  <div class="modal-content">
   <div class="modal-header">
    <h5 class="modal-title" id="exampleModalLabel">일정 등록</h5>
     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
     </button> 
   </div> 
  <div class="modal-body">
  <form:form modelAttribute="scheduleVO" method="post" id="insertSchedule" action="/schedule/insertSchedule">
  <sec:csrfInput/>
	일정 제목 : <input type="text" id="scdNm" name="scdNm">
	<input type="text" id="empCd" name="empCd" style="display: none;" value="${loginUser.empCd}">	
	<br><br>
	<label for="scdCont">일정 내용 : <textarea id="scdCont" name="scdCont" rows="3" cols="25"></textarea></label>
	<br><br>
	시작 시간 : <input type="datetime-local" id="stTime">
	<input type="text" id="scdStTime" name="scdStTime" style="display: none;">
	<br><br>
	종료 시간 : <input type="datetime-local" id="endTime">
	<input type="text" id="scdEndTime" name="scdEndTime" style="display: none;">
	<br><br>
  </form:form>
  </div> 
  <div class="modal-footer">
   <button type="button" class="btn btn-secondary closebtn" data-dismiss="modal">Close</button>
    <button id="subBtn" type="button" class="btn btn-primary">등록</button>
  </div> 
  </div> 
  </div> 
 </div>
 
 
 <!-- 일정 상세 및 수정 Modal --> 
 <div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document"> 
  <div class="modal-content">
   <div class="modal-header">
    <h5 class="modal-title" id="exampleModalLabel">일정 상세</h5>
     <button type="button" class="close" data-dismiss="modal" aria-label="Close">
      <span aria-hidden="true">&times;</span>
     </button> 
   </div> 
  <div class="modal-body">
  <form:form modelAttribute="scheduleVO" method="post" id="modifySchedule" action="/schedule/modifySchedule">
  <sec:csrfInput/>
  <input type="text" id="dscdNo" name="scdNo" style="display: none;">
	일정 제목 : <input type="text" id="dScdNm" name="scdNm">
	<input type="text" id="dEmpCd" name="empCd" style="display: none;" value="${loginUser.empCd}">	
	<br><br>
	<label for="scdCont">일정 내용 : <textarea id="dScdCont" name="scdCont" rows="3" cols="25"></textarea></label>
	<br><br>
	시작 시간 : <input type="datetime-local" id="dStTime">
	<input type="text" id="dScdStTime" name="ScdStTime" style="display: none;">
	<br><br>
	종료 시간 : <input type="datetime-local" id="dEndTime">
	<input type="text" id="dScdEndTime" name="ScdEndTime" style="display: none;">
	<br><br>
  </form:form>
  </div> 
  <div class="modal-footer">
   <button type="button" class="btn btn-secondary closebtn" data-dismiss="modal">Close</button>
    <button id="modifyBtn" type="button" class="btn btn-primary">수정</button>
    <button id="deleteBtn" type="button" class="btn btn-danger">삭제</button>
  </div> 
  </div> 
  </div> 
 </div>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="kr">
<head>
  <title>calendar</title>
  <meta charset='utf-8' />
  <!-- 화면 해상도에 따라 글자 크기 대응(모바일 대응) -->
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">
  <script type="text/javascript" src="../js/jquery-3.6.0.min.js"></script>

  <link href='./lib/main.css' rel='stylesheet' />
<script src='./lib/main.js'></script>
<!--   <script src="/team3/js/fullcalendar-5.10.1.locales-all.min.js"></script> -->
  
  <!-- jquery CDN 
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <link href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css' rel='stylesheet' />
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
  <script src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script> -->
<style>
  /* body 스타일 */
  html, body {
    overflow: hidden;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }
  
  /* 캘린더 위의 해더 스타일(날짜가 있는 부분) */
  .fc-header-toolbar {
    padding-top: 1em;
    padding-left: 1em;
    padding-right: 1em;
  }

</style>

       
 <script>
    $(function(){
    	var pntCd = "${calendarVO.pntCd}"
    	var pntNm = "${calendarVO.pntNm}"
    	var chrDr = "${calendarVO.chrDr}"
    	var operNo = "${calendarVO.operNo}"
    	var operRoom = "${calendarVO.operRoom}"
    	var operYmd = "${calendarVO.operYmd}"
    	var operIng = "${calendarVO.operIng}"
    	var operBgnHr = "${calendarVO.operBgnHr}"
    	var operEndHr = "${calendarVO.operEndHr}"
    	var	title ="";
    	var vEvents = [];
    	 
    	 $.ajax({
    			
    		 type: 'post',
    		 data: {
    			 "pntCd" = pntCd,     
   				 "pntNm" = pntNm,       
   				 "chrDr" = chrDr,   
   				 "operNo" = operNo,     
   				 "operRoom" = operRoom, 
   				 "operYmd" = operYmd,    
   				 "operIng" = operIng, 
   				 "operBgnHr" = operBgnHr,
   				 "operEndHr" = operEndHr
//    				 title ="";                           
    			 
    		 },
    		 dataType: 'json',
    		 url: '/operation/calendar',
    		 async: false,
    		 success: function(data){
    			// $.each(data, function(i,v){
    			//	v['end'] = v['end'].split('t')[0];
    			//	v['start'] = v['start'].split('t')[0];
    			// });
    			
//     			extendedProps: {
//         department: 'BioChemistry'
//       },
    			
    			console.log(data);
    			console.log(Object.keys(data));
    			console.log(data["0"].state);
    			
    			$.each(data, function(i,v){
//     				v.title += "#" + v.state + "#" +v.ptno
    				v.title += data[i].chrDr;
    				console.log("title : " + v.title);
    				
//     				extendedProps: {
    			        
//     			      }
    				
    			});
    			 vEvents = data;
    			 console.log("test",vEvents);
    		 },
    		 error : function(xhr){
    			 alert("상태:"+xhr.status);
    		 }
    	 
    	 });
    	 console.log(vEvents + "입니다.");
      // calendar element 취득
      var calendarEl = $('#calendar')[0];
      // full-calendar 생성하기
      

      
      var calendar = new FullCalendar.Calendar(calendarEl, {
        height: '700px', // calendar 높이 설정
        expandRows: true, // 화면에 맞게 높이 재설정
        slotMinTime: '08:00', // Day 캘린더에서 시작 시간
        slotMaxTime: '24:00', // Day 캘린더에서 종료 시간
        // 해더에 표시할 툴바
        headerToolbar: {
          left: 'prev,next today',
          center: 'title',
          right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
        },
        initialView: 'timeGridWeek', // 초기 로드 될때 보이는 캘린더 화면(기본 설정: 달)
        //initialDate: '2021-07-15', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)
        navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크
        
      	
        editable: false, 
        
        selectable: false, // 달력 일자 드래그 설정가능
        nowIndicator: true, // 현재 시간 마크
        dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)
        locale: 'ko', // 한국어 설정
        
//         eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
//           console.log(obj);
//         },
//         eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
//           console.log(obj);
//         },
//         eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
//           console.log(obj);
//         },
        
     	// 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용.. 
        // (캘린더에서 드래그로 이벤트를 생성할 수 있다.)
     	select: function(arg) { 
     	  console.log(arg); 
     	  var title = prompt('입력할 일정:');
     	// title 값이 있을때, 화면에 calendar.addEvent() json형식으로 일정을 추가  
          if (title) {
            calendar.addEvent({
              title: title,
              start: arg.start,
              end: arg.end,
              allDay: arg.allDay,
              backgroundColor:"yellow", 
			  textColor:"blue" 
		
            })
          }
          calendar.unselect();
        },
//         eventClick: function(arg) { 	// 있는 일정 클릭시, 

// 			var ptitle = (arg.event.title).split('-');
// 			var ptno = ptitle[1]
// 			    ptitle = ptitle[0]
// 			var pstart = arg.event.start;
// 			var pend = arg.event.end;

// 		if(arg.event._def.extendedProps.state !== '예약가능'){
// 			alert("현재는 예약이 불가능합니다.")	
// 		}	
// 		if(arg.event._def.extendedProps.state !== '예약불가'){
			
// 			if (confirm('예약하시겠습니까?')) {
				
// 				alert("결제창으로 이동합니다.");
// 				opener.location.href = "../calendar/placePay.jsp?place_no=" + place_no + "&facilities_no=" + facilities_no + "&placetime_stime=" + pstart + "&placetime_etime=" + pend + "&place_price=" + place_price + "&placetime_no=" + ptno;
// 				window.close();
				
// 				} 
// 		}	
// 		}, 
		
		// 이벤트 
		events: vEvents
		
      });
      // 캘린더 랜더링
      calendar.render();
      
      
      
    });
</script>
</head>
<body style="padding:30px;">
  <!-- calendar 태그 -->
  <div id='calendar-container'>
    <div id='calendar'></div>
  </div>
  
 
 	
 	
 	
</body>

</html>
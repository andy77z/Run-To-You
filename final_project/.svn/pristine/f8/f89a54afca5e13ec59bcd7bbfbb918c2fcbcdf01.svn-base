<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%
	String pntNm = request.getParameter("pntNm");
	String pntCd = request.getParameter("pntCd");
%>

<link rel="stylesheet" href="/resources/fullcalendar/main.css">
<link rel="stylesheet"
	href="/resources/vendors/niceselect/css/nice-select.css">
<link rel="stylesheet" href="/resources/css/reservation/main.css"
	type="text/css" />
<script src="/resources/fullcalendar/main.js"></script>
<script src="/resources/fullcalendar/ko.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script type="text/javascript">
$(function() {
	var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
	var csrfHeader = $("meta[name=_csrf_header]").attr("content");
	var csrfToken = $("meta[name=_csrf]").attr("content");
		today = new Date();
		today.setHours(today.getHours() + 9)
		currentdate = today.toISOString().split('T')[0];	//2022-03-31
		currenttime = today.toISOString().split('T')[1].substring(0,5);		//09:00
		spcurrenttime = currenttime.split(':')[0]+currenttime.split(':')[1];		//09:00
})


$(document).ready(function() {	
// 	console.log('${loginUser.deptNm}')
	if('${loginUser.deptNm}'.trim()=='진료부'){
		$('#selectmajor').val('${loginUser.secNm}').prop("selected",true);
	}else{
		$('#selectmajor').val('전체부서').prop("selected",true);
	}
	
	//selectbox에 의사 출력
	var data = {};

	data[csrfParameter]=csrfToken;
	data["major"] = $("#selectmajor option:selected").val();

	//예약 목록 내 의사 선택
	$.ajax({
		url:"/reservation/doctorList",
		method: "post",
		data: data,
		success: function(dres) {
			//console.log(dres);
			//alert(dres)
			var listHtml = '<option value="" label="=담당의사=">=담당의사=</option>';
			if(dres!=''){
				for(var i in dres){
					listHtml +='<option id="optdoc" label="'+dres[i].empNm+'">'+dres[i].empNm+'_'+dres[i].empCd+'</option>';
				}
			}
			$("#chrDr").html(listHtml);			
		}
	})

	//진료부서 별 예약목록 출력
	$.ajax({
		url:"/reservation/majorresList",
		method:"get",
		data: data,
		success: function (res) {
			var mList = new Array();
			//console.log(jsonData)
			$.each(res, function(i, v) {
				$.each(v.reservation, function(j, k){
					var data = new Object();
					data.pntNm = k.pntNm;
					data.rsvtNo = k.rsvtNo;
					data.rsvtDt = k.rsvtDt;
					
				mList.push(data);
				})	
			})
			var jsonData = JSON.stringify(mList) ;
			
		    var Calendar = FullCalendar.Calendar;
		    var Draggable = FullCalendar.Draggable;
		    var calendarEl = document.getElementById('calendar');
		
		    var events = mList.map(function(item) {
				return {
					title : item.pntNm +" "+ item.rsvtNo,
					start : item.rsvtDt.substring(0,4) + '-' + item.rsvtDt.substring(4,6) + '-' + item.rsvtDt.substring(6,8)  
							+ "T" + item.rsvtDt.substring(8,10) + ':' + item.rsvtDt.substring(10,12) + ':'+item.rsvtDt.substring(12,14)
				}
			});
		    
		    // initialize the calendar
		    // -----------------------------------------------------------------
		
		    var calendar = new Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek'
		      },
		      initialView: 'dayGridMonth',
		      selectable:true,
		      editable: true,
		      droppable: true, // this allows things to be dropped onto the calendar
		      drop: function(info) {
		        // is the "remove after drop" checkbox checked?
		        if (checkbox.checked) {
		          // if so, remove the element from the "Draggable Events" list
		          info.draggedEl.parentNode.removeChild(info.draggedEl);
		        }
		      },
		      locale:'ko',
		      events: events,
		      eventTimeFormat: {
				    hour: '2-digit',
				    minute: '2-digit',
				    hour12: false
				  }
		    });
		    //console.log(events)
		    calendar.render()
		}//end of success
	});//end of ajax
	
	//=======================================================================
	
	var data = {};

	data[csrfParameter]=csrfToken;
	data["empCd"] = "${loginUser.empCd}";

	//예약 목록 내 의사 선택
	$.ajax({
		url:"/reservation/doctor",
		method: "post",
		data: data,
		success: function(dres) {
			
			var data2 = {};

			data2[csrfParameter]=csrfToken;
			data2["empCd"] = "${loginUser.empCd}";
			
			
			//console.log(dres.length)
			if(dres.length == 1){//로그인 한 사람이 의사 
				//진료부서 별 예약 목록 
				$.ajax({
					url:"/reservation/resdoctorList",
					method: "post",
					data: data2,
					dataType:"html",
					traditional:"true",
					success: function(res) {
					console.log(res)
						var html = $("<div>").html(res);
						var contents = html.find("div#doctoroutput").html();
						$("#resemplist").html(contents);
					}
				});
			}else if(dres.length != 1){//로그인 한 사람이 의사가 아니야
				//진료부서 별 예약 목록 
				$.ajax({
					url:"/reservation/resdoctorList",
					method: "post",
					data: data2,
					dataType:"html",
					traditional:"true",
					success: function(res) {
						var html = $("<div>").html(res);
						var contents = html.find("div#otheroutput").html();
						$("#resemplist").html(contents);
					}
				});
			}			
		}
	})

	//금일예약내역의 환자를 클릭 시 접수되게(예약에서 상태를 대기로 변경)
	$(document).on("click","#tbltr", function(){
		//var pntclick = $(this).attr("class");
		var waitState = $(this).children('td').eq(2).text();
		if(waitState=='미완료'){
			var pntNm = $(this).children('td').eq(1).text();
			var pntCd = $(this).attr('pntCd');
			var rsvtNo = $(this).attr('rsvtNo');
			var empCd = $(this).attr('empCd');
			var authList = ${loginUser.viewAuthList()};
			
			  var data = {};

				data[csrfParameter]=csrfToken;
				data["pntCd"] = pntCd;
				data["rsvtNo"] = rsvtNo;
				data["empCd"] = empCd;
				
			console.log(data);
			for(var i = 0; i < authList.length; i++){
			
				if(authList[i].auth=='ROLE_NURSE'){
				
				Swal.fire({
					  title: '"'+pntNm+'" '+'환자',
					  text:'해당 환자의 접수를 진행 하시겠습니까?',
					  icon: 'question',
					  showCancelButton: true,
					  confirmButtonColor: '#3085d6',
					  cancelButtonColor: '#d33',
					  confirmButtonText: '예',
					  cancelButtonText : "아니오"
					}).then((result)=> {
					  if (result.isConfirmed) {
						  
					    Swal.fire(
					      '접수 완료!',
					      '환자대기 목록에서 확인할 수 있습니다.',
					      'success'
					    )
					    
					    //예약 상태 변경(접수완료 후 대기)
					    $.ajax({
							url:"/reservation/waiting",
							method: "post",
							data: data,
							success: function(res) {
							}
						});
					    
					  }
					  
					}).then(function(){
						$(".swal2-confirm").on("click", function() {
							location.reload();
						});
					});
				}
			}
		}
		
	})
	
	//환자 목록 출력 
	$.ajax({
		url:"/reservation/patientsList",
		method:"get",
		success: function(res) {
			//console.log(res)
			var option = '<option>=환자 코드 이름 생년월일=</option>';
			$.each(res, function(i, v) {
				option += '<option value="'+v.pntCd+'">'+v.pntCd+' '+v.pntNm+' '+v.pntPrno.split('-')[1]+'</option>';
			})
			$("#serchPnt").append(option);
			$("#serchPnt").niceSelect('update');
			
			if('${param.pntCd}' != null ||'${param.pntCd}' != ''){
				var pntcd = '${param.pntCd}';
				//console.log($(option [name="${param.pntCd}"]).text())
				
				var ul = $(".list")[0];
				var li = $(".option");
				//console.log(ul);
				//console.log(li);
				
		 		for(var i = 0; i < li.length; i++){
		 			if($(li[i]).attr("data-value") == pntcd){
		 				$(li[i]).attr("class", "option focus selected");
		 				$(".current").text($(li[i]).text());
		 			} 
		 		}
		 		//console.log($(".current").text())
			}
		}
	});//end of ajax
	
	
$(document).on("change", ".selmajor", function() {

	var data2 = {};

	data2[csrfParameter]=csrfToken;
	data2["major"] = $('.selmajor option:selected').val();//옵션에서 선택한 벨류값
	
	$.ajax({
		url:"/reservation/resdoctorList",
		method: "post",
		data: data2,
		dataType:"html",
		traditional:"true",
		success: function(res) {
			var html = $("<div>").html(res);
			var contents = html.find("div#otheroutput").html();
			$("#resemplist").html(contents);
		}
	});
})
	
	//일정 클릭 시 이벤트
	$(document).on("click", ".fc-daygrid-event-harness", function() {
		
		//alert($(this).find(".fc-event-title").text().split(" ")[1].trim())
		var data = {};
	
		data[csrfParameter]=csrfToken;
		data["rsvtNo"] = $(this).find(".fc-event-title").text().split(" ")[1].trim();
		
		var clickdate = $(this).parents("td").attr("data-date");
		var rtime = $(this).find(".fc-event-time").text()+":00";
		var rstime = rtime.split(':')[0]+rtime.split(':')[1];
		var sprtime = rtime.split(':')[0]+rtime.split(':')[1]+rtime.split(':')[2];
		$("#detailresModal").modal("show")
		$("#detailresModal").find("#rsvDate").attr("value",$(this).parents("td").attr("data-date"));
		$("#detailresModal").find("#rsvTime").attr("value",sprtime);
		$("#detailresModal").find("#srsvTime").attr("value",$(this).find(".fc-event-time").text());
		
		$.ajax({
			url:"/reservation/findres",
			method:"post",
			data: data,
			success: function (res) {
				//console.log(res) //여기!!!!!!!!!!!!!!!!
					$("#detailresModal").find("#mhour").css("display","none");
					$("#detailresModal").find("#complete").css("display","none");
					$("#detailresModal").find("#srsvTime").attr("readonly",true);
					$("#detailresModal").find("#rsvDate").attr("readonly",true);
					$("#detailresModal").find("#pntNm").attr("value",res.pntNm);
					$("#detailresModal").find("#pntCd").attr("value",res.pntCd);
					$("#detailresModal").find("#rsvt").attr("value",res.pntNm);
					$("#detailresModal").find("#pntNm").attr("readonly",true);
					$("#detailresModal").find("#empNm").attr("value",res.empNm);
					$("#detailresModal").find("#empNm").attr("readonly",true);
					$("#detailresModal").find("#empCd").attr("value",res.empCd);
 					$("#detailresModal").find("#rsvtNo").attr("value",res.rsvtNo);
 					$("#detailresModal").find("#delres").attr("value",res.rsvtNo);
					$("#detailresModal").find("#symptoms").text(res.symptoms);
					$("#detailresModal").find("#symptoms").attr("readonly",true);
					
				if(clickdate<currentdate || (clickdate==currentdate&&rstime<=currenttime)){
					$("#delres").css("display","none");
					$("#modires").css("display","none");
					$("#detailresModal").find("#rsvDate1").css("display","none");
				}else if(currentdate<clickdate || (clickdate==currentdate&&currenttime<rstime)){
					$("#delres").css("display","inline-block");
					$("#modires").css("display","inline-block");
					$("#detailresModal").find("#rsvDate1").css("display","none");
				}
				
			}
		})// end of ajax
		
	})
	
	
});//end of function
  

  
//Byte 수 체크 제한
function fnChkByte(obj, maxByte)
{
    var str = obj.value;
    var str_len = str.length;


    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";


    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4) {
            rbyte += 2;                                         //한글2Byte
        }else{
            rbyte++;                                            //영문 등 나머지 1Byte
        }
        if(rbyte <= maxByte){
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }
     if(rbyte > maxByte)
     {
        // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
        swal("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.", "warning");
//         alert("메세지는 최대 " + maxByte + "byte를 초과할 수 없습니다.")
        str2 = str.substr(0,rlen);                                  //문자열 자르기
        obj.value = str2;
        fnChkByte(obj, maxByte);
     }
     else
     {
        document.getElementById('byteInfo').innerText = rbyte;
     }
}

//신규예약
function newres() {
	
	if($("#rsvTime").val()==null ||$("#rsvTime").val()==''){
		swal("주의!", "예약 시간을 선택하세요.", "warning");
		
	}else{
		$("#reservationVo").submit();
	}
	
	var pntCd = $("input [name=pntCd]").attr("value");
		
}


//selectbox의 진료과목 선택했을 때
$(document).on("change","#selectmajor", function() {
   
   //var data = {"major" : $("#selectmajor option:selected").val()};
   
   var data = {};

   data[csrfParameter]=csrfToken;
   data["major"] = $("#selectmajor option:selected").val();
   
   //예약 목록 내 의사 선택
   $.ajax({
      url:"/reservation/doctorList",
      method: "post",
      data: data,
      success: function(dres) {
         //console.log(dres);
         var listHtml = '<option value="" label="=담당의사=">=담당의사=</option>';
         if(dres!=''){
            for(var i in dres){
               listHtml +='<option id="optdoc" label="'+dres[i].empNm+'">'+dres[i].empNm+'_'+dres[i].empCd+'</option>';
            }
         }
         $("#chrDr").html(listHtml);   
      }
   })
   
   
   var data = {"major": $("#selectmajor option:selected").val()};

	//진료부서 별 예약목록 출력(캘린더에)
	$.ajax({
		url:"/reservation/majorresList",
		method:"get",
		data: data,
		success: function (res) {
			var mList = new Array();
			//console.log(mList)
			
			$.each(res, function(i, v) {
				$.each(v.reservation, function(j, k){
					var data = new Object();
					data.pntNm = k.pntNm;
					data.rsvtNo = k.rsvtNo;
					data.rsvtDt = k.rsvtDt;
					
				mList.push(data);
				})	
			})
			var jsonData = JSON.stringify(mList) ;
			
		    var Calendar = FullCalendar.Calendar;
		    var Draggable = FullCalendar.Draggable;
		    var calendarEl = document.getElementById('calendar');
		
		    var events = mList.map(function(item) {
				return {
					title : item.pntNm +" "+ item.rsvtNo,
					start : item.rsvtDt.substring(0,4) + '-' + item.rsvtDt.substring(4,6) + '-' + item.rsvtDt.substring(6,8)  
							+ "T" + item.rsvtDt.substring(8,10) + ':' + item.rsvtDt.substring(10,12) + ':'+item.rsvtDt.substring(12,14)
				}
			});
		    
		    // initialize the calendar
		    // -----------------------------------------------------------------
		
		    var calendar = new Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek'
		      },
		      initialView: 'dayGridMonth',
		      selectable:true,
		      editable: true,
		      droppable: true, // this allows things to be dropped onto the calendar
		      drop: function(info) {
		        // is the "remove after drop" checkbox checked?
		        if (checkbox.checked) {
		          // if so, remove the element from the "Draggable Events" list
		          info.draggedEl.parentNode.removeChild(info.draggedEl);
		        }
		      },
		      locale:'ko',
		      events: events,
		      eventTimeFormat: {
				    hour: '2-digit',
				    minute: '2-digit',
				    hour12: false
				  }
		    });
		    //console.log(events)
		    calendar.render();
		}//end of success
	});//end of ajax
	
	
	if($("#selectmajor option:selected").val().trim() == '전체부서'){
	
		//전체 예약목록 출력
		$.ajax({
			url:"/reservation/allList",
			method:"get",
			success: function (res) {
				var list = res;	
			    var Calendar = FullCalendar.Calendar;
			    var Draggable = FullCalendar.Draggable;
			    var calendarEl = document.getElementById('calendar');
			
			    var events = list.map(function(item) {
			    	console.log(events)
					return {
						title : item.pntNm +" "+ item.rsvtNo,
						start : item.rsvDate + "T" + item.rsvTime
					}
				});
			    
			    
			    // initialize the calendar
			    // -----------------------------------------------------------------
			
			    var calendar = new Calendar(calendarEl, {
			      headerToolbar: {
			        left: 'prev,next today',
			        center: 'title',
			        right: 'dayGridMonth,timeGridWeek'
			      },
			      initialView: 'dayGridMonth',
			      selectable:true,
			      editable: true,
			      droppable: true, // this allows things to be dropped onto the calendar
			      drop: function(info) {
			        // is the "remove after drop" checkbox checked?
			        if (checkbox.checked) {
			          // if so, remove the element from the "Draggable Events" list
			          info.draggedEl.parentNode.removeChild(info.draggedEl);
			        }
			      },
			      locale:'ko',
			      events: events,
			      eventTimeFormat: {
					    hour: '2-digit',
					    minute: '2-digit',
					    hour12: false
					  }
			    });
			    //console.log(events)
			    calendar.render();
			}//end of success
		});//end of ajax
	
		
		var data = {};

		   data[csrfParameter]=csrfToken;
		   data["major"] = $("#selectmajor option:selected").val();
		   
		  $.ajax({
		 		url:"/reservation/resdoctorList",
		 		method:"post",
		 		data : data,
		 		dataType:"html",
				traditional:"true",
		 		success: function (res) {
		 			var html = $("<div>").html(res);
					var contents = html.find("div#output").html();
					$("#resemplist").html(contents);
		 		}
		 });
		  
	}
	
	
})

//의사 선택했을 때 
$(document).on("change","#chrDr", function() {
	var data = {};
	var split = $("#chrDr option:selected").val().split('_');
	
	data[csrfParameter]=csrfToken;
	data["empCd"] = split[1].trim();
	
	$("#empCd").attr("value", split[1].trim());
	$("#empNm").attr("value", split[0].trim());
	
	//의사별 예약목록 출력(캘린더에)
	$.ajax({
		url:"/reservation/docList",
		method:"post",
		data: data,
		success: function (res) {
			var list = res;
			//console.log(list)
	
			
		    var Calendar = FullCalendar.Calendar;
		    var Draggable = FullCalendar.Draggable;
		    var calendarEl = document.getElementById('calendar');
		
		    var events = list.map(function(item) {
				return {
					title : item.pntNm +" "+ item.rsvtNo,
					start : item.rsvDate + "T" + item.rsvTime
				}
			});
		    
		    // initialize the calendar
		    // -----------------------------------------------------------------
		
		    var calendar = new Calendar(calendarEl, {
		      headerToolbar: {
		        left: 'prev,next today',
		        center: 'title',
		        right: 'dayGridMonth,timeGridWeek'
		      },
		      initialView: 'dayGridMonth',
		      nowIndicator: true,
		      selectable:true,
		      editable: true,
		      droppable: true, // this allows things to be dropped onto the calendar
		      drop: function(info) {
		        // is the "remove after drop" checkbox checked?
		        if (checkbox.checked) {
		          // if so, remove the element from the "Draggable Events" list
		          info.draggedEl.parentNode.removeChild(info.draggedEl);
		        }
		      },
		      locale:'ko',
		      dateClick:function(info){
		    	var day = new Date();
		    	  var year = day.getFullYear();
		    	  var month = ('0' + (day.getMonth() + 1)).slice(-2);
		    	  var day = ('0' + day.getDate()).slice(-2);
		    	  var pntinfo = $('.current').text();
		    	  var pntsplit = pntinfo.split(' ');
		
		    	  var todayFormat = year + '-' + month  + '-' + day;
		    	  
		    	  $("#pntNm").attr("value", pntsplit[1].trim());
		    	  $("#pntCd").attr("value", pntsplit[0].trim());
		    	  
		    	 $('#serchPnt > option:selected').val()
		    		if($(".current").text().trim() == '=환자 코드 이름 생년월일='){
		    			swal("주의!", "환자를 선택하세요.", "warning");
		    			
		    		}else{
		    			
				    	  if(info.dateStr < todayFormat){
				    		  swal("예약 불가","예약은 오늘 날짜 이후부터 가능합니다.", "warning");
				    	  }else if(todayFormat <= info.dateStr){
					      	$("#exampleModal").modal("show");
					      	$("#rsvDate").attr("value", info.dateStr)    		  
				    	  }
		    		}
		      },
		      events: events,
		      eventTimeFormat: {
				    hour: '2-digit',
				    minute: '2-digit',
				    hour12: false
				  }
		    });
		
		    calendar.render();
		}//end of success
	});//end of ajax
	
	
	//캘린더의 날짜를 클릭했을 때 
	$(document).on("click", ".fc-daygrid-day", function(){
	
		var child = $(this).find(".fc-event-time");
		//console.log(child)
		childVal = '';
		for(var i=0; i<child.length;i++){
			childVal += child.eq(i).text()+"/"		
		}
		
		var arr = childVal.split('/')	//해당날짜에 예약되어있는 시간
		//console.log("arr", arr)
		
		 clickdate = $(this).attr('data-date')	//클릭한 날의 날짜 2022-03-31
		 
		var values = $.map($('#hour option'), function(e) { return e.value; }); 
		
		//console.log("dd"+values)
		//console.log(currentdate.trim())
		//console.log(clickdate.trim())

		for(var i=1; i<values.length; i++){
			if(values[i]<= currenttime && currentdate.trim() == clickdate.trim()){
				//console.log($("#hour option:contains("+values[i]+")").val())
				$("#hour option:contains("+values[i]+")").css("color", "lightgray")
				$("#hour option:contains("+values[i]+")").attr("disabled", true)
			}else if(!(currentdate.trim() == clickdate.trim())){
				$("#hour option:contains("+values[i]+")").css("color", "black")
				$("#hour option:contains("+values[i]+")").attr("disabled", false)
			}
			
			for(var j=0; j<arr.length; j++){
				if(values[i] == arr[j]){
					//console.log("ddddd"+$("#hour option:contains("+values[i]+")").val())
					$("#hour option:contains("+values[i]+")").css("color", "lightgray")
					$("#hour option:contains("+values[i]+")").attr("disabled", true)
				}
				
			}
		}
		
	})
})


//예약 시간 출력
$(document).on("change","#hour", function() {
		var timevalue = $("#hour option:selected").val();
		var timeVal = $("#rsvTime").attr("value", timevalue+":00")
})

//수정버튼 클릭 시 
function modires() {
	$("#detailresModal").find("#mhour").css("display","inline-block");
	//$("#detailresModal").find("#rsvTime").css("display","inline-block");
	//$("#detailresModal").find("#rsvTime").attr("disabled",false);
	//$("#detailresModal").find("#rsvDate").attr("disabled",true);
	$("#detailresModal").find("#symptoms").attr("readonly",false);
	//alert($("#detailresModal").find("#empCd").attr("value"))


	$("#delres").css("display","none");
	$("#complete").css("display","inline-block");
	$("#modires").css("display","none");
	$("#detailresModal").find("#rsvDate1").css("display","inline-block");
	
	
	if($('input[name=rsvDate1]').val() == null || $('input[name=rsvDate1]').val() == '' ){
		$("#mhour").attr("hidden",true);
	}
	
	  $('#rsvDate1').change(function (){
		  $("#mhour").attr("hidden",false);
		  
		  var date = $('#rsvDate1').val();
		  $('input[name=rsvDate]').attr("value", date);
		  
			//alert($("#detailresModal").find("#empCd").attr("value"))       //여기야!!!!!!!!!!!!!!!!!!!!!
		  var data = {};
			data[csrfParameter]=csrfToken;
			data["empCd"] = $("#detailresModal").find("#empCd").val();
			data["rsvDate"] = $("#rsvDate").val();
			
			$.ajax({
				url:"/reservation/restime",
		 		method:"post",
		 		data : data,
		 		success: function (res) {
		 			//console.log(res[0].rsvTime)
		 			
		 			var hourval = $.map($('#mhour option'), function(e) { return e.value; }); 
		 			//console.log(hourval[1])
		 			
		 			for(var i=1; i<hourval.length; i++){
		 				
		 				for(var j=0; j<res.length; j++){
		 					if(hourval[i] == res[j].rsvTime){
		 						//console.log($("#mhour option:contains("+hourval[i]+")").val())
		 						$("#mhour option:contains("+hourval[i]+")").css("color", "lightgray");
		 						$("#mhour option:contains("+hourval[i]+")").attr("disabled", true);
		 					}
		 					
		 				}
		 			}
		 			
		 		}
			})
			
			$("#mhour").on("change", function() {
				var time = $("#mhour option:selected").val()+":00";
				var spl = time.split(":");
				var spltime = spl[0]+spl[1]+spl[2]
				$("#srsvTime").attr("value", $("#mhour option:selected").val())
				$("input[name=rsvTime]").attr("value", spltime)
			})
			
      });
}
//예약 수정 완료버튼 클릭 시 실행
function rescomp() {
	$(reservationVo).submit();
}

//예약 삭제 시 실행 
function delres(d) {
	
	var data = {};

	data[csrfParameter]=csrfToken;
	data["rsvtNo"] = d.value;
	data["pntCd"] = $("#delres").parent().prev().find("#pntCd").val();
	
	Swal.fire({
		  title: '정말로 삭제 하시겠습니까?',
		  text: "삭제한 데이터는 복구되지 않습니다.",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'delete'
		}).then((result)=> {
		  if (result.isConfirmed) {

			$.ajax({
				url:"/reservation/resdelete",
				method: "post",
				data: data,
				success: function(rres) {
					//console.log(rres);	
				}
			});
			
		    Swal.fire(
		      '삭제 완료!',
		      'Your file has been deleted.',
		      'success'
		    )
		  }
		  else{
			  $("#detailresModal").modal('hide');
		  }
		}).then(function(){
			$(".swal2-confirm").on("click", function() {
				location.reload();
			});
		});
	
}



</script>

<div class="main_content_iner ">
	<div class="container-fluid p-0">
		<div class="row justify-content-center">
			<div class="col-12">
				<div class="QA_section">
					<div class="white_box calout">
						<div class="box_header border_bottom_1px  ">
							<div class="main-title">
								<h3 class="mb_25">예약</h3>
							</div>
						</div>
						<!-- 환자 검색 -->
						<div style="width: 100%; display: inline-block;">
							<div style="width: 200px; float: left; margin-right: 70px;">
								<h6>환자 검색</h6>
								<select class="nice_Select" id="serchPnt">
								</select>
							</div>
							<!-- 환자 검색 -->
							<!-- 의사  -->
							<div style="width: auto; display: inline-block;">
								<h6>담당 의사</h6>
								<form:form modelAttribute="patientsVo" name="patientsVo"
									method="get" action="/reservation/main">
									<form:select path="" id="selectmajor" style="margin-right:5px;">
										<form:option value="" label="=진료과목=" />
										<form:option value="전체부서" label="전체부서" />
										<c:forEach var="major" items="${majorlist}">
											<form:option value="${major.major}" label="${major.major}" />
										</c:forEach>
									</form:select>

									<form:select path="chrDr" id="chrDr" style="width:170px;">

									</form:select>
								</form:form>
							</div>
							<!-- 의사  -->
						</div>
						<br>
						<div id="calendar" class="type2"></div>
					</div>

					<!-- 의사별 일정 보기 -->
					<div class="dodiv">
						<div class="white_box" style="height: 100%;">
							<div class="box_header border_bottom_1px  ">
								<div class="main-title">
									<h3 class="mb_25">금일 예약 현황</h3>
								</div>
									<c:set var="deptNm" value="${loginUser.deptNm}"/>
									<c:if test="${deptNm != '진료부'}">
										<select class="selmajor" >
											<option name="=진료부서=" value="=진료부서=">=진료부서=</option>
										<c:forEach var="major" items="${majorlist}">
											<option value="${major.major}">${major.major}</option>
										</c:forEach>	
										</select>
									</c:if>
							</div>
							<div id="resemplist" class="type2">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- 예약 등록 Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">신규예약</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form:form modelAttribute="reservationVo" method="post"
					name="addreservation" action="/reservation/addreservation">
					<sec:csrfInput />
	담당 의사 : <input type="text" class="input" id="empNm" name="empNm">
					<input type="text" class="input" id="empCd" name="empCd"
						style="display: none;">
					<br>
					<br>	
	예약 일자 : <input type="text" class="input" id="rsvDate" name="rsvDate">
					<br>
					<br>
	예약 시간 : <select id="hour">
						<option>-선택-</option>
						<option>09:00</option>
						<option>09:30</option>
						<option>10:00</option>
						<option>10:30</option>
						<option>11:00</option>
						<option>11:30</option>
						<option>13:00</option>
						<option>13:30</option>
						<option>14:00</option>
						<option>14:30</option>
						<option>15:00</option>
						<option>15:30</option>
						<option>16:00</option>
						<option>16:30</option>
						<option>17:00</option>
						<option>17:30</option>
						<option>18:00</option>
					</select>
					<input type="text" class="input" id="rsvTime" name="rsvTime"
						style="display: none;">
					<br>
					<br>	
	환자 이름 : <input type="text" class="input" id="pntNm" name="pntNm"
						value="">
					<input type="text" class="input" id="pntCd" name="pntCd" value=""
						style="display: none;">
					<br>
					<br>
	내원 사유 : 
	<br>
					<textarea id="symptoms" name="symptoms" cols="60" rows="4"
						style="margin-left: 10px; resize: none;"
						onKeyUp="javascript:fnChkByte(this,'100')"></textarea>
					<div style="float: right;">
						<span id="byteInfo">0</span>/100bytes
					</div>
				</form:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-primary" onclick="newres()">등록</button>
			</div>
		</div>
	</div>
</div>

<!-- 예약 상세 Modal -->
<div class="modal fade" id="detailresModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">예약상세</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<form:form modelAttribute="reservationVo" method="post"
					name="modireservation" action="/reservation/modireservation">
					<sec:csrfInput />
					<input type="hidden" id="rsvtNo" name="rsvtNo">
	담당 의사 : <input type="text" class="input" id="empNm" name="empNm">
					<input type="hidden" class="input" id="empCd" name="empCd">
					<br>
					<br>	
	예약 일자 : 
	<input type="text" class="input" id="rsvDate" name="rsvDate">
					<input type="date" class="input" id="rsvDate1" name="rsvDate1">
					<br>
					<br>
	예약 시간 : 
			<input type="text" class="input" id="srsvTime" name="srsvTime">
					<input type="hidden" class="input" id="rsvTime" name="rsvTime">
					<select id="mhour">
						<option>-선택-</option>
						<option>09:00</option>
						<option>09:30</option>
						<option>10:00</option>
						<option>10:30</option>
						<option>11:00</option>
						<option>11:30</option>
						<option>13:00</option>
						<option>13:30</option>
						<option>14:00</option>
						<option>14:30</option>
						<option>15:00</option>
						<option>15:30</option>
						<option>16:00</option>
						<option>16:30</option>
						<option>17:00</option>
						<option>17:30</option>
						<option>18:00</option>
					</select>
					<br>
					<br>	
	환자 이름 : <input type="text" class="input" id="pntNm" name="pntNm"
						value="">
					<input type="hidden" class="input" id="pntCd" name="pntCd" value="">
					<br>
					<br>	
	내원 사유 : 
	<br>
					<textarea id="symptoms" name="symptoms" cols="60" rows="4"
						style="margin-left: 10px; resize: none;"
						onKeyUp="javascript:fnChkByte(this,'100')"></textarea>
					<div style="float: right;">
						<span id="byteInfo">0</span>/100bytes
					</div>
				</form:form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" class="btn btn-danger" id="delres"
					onclick="delres(this)">삭제</button>
				<button type="button" class="btn btn-primary" id="modires"
					onclick="modires()">수정</button>
				<button type="button" class="btn btn-primary" id="complete"
					onclick="rescomp()">완료</button>
			</div>
		</div>
	</div>
</div>
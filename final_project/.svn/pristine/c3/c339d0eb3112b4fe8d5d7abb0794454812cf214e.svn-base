<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="/resources/vendors/niceselect/css/nice-select.css">
<link rel="stylesheet" href="/resources/css/ent/entCommon.css"
	type="text/css" />
<link href='/resources/fullcalendar/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar/main.js'></script>
<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
<script src="https://unpkg.com/tippy.js@6"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- 이쁜 alert -->

<style>
#vsInsertBtn, #cmInsertBtn {
	margin: 0.5%;
}

#searchArea {
	display: inline-block;
}

.cmTD:hover{
	background-color: #d3d3d3; 
	cursor : pointer;
}

#BNav {
	float: right;
	width: 85%;
	height: 600px;
	overflow: auto;
	display: flex;
	flex-wrap: wrap;
	background-color: #eee6c4;
	padding: 0;
	padding-left:5%;
	padding-top: 3%;
}

.levDtOvertime:hover, .clickBed:hover, .changeLisk:hover {
	background-color: #FAAA8D;
}

.levDtOvertime, .changeLisk{
	cursor: pointer;
}

.addEntDate {
	height: 60px;
	width: 270px;
	display: none;
	position: absolute;
}

.addLevDtBtn, .cancleBtn, .updateDietBtn, .updateLiskBtn {
	height: 30px;
	width: 40px;
	padding: 0;
	font-size: 0.6em;
}

.mdlBodyTop {
	width: 100%;
	height: 50%;
	margin-top: 3%;
}

.mdlBodyTopCnt1 {
	width: 70%;
	height: 80%;
	margin-left: 17%;
}

.mdlBodyTopCnt2 {
	width: 70%;
	height: 80%;
	margin-left: 17%;
}

.mdlBodyTopCnt3 {
	width: 70%;
	height: 80%;
	margin-left: 17%;
}

.mdlBodyTopCnt4 {
	width: 70%;
	height: 80%;
	margin-left: 17%;
}

.drugCnt {
	border: 1px solid black;
	height: 80%;
	width: 100%;
	border-radius: 4%;
	overflow-y: scroll;
}

.selectedDrug {
	margin: 0.5px;
	border-bottom: 0.6px solid black;
}

.selectedDrug:hover {
	background-color: #b9ceac;
}

.btn-lg {
	width: 23%;
	margin-left: 1.5%;
	margin-bottom: 4%;
}

.btnMoem {
	padding-top: 2.4%;
}

.detailMdBody {
	width: 30%;
	height: 100%;
	float: left;
	padding: 10px;
}

.detailMdBody2 {
	width: 70%;
	height: 100%;
	float: right;
}

.tippy-box[data-theme~='tomato'] {
	background-color: #e48e58;
	color: yellow;
}

.tippy-box[data-placement^=top]>.tippy-arrow:before {
	border-top-color: tomato;
}

.tippyBox td:first-child {
	background-color: #e48e58;
	width: 70px;
	height: 40px;
}

.detailMdBody input[type=text] {
	border-radius: 10px;
	height: 30px;
	border: 1.5px solid black;
	padding-left: 4px;
}

.forwardWard {
	width: 67px;
	font-weight: bold;
}

.detailEle {
	margin-bottom: 10px;
}
</style>

<script>

	$(function(){	
		
		var array = []
		
		array.push({"2":'2', "3":'3'});
		array.push({"2":'2', "3":'3'});
		array.push({"2":'2', "3":'3'});
		console.log(array);
		
		var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
		var csrfHeader = $("meta[name=_csrf_header]").attr("content");
		var csrfToken = $("meta[name=_csrf]").attr("content");
		
		// 알림
		empCd = "${loginUser.empCd}";
		lkCd = "${param.lkCd}"
// 		setInterval(getNotiCnt, 2000, empCd);
// 		setInterval(insertDrugNotiContent, 60000);
		
		var today = new Date();
		var now = today.toLocaleDateString();
		
		$("#entList").on("click", function(){
			clickEntList();
		})
		$("#positionMap").on("click", function(){
			clickPosition();
		})
		
		$(function(){
			// 방번호 누르면 가져오기
			$(document).on("click", ".getRoom", function(){
				var t = this.id;
				getRoom(t);
			})
			// 위치 변경 버튼
			$(".positionBed").on("click", function(){
				positionBed();
			})
			// 위치 저장 버튼
			$(".positionSave").on("click", function(){
				positionSave();
			})
			// 변경 취소 버튼
			$(".positionCancle").on("click", function(){
				positionCancle();
			})
			// 마우스 올리면 묵고있는 환자의 상세 정보를 볼 수 있음 ==================================================================================================
			$(document).on("click", ".bed", function(){
				mouseOn(this);
			})
			// 마우스 때면 있던 상세정보 사라지게 하는 코드 ==================================================================================================
			$(document).on("mouseleave", ".bed", function(){
				mouseDown();
			})
		})
		
		// 간호일지를 눌렀을 때.
		$(document).on("click", ".careNote", function(){
			var data = {"entCd":this.id};  // entCd
			var pntNm = $(this).attr("value");
			var pntCd = $(this).attr("name"); // pntCd
			
			$(".modal-content").attr("value", this.id); // entCd
			$(".modal-content").attr("id", pntCd); // pntCd
			
			$.ajax({
				url : "/ent/getCareNote",
				method : "get",
				data : data,
				success : function(res){
					$("#exampleModalLabel").html(pntNm + " 간호일지");
					$("#careNoteContent").empty();
					console.log(res);
					var div = "";
					var table = "<table id='cmTB' style='width:100%; text-align:center; table-layout: fixed;'>";
					table += "<tr>";
					table += "<th>내용</th>"; table += "<th>등록자</th>"; table += "<th>등록일</th>";
					table += "</tr>";
					if(res.length >= 1){
						$.each(res, function(i, v){
							table += "<tr class='cmTD' id='"+v.noteNo+"'>";
							table += "<td id='"+ i +"' style='text-overflow:ellipsis;overflow:hidden;white-space:nowrap;' title='"+v.noteContent+"'>"+v.noteContent+"</td>"; table += "<td>"+v.empNm+"</td>"; table += "<td>"+cutDt(v.noteWrtDt)+"</td>"; 
							table += "</tr>";
						})
					}
					table += "</table>";
					
					$("#careNoteContent").append(table);
				}
			})
			var data2 = {"pntCd":pntCd};
			$.ajax({
				url : "/ent/getVital",
				method : "get",
				data : data2,
				success : function(res){
					$("#vitalSignContent").empty();
					console.log(res);
					var div = "";
					var table = "<table id='vstb' style='width:100%; text-align:center; table-layout: fixed;'>";
					table += "<tr>";
					table += "<th>혈압</th>"; table += "<th>체온</th>"; table += "<th>혈당</th>"; table += "<th>측정일</th>";
					table += "</tr>";
					if(res.length >= 1){
						$.each(res, function(i, v){
							table += "<tr style='overflow:hidden;'>";
							table += "<td>"+v.vsBpMax+"/"+v.vsBpMin +"</td>"; table += "<td>"+v.vsTmp+"</td>"; table += "<td>"+v.vsBs+"</td>"; table += "<td>"+cutDt(v.vsDt)+"</td>"; 
							table += "</tr>";
						})
					}
					table += "</table>";
					
					$("#vitalSignContent").append(table);
				}
			})
		})
		
		// 간호일지 삭제
		$(document).on("click",".cmTD",  function(){
			console.log(this);
			Swal.fire({
				title : "",
 				 text : "해당 일지를 삭제하시겠습니까?", 
 				 icon : "info",
 				 confirmButtonText: '삭제',
 				showCancelButton: true
 			}).then((result) => {
 			      if(result.isConfirmed){
						var noteNo = $(this).attr("id");
						var data = {"noteNo":noteNo};						
						$.ajax({
							url : '/ent/deleteCN',
							method : 'get',
							data : data,
							success : function(res){
								if(res > 0){
									$(this).hide();
									Swal.fire(" ", "삭제 완료!", "success");
								}	
							}
						}) 			    	  
				  }
 			  })
		})
		
		// 간호일지 바이탈 사인 등록
		$("#vsInsertBtn").on("click", function(){
			var btn = $("#vsInsertBtn").parent().parent();
			var pntCd = $(btn).attr("id"); // pntCd
			
			var mxBp = $("#mxBp").val();
			var mnBp = $("#mnBp").val();
			var tmpe = $("#tmpe").val();
			var vsBs = $("#vsBs").val();
			var table = "<tr><td>"+mxBp+"/"+mnBp+"</td>"; table += "<td>"+tmpe+"</td>"; table += "<td>"+vsBs+"</td>"; table += "<td>방금</td></tr>"; 

			
			if(mxBp.trim()=='' || mnBp.trim()=='' || tmpe.trim()=='' ||vsBs.trim()==''){
				Swal.fire("경고!", "측정값을 입력해주세요.", "warning");
				return false;
			}else{
				$("#mxBp").val(""); $("#mnBp").val(""); $("#tmpe").val(""); $("#vsBs").val("");
				var data = {"pntCd":pntCd, "vsBpMax":mxBp, "vsBpMin":mnBp, "vsTmp":tmpe, "vsBs":vsBs};
				$.ajax({
					url : "/ent/insertVital",
					method : "get",
					data : data,
					success : function(res){
						if(res >= 1){
							Swal.fire("성공", "등록 완료", "success");
							$("#vstb").append(table);
						}else{
							Swal.fire("경고!", "등록 실패", "error");
						}
					}
				})
			}
		})
		// 간호일지 코멘트 입력
		$("#cmInsertBtn").on("click", function(){
			var btn = $("#cmInsertBtn").parent().parent();
			var entCd = $(btn).attr("value"); // entCd
			var empCd = $("#maxDivEle").attr("value");
			var empNm = $("#maxDivEle").attr("name");
			
			
			var cmtxt = $("#cmtxtarea").val();
			if(cmtxt.trim() == ''){
				Swal.fire("경고!", "코멘트를 입력해주세요.", "warning");
			}else{
				var data = {"entCd":entCd, "noteContent":cmtxt, "empCd":empCd};
				
				$.ajax({
					url : '/ent/insertCareNote',
					method : 'get',
					data : data,
					success : function(res){
						if(res >= 1){
							$("#cmtxtarea").val("");
							table = "<tr class='cmTD'><td style='text-overflow:ellipsis;overflow:hidden;white-space:nowrap;' title='"+cmtxt+"'>"+cmtxt+"</td>"; table += "<td>"+empNm+"</td>"; table += "<td>방금</td></tr>"; 
							Swal.fire("성공", "등록 완료", "success");
							$("#cmTB").append(table);
						}else{
							Swal.fire("경고!", "등록 실패", "error");
						}
					}
				})
			}
			
		})

		// 퇴원하기 눌렀을 때.
		$(".leaving").on("click", function(){
			var today = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];
			
			var date = new Date();
			var levdT = convertDateFormat(date);
			
			var today = new Date(today);
			
			var difference = Math.abs(today - levDt);
			var days = difference/(1000 * 3600 * 24);
			
			var trPr = $(this).parent().parent().parent().parent().parent();
			
			var pntCd = $(this).attr("pntCd");
			var entCd = $(this).attr("entCd");
			var treatCd = $(this).attr("treatCd");
			var dietCd = $(this).attr("dietCd");
			var bedNo = $(this).attr("bedNo");
			var entAmt = $(this).attr("entAmt");
			var pntNm = $(this).attr("pntNm");
			var entDt = $(this).attr("entDt");
			
			var data = {};
		    data[csrfParameter]=csrfToken;
		    data["levDt"]=levdT;
		    data["pntCd"]=pntCd; 	  data["entCd"]=entCd;
		    data["treatCd"]=treatCd;  data["dietCd"]=dietCd;
		    data["bedNo"]=bedNo; 	  data["entAmt"]=entAmt;
		    data["entDt"]=entDt;
			
				Swal.fire({
					title : "",
	 				 text : "'" + pntNm + "' 환자의 퇴원일은 '"+days+"'일 남았습니다.\n 퇴원 시키겠습니까?", 
	 				 icon : "warning",
	 				 confirmButtonText: '퇴원',
	 				showCancelButton: true
	 			}).then((result) => {
	 			      if(result.isConfirmed){
	 				   	 $.ajax({
	 				   		 url : '/ent/leaving',
	 				   		 method : 'POST',
	 				   		 data : data,
	 				   		 success : function(res){
	 				   			 if(res > 3){
	 				   				Swal.fire("", "퇴원처리에 성공했습니다.", "success");
	 				   				$(trPr).hide();
	 				   			 }else{
	 				   				Swal.fire("", "퇴원처리에 실패했습니다.", "error");
	 				   			 }
	 				   		 }
	 				   	 })
	 			      }
	 			})

		})
		
		// 퇴원일 변경
		$(document).on("click", ".levDtOvertime", function(){
			entCd = $(this).attr("entCd");
			bedNo = $(this).attr("bedNo");
			dietCd = $(this).attr("dietCd");
			entDt = $(this).attr("entDt");
			$(this).find("div").show();
		})
		// 중증도 변경
		$(document).on("click", ".changeLisk", function(){
			entCd = $(this).attr("entCd");	
			$(this).find("div").show();
		})
		$(document).on("click", ".cancleBtn", function(e){
			e.stopPropagation();
			$(".adaLevDt").val("");
			$(this).parent().hide();
		})
		
		$(document).on("click", ".updateLiskBtn", function(e){
			e.stopPropagation();
			var entCd = $(this).attr("entCd");
			var pr = $(this).prev().prev().attr("id");
			var va = $("#" + pr+ " option:selected").val();
			var vaNm = "";
			var data = {"entCd":entCd, "liskCd":va};
			var prTd = $(this).parent().prev();
			console.log(prTd);
			console.log(data);
			if(va != 0){
				$.ajax({
					url : '/ent/updateLiskCd',
					method : 'get',
					data : data,
					success : function(res){
						if(res > 0){
							if(va == "LK1"){vaNm = "비응급"; $(prTd).attr("class", "badge badge-success")};
							if(va == "LK2"){vaNm = "응급"; $(prTd).attr("class", "badge badge-warning")};
							if(va == "LK3"){vaNm = "긴급"; $(prTd).attr("class", "badge badge-danger")};
							$(".addEntDate").hide();
							Swal.fire("알림", "중증도 변경", "success");
							$(prTd).empty();
							$(prTd).append(vaNm);
						}else{
							Swal.fire("경고", "중증도 변경 실패", "error");
						}
					}
				})
			}else{
				swal("경고!", "중증도를 선택 해주세요.", "warning")
			}
		})
		
		$(document).on("click", ".addLevDtBtn", function(e){
			e.stopPropagation();
			var newlevDt = $(this).parent().find("input").val();
			var reallevDt = new Date(newlevDt);
			
			var data = {"levDt":newlevDt, "entCd":entCd, "bedNo":bedNo, "dietCd":dietCd, "entDt":entDt};
			
			var leaving = $(".leaving");
			
			for(var i = 0; i < leaving.length; i++){
				if($(leaving[i]).attr("entCd") == entCd){
					$(leaving[i]).attr("levDt", newlevDt);
				}
			}
			if(newlevDt == ''){
				Swal.fire("경고!", "퇴원일을 입력해주세요.", "warning");
				return false;
			}
			var today = new Date();
			today.setDate(today.getDate() - 1);
			if(reallevDt < today){
				Swal.fire("경고!", "이전일은 선택할 수 없습니다.", "warning");
				return false;
			}
			
			var prTd = $(this).parent().prev();
			$.ajax({
				url : '/ent/updateLevDt',
				method : 'get',
				data : data,
				success : function(res){
					if(res >= 0){
						$(prTd).empty();
						$(prTd).append(newlevDt);
						Swal.fire("알림", "퇴원일 갱신 성공", "success");
						$(".addEntDate").hide();
					}
				}
			})
			
		})
		
			// 환자 일정 눌러을 때
			$(".entSchedule").on("click", function(){
				$(".drugCnt").empty();
				
				var entCd = $(this).attr("entCd"); // entCd   // 일단 필요 없음====
				var pntCd = $(this).attr("pntCd"); // pntCd
				var pntNm = $(this).attr("pntNm"); // pntNm  
				var treatCd = $(this).attr("treatCd"); // treatCd
				var entDt = $(this).attr("entDt");
				var levDt = $(this).attr("levDt");
				
				$("#scModalHeader").attr("entCd", entCd);
				$("#scModalHeader").attr("pntCd", pntCd);
				$("#scModalHeader").attr("pntNm", pntNm);
				$("#scModalHeader").attr("treatCd", treatCd);
				$("#scModalHeader").html(pntNm + " 환자 일정");
				$("#drugDate").attr("max", levDt);
				$("#drugDate").attr("min", entDt);
			})
			// 주사/외용/기타/내복 윈도우 새창 열기
			$(".drugBtn").on("click", function(){
				var keyword = this.id;
				console.log(keyword);
				window.open("/ent/drugList?keyword="+keyword, "zusaList", "width=430, height=550, resizable=no, left=450px, top=200px");
				
			})
			// 선택한 약들 지우기
			$(document).on("click", ".selectedDrug", function(){
				$(this).remove();
			})
			
			// 누른 투약 나오기 script
			$(".btn-lg").on("click", function(){
				var btnValue = $(this).attr("value"); // 주사, 외용, 내복, 기타
				var child = $(".mdlBodyTop").children();
				
				for(var i = 0; i < child.length; i++){
					$(child[i]).hide();
					$(child[i]).find("div").html("");
				}
				
				$("."+btnValue).show();
			})
			// 투약 등록버튼 누르기
			$("#drugRegistBtn").on("click", function(){
				var pc = $("#scModalHeader").attr("pntCd");
				var tc = $("#scModalHeader").attr("treatCd");
				var empCd = $("#maxDivEle").attr("value"); 
				var drugDate = $("#drugDate").val();
				var drugTime = $("#drugTime").val();
				var drugRepeat = $("#drugRepeat").val();
				var chp = $(".drugCnt").children();  // chp 하나 하나 당 drugCd를 가지고 drugAmt를 가짐
				var today = new Date();
				
				var dgDate = new Date(drugDate);
				
				today.setDate(today.getDate() - 1);
				if(dgDate < today){
					Swal.fire("경고!", "이전일은 선택할 수 없습니다.", "warning");
					return false;
				}
				if(chp.length < 1){
					Swal.fire("경고", "투약할 약을 선택해주세요.", "warning");
				}

				drugDate = drugDate.replaceAll("-", "") + ''+ drugTime.replace(":", "");
				console.log(drugDate);
				
				for(var i = 0; i < chp.length; i++){
					var drugCd = $(chp[i]).attr("drugCd");
					var drugAmt = $(chp[i]).attr("drugAmt");
					
					var data = {"pntCd":pc, "treatCd":tc, "injDt":drugDate, "drugRepeat":drugRepeat, "drugCd":drugCd, "drugAmt":drugAmt, "empCd":empCd};
					console.log(data);
					
					$.ajax({
						url : '/ent/insertInject',
						method : 'get',
						data : data,
						async : false,
						success : function(res){
							Swal.fire("성공", "투약 등록 성공했습니다.", "success");
						}
					})
				}
			})
			
			// 환자 상세정보 
			$(document).on("click", ".detailModal", function(){
				var pntCd = $(this).attr("name"); // pntCd
				
				if(pntCd=='null'){
					return false;					
				}
				$("#myModalDetail").modal("show");
							
				
				data2 = {};
			    data2[csrfParameter]=csrfToken;
			    data2["pntCd"]=pntCd;
				
				$.ajax({
					url : '/ent/getEntDetail',
					method : 'post',
					data : data2,
					success : function(res){
						$("#dtPntNm").val(res.pntNm);
						$("#dtPntTr").val(res.treatOp);
						$("#dtLkCd").val(res.liskCd);
						var prno = maskingFunc.rrn(res.pntPrno);
						$("#dtPntPr").val(prno);
						$("#dtPntTel").val(res.pntHp);
						$("#dtPntAd").val(res.pntAddr);
						$("#dtPntCr").val(res.prtcrNm);
						$("#dtPntCrT").val(res.prtcrTel);
						$("#dtPntChr").val(res.chrDr);
						$("#dtPntDit").val(res.dietNm);
						$("#dtPntAmt").val(res.entAmt);
						$("#dtBpm").text(res.vsBpMax + "/" + res.vsBpMin);
						$("#dtTemp").text(res.vsTmp);
						$("#dtBlood").text(res.vsBs);
						if(res.vsDt != null){
							$("#dtVsDt").text(res.vsDt);
						}
					}
				})
		        var calendarEl = document.getElementById('calendar');
				events = [];
				getEvents();
				setTimeout(calInsert, 200, events);
			
			})

			$(document).on("click", ".clickBed", function(){
				var bed = $(this).attr("bed");
				var bedNo = bed.substr(0, 2);
				clickPosition();
				$("#" + bedNo).click();
				setTimeout(function(){
					$("#" + bed).click();
				}, 200)
			})
			
			function calInsert(events){
					console.log(events);
				    var calendarEl = document.getElementById('calendar');
				    
			        var calendar = new FullCalendar.Calendar(calendarEl, {
			        	events : events,
			        	initialView: 'dayGridMonth',
			        	selectable : true,
			        	eventTimeFormat: {
						    hour: '2-digit',
						    minute: '2-digit',
						    hour12: false
						},
						eventDidMount: function(info) {
							var contents = "";
							if(info.event.extendedProps.status == '입원'){
								contents += "<table class='alert alert-danger tippyBox'>";
								contents += "<tr><td colspan='2' style='text-align:center; font-size:1.2em;'>입원</td></tr>";
								contents += "<tr><td>&nbsp;입원기간</td><td>"+info.event.extendedProps.description+"</td></tr>";
								contents += "<tr><td>&nbsp;예상금액</td><td>"+info.event.extendedProps.content+"</td></tr>";
								contents += "</table>";
							}else{
								contents += "<table class='alert alert-danger tippyBox'>";
								contents += "<tr><td colspan='2' style='text-align:center; font-size:1.2em;'>투약</td></tr>";
								contents += "<tr><td>&nbsp;약명</td><td>"+info.event.extendedProps.description+"</td></tr>";
								contents += "<tr><td>&nbsp;담당자</td><td>"+info.event.extendedProps.status+"</td></tr>";
								contents += "<tr><td>&nbsp;분류</td><td>"+info.event.extendedProps.content+"</td></tr>";
								contents += "</table>";
							}
							tippy(info.el, {
								content: contents 
							    ,placement: 'bottom' 
								,arrow : true
								,allowHTML : true
								,theme: 'tomato'
								,maxWidth : 400
							    });
						},
						eventClick : function(info){
							if(info.event.extendedProps.status != '입원'){
								var injCd = info.event.extendedProps.injCd;
								var admst = info.event.extendedProps.admst;
								var entDt = info.event.extendedProps.entDt;
								var levDt = info.event.extendedProps.levDt;
								
								var data = {};
							    data[csrfParameter]=csrfToken;
							    data["injCd"]=injCd;
							    
								Swal.fire({
					 				 title : "변경 및 삭제하시겠습니까?",
							    	 showDenyButton: true,
							    	 showCancelButton: true,
							    	 confirmButtonText: '변경',
							    	 denyButtonText: '삭제'
								}).then((result) => {
									if(result.isConfirmed){//변경
										
										window.open("/ent/updateInject?injCd="+injCd + "&admst=" + admst + "&entDt=" + entDt + "&levDt=" + levDt, "updateInject", "width=550, height=500, resizable=no, left=450px, top=200px");
									
									}else if(result.isDenied){//삭제
										$.ajax({
											url : '/ent/deleteInjection',
											method : 'post',
											data : data,
											success : function(res){
												if(res > 0){
													Swal.fire("성공", "삭제에 성공했습니다.", "success");
													newEvents();
												}else{
													Swal.fire("실패", "삭제에 실패했습니다.", "error");
												}
											}
										})
									}
								})
							}
						}
			        });
			        
			        calendar.render();
				}
	})
	function newEvents(){
		var v_par = $("#calendar").parent();
		$("#calendar").remove();
		v_par.append($('<div class="alert alert-warning detailMdBody2" id="calendar"></div>'));
		events.splice(0,events.length); //배열 지우깅
		getEvents();
		setTimeout(calInsert, 200, events);
		console.log("나 실행 끝")
	}
	
	function getEvents(){
        $.ajax({
			url : '/ent/getDrugSchedule',
			method : 'post',
			data : data2,
			async : false,
			success : function(res){
				$.each(res, function(i, v){
                    events.push({
        				title : v.admst,
        				start : v.injDt1 + "T" + v.injDt2,
        				description : v.drugNm,
        				color : 'red',
        				status : v.empNm,
        				content : v.cdNm,
        				injCd : v.injCd,
        				admst : v.admst,
        				entDt : v.entDt,
        				levDt : v.levDt
                     })
				})
			}
		})
		$.ajax({
			url : '/ent/getEntLevDt',
			method : 'post',
			data : data2,
			async : false,
			success : function(res){
				
                events.push({
    				title : res.pntNm + ' 환자 입원기간',
    				start : res.entDt,
    				end : res.levDt,
    				description : res.entDt + " ~ " + res.levDt,
    				color : '#b9ceac',
    				content : res.entAmt,
    				status : '입원'
                 })
			}
		})
	}
	function calInsert(events){
		console.log(events);
	    var calendarEl = document.getElementById('calendar');
	    
        var calendar = new FullCalendar.Calendar(calendarEl, {
        	events : events,
        	initialView: 'dayGridMonth',
        	selectable : true,
        	eventTimeFormat: {
			    hour: '2-digit',
			    minute: '2-digit',
			    hour12: false
			},
			eventDidMount: function(info) {
				var contents = "";
				if(info.event.extendedProps.status == '입원'){
					contents += "<table class='alert alert-danger tippyBox'>";
					contents += "<tr><td colspan='2' style='text-align:center; font-size:1.2em;'>입원</td></tr>";
					contents += "<tr><td>&nbsp;입원기간</td><td>"+info.event.extendedProps.description+"</td></tr>";
					contents += "<tr><td>&nbsp;예상금액</td><td>"+info.event.extendedProps.content+"</td></tr>";
					contents += "</table>";
				}else{
					contents += "<table class='alert alert-danger tippyBox'>";
					contents += "<tr><td colspan='2' style='text-align:center; font-size:1.2em;'>투약</td></tr>";
					contents += "<tr><td>&nbsp;약명</td><td>"+info.event.extendedProps.description+"</td></tr>";
					contents += "<tr><td>&nbsp;담당자</td><td>"+info.event.extendedProps.status+"</td></tr>";
					contents += "<tr><td>&nbsp;분류</td><td>"+info.event.extendedProps.content+"</td></tr>";
					contents += "</table>";
				}
				tippy(info.el, {
					content: contents 
				    ,placement: 'bottom' 
					,arrow : true
					,allowHTML : true
					,theme: 'tomato'
					,maxWidth : 400
				    });
			},
			eventClick : function(info){
				if(info.event.extendedProps.status != '입원'){
					var injCd = info.event.extendedProps.injCd;
					var admst = info.event.extendedProps.admst;
					var entDt = info.event.extendedProps.entDt;
					var levDt = info.event.extendedProps.levDt;

					var data = {};
				    data[csrfParameter]=csrfToken;
				    data["injCd"]=injCd;
				    
					Swal.fire({
		 				 title : "변경 및 삭제하시겠습니까",
				    	 showDenyButton: true,
				    	 showCancelButton: true,
				    	 confirmButtonText: '변경',
				    	 denyButtonText: '삭제'
					}).then((result) => {
						if(result.isConfirmed){//변경

							window.open("/ent/updateInject?injCd="+injCd +"&admst="+admst, "updateInject", "width=550, height=500, resizable=no, left=450px, top=200px");
						
						}else if(result.isDenied){//삭제
							$.ajax({
								url : '/ent/deleteInjection',
								method : 'post',
								data : data,
								success : function(res){
									if(res > 0){
										Swal.fire("성공", "삭제에 성공했습니다.", "success");
										newEvents();
									}else{
										Swal.fire("실패", "삭제에 실패했습니다.", "error");
									}
								}
							})
						}
					})
				}
			}
        });
        
        calendar.render();
	}
	
	
</script>

<!-- 세션 아이디 코드 숨겨놓기 -->
<div class="col-lg-12" id="maxDivEle" value="${loginUser.empCd}" name="${loginUser.empNm}">
	<div class="single_element">
		<div class="quick_activity">
			<div class="row">
				<div class="col-12">
					<div class="quick_activity_wrap">
						<div id="enting"
							class="single_quick_activity d-flex mainHeaderCount">
							<div class="icon">
								<img src="/resources/img/icon/wheel.svg" alt="">
							</div>
							<div class="count_content">
								<h3>
									<span class="counter">${entVOCnt}</span>
								</h3>
								<p>입원 중</p>
							</div>
						</div>
						<div id="notenting"
							class="single_quick_activity d-flex mainHeaderCount">
							<div class="icon">
								<img src="/resources/img/icon/pharma.svg" alt="">
							</div>
							<div class="count_content">
								<h3>
									<span class="counter">${waitPntCnt}</span>
								</h3>
								<p>입원 대기</p>
							</div>
						</div>
						<div id="Wdteam"
							class="single_quick_activity d-flex mainHeaderCount">
							<div class="icon">
								<img src="/resources/img/icon/cap.svg" alt="">
							</div>
							<div class="count_content">
								<h3>
									<span class="counter">${entEmpCnt}</span>
								</h3>
								<p>병동근무직원</p>
							</div>
						</div>
						<div id="entNotice" class="single_quick_activity d-flex">
							<div class="icon">
								<img src="/resources/img/bell.png">
							</div>
							<div class="count_content">
								<h3>
									<span id="notiCnt"></span>
								</h3>
								<p>알림</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="main_content_iner ">
	<div class="container-fluid p-0">
		<div class="row justify-content-center">
			<div class="col-12">
				<div class="QA_section">
					<h4 id="txtTitle">입원 중인 환자</h4>
					<button type="button" id="positionMap" class="btn btn-info"
						style="margin: 1%; float: left;">자리배치도</button>
					<button type="button" id="entList" class="btn btn-info"
						style="margin: 1%; float: left; display: none;">목록으로</button>
					<div id="searchArea" class="white_box_tittle list_header"
						style="float: right;">
						<div class="box_right d-flex lms_block">
							<div class="serach_field_2">
								<div class="search_inner">
									<form>
										<div class="search_field">
											<input type="text" id="keyword2" placeholder="이름으로 검색..."
												value="${param.keyword}">
										</div>
										<button type="button">
											<i class="ti-search"></i>
										</button>
									</form>
								</div>
							</div>
							<div class="add_button ml-10">
								<button type="button" id="searchBtn2" class="btn_1">검색</button>
							</div>
						</div>
					</div>
					<div id="entListTable" class="QA_table mb_30">
						<div id="DataTables_Table_0_wrapper"
							class="dataTables_wrapper no-footer">
							<a class="badge badge-secondary bdg" href="/ent/enting">전체</a> <a
								class="badge badge-success bdg"
								href="/ent/enting?lkCd=LK1&keyword=${param.keyword}">비응급</a> <a
								class="badge badge-warning bdg"
								href="/ent/enting?lkCd=LK2&keyword=${param.keyword}">응급</a> <a
								class="badge badge-danger bdg"
								href="/ent/enting?lkCd=LK3&keyword=${param.keyword}">긴급</a>
							<table
								class="table lms_table_active dataTable no-footer dtr-inline"
								id="DataTables_Table_0" role="grid"
								aria-describedby="DataTables_Table_0_info"
								style="width: 1586px; text-align: center;">
								<thead>
									<tr role="row">
										<th id="th1" scope="col" class="sorting_asc" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 143px;" aria-sort="ascending"
											aria-label="title: activate to sort column descending">
											환자명</th>
										<th id="th2" scope="col" class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 180px;"
											aria-label="Category: activate to sort column ascending">
											환자 연락처</th>
										<th id="th2" scope="col" class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 100px;"
											aria-label="Category: activate to sort column ascending">
											중증도</th>
										<th id="th2" scope="col" class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 140px;"
											aria-label="Category: activate to sort column ascending">
											식단</th>
										<th id="th3" scope="col" class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 110px;"
											aria-label="Teacher: activate to sort column ascending">
											자리</th>
										<th id="th4" scope="col" class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 120px;"
											aria-label="Lesson: activate to sort column ascending">
											담당의</th>
										<th id="th5" scope="col" class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 180px;"
											aria-label="Enrolled: activate to sort column ascending">
											퇴원일</th>
										<th id="th6" scope="col" class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 140px;"
											aria-label="Price: activate to sort column ascending">
											보호자 연락처</th>
										<th id="th7" scope="col" class="sorting" tabindex="0"
											aria-controls="DataTables_Table_0" rowspan="1" colspan="1"
											style="width: 90px;"
											aria-label="Status: activate to sort column ascending">
											비고</th>
									</tr>
								</thead>
								<tbody id="tbdy">
									<c:forEach var="ent" items="${entVO}" varStatus="status">
										<tr role="row">
											<th scope="row" class="sorting_1"
												style="color: black; font-size: 1.1em; font-weight: bold;">${ent.pntNm}</th>
											<td>${ent.pntHp}</td>
											
											<td class="changeLisk">
												<c:if test="${ent.liskCd eq 'LK1'}">
													<span class="badge badge-success forEmpty">비응급</span>
												</c:if> 
												<c:if test="${ent.liskCd eq 'LK2'}">
													<span class="badge badge-warning forEmpty">응급</span>
												</c:if> 
												<c:if test="${ent.liskCd eq 'LK3'}">
													<span class="badge badge-danger forEmpty">긴급</span>
												</c:if>
												<div class="addEntDate">
													<select id="${status.count}" class="nice_select selLisk">
							      						<option value="0">중증도 선택</option>
							      						<option value="LK1">비응급</option>
							      						<option value="LK2">응급</option>
							      						<option value="LK3">긴급</option>
							      					</select>
													<button class="btn btn-success updateLiskBtn" entCd="${ent.entCd}">변경</button>
													<button class="btn btn-danger cancleBtn">취소</button>
												</div>
											</td>
											<td>${ent.dietNm}</td>
											<td class="clickBed" bed="${ent.bed}">${ent.bed}</td>
											<td>${ent.chrDr}</td>
											
											<td class="levDtOvertime" id="levDtTd" entCd="${ent.entCd}" bedNo="${ent.bedNo}" dietCd="${ent.dietCd}" entDt="${ent.entDt}">
												<span class="forEmpty">${ent.levDt}</span>
												<div class="addEntDate">
													<input type="date" class="adaLevDt">
													<button class="btn btn-success addLevDtBtn">변경</button>
													<button class="btn btn-danger cancleBtn">취소</button>
												</div>
											</td>
											
											<td>${ent.prtcrTel}</td>
											<td>
												<div class="amoutn_action d-flex align-items-center">
													<div class="dropdown ml-4">
														<a class=" dropdown-toggle hide_pils" href="#"
															role="button" id="dropdownMenuLink"
															data-toggle="dropdown" aria-haspopup="true"
															aria-expanded="false"> <i class="fas fa-ellipsis-v"></i>
														</a>
														<div class="dropdown-menu dropdown-menu-left"
															aria-labelledby="dropdownMenuLink"
															x-placement="bottom-end"
															style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-147px, 23px, 0px);">
															<p class="dropdown-item detailModal" id="${ent.entCd}"
																value="${ent.pntNm}" name="${ent.pntCd}"
																style="cursor: pointer;">상세정보</p>
															<p class="dropdown-item careNote" id="${ent.entCd}"
																value="${ent.pntNm}" name="${ent.pntCd}"
																data-toggle="modal" data-target="#myModal"
																style="cursor: pointer;">간호일지</p>
															<p class="dropdown-item entSchedule" data-toggle="modal"
																data-target="#entScModal" entCd="${ent.entCd}"
																pntCd="${ent.pntCd}" pntNm="${ent.pntNm}"
																treatCd="${ent.treatCd}" entDt="${ent.entDt}" levDt="${ent.levDt}" style="cursor: pointer;">투약등록</p>
															<p class="dropdown-item leaving"
																style="cursor: pointer; color: red;"
																levDt="${ent.levDt}" pntCd="${ent.pntCd}" entDt="${ent.entDt}"
																entCd="${ent.entCd}" entAmt="${ent.entAmt}"
																bedNo="${ent.bedNo}" treatCd="${ent.treatCd}"
																dietCd="${ent.dietCd}" pntNm="${ent.pntNm}">퇴원처리</p>
														</div>
													</div>
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			<a id="excelDown" href="/downloadExcelFile?where=enting" class="btn btn-outline-primary">엑셀 다운로드</a>
			</div>
		</div>
<!-- 병동 자리배치도 뽑기====================================================================== -->
<div id="positionArea" style="display:none;">
	<div class="alert alert-success" style="height:630px; width: 100%;">
	  	<div id="BAside" class="alert alert-danger type2" style="overflow-y:scroll; width:15%; height: 600px; float:left;">
	 <ul class="tree">
	   <li>
	     <input type="checkbox" id="root">
	     <label for="root" id="wardInfo">병동정보</label>
	     <ul>
	     <c:forEach var="wardVO" items="${wardVOList}">
	       <li>
	         <input type="checkbox" id="node${wardVO.wardCls}">
	         <label for="node${wardVO.wardCls}" class="roomInfo">${wardVO.wardCls}&nbsp;동</label>
	         <ul>
	         	<c:forEach var="roomVO" items="${wardVO.roomVO}">
	         		<li id="${roomVO.roomCls}" class="getRoom">${roomVO.roomCls}&nbsp;호</li>
	         		<li style="font-size:0.7em;color:red;">( ${roomVO.ingBed} / ${roomVO.allBed} )</li>
	         	</c:forEach>
	         </ul>
	       </li>
	       </c:forEach>
	     </ul>
	   </li>
	 </ul>
	  	</div>
	  	<div id="BigNav">
	  		<div id="BNav"></div>
	   	</div>
	</div>
	   <div class="modal-footer" id="BFooter">
	     <button type="button" id="positioning" class="btn btn-success positionBed" style="float: left;" >위치 변경</button>
	 	 <button type="button" id="positionSave" class="btn btn-success positionSave" style="float: left; display:none;">위치 저장</button>
	 	 <button type="button" id="cancleBtn" class="btn btn-danger positionCancle" style="float: left; display:none;">취소</button>
	  </div>
</div>
	
	</div>
</div>



<!-- 간호일지  -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel2" aria-hidden="true">
	<div class="modal-dialog modal-dialog-slideout" role="document"
		style="width: 50%;">
		<div class="modal-content">
			<div class="modal-header">
				<div style="float: left;">
					<h5 class="modal-title align-right" id="exampleModalLabel"
						style="font-weight: bolder; font-size: 20px;"></h5>
				</div>
			</div>
			<div class="modal-body" style="height: 100%; width: 100%;">
				코멘트
				<div class="alert alert-warning type2" id="careNoteContent"
					style="height: 150px; overflow-y: scroll;"></div>
				<p>바이탈 사인</p>
				<div class="alert alert-danger type2" id="vitalSignContent"
					style="height: 150px; overflow-y: scroll;"></div>
				<table style="width: 100%; text-align: center;">
					<tr>
						<td style="width: 25%;">최고 혈압</td>
						<td style="width: 25%;">최저 혈압</td>
						<td style="width: 25%;">체온</td>
						<td style="width: 25%;">혈당</td>
					</tr>
					<tr>
						<td><input type="text" id="mxBp" style="width: 100%;"></td>
						<td><input type="text" id="mnBp" style="width: 100%;"></td>
						<td><input type="text" id="tmpe" style="width: 100%;"></td>
						<td><input type="text" id="vsBs" style="width: 100%;"></td>
					</tr>
				</table>
				<button class="btn btn-primary" id="vsInsertBtn" type="button"
					style="display: block; margin-left: 90.8%;">등록</button>
				<div></div>
				<hr>
				<p>코멘트</p>
				<textarea id="cmtxtarea" rows="5" cols="100"></textarea>
				<button class="btn btn-primary" id="cmInsertBtn" type="button"
					style="margin-bottom: 4%;">등록</button>
			</div>
			<div class="modal-footer">
				<button type="button" id="detailModalCloseBtn"
					class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- 환자 상세 정보 !@!@ -->
<!-- 상세정보 조회 modal -->
<div class="modal fade" id="myModalDetail" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel2" aria-hidden="true">
	<div class="modal-dialog modal-dialog-slideout" role="document">
		<div class="modal-content">
			<div class="modal-header">상세정보</div>
			<div class="modal-body type2" style="height: 665px; width: 100%;">
				<div class="alert alert-success detailMdBody">
					<div class="detailEle">
						<label class="forwardWard">환자명</label><input type="text"
							id="dtPntNm" disabled>
					</div>
					<div class="detailEle">
						<label class="forwardWard">상병</label><input type="text"
							id="dtPntTr" disabled>
					</div>
					<div class="detailEle">
						<label class="forwardWard">중증도</label><input type="text"
							id="dtLkCd" disabled>
					</div>
					<div class="detailEle">
						<label class="forwardWard">주민번호</label><input type="text"
							id="dtPntPr" disabled>
					</div>
					<div class="detailEle">
						<label class="forwardWard">연락처</label><input type="text"
							id="dtPntTel" disabled>
					</div>
					<div class="detailEle">
						<label class="forwardWard">주소</label><input type="text"
							id="dtPntAd" disabled>
					</div>
					<div class="detailEle">
						<label class="forwardWard">보호자명</label><input type="text"
							id="dtPntCr" disabled>
					</div>
					<div class="detailEle">
						<label class="forwardWard">연락처</label><input type="text"
							id="dtPntCrT" disabled>
					</div>
					<div class="detailEle">
						<label class="forwardWard">담당의</label><input type="text"
							id="dtPntChr" disabled>
					</div>
					<div class="detailEle">
						<label class="forwardWard">식단</label><input type="text"
							id="dtPntDit" disabled>
					</div>
					<div class="detailEle">
						<label class="forwardWard">입원비용</label><input type="text"
							id="dtPntAmt" disabled>
					</div>
					<br> <label style="width: 30%; font-weight: bold;">최근
						바이탈 : </label><span id="dtVsDt"></span>
					<table style="width: 100%; text-align: center;">
						<tr style="font-weight: bold; background-color: #b9ceac;">
							<td style="width: 100px;">혈압</td>
							<td>체온</td>
							<td>혈당</td>
						</tr>
						<tr style="height: 60px;">
							<td id="dtBpm"></td>
							<td id="dtTemp"></td>
							<td id="dtBlood"></td>
						</tr>
					</table>
				</div>
				<div class="alert alert-warning detailMdBody2" id="calendar"></div>
			</div>
			<div class="modal-footer">
				<button type="button" id="detailModalCloseBtn"
					class="btn btn-secondary" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- 퇴원일 변경  -->
<div class="dateModal" style="display: none;">
	<div class="dateModalHeader"></div>
	<div class="dateModalBody">
		<input type="date" id="addEntDate" style="display: none;">
	</div>
</div>

<!-- 환자 일정 모달 -->
<div class="modal fade" id="entScModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel2" aria-hidden="true">
	<div class="modal-dialog modal-dialog-slideout" role="document"
		style="width: 40%;">
		<div class="modal-content" style="height: 90%;">
			<div class="modal-header" id="scModalHeader"></div>
			<div class="modal-body type2" style="height: 100%; width: 100%;">
				<div class="btnMoem alert alert-secondary">
					<button type="button" class="btn btn-secondary btn-lg"
						value="mdlBodyTopCnt1">주사</button>
					<button type="button" class="btn btn-secondary btn-lg"
						value="mdlBodyTopCnt2">내복</button>
					<button type="button" class="btn btn-secondary btn-lg"
						value="mdlBodyTopCnt3">외용</button>
					<button type="button" class="btn btn-secondary btn-lg"
						value="mdlBodyTopCnt4">기타</button>
				</div>
				<div class="mdlBodyTop">
					<div class="mdlBodyTopCnt1 alert alert-success box">
						<button type="button" id="주사"
							class="btn btn-primary btn-block drugBtn">+ 주사</button>
						<br>
						<div class="drugCnt type2"></div>
					</div>

					<div class="mdlBodyTopCnt2 alert alert-danger box"
						style="display: none;">
						<button type="button" id="내복"
							class="btn btn-primary btn-block drugBtn">+ 내복</button>
						<br>
						<div class="drugCnt type2"></div>
					</div>

					<div class="mdlBodyTopCnt3 alert alert-primary box"
						style="display: none;">
						<button type="button" id="외용"
							class="btn btn-primary btn-block drugBtn">+ 외용</button>
						<br>
						<div class="drugCnt type2"></div>
					</div>

					<div class="mdlBodyTopCnt4 alert alert-secondary box"
						style="display: none;">
						<button type="button" id="기타"
							class="btn btn-primary btn-block drugBtn">+ 기타</button>
						<br>
						<div class="drugCnt type2"></div>
					</div>
				</div>

				<div class="alert alert-warning" style="width: 100%; height: 30%;">
					<table style="width: 100%; text-align: center; margin-bottom: 10%;">
						<tr>
							<td>투약일</td>
							<td>투약시</td>
							<td>반복일</td>
						</tr>
						<tr>
							<td><input type="date" id="drugDate" style="width: 100%;"></td>
							<td><input type="time" id="drugTime" style="width: 100%;"></td>
							<td><input type="text" id="drugRepeat" value="1"
								style="width: 50%;"></td>
						</tr>
					</table>
					<button type="button" id="drugRegistBtn"
						class="btn btn-success btn-block"
						style="width: 70%; margin-left: 15%;">등록</button>
				</div>

			</div>
			<div class="modal-footer">
				<button type="button" id="entScModal" class="btn btn-secondary"
					data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>

<!-- 우측 슬라이드 메뉴 -->
<div id="mask"></div>
<div class="slide_notice type2">
	<div class="menu_close" style="padding: 5%;">
		<p style="color: white; text-align: center; font-weight: 1.4em;">입원
			상세 알림</p>
		<button type="button" class="btn_menu_close">닫기</button>
	</div>
	<ul class="menu_list" id="noticeContent">
	</ul>
</div>
<!-- 우측 슬라이드 메뉴 끝 -->
<script src="/resources/js/entCommon.js"></script>


<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script>
const fnSetDataYeyekTable = () => {
	$('#yeyakTb').DataTable({
		"data": ${patientVO},
		"dataSrc": "",
		"columns": [
			{ 'data': 'pntNm', "className": "text-center" },
			{ 'data': 'pntPrno', "className": "text-center" },
			{ 'data': 'pntSex', "className": "text-center" },
			{ 'data': 'pntHp', "className": "text-center" },
		],
		"bLengthChange": false, // thought this line could hide the LengthMenu
		"pageLength": 5,
		"language": {
			"emptyTable": "검색결과가 존재하지 않습니다.",
			"info": "총 _TOTAL_명   _START_에서 _END_까지 표시",
			"search": "환자검색 : ",
			"zeroRecords": "일치하는 환자가 없습니다.",
			"paginate": {
				"first": "처음",
				"last": "마지막",
				"next": "다음",
				"previous": "이전"
			},
		}
	});
}

const fnSelectDetailMedical = (row) => {
	$('.injectList').empty();
	pntCd = row.pntCd;
	pntNm = row.pntNm;
	$('#datePatientCd').val(pntCd);
	$('#selectPatient').text(pntNm+"님");
	data = {};
    data["pntCd"] = pntCd;
    $.ajax({
		url:"/inject/injectDetail",
		data: data,
		method:"get",
		success: function(res){
			fnSetDataToyakTable(res);
		}
    });
}

const fnSetDataToyakTable = (res) => {
		
	$("#selectPatient").val();
	$('#choiceComment').hide();
	$('#toyakTb').DataTable({
		"data": JSON.parse(res),
		"dataSrc": "",
		"columns": [
			{ 'data': 'drugNm', "className": "text-center" },
			{ 'data': 'injDt', "className": "text-center" },
			{ 'data': 'empNm', "className": "text-center" },
		],
		"bLengthChange": false, // thought this line could hide the LengthMenu
		"destroy": true,
		"pageLength": 5,
		"language": {
			"emptyTable": "투약내역이 존재하지 않습니다.",
			"info": "총 _TOTAL_,   _START_에서 _END_까지 표시",
// 			"search": "환자명 : ",
			"zeroRecords": "일치하는 환자가 없습니다.",
			"paginate": {
				"first": "처음",
				"last": "마지막",
				"next": "다음",
				"previous": "이전"
			},
		}
	});
}

$(function(){	
	$(".table").on('mouseover', 'tbody tr', function () {
		$(".table tbody tr").css("background", "white");
		$(this).css("background", "#dee2e6");
	});
	$(".table").on('click', 'tbody tr', function () {
		$(this).css("background", "#dee2e6");
	});
	
	fnSetDataYeyekTable();
	
	$("#yeyakTb").on('click', 'tbody tr', function () {
		var row = $("#yeyakTb").DataTable().row($(this)).data();
		fnSelectDetailMedical(row);
	});
	
	//기간 선택 시
	$('.injectRange').on('change', function(){
		selectDate = $(this).val();
		var today = new Date();
		var year = today.getFullYear();
		var month = ('0' + (today.getMonth() + 1)).slice(-2);
		var day = ('0' + today.getDate()).slice(-2);
		var edate = year + month + day;
		switch(selectDate){
			case "1":
				month = ('0' + today.getMonth()).slice(-2);
				$('.searchDate').attr("hidden",true);
				break;
			case "3":
				month = ('0' + (today.getMonth() -2)).slice(-2);
				$('.searchDate').attr("hidden",true);
				break;
			case "6":
				month = ('0' + (today.getMonth() -5)).slice(-2);
				$('.searchDate').attr("hidden",true);
				break;
			case "12":	
				year = year -1 ;
				$('.searchDate').attr("hidden",true);
				break;
			case "0":
				$('.searchDate').attr("hidden",false);
				break;
			case "00":
				$('.searchDate').attr("hidden",true);
				break;	
		} 
		
		var sdate = year + month + day;
		$('.injectList').empty();
		pntCd = $('#datePatientCd').val();
		pntNm = $(this).text();
		data = {};
        data["pntCd"] = pntCd;
        data["sDate"] = sdate;
        data["eDate"] = edate;
        $.ajax({
			url:"/inject/injectDetail",
			data: data,
			method:"get",
			success: function(res){
				fnSetDataToyakTable(res);
			}
        });
	});
	
	
	$('#eDate').on('change', function(){
		pntCd = $('#datePatientCd').val();
		sdate = $('#sDate').val();
		edate = $(this).val();
		data = {};
			data["pntCd"] = pntCd;
			data["startDate"] = sdate.replaceAll("-", "");
			data["endDate"] = edate.replaceAll("-", "");
		if(sdate > edate){
			alert("종료일은 시작일 이후여야 합니다.다시 선택 해주세요.")
			$(this).val("");
		}else{
// 			$('.injectList').empty();
			$.ajax({
				url:"/inject/injectDetail",
				data: data,
				method:"get",
				dataType:"json",
				success: function(res){
					fnSetDataToyakTable(res);
				}
	        });
		};
	});
	
	// 투약목록에서 클릭 시 
	$("#toyakTb").on('click', 'tbody tr', function () {
		var row = $("#toyakTb").DataTable().row($(this)).data();

		$('.injectDetail').empty();
		injCd = row.injCd;
		
		data={};
		data["injCd"] = injCd;
		
		$.ajax({
				url:"/inject/injectDetail",
				data: data,
				method:"get",
				dataType:"json",
				success: function(v){
				var res = JSON.parse(v);
				str = "";
				str += '<tbody>'
				str += '<tr role="row" class="addTr">'
				str += '<td width="16.667%" colspan="10" style="background-color: #EFF1F7">의약품코드</td>'
				str += '<td width="16.667%" colspan="10"><input class="injectInput" type="text" id="secNm" value="'+ res[0].drugCd +'"></td>'
				str += '<td width="16.667%" colspan="10" style="background-color: #EFF1F7">의약품명</td>'
				str += `<td width="16.667%" colspan="10"><input class="injectInput" type="textarea" id="operCd" value="\${res[0].drugNm}"></td>`
				str += `</tr>`
				str += `<tr role="row" class="">`
				str += `<td width="16.667%" colspan="10" style="background-color: #EFF1F7">투약일시</td>`
				str += `<td width="16.667%" colspan="10"><input class="injectInput" type="text" id="pntNm" value="\${res[0].injDt}"></td>`
				str += `<td width="16.667%" colspan="10" style="background-color: #EFF1F7">투약량</td>`
				str += `<td width="16.667%" colspan="10"><input class="injectInput" type="text" id="pntAge" value="\${res[0].drugStnd}\${res[0].drugUnit}"></td>`
				str += `</tr>`
				str += `<tr role="row" class="">`
				str += `<td width="16.667%" colspan="10" style="background-color: #EFF1F7">투약횟수</td>`
				str += `<td width="16.667%" colspan="10"><input class="injectInput" type="text" id="opRoomNo" value="\${res[0].injCnt} 회"></td>`
				str += `<td width="16.667%" colspan="10" style="background-color: #EFF1F7">투약금액</td>`
				str += `<td width="16.667%" colspan="10"><input class="injectInput" type="text" id="operYmd" value="\${res[0].injAmt} 원"></td>`
				str += `</tr>`
				str += `<tr role="row" class="">`
				str += `<td colspan="8" style="background-color: #EFF1F7">담당직원</td>`
				str += `<td colspan="52"><input class="injectInput" type="text" id="disNm" value="\${res[0].empNm}"></td>`
				str += `</tr>`
			    str += `</tbody>`
			    
			    $('.injectDetail').append(str);
			    
				$('#injectModal').modal("show");
			}
		});
	});
	
// 	$('.calendarImg').on("click", function(){
// 		console.log($('#calendarSDate'));
// 		id = $(this).attr('id');
// 		if(id == "sDate"){
// 			$('#calendarSDate').attr("hidden",false);
// 			$('#calendarSDate').click();
// 		}
// 	})
});

</script>

<style>

 .calendarImg{
 cursor: pointer;
 }
 .modal-dialog {
     max-width: 36%;
     max-height: 90%;
   }
   .modal-dialog-slideout {
     min-height: 80%;
     margin: 100 0 0 auto;
     background: #fff;
   }
   .modal.fade .modal-dialog.modal-dialog-slideout {
     -webkit-transform: translate(100%, 0)scale(1);
     transform: translate(100%, 0)scale(1);
   }
   .modal.fade.show .modal-dialog.modal-dialog-slideout {
     -webkit-transform: translate(0, 0);
     transform: translate(0, 0);
     display: flex;
     align-items: stretch;
     -webkit-box-align: stretch;
     height: 100%;
   }
   .modal.fade.show .modal-dialog.modal-dialog-slideout .modal-body {
     overflow-y: auto;
     overflow-x: hidden;
   }
   .modal-dialog-slideout .modal-content {
     border: 0;
   }
   .modal-dialog-slideout .modal-header,
   .modal-dialog-slideout .modal-footer {
     height: 4rem;
     display: block;
   }
   
   .injectInput{
   border: none;
   }
   
   input[type="date"]{
  position: relative;
  min-height:30px
  padding: 10px 12px
  border: 1px solid #ddd;
  
  font-size:15px;
}

input[type="date"]::before-webkit-clear-button,
input[type="date"]::before-webkit-inner-spin-button { 
    display: none;
} 
input[type="date"]::before-webkit-calendar-picker-indicator { 

  background-image: url("../resources/img/calendar-icon.png");
  opacity:0;
  z-index: 1;
  cursor: pointer;
} 

.input_date_box input:after{
  position: absolute;
  top:50%;
  right:10px;
  content: '';
  width: 20px;
  height:22px;

/*   background: #fff url('https://lh3.googleusercontent.com/ogw/ADea4I6bjkdf2t0DAHqD6ZP5ylrs5LMS6FOR0JxyZxHn=s83-c-mo') center center /contain; */
  transform: translateY(-50%);
  z-index: 0;
}

input[type="date"]::before {
    content:attr(data-placeholder);
    width:50%;

    color:#c3c3c3;
}

input[type="date"]:focus:before,
input[type="date"]:valid:before{
/*     display: none; */
}


</style>

<div class="main_content_iner ">
	<div class="container-fluid p-0">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="messages_box_area">
					<div class="messages_list">
					
						<div class="white_box shadow-sm mb-3" >
							<div class="message_pre_left">
								<div class="messges_info">
									<h4 class="mb-3">환자선택</h4>
									<select class="btn btn-outline-info injectRange" style="float: right;">
										<option value="00">기간선택</option>
										<option value="1">최근 1개월</option>
										<option value="3">최근 3개월</option>
										<option value="6">최근 6개월</option>
										<option value="12">최근 12개월</option>
										<option value="0">직접 선택</option>
									</select>
									<br>
									<br>
									<p class="searchDate" style="float: right;" hidden="true"><input class="btn btn-outline-danger" type="date" data-placeholder="검색 시작일" required="required" id="sDate" style="height: 6%;width: 103.5%;"></p>
									<br>
									<br>
									<p class="searchDate" style="float: right;" hidden="true"><input class="btn btn-outline-success" type="date" data-placeholder="검색 종료일" required="required" id="eDate" style="height: 6%;width: 103.5%;"></p>&nbsp;
									<br>
									<br>
								</div>
							</div>

							<table class="table" id="yeyakTb" style="border:1px solid #869cdd;">
								<thead>
									<tr>
										<th scope="col">성함</th>
										<th scope="col">생년월일</th>
										<th scope="col">성별</th>
										<th scope="col">전화번호</th>
									</tr>
								</thead>
								
							</table>
						</div>
						<!------------------- 기간선택 --------------------->
<!-- 						<div class="white_box shadow-sm"> -->
<!-- 							<div class="message_pre_left"> -->
<!-- 								<div class="messges_info"> -->
<!-- 									<input type="text" id="datePatientCd" hidden="true"> -->
<!-- 									<h4 class="mb-3">기간선택</h4> -->
<!-- 								</div> -->
<!-- 							</div> -->

<!-- 							<div id="rangeTb_wrapper" class="dataTables_wrapper no-footer"> -->
<!-- 							<table class="table dataTable no-footer" id="rangeTb" role="grid" aria-describedby="rangeTb_info" style="width: 428px;"> -->
<!-- 								<thead> -->
<!-- 									<tr role="row"> -->
<!-- 									<th class="text-center">선 택</th> -->
<!-- <!-- 									<th><button type="button" class="btn btn-outline-info injectRange" value="1" style="font-size:1px;">최근 1개월</button></th> --> 
<!-- <!-- 									<th><button type="button" class="btn btn-outline-info injectRange" value="3" style="font-size:1px;">최근 3개월</button></th> --> 
<!-- <!-- 									<th><button type="button" class="btn btn-outline-info injectRange" value="6" style="font-size:1px;">최근 6개월</button></th> --> 
<!-- <!-- 									<th><button type="button" class="btn btn-outline-info injectRange" value="12" style="font-size:1px;">최근 12개월</button></th> --> 
<!--  									<th> -->
<!-- 										<button type="button" class="btn btn-outline-info injectRange" value="1" style="font-size:1px;">최근 1개월</button> -->
<!-- 									</th> -->
<!-- 									<th> -->
<!-- 										<button type="button" class="btn btn-outline-info injectRange" value="3" style="font-size:1px;">최근 3개월</button> -->
<!-- 									</th> -->
<!-- 									<th> -->
<!-- 										<button type="button" class="btn btn-outline-info injectRange" value="6" style="font-size:1px;">최근 6개월</button> -->
<!-- 									</th>  -->
<!-- 									<th> -->
<!-- 										<button type="button" class="btn btn-outline-info injectRange" value="6" style="font-size:1px;">최근 12개월</button> -->
<!-- 									</th>  -->
<!-- 									</tr> -->
<!-- 								</thead> -->
<!-- 							<tbody> -->
<!-- 							<tr role="row" class="odd"> -->
<!-- 							<td class="text-center">직접<br>입력</td> -->
<!-- 							<td class=" text-center"><span>검색 시작일</span><img class="calendarImg" src="../resources/img/calendar-icon.png" style="width: 40%" id="sDate"><input type="date" id="calendarSDate"></td> -->
<!-- 							<td class=" text-center"><span>검색 종료일</span><img class="calendarImg" src="../resources/img/calendar-icon.png" style="width: 40%" id="eDate"><input type="date" id="calendarEDate"></td> -->
<!-- 							</tr> -->
<!-- 							</tbody> -->
<!-- 							</table> -->
<!-- 							</div> -->
<!-- 							</div> -->
					</div>

					<div class="messages_list mb_30">
						<form id="frm" name="frm" class="mb-0">
							<div class="white_box shadow-sm mb-3" style="height:103.5%;">
							<div class="message_pre_left">
								<div class="messges_info">
									<h4 id="selectPatient" style="display:inline;"></h4>&nbsp;<h4 class="mb-3" style="display:inline;">투약이력</h4>
								</div>
							</div>

							<table class="table" id="toyakTb">
								<thead>
									<tr>
										<th scope="col">의약품명</th>
										<th scope="col">투약일자</th>
										<th scope="col">담당직원</th>
									</tr>
								</thead>
								
							</table>
						<h2 id="choiceComment">환자를 선택해주세요.</h2>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="loding-center">
		<div class="spinner-border" role="status" style="display: none;">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
</div>

<!----------------- 투약상세  Modal 시작-------------------->
		<div class="modal fade" id="injectModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="exampleModalLabel">상세 투약내역</h2>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">
					   		
						<div class="col-md-9">
					<div class="white_box QA_section mb_30">
						<div class="white_box mb_30 " style="position: relative;">
							<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
								<table class="table lms_table_active dataTable no-footer dtr-inline collapsed injectDetail" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width: 764px;">

								</table>
							</div>
						</div>
					</div>
				</div>
					</div>
				</div>
			</div>
		</div>
<!----------------- 투약상세 Modal 끝-------------------->
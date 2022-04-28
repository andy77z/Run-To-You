<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet" href="/resources/vendors/niceselect/css/nice-select.css">
<link rel="stylesheet" href="/resources/css/ent/entCommon.css" type="text/css"/>

	<style>
	.sidebar_menu{
 		display: none;
        width: 40%;
        height: 100%;
        background: #e98282;
        position: absolute;
        top:0;
        left: -50%;
        z-index: 2;
    }
    	.tree, .tree ul{
	      list-style: none;
	      padding-left:10%;
	    }
	   	.pntnm{
		font-weight: bolder; 
		font-size: 20px; 
		color: black;
		}
		.gender .age{
			color: black;
		}
		.title{
			margin-right: 50px;
			color: gray;
			width: 200px;
		}
		.titlea{
			margin-right: 50px;
			color: gray;
			width: 320px;
		}
		.nti{
			width: 60px;
		}
	
		.btnset{
			position: absolute;
			left: 41%;
		}
		#bHeader{
		  width: 100%;
		  height: 60px;
		  padding: 0;
		}
      	#BAside{
			float: left;
			width: 12.8%;
			height: 500px;
      	}
      	#BNav{
      		float: right;
			width: 86.2%;
			height: 500px;
			padding: 8%;
      	}
      	.bed {
        	width: 20%;   
			margin : 0% 2% 2% 2%;
			padding:2%;
       		height : 53%;  
       		display: block; 
      	}
      	.mouseOverMenu{
      		position : relative;
      		display : inline-block;
      		margin: auto;
       		margin-top: 65px; 
       	} 
		.mouseOverMenu .tooltip{
			position: absolute;
			width: 200px;
			padding: 0;
			background-color: #D6D6D6;
			z-index: 1;
			bottom: 50%;
			left: 50%;
			margin-left: -100px;
		}
		.mouseOverMenu .tooltip::after{
			position: absolute;
			top: 100%;
			left: 50%;
			margin-left: -10px;
			border-width: 10px;
			border-color: #D6D6D6 transparent transparent transparent;
		}
		#slideMenu{
			display:none;
			position: absolute;
			z-index: 2;
			margin-left: 7%;
			margin-top: 5.4%;
			width: 30%;
			height:80%;
			background:white;
			border-radius:5%;
		}
		#mdlheader{
			margin: 0.7%;
			height: 13%;
			border-radius:10%;
			padding: 5%;
		}
		#mdlbody{
			margin: 1%;
			border : 1px solid black;
			height: 80%;
			border-radius:5%;
			padding: 5%;
		}
		#mdlbody table tr td{
			padding-left: 3%;
		}
		#mdlbody table tr td:nth-child(odd){
			font-weight:bold;
		}
		
		.nice-select{
			height: 30px;
			width: 100%;
		}
		.current{
			margin-bottom:30%;;
		}
	</style>
	<script>
		var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
		var csrfHeader = $("meta[name=_csrf_header]").attr("content");
		var csrfToken = $("meta[name=_csrf]").attr("content");
		var data = {};
    
		$(function(){
			empCd = "${loginUser.empCd}";
			setInterval(getNotiCnt, 2000, empCd);
			setInterval(insertDrugNotiContent, 60000);
		})
		
		// 환자 정보 가져오는 AJAX===================================================================================
		function modalBtn(p){
			var data = {};
		    data[csrfParameter]=csrfToken;
		    data["pntCd"]=p.value;
		    
// 			var data = {"pntCd" : p.value};
			//환자 상세정보
			$.ajax({
				url:"/patients/detail",
				method: "post",
				data: data,
				success: function(res) {
					console.log(res);
					$(".pntcd").text(res.pntCd);	$(".pntnm").text(res.pntNm)	;	$(".gender").text(res.pntSex);
					$(".age").text(res.age);		
					var prno = maskingFunc.rrn(res.pntPrno);
					$(".pno").text(prno);	
					$(".tel").text(res.pntHp);
					$(".prtnm").text(res.prtcrNm);	$(".tel2").text(res.prtcrTel);	$(".addr").text(res.pntAddr);
					$(".smk").text(res.smoking);	$(".drk").text(res.drinking);	$(".preg").text(res.pregnancy);
					$(".tem").text(res.vsTmp);		$(".wei").text(res.weight);	$(".hei").text(res.height);
					$(".bp").text(res.vsBpMax+"/" + res.vsBpMin);	$(".bs").text(res.vsBs);	$(".date").text(res.vsDt);
				}
			});
			//예약목록
			$.ajax({
				url:"/reservation/reservlist",
				method: "post",
				data: data,
				success: function(rres) {
					var listHtml='';
					if(rres!=''){
						for(var i in rres){
							
							listHtml +="<tr role='row'>";
							listHtml +="<td>"+rres[i].rsvtNo+"</td>;"
							listHtml +="<td>"+rres[i].pntNm+"</td>;"
							listHtml +="<td>"+rres[i].rsvtDt+"</td>;"
							listHtml +="<td>"+rres[i].treatStartTime+"</td>;"
							listHtml +="<td>"+rres[i].symptoms+"</td>;"
							listHtml +="<td>"+rres[i].mdlNm+"</td>;"
							listHtml +="</tr>";
						}
					}
					else{
						listHtml +="<tr role='row'>";
						listHtml +="<td colspan='6' style='text-align: center;'>환자의 예약내역이 없습니다.</td>;"
						listHtml +="</tr>";
					}
					$(".rescon").html(listHtml);
				}
			});
			//바이탈 리스트
		    $.ajax({
		      url:"/patients/vslist",
		      method: "post",
		      data: data,
		      dataType:"html",
		      traditional:"true",
		      success: function(vres) {
		         var html = $("<div>").html(vres);
		         var contents = html.find("div#vslist").html();
		         $("#vital").html(contents);
		      }
		   });		}
		
		// 입원 할 환자의 정보를 가져오는 AJAX===================================================================================================
		function enting(t){
			$("#entDate").val("");
			$("#11").click();
			
			parentTR = $(t).parent().parent();
			var data = {};
		    data[csrfParameter]=csrfToken;
		    data["pntCd"]=t.value;
// 			var data = {"pntCd":t.value};

			$.ajax({
				url : "/ent/pntModal",
				method : "post", 
				data : data,
				async : false,
				success : function(rst){
					$("#exampleModalLabel2").text(rst.pntNm + " 환자 입원수속");
					$("#regist").attr('value', rst.pntCd);
					$("#oneTD").text(rst.pntCd);
					$("#twoTD").text(rst.pntHp);
					var prno = maskingFunc.rrn(rst.pntPrno);
					$("#thrTD").text(prno);
					$("#foTD").text(rst.prtcrNm);
					$("#fiTD").text(rst.chrDr);
					$("#entingPrintBtn").attr("", );
					$("#entingPrintBtn").attr("", );
					$("#entingPrintBtn").attr("", );
					$("#entingPrintBtn").attr("", );
				}
			})
			
			var data2 = {};
		    data2[csrfParameter]=csrfToken;
			
			$.ajax({
				url : '/ent/getDiet',
				method : 'post',
				data : data2,
				success : function(res){
					$("#dietList").empty();
					var opt = "<option id='notSelect' selected>식단 선택</option>";
						
					$.each(res, function(i, v){
						opt += "<option id='"+v.dietCd+"' value='"+v.dietNm+"' name='"+v.dietAmt+"'>"+ v.dietNm +"</option>";
					})
					$("#dietList").append(opt);
					$("#dietList").niceSelect('update');
				}
			})
		}
		
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
		
		// 등록 버튼을 누르면 테두리 있는 애가 선택되어 입원 환자로 상태코드 및 ent테이블에 추가되는 코드	==================================================================================================
		function regist(){
			var selBoxId = $("#dietList option:selected").attr("id");  // 코드
// 			var selBoxVal = $("#dietList option:selected").attr("value"); // 이름
// 			var selBoxNm = $("#dietList option:selected").attr("name"); // 가격
						
			var levDt = $("#entDate").val();  // 날짜
			var liskCd = $("#liskCd option:selected").attr("value"); // 중증도
			
			if(selBoxId == "notSelect"){
				swal("경고!", "식단을 선택해주세요.", "warning");
				return false;
			}
			
			if(levDt == ''){
				swal("경고!", "퇴원일을 선택해주세요.", "warning");
				return false;
			}
			
			if(liskCd == '0'){
				swal("경고!", "중증도를 선택해주세요.", "warning");
				return false;
			}
			
			console.log("dietCd", selBoxId);
			console.log("levDt", levDt);
			console.log("liskCd", liskCd);
			
			var flag = false;
			var child = $("#BNav").children();
			var pntCd = $("#regist").val();
			var data = {};
		    data[csrfParameter]=csrfToken;
		    data["pntCd"]=pntCd;
			
		    console.log("pntCd", pntCd);
		    console.log($(child[i]).val());
		    
			if(child.length <= 0){
				swal('경고!', '등록할 위치를 선택해주세요.','warning');
				return false;
			}
			for(var i = 0; i < child.length; i++){
				if($(child[i]).css("border") == "3px solid rgb(0, 0, 0)" && $(child[i]).css("backgroundColor") == "rgb(192, 192, 192)"){

					data["bedNo"]=$(child[i]).val();
					data["dietCd"]=selBoxId;
					data["levDt"]=levDt;
					data["liskCd"]=liskCd;
					
					console.log($(child[i]).val());
					
					console.log(data);
					var st = $(child[i]).attr("id").substr(0,2);
					
					flag = true;
					$.ajax({
						url : '/ent/updateEnt',
						method : 'post',
						data : data,
						success : function(rst){
							console.log(rst);
							if(rst > 0){
								swal('알림', '등록이 완료 되었습니다.','success');
							}
							var clk = document.getElementById(st);
							clk.click();
							
							console.log("등록한 tr" + parentTR);
							$(parentTR).hide();
							
							var va = $("#enting2").text(); // 상단 명수 카운트 + or -
							var vr = $("#notenting2").text();
							
							$("#enting2").html(parseInt(va) + 1);
							$("#notenting2").html(parseInt(vr) - 1);
						}
					})
				}
			}
			if(!flag){
				swal('경고!', '이미 사용 중 입니다.','warning');
				return false;
			}
		}
		


	</script>

<!-- 환자 상세조회 -->
<div class="col-lg-12">
<div class="single_element">
	<div class="quick_activity">
		<div class="row">
			<div class="col-12">
				<div class="quick_activity_wrap">
					<div id="enting" class="single_quick_activity d-flex mainHeaderCount">
						<div class="icon">
							<img src="/resources/img/icon/wheel.svg" alt="">
						</div>
						<div class="count_content">
							<h3>
								<span id="enting2" class="counter">${entVOCnt}</span>
							</h3>
							<p>입원 중</p>
						</div>
					</div>
					<div id="notenting" class="single_quick_activity d-flex mainHeaderCount">
						<div class="icon">
							<img src="/resources/img/icon/pharma.svg" alt="">
						</div>
						<div class="count_content">
							<h3>
								<span id="notenting2" class="counter">${waitPntCnt}</span>
							</h3>
							<p>입원 대기</p>
						</div>
					</div>
					<div id="Wdteam" class="single_quick_activity d-flex mainHeaderCount">
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
			<div class="white_box_tittle list_header">
				<h4 id="txtTitle">입원 대기 중인 환자</h4>
					<div class="box_right d-flex lms_block">
					<div class="serach_field_2">
					<div class="search_inner">
				<form>
				<div class="search_field">
				<input type="text" id="keyword" placeholder="이름으로 검색...">
				</div>
				<button type="button"> <i class="ti-search"></i> </button>
				</form>
				</div>
				</div>
				<div class="add_button ml-10">
				<button type="button" id="searchBtn" class="btn_1">검색</button>
				</div>
				</div>
				</div>
				<div class="QA_table mb_30">
				
				<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
				<table class="table lms_table_active dataTable no-footer dtr-inline" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width: 1586px; text-align: center;">
				<thead>
				<tr role="row">
					<th id="th1" scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="background-color:#ffae69; width: 143px;" aria-sort="ascending" aria-label="title: activate to sort column descending">
						환자명</th>
					<th id="th2" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="background-color:#ffae69; width: 219px;" aria-label="Category: activate to sort column ascending">
						전화번호</th>
					<th id="th3" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="background-color:#ffae69; width: 110px;" aria-label="Teacher: activate to sort column ascending">
						성별</th>
					<th id="th4" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="background-color:#ffae69; width: 120px;" aria-label="Lesson: activate to sort column ascending">
						담당의</th>
					<th id="th5" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="background-color:#ffae69; width: 120px;" aria-label="Enrolled: activate to sort column ascending">
						보호자</th>
					<th id="th6" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="background-color:#ffae69; width: 140px;" aria-label="Price: activate to sort column ascending">
						보호자 연락처</th>
					<th id="th7" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="background-color:#ffae69; width: 200px;" aria-label="Status: activate to sort column ascending">
						</th>
				</tr>
				</thead>
				<tbody id="tbdy">
					<c:forEach var="waitPnt" items="${waitPnt}" varStatus="status">
						<tr role="row" id="${status.count}">
							<th scope="row" class="sorting_1" style="color:black; font-size:1.1em; font-weight:bold;">${waitPnt.pntNm}</th>
							<td>${waitPnt.pntHp}</td>
							<td><span <c:if test="${waitPnt.pntSex eq 'M'}">class="badge-pill badge-danger"</c:if><c:if test="${waitPnt.pntSex eq 'F'}">class="badge-pill badge-primary"</c:if>>${waitPnt.pntSex}</span></td>
							<td>${waitPnt.chrDr}</td>
							<td>${waitPnt.prtcrNm}</td>
							<td>${waitPnt.prtcrTel}</td>
							<td> 
								<button type="button" id="modalBtn" class="btn btn-outline-secondary" value="${waitPnt.pntCd}" data-toggle="modal" data-target="#myModal" onclick="modalBtn(this)" style="font-size:0.9em;">환자정보</button>
					   			<button type="button" id="modalBtn2" class="btn btn-outline-success" value="${waitPnt.pntCd}" data-toggle="modal" data-target="#myModal2" onclick="enting(this)" style="font-size:0.9em;">입원처리</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
				</table>
			  </div>
			</div>
		</div>
		</div>
	</div>
	</div>
</div>

<!-- 상세정보 조회 modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-slideout" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div style="float: left;"><h5 class="modal-title align-right" id="exampleModalLabel" style="font-weight: bolder; font-size: 20px;">환자 상세 정보</h5></div>
      
      </div>
      <div class="modal-body type2">
        <div class="alert alert-warning" role="alert">
           <table >
              <tr>
                 <td class="title">no.&nbsp;<span class="pntcd title"></span></td>
              </tr>
           </table>   
           <span class="pntnm"></span>&nbsp;
           (<span class="gender"></span>) &nbsp;&nbsp;만 <span class="age"></span>세
           <br><br>
           <table class="tab">
              <tr>
                 <td class="title">주민등록번호</td>
                 <td class="title">환자연락처</td>
                 <td class="title">보호자이름</td>
                 <td class="title">보호자연락처</td>
                 <td class="titlea">주소</td>
              </tr>
              <tr>
                 <td class="pno" valign="top"></td>
                 <td class="tel"  valign="top"></td>
                 <td class="prtnm"  valign="top"></td>
                 <td class="tel2"  valign="top"></td>
                 <td class="addr" valign="top"></td>
              </tr>
           </table>
        </div>
        <div class="alert alert-primary" role="alert">
         <div style="margin-bottom: 10px;">
            <div style=" float: left;"><h6 style="font-weight: bold;">건강 기록</h6></div>
         </div>
         <br>
         <div>
            <table>
               <tr>
                  <td class="title">흡연여부</td>
                  <td class="title">음주여부</td>
                  <td class="title">임신여부</td>
               </tr>
               <tr>
                  <td class="smk"></td>
                  <td class="drk"></td>
                  <td class="preg"></td>
               </tr>
               </table>
               <br>
               
               <div class="type2" style="width: 100%; height: 120px; overflow-y: scroll;">
               <div id="vital" class="dataTables_wrapper no-footer">
                  
               </div>
               </div>
         </div>
      </div>
      <div class="alert alert-success" role="alert">
         <div style="margin-bottom: 10px;">
            <div style=" float:left;"><h6 style="font-weight: bold;">예약 내역</h6></div>
         </div>
         <br><br>
         <!-- 예약내역 시작 -->
         
         <div class="type2" style="width: 100%; height: 20%; overflow-y: scroll;">
         <div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
            <table  class="table dataTable no-footer dtr-inline table-hover" id="DataTables_Table_0" role="grid" style="width: 600px; text-align: center;">
               <thead>
                  <tr role="row">
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">예약번호</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">환자명</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">예약일자</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">예약시간</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 110px; position: sticky; top: 0px; background: #ffffe3;">증상</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">담당의사</th>
                  </tr>
               </thead>
               <tbody class="rescon">

               </tbody>
            </table>
         </div>
         </div>
         <!-- 예약내역 끝 -->
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" id="detailModalCloseBtn" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal 입원처리 -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
<div id="slideMenu">
	<div id="mdlheader">
		병동<h4 id="entWARD"></h4>
		<span id="entROOM" style="font-size:1.2em; font-weight:bold;"></span>
		<span id="entBEDNO" style="font-size:1.2em; font-weight:bold;"></span>
	</div>
	<hr>
	<div id="mdlbody">
		<table style="width: 100%; height:80%;" border="1">
		  <tr>
		    <td>환자명</td>
		    <td id="entNM"></td>
		  </tr>
		  <tr>
		    <td>환자코드</td>
		    <td id="entCD"></td>
		  </tr>
		  <tr>
		    <td>담당의</td>
		    <td id="entCHRDR"></td>
		  </tr>
		  <tr>
		    <td>주민등록번호</td>
		    <td id="entPRNO"></td>
		  </tr>
		  <tr>
		    <td>성별</td>
		    <td id="entSEX"></td>
		  </tr>
		  <tr>
		    <td>연락처</td>
		    <td id="entHP"></td>
		  </tr>
		  <tr>
		    <td>보호자명</td>
		    <td id="entPRTCRNM"></td>
		  </tr>
		  <tr>
		    <td>보호자 연락처</td>
		    <td id="entPRTCRHP"></td>
		  </tr>
		  <tr>
		    <td>흡연여부</td>
		    <td id="entSMKYN"></td>
		  </tr>
		  <tr>
		    <td>음주여부</td>
		    <td id="entDRKYN"></td>
		  </tr>
		</table>
	</div>
</div>
  <div class="modal-dialog modal-dialog-slideout" role="document">
  
  <!-- 입원 환자 상세정보 모달 ~~!~!~!~!~!~!~!~!~!~!~!~!~! -->
    <div class="modal-content">
      <div class="modal-header">
        <div style="float: left;"><h5 class="modal-title align-right" id="exampleModalLabel2" style="font-weight: bolder; font-size: 20px;">입원 수속</h5></div>
            <button type="button" id="regist" class="btn btn-success" style="float: right; margin-left:1.3%" onclick="regist()">등록</button>
      		<button type="button" id="entingPrintBtn" class="btn btn-outline-success" style="float: right;">입원수속서</button>
        </div>
      <div class="modal-body alert-success">
      	<div id="BHeader" class="alert alert-warning">
      		<table style="width:100%; height:100%; text-align:center;">
      			<tr style="font-size:0.75em;">
      				<td style="height:30%;">연락처</td>
      				<td>주민등록번호</td>
      				<td>담당의</td>
      				<td>식단</td>
      				<td>퇴원일</td>
      				<td>중증도</td>
      			</tr>
      			<tr>
      				<td style="width:13%;" id="twoTD"></td>
      				<td style="width:13%;" id="thrTD"></td>
      				<td style="width:10%;" id="fiTD"></td>
      				<td style="width:17%;" id="sixTD"><select id="dietList" class="nice_Select" style="display: none;"></select></td>
      				<td style="width:20%;" id="sevTD"><input id="entDate" type="date"></td>
      				<td style="width:15%;" id="eigTD">
      					<select id="liskCd" class="nice_select">
      						<option value="0">중증도 선택</option>
      						<option value="LK1">비응급</option>
      						<option value="LK2">응급</option>
      						<option value="LK3">긴급</option>
      					</select>
      				</td>
      			</tr>
      		</table>
      	</div>
      	<div id="BAside" class="alert alert-danger type2" style="overflow-y:scroll">
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
      		<div id="BNav" style="display:flex; flex-wrap:wrap; background-color: #eee6c4;"></div>
      	</div>
	  </div>
      <div class="modal-footer" id="BFooter">
        <button type="button" id="positioning" class="btn btn-success positionBed" style="float: left;" >위치 변경</button>
	    <button type="button" id="positionSave" class="btn btn-success positionSave" style="float: left; display:none;">위치 저장</button>
	    <button type="button" id="cancleBtn" class="btn btn-danger positionCancle" style="float: left; display:none;">취소</button>
        <button type="button" class="btn btn-danger" data-dismiss="modal" style="float: right;">닫기</button>
      </div>
    </div>
  </div>
</div>

<!-- 우측 슬라이드 메뉴 -->
<div id="mask"></div>
<div class="slide_notice type2"> 
	<div class="menu_close" style="padding:5%;">
		<p style="color:white; text-align:center; font-weight: 1.4em;">입원 상세 알림</p>
		<button type="button" class="btn_menu_close">닫기</button>
	</div> 
	<ul class="menu_list" id="noticeContent">
	</ul> 
</div> 
<!-- 우측 슬라이드 메뉴 끝 -->

<script src="/resources/js/entCommon.js"></script>

<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script>
$('html').loading('start');
var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
var csrfHeader = $("meta[name=_csrf_header]").attr("content");
var csrfToken = $("meta[name=_csrf]").attr("content");
var modifyImg;
selectText = "전체";

$(function(){
	$('html').loading('stop');
	$(".selectBtn").text(selectText);
	
	
	// '신규등록'버튼 클릭 시 직원등록 modal창 띄우기
	$('#writeBtn').click(function(e){
		e.preventDefault();
		$('#writeModal').modal("show");
	});
	
	
$("#input_imgs").on("change", handleImgFileSelect);
	function handleImgFileSelect(e){
		$('html').loading('start');
		var files = e.target.files;
		modifyImg = files[0];
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				$('html').loading('stop');
				swal("등록 불가","이미지만 가능합니다","error");
				return;
			}
			
			//파일을 읽어주는 객체 생성
			var reader = new FileReader();
			reader.onload = function(e){
				$('html').loading('stop');
 				$("#up_profile").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});
		
	}
	
	//첨부파일의 확장자가 exe, sh, zip, alz 경우 업로드를 제한
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	//최대 5MB까지만 업로드 가능
	var maxSize = 5242880;
	//확장자 체크
	function checkExtension(fileName, fileSize){
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		return true;
	}
		
	
	
		 
		
		
});

// 직원 목록창에서 검색어 입력 시 
function searchEmp(p){
	searchVal = $("#searchInput").val();
	location.href="/emp/home?keyword="+searchVal;
	
//     var data = {};
//  data[csrfParameter]=csrfToken;
//  	data["keyword"]=searchVal;
// 	$.ajax({
// 		url:"/emp/homeAjax",
// 		data:data,
// 		method:"get",
// 		dataType:"html",
// 		traditional:true,
// 		success: function(res){
// 			$(".selectBtn").text("전체");
// 			var html = $("<div>").html(res);
// 			var contents = html.find("div#respData").html();
// 			console.log(contents)
// 			$("#ajaxTable").html(contents);
// 		}
// 	});
}

//다음 우편번호 검색
function openHomeSearch() {
 new daum.Postcode({
    oncomplete: function(data) {
    	
       $('#up_empAddr').val(data.address);
       $('#up_detAddr').val(data.buildingName);
    }
 }).open();
};

	// 직원목록에서 이름 클릭 시 상세정보 modal창 띄우기
function empDetail(p){
	$('html').loading('start');
	var empCd = p.id;
    var data = {};
    data[csrfParameter]=csrfToken;
    data["empCd"]=empCd;

	
	$.ajax({
		url:"/emp/detail",
		data:data,
		method:"post",
		dataType:"html",
		traditional:true,
		success: function(res){
			$('html').loading('stop');
			var html = $("<div>").html(res);
			var contents = html.find("div#data").html();
			$("#empDetail").html(contents);
			$('#detailModal').modal("show");
		}
	});
};


// 상세보기에서 수정버튼 클릭 시 수정 모달창 띄우기
function updateEmp(p){
	$('html').loading('start');
	var empCd = $('#dt_empCd').text();
	$("#up_empCd").val(empCd);
	
	var empNm = $('#dt_empNm').text();
	$("#up_empNm").val(empNm);
	
	var secCd = $('#dt_secCd').text();
	$("#up_secCd").val(secCd);
	
	var empPrno = $('#dt_empPrno').text();
	$("#up_empPrno").val(empPrno);
	
	var empSex = $('#dt_empSex').text();
	if(empSex == "여"){
	$("#up_empSex").val("F");
	}else{
		$("#up_empSex").val("M");
	};
	
	var empAddr = $('#dt_empAddr').text();
	$("#up_empAddr").val(empAddr);
	
	var empHp = $('#dt_empHp').text();
	$("#up_empHp").val(empHp);
	
	var position = $('#dt_position').text();
	$("#up_position").val(position);
	
	var lcnsNo = $('#dt_lcnsNo').text();
	$("#up_lcnsNo").val(lcnsNo);
	
	var empPic = $('#dt_empPic').text();
	$("#up_empPic").val(empPic);
	$("#up_profile").attr("src", empPic);

	var stateCd = $('#dt_stateCd').text();
	$("#up_stateCd").val(stateCd);
	
	var oldhireDate = $('#dt_hireDate').text();
	var hireDate = oldhireDate.replaceAll("/","-");
	$("#up_hireDate").val(hireDate);
	
	var leaveYn = $('#dt_leaveYn').text();
	$("#up_leaveYn").val(leaveYn);
	
	var enabled = $('#dt_enabled').text();
	if(enabled == 'Y'){
		$("#up_enabled").val(0);
	}else{
	$("#up_enabled").val(1);
	};
	
	var empMail = $('#dt_empMail').text();
	$("#up_empMail").val(empMail);
	
	var empPw = $('#dt_empPw').text();
	$("#up_empPw").val(empPw);
	
	$('html').loading('stop');
	$('#updateModal').modal("show");
}

// 직원 상세에서 삭제버튼 클릭 시 
function deleteEmp(p){
	console.log(p.value);
	empCd = p.value;
	var data = {"empCd":empCd}

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
        	$('html').loading('start');
	       	$.ajax({
	        	url:"/emp/delete",
	       		method: "get",
	       		data: data,
	       	    success: function(rres) {
	       	    	$('html').loading('stop');
// 	       	    	console.log(rres);   
	       	    }
	       	});
          Swal.fire(
            '삭제 완료!',
            '',
            'success'
          )
        }
      }).then(function(){
         $(".swal2-confirm").on("click", function() {
            location.reload();
         });
      });
}


// 부서별 분류 화면 출력
function selectDept(p){
	var selectDept = $(p).text();
	console.log(selectDept);
	console.log(p);
	$(".selectBtn").text(selectDept);
// 	var value = $(p).val();

//     var data = {};
//     data["secCd"]=value;
    
// 	$.ajax({
// 		url:"/emp/homeAjax",
// 		data:data,
// 		method:"get",
// 		dataType:"html",
// 		traditional:true,
// 		success: function(res){
// 			var html = $("<div>").html(res);
// 			var contents = html.find("div#respData").html();
// 			console.log(contents)
// 			$("#ajaxTable").html(contents);
// 		}
// 	});
	
};

// 직원등록 시 셀렉트박스 변경 메서드
function categoryChange(e) {
	
	var value = $(e).val();
	var dept = "";
	var posi = "";
	
	var medical = ["내과", "외과", "정형외과", "마취과"];
	var nurse = ["외래간호과", "특수간호과", "병동간호과"];
	var eng = ["방사선과"];
	var admin = ["원무과", "약제과"]; 
	var optionDept = ["상세선택"];
	
	var medPosition = ["부원장", "부장", "과장", "전공의", "일반의"];
	var nurPosition = ["부장", "과장", "책임", "주임", "사원"];
	var engPosition = ["기사"];
	var admPosition = ["부장", "과장", "대리", "주임", "사원"]; 
	
	// 등록에서 변경했을 때
	if(e.id == "ins_select"){
		var target = document.getElementById("secCd");
		var targetPosition = document.getElementById("position");
	}else{ // 수정에서 변경했을 때
		var target = document.getElementById("up_secCd");
		var targetPosition = document.getElementById("up_position");
	}
	
	if(value == "optionMed"){
		dept = medical;
		posi = medPosition;
		
	}else if(value == "optionNur"){
		dept = nurse;
		posi = nurPosition;
		
	}else if(value == "optionEng"){
		dept = eng;
		posi = engPosition;
		
	}else if(value == "optionAdm"){
		dept = admin;
		posi = admPosition;
		
	}else if(value == "optionDept"){
		dept = optionDept;
	}
	target.options.length = 0;
	targetPosition.options.length = 0;
	
	for (x in dept) {
		
		var opt = document.createElement("option");
		
		switch(dept[x]){
			case "내과":
				opt.value = "SEC00001";
				break;
			case "외과":
				opt.value = "SEC00002";
				break;
			case "정형외과":
				opt.value = "SEC00003";
				break;
			case "마취과":
				opt.value = "SEC00004";
				break;
			case "외래간호과":
				opt.value = "SEC00005";
				break;
			case "특수간호과":
				opt.value = "SEC00006";
				break;
			case "병동간호과":
				opt.value = "SEC00007";
				break;
			case "방사선과":
				opt.value = "SEC00008";
				break;
			case "원무과":
				opt.value = "SEC00009";
				break;
			case "약제과":
				opt.value = "SEC00010";
				break;	
		}
// 		opt.value = dept[x];
		opt.innerHTML = dept[x];
		target.appendChild(opt);
	}
	
	for (x in posi) {
		var opt = document.createElement("option");
		opt.value = posi[x];
		opt.innerHTML = posi[x];
		targetPosition.appendChild(opt);
	}
}

// '등록' 버튼 클릭 시 신규직원 등록
function insertEmp(p){
	$('html').loading('start');
	var empCd = $('#empCd').val();
	var secCd = $('#secCd').val();
	var major = $('#secCd').text();
	var position = $('#position').val();
	var hireDate = $('#hireDate').val();
	var empPw = $('#empPw').val();
	
	var data = {};
    data[csrfParameter]=csrfToken;
    data["empCd"]=empCd;
    data["secCd"]=secCd;
    data["major"]=major;
    data["position"]=position;
    data["hireDate"]=hireDate;
    data["empPw"]=empPw;
	
	$.ajax({
		url:"/emp/create",
		data:data,
		method:"post",		
		success: function(res){
			$('html').loading('stop');
			if(res > 0){
				 Swal.fire(
					'등록 완료!',
					'',
					'success'
						)
					$(".swal2-confirm").on("click", function() {
						 	 $('#detailModal').modal("hide");
					location.reload();
					});
			}else{
					Swal.fire(
					'제목과 내용은 필수 입력사항 입니다!',
					'',
					'error'
						)
			      	}
		}
	});
}

//수정창에서 완료버튼 클릭 시 ajax로 보냄
function mdfSubmit(p){
	$('html').loading('start');
	var empCd = $("#up_empCd").val();
	var secCd = $("#up_secCd").val();
	var empNm = $("#up_empNm").val();
	var empPrno = $("#up_empPrno").val();
	var empSex = $("#up_empSex").val();
	var addr = $("#up_empAddr").val();
	var detAddr = $("#up_detAddr").val();
	var empAddr = addr + " " + detAddr;
	var empHp = $("#up_empHp").val();
	var position = $("#up_position").val();
	var lcnsNo = $("#up_lcnsNo").val();
	var empPic = $("#input_imgs").val();
	var hireDate = $("#up_hireDate").val();
	var leaveYn = $("#up_leaveYn").val(); 
	var enabled = $("#up_enabled").val(); 
	var empMail = $("#up_empMail").val();  
	var empPw = $("#up_empPw").val();
	
	var data = {};	

    data[csrfParameter]=csrfToken;
    data["empCd"]=empCd;
    data["secCd"]=secCd;
    data["empNm"]=empNm;
    data["empPrno"]=empPrno;
    data["empAddr"]=empAddr;
    data["empSex"]=empSex;
    data["empHp"]=empHp;
    data["position"]=position;
    data["lcnsNo"]=lcnsNo;
    data["hireDate"]=hireDate;
    data["leaveYn"]=leaveYn;
    data["empMail"]=empMail;
    data["empPw"]=empPw;
    
    $("#hiddenEmpCd").val(empCd);
	
	$.ajax({
		url:"/emp/update",
		data: data,
		method:"post",
		success: function(res){
			$('html').loading('stop');
			if(res > 0){
				 Swal.fire(
					'수정 완료!',
					'',
					'success'
						)
					$(".swal2-confirm").on("click", function() {
						$('#detailModal').modal("hide");
						$("#updateImgFrm").submit();
					});
				
			}else{
					Swal.fire(
					'수정 실패!',
					'',
					'error'
						)
				}
		}
	});
	
	
}


</script>

<style>
.dataTables_info{
display: none;
}

.dataTables_paginate{
display: none;
}

.empDetailBtn{
/* background: pink; */
/* font-size: 14px; */
}

.empCdBtn{
/* width: 100%; */
}

#detailTable{
 	height: 50%; 
}

.baseImg{
text-align: center;
}

.adminView{
background: black;
display: none;
}

.mainPartBtn{
background: pink;
font-weight: bold;
pointer-events : none;
}

.detailPartBtn:hover{background: lightblue;}



 .modal-dialog {
     max-width: 50%;
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

	input[type="date"]::-webkit-calendar-picker-indicator { 

	background-image: url("../resources/img/calendar-icon.png");
	} 

</style>

<div class="main_content_iner ">
<div class="container-fluid p-0" >
<div class="row justify-content-center" >
<div class="col-12">
<div class="QA_section" >
<div class="white_box_tittle list_header">
<h2>직원목록</h2>
<div class="box_right d-flex lms_block">
<div class="serach_field_2">
<div class="search_inner">
<form active="#">
<div class="search_field">
<input id="searchInput" type="text" placeholder="검색어 입력" >
</div>
<button type="button" onclick="searchEmp(this)"> <i class="ti-search"></i> </button>
</form>
</div>
</div>
</div>
</div>

<a href="#modalSlide" data-toggle="modal" class="btn_1" id="writeBtn">신규등록</a>
<!----------------- 직원등록  Modal 시작-------------------->
		<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="exampleModalLabel">신규 직원등록</h2>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">
						<form:form modelAttribute="empVO" id="insertEmp" method="post" action="/emp/create" >
						
							<div class="form-group baseImg">
							<img alt="기본 이미지" src="../resources/upload/empPic/기본프로필.png">
							</div>
						
							<div class="form-group">
							<h4>사번</h4>
							<form:input type="text" path="empCd" class="form-control content" value="${nextEmpCD}"></form:input>
							</div>
						
						
							<div class="form-group">
							<h4>부서선택</h4>
								<select id="ins_select" class="selectpicker" data-style="btn-success" onchange="categoryChange(this)" >
									<option value="optionDept">부서명</option>
									<option value="optionMed">진료부</option>
									<option value="optionNur">간호부</option>
									<option value="optionEng">의료기사</option>
									<option value="optionAdm">행정부</option>	
								</select>
								
								<form:select path="secCd">
									<form:option value="selectSecDetail">상세선택</form:option>
								</form:select>
							</div>
							
							<div class="form-group">
							<h4>직급선택</h4>
								<form:select path="position" class="selectpicker" data-style="btn-success" >
									<form:option value="">해당없음</form:option>
								</form:select>
							</div>
							
							
							<div class="form-group">
							<h4>입사일 선택</h4>
							<form:input type="date" path="hireDate" class="form-control hireDate" ></form:input>
							</div>
							
							<div class="form-group">
							<h4>비밀번호</h4>
							<form:input type="text" path="empPw" class="form-control password" value="${nextEmpCD}"></form:input>
							</div>
							
							<div class="modal-footer">
								<button class="btn btn-info" id="modalY" type="button" onclick="insertEmp(this)">등록</button>
								<form:button class="btn btn-danger" type="button" data-dismiss="modal">취소</form:button>
							</div>
							
						</form:form>


					</div>
					
				</div>
			</div>
		</div>
<!----------------- 직원등록 Modal 끝-------------------->

		<div class="btn-group show">
			<button class="btn btn-Info dropdown-toggle selectBtn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">전체</button>
			<div class="dropdown-menu dropdown-menu-left" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-9px, 38px, 0px);">
				
				<button class="dropdown-item mainPartBtn" type="button">진료부</button>
				<div class="btn-group show">
				<button class="btn btn-Info dropdown-toggle partBtn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" hidden="hidden">진료부</button>
<!-- 					<button class="dropdown-item detailPartBtn" type="button" value="SEC00001" onclick="selectDept(this)">내과</button> -->
					<a class="dropdown-item detailPartBtn" onclick="selectDept(this)" href="/emp/home?secCd=SEC00001&keyword=SEC00001">내과</a>
					<a class="dropdown-item detailPartBtn" onclick="selectDept(this)" href="/emp/home?secCd=SEC00002&keyword=SEC00002">외과</a>
					<a class="dropdown-item detailPartBtn" onclick="selectDept(this)" href="/emp/home?secCd=SEC00003&keyword=SEC00003">정형외과</a>
					<a class="dropdown-item detailPartBtn" onclick="selectDept(this)" href="/emp/home?secCd=SEC00004&keyword=SEC00004">마취과</a>
				</div>
					
				<button class="dropdown-item mainPartBtn" type="button">간호부</button>
				<div class="btn-group show">
				<button class="btn btn-Info dropdown-toggle partBtn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" hidden="hidden">진료부</button>
					<a class="dropdown-item detailPartBtn" onclick="selectDept(this)" href="/emp/home?secCd=SEC00005&keyword=SEC00005">외래간호과</a>
					<a class="dropdown-item detailPartBtn" onclick="selectDept(this)" href="/emp/home?secCd=SEC00006&keyword=SEC00006">특수간호과</a>
					<a class="dropdown-item detailPartBtn" onclick="selectDept(this)" href="/emp/home?secCd=SEC00007&keyword=SEC00007">병동간호과</a>
				</div>
					
				<button class="dropdown-item mainPartBtn" type="button">행정부</button>
				<div class="btn-group show">
				<button class="btn btn-Info dropdown-toggle partBtn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" hidden="hidden">진료부</button>
					<a class="dropdown-item detailPartBtn" onclick="selectDept(this)" href="/emp/home?secCd=SEC00009&keyword=SEC00009">원무과</a>
					<a class="dropdown-item detailPartBtn" onclick="selectDept(this)" href="/emp/home?secCd=SEC00010&keyword=SEC00010">약제과</a>
				</div>		
				
				<button class="dropdown-item mainPartBtn" type="button">의료기사부</button>
				<div class="btn-group show">
				<button class="btn btn-Info dropdown-toggle partBtn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" hidden="hidden">진료부</button>
					<a class="dropdown-item detailPartBtn" onclick="selectDept(this)" href="/emp/home?secCd=SEC00008&keyword=SEC00008">방사선과</a>
				</div>
				
				<button class="dropdown-item mainPartBtn" type="button">전체</button>
				<div class="btn-group show">
				<button class="btn btn-Info dropdown-toggle partBtn" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" hidden="hidden">진료부</button>
					<a class="dropdown-item detailPartBtn" onclick="selectDept(this)" href="/emp/home">전체</a>
				</div>
				
			</div>
		</div>
<!----------------- 부서별 직원목록 출력 시작-------------------->
<div id="ajaxTable">
<div class="QA_table mb_30 list" id="dept">

<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
	<table class="table lms_table_active dataTable no-footer dtr-inline" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width: 1175px;">
		<thead>
		<tr role="row">
			<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 99px;" aria-sort="ascending" aria-label="title: activate to sort column descending">사번</th>
			<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 141px;" aria-label="Category: activate to sort column ascending">이름</th>
			<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 133px;" aria-label="Teacher: activate to sort column ascending">생년월일</th>
			<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 130px;" aria-label="Lesson: activate to sort column ascending">성별</th>
			<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 130px;" aria-label="Lesson: activate to sort column ascending">부서</th>
			<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 76px;" aria-label="Enrolled: activate to sort column ascending">직급</th>
			<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 70px;" aria-label="Price: activate to sort column ascending">상태</th>
		</tr>
		</thead>
		
		<tbody>
		
<!--------------------------- 부서별 직원 목록 출력 시작--------------------------->		
		<c:forEach var="list" items="${list}" varStatus="i">
		<tr role="row" class="odd">
			<th scope="row" tabindex="0" class="sorting_1"> 
			<button class="btn empDetailBtn" class="btn btn-outline-Secondary" type="button" onclick="empDetail(this)" id="${list.empCd}">${list.empCd}</button></th>
			<td><button class="btn empDetailBtn" class="btn btn-outline-Secondary" type="button" onclick="empDetail(this)" id="${list.empCd}">${list.empNm}</button></td>
			<td><button class="btn" type="button">${list.empPrno.substring(0,6)}</button></td>
			<c:if test="${list.empSex eq '남'}">
			<td><button class="btn btn-outline-success" type="button">${list.empSex}</button></td>
			</c:if>
			<c:if test="${list.empSex eq '여'}">
			<td><button class="btn btn-outline-danger" type="button">${list.empSex}</button></td>
			</c:if>
			<td><button class="btn btn-outline-Secondary " type="button">${list.secNm}</button></td>
			<td><button class="btn btn-outline-Secondary " type="button">${list.position}</button></td>
			<c:if test="${list.stateCd eq '온라인'}">
			<td><button class="btn btn-success" type="button">${list.stateCd}</button></td>
			</c:if>
			<c:if test="${list.stateCd eq '오프라인'}">
			<td><button class="btn btn-dark" type="button">${list.stateCd}</button></td>
			</c:if>
			<c:if test="${list.stateCd eq '업무중'}">
			<td><button class="btn btn-info" type="button">${list.stateCd}</button></td>
			</c:if>
			<c:if test="${list.stateCd eq '자리비움'}">
			<td><button class="btn btn-light" type="button">${list.stateCd}</button></td>
			</c:if>
			<c:if test="${list.stateCd eq '진료중'}">
			<td><button class="btn btn-warning" type="button">${list.stateCd}</button></td>
			</c:if>
			<c:if test="${list.stateCd eq '수술중'}">
			<td><button class="btn btn-danger" type="button">${list.stateCd}</button></td>
			</c:if>
			
<%-- 			<c:if test="${list.stateCd eq '최초로그인'}"> --%>
<!-- 			<td><button class="btn " type="button" style="background: pink;">미등록 직원</button></td> -->
<%-- 			</c:if> --%>
		</tr>
		</c:forEach>
<!--------------------------- 부서별 전체 목록 끝 --------------------------->		
		</tbody>
		</table>
            <!-- 페이징 처리 시작 -->
         <ul class="pagination" style="margin:4% 0% 5% 35%;">
            <!-- Previous 시작 -->
            <li
               class="paginate_button page-item previous <c:if test='${page.startPage<page.pagingCount+1}'>disabled</c:if>"
               id="dataTable_previous"><a
               href="/emp/home?currentPage=${page.startPage-page.pagingCount}&keyword=${param.keyword}"
               aria-controls="dataTable" data-dt-idx="0" tabindex="0"
               class="page-link">Previous</a></li>
            <!-- Previous 끝 -->
            <!-- Page번호 시작 -->
            <c:forEach var="pNo" begin="${page.startPage}" end="${page.endPage}"
               step="1">
               <li
                  class="paginate_button page-item <c:if test='${page.currentPage eq pNo}'>active</c:if>"><a
                  href="/emp/home?currentPage=${pNo}&keyword=${param.keyword}" aria-controls="dataTable"
                  data-dt-idx="1" tabindex="0" class="page-link">${pNo}</a></li>
            </c:forEach>
            <!-- Page번호 끝 -->
            <!-- Next 시작 -->
            <li
               class="paginate_button page-item next <c:if test='${page.endPage>=page.totalPage}'>disabled</c:if>"
               id="dataTable_next">
               <a
               href="/emp/home?secCd=${param.secCd}&currentPage=${page.startPage+page.pagingCount}&keyword=${param.keyword}"
               aria-controls="dataTable" data-dt-idx="7" tabindex="0"
               class="page-link">Next</a>
            </li>
            <!-- Next 끝 -->
         </ul>
         <!-- 페이징 처리 끝 --> -
      
		</div>
	</div>
</div>


</div>
</div>
</div>
</div>
</div>

<!---------------------- 직원 상세보기 시작 ---------------------->
<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-slideout" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div style="float: left;"><h5 class="modal-title align-right" id="exampleModalLabel" style="font-weight: bolder; font-size: 20px;">상세정보</h5></div>
      </div>
      <div class="modal-body">
         <div id="empDetail">
         
      	 </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right;">Close</button>
      </div>
    </div>
  </div>
</div>

<!---------------------- 직원 상세보기 끝 ---------------------->

<!----------------- 직원 정보 수정 Modal 시작-------------------->
	  <!-- 직원 정보 수정 Modal-->
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="exampleModalLabel">정보 수정</h2>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">
<%-- 							<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> --%>
							<div class="form-group">
							<h4>프로필사진</h4>
							<img id="up_profile" alt="프로필사진" src="" style="width: 20%;">
						<form:form id="updateImgFrm" modelAttribute="empVO" action="/emp/updateImg" method="post" enctype="multipart/form-data">
							<sec:csrfInput/>
							<input id="hiddenEmpCd" type="hidden" name="empCd" />
							<input id="up_empPic" class="form-control" hidden="hidden"/>
								<div class="form-group">
						        	<input type="file" id="input_imgs" name="uploadFile" />
						        </div>
						</form:form>
							</div>
						<form id="updateEmp" method="post" action="/emp/update" enctype="multipart/form-data">
							<div class="form-group">
							<h4>사번</h4>
							<input id="up_empCd" class="form-control" disabled="disabled"/>
							</div>
							
							<div class="form-group">
							<h4>부서선택</h4>
								<select id="upd_select" class="selectpicker" data-style="btn-success" onchange="categoryChange(this)" >
									<option value="optionDept">부서명</option>
									<option value="optionMed">진료부</option>
									<option value="optionNur">간호부</option>
									<option value="optionEng">의료기사</option>
									<option value="optionAdm">행정부</option>	
								</select>
								
								<select id="up_secCd">
									<option value="selectSecDetail">상세선택</option>
								</select>
							</div>
							
							<div class="form-group">
							<h4>직급선택</h4>
								<select id="up_position" class="selectpicker" data-style="btn-success" >
									<option value="">해당없음</option>
								</select>
							</div>
							
							
							<div class="form-group">
							<h4>이름</h4>
							<input id="up_empNm" class="form-control"></input>
							</div>
							
							<div class="form-group">
							<h4>주민등록번호</h4>
							<input id="up_empPrno" class="form-control"></input>
							</div>
							
							<div class="form-group">
							<h4>성별</h4>
								<select id="up_empSex" class="selectpicker" data-style="btn-success" >
									<option value="F">남</option>
									<option value="M">여</option>
								</select>
							</div>
							
							<div class="form-group">
							<h4>주소</h4>
							<input id="up_empAddr" class="form-control" />
							<h4>상세주소</h4>
							<input id="up_detAddr" class="form-control" /><br>
							<button class="btn btn-secondary" type="button" onclick="openHomeSearch()">주소검색</button>
							</div>
							
							<br>
							<div class="form-group">
							<h4>전화번호</h4>
							<input id="up_empHp" class="form-control"></input>
							</div>
							
							<div class="form-group">
							<h4>입사일</h4>
							<input type="date" id="up_hireDate" class="form-control hireDate" ></input>
							</div>
							
							<div class="form-group">
							<h4>퇴사여부</h4>
								<select id="up_leaveYn" class="selectpicker" data-style="btn-success" >
									<option value="0">재직</option>
									<option value="1">퇴직</option>
								</select>
							</div>
							
							<div class="form-group">
							<h4>활성화</h4>
								<select id="up_enabled" class="selectpicker" data-style="btn-success" >
									<option value="0">활성화</option>
									<option value="1">비활성화</option>
								</select>
							</div>
							
							<div class="form-group">
							<h4>면허번호</h4>
							<input id="up_lcnsNo" class="form-control" ></input>
							</div>
							
							<div class="form-group">
							<h4>메일</h4>
							<input id="up_empMail" class="form-control" ></input>
							</div>
							
							<div class="form-group">
							<h4>비밀번호</h4>
							<input id="up_empPw" class="form-control" ></input>
							</div>
							
					<!-- 수정/삭제 버튼 보이지않고, 관리자 ID로 조회 시 나타남  style="display: none;"-->	
					<div class="modal-footer">
						<button class="btn btn-info submit" type="button" onclick="mdfSubmit(this)">완료</button>
						<button class="btn btn-danger cancel" type="button" data-dismiss="modal">취소 </button>
					</div>
					</form>
					</div>
					
				</div>
			</div>
		</div>
<!----------------- 직원 정보 수정 Modal 끝-------------------->



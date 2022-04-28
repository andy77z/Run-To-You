<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/patients/patientsHome.css" type="text/css">
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
var csrfHeader = $("meta[name=_csrf_header]").attr("content");
var csrfToken = $("meta[name=_csrf]").attr("content");

//다음 우편번호 검색
function openHomeSearch() {
 new daum.Postcode({
    oncomplete: function(data) {
       $('[name=addr]').val(data.address);
       $('[name=detaddr]').val(data.buildingName);
    }
 }).open();
}

//엑셀 다운로드
function fn_doExcelDownloadProcess(){
	var excelData = '${listJSON}';
// 	$.ajax({
// 		url: '/downloadExcelFile',
// 		data: excelData,
// 		type: ''
// 	})
// 	f.action = "downloadExcelFile";
// 	f.submit();
}

//환자 상세정보
function modalAjax(p) {
	//console.log(p.id);
	var data = {};

	data[csrfParameter]=csrfToken;
	data["pntCd"] = p.id;
	
	//환자 상세정보
	$.ajax({
		url:"/patients/detail",
		method: "post",
		data: data,
		success: function(res) {
			//console.log(res.pregnancy);
			$("#vitalInsert").val(res.pntCd);
			$(".pntcd").text(res.pntCd);
			$(".pntnm").text(res.pntNm);
			$(".gender").text(res.pntSex);
			$(".age").text(res.age);
			$(".pno").text(res.pntPrno);
			$(".tel").text(res.pntHp);
			$(".prtnm").text(res.prtcrNm);
			$(".tel2").text(res.prtcrTel);
			var splita = res.pntAddr.split("_");
			$(".addr1").text(splita[0]);
			$(".addr2").text(splita[1]);
			if(res.smoking.trim() == 'N'){
				$(".smk").text("  > 비흡연자");
			}else if(res.smoking.trim() == 'Y'){
				$(".smk").text("  > 흡연자");
			}
			if(res.drinking.trim() == 'N'){
				$(".drk").text("  > 비음주자");
			}else if(res.drinking.trim() == 'Y'){
				$(".drk").text("  > 음주자");
			}
			
			if(res.pregnancy.trim() == 'N'){
				$("#prgck").css("display", "none");
				$(".pregY").css("display", "none");
				$(".pregN").css("display", "inline-block");
				
			}else if(res.pregnancy.trim() == 'Y'){
				$(".pregY").text("  > 임신");
				$(".pregY").css("display", "inline-block");
				$("#prgck").css("display", "inline-block");
				$(".pregN").css("display", "none");
			}
			$(".tem").text(res.vsTmp);
			$(".wei").text(res.weight);
			$(".hei").text(res.height);
			$(".bp").text(res.vsBpMax+"/" + res.vsBpMin);
			$(".bs").text(res.vsBs);
			$(".date").text(res.vsDt);
			
			$(document).on("click", "#resvbtn", function() {
				$(location).attr("href","/reservation/main?pntCd="+res.pntCd+"&pntNm="+res.pntNm);
			});
			
		},
		error : function(xhr){
			alert(xhr.status);
		}
	});

	//예약목록
	$.ajax({
		url:"/reservation/reservlist",
		method: "post",
		data: data,
		success: function(rres) {
			//console.log(rres)
			
			var listHtml='';
			if(rres!=''){
				for(var i in rres){
					
					listHtml +="<tr role='row'>";
					listHtml +="<td>"+rres[i].rsvtNo+"</td>;"
					listHtml +="<td>"+rres[i].pntNm+"</td>;"
					listHtml +="<td>"+rres[i].rsvtDt.substring(0,4)+'-'+rres[i].rsvtDt.substring(4,6)+'-'+rres[i].rsvtDt.substring(6,8)+"</td>;"
					listHtml +="<td>"+rres[i].rsvtDt.substring(8,10)+':'+rres[i].rsvtDt.substring(10,12)+"</td>;"
					listHtml +="<td><p id='symp'>"+rres[i].symptoms+"</p></td>;"
					listHtml +="<td>"+rres[i].empNm+"</td>;"
					listHtml +="</tr>";
				}
			}
			else{
				listHtml +="<tr role='row'>";
				listHtml +="<td colspan='6' style='text-align: center;'>환자의 예약내역이 없습니다.</td>;"
				listHtml +="</tr>";
			}
			//console.log(listHtml)
			$(".rescon").html(listHtml);
			

		}
	});
	
	//진료내역 목록
	$.ajax({
		url:"/patients/treatlist",
		method: "post",
		data: data,
		success: function(rres) {
			//console.log(rres)
			
			var listHtml='';
			if(rres!=''){
				for(var i in rres){
					
					listHtml +="<tr role='row' id='treatrow'>";
					listHtml +="<td>"+rres[i].treatCd+"</td>;"
					listHtml +="<td>"+rres[i].pntNm+"</td>;"
					listHtml +="<td>"+rres[i].treatDt+"</td>;"
					listHtml +="<td><p id='treop'>"+rres[i].treatOp+"</p></td>;"
					listHtml +="<td>"+rres[i].empNm+"</td>;"
					listHtml +="</tr>";
				}
			}
			else{
				listHtml +="<tr role='row'>";
				listHtml +="<td colspan='6' style='text-align: center;'>환자의 진료내역이 없습니다.</td>;"
				listHtml +="</tr>";
			}
			//console.log(listHtml)
			$(".treatcon").html(listHtml);
			

		}
	});
	
// 	$(document).on('mouseover',"#treatrow",function(){
// 		$(this).css("background-color"," rgba(189,189,189,0.5)")
// 	});
	
	$(document).on('click',"#treatrow",function(){
		window.open('/medical/treatRecord?treatCd=' + $(this).children().first().text(),'record','width=1250, height=720, top=100, left=100');
// 		console.log($(this).children().first().text());
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
	});  
	
}

//환자 삭제
function deletePnt(d) {
	var data = {};

	data[csrfParameter]=csrfToken;
	data["pntCd"] = d.id;
	
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
		    Swal.fire(
		      '삭제 완료!',
		      'Your file has been deleted.',
		      'success'
		    )
		  }
//		    location.reload();
		}).then(function(){
			$(".swal2-confirm").on("click", function() {
				location.reload();
			});
		});
		
	$.ajax({
		url:"/patients/deletePatients",
		method: "post",
		data: data,
		success: function(rres) {
			console.log(rres);	
		}
	});
	
}

//환자정보 수정
function editeAjax(e) {
	var data = {};

	data[csrfParameter]=csrfToken;
	data["pntCd"] = e.id;
	
	//환자정보 수정 시 기존 정보 출력되게..
	$.ajax({
		url:"/patients/detail",
		method: "post",
		data: data,
		success: function(eres) {
			
			var fPrno = eres.pntPrno.substring(0,6);
			var bPrno = eres.pntPrno.substring(8,15);
			var pntHpsplit = eres.pntHp.split('-')
			var pntAddrsplit = eres.pntAddr.split('_')
			var crtelsplit = eres.prtcrTel.split('-')
			//console.log(eres.prtcrNm)
			$("input[name='pntCd']").attr('value', eres.pntCd);
			$("input[name='pntNm']").attr('value', eres.pntNm);
			$("input[name='fPrno']").attr('value', fPrno);
			$("input[name='bPrno']").attr('value', bPrno);
			$("input[name='pntHp1']").attr('value', pntHpsplit[0]);
			$("input[name='pntHp2']").attr('value', pntHpsplit[1]);
			$("input[name='pntHp3']").attr('value', pntHpsplit[2]);
			$("input[name='addr']").attr('value', pntAddrsplit[0]);
			$("input[name='detaddr']").attr('value', pntAddrsplit[1]);
			$("input[name='prtcrNm']").attr('value', eres.prtcrNm);
			$("input[name='rtel1']").attr('value', crtelsplit[0]);
			$("input[name='rtel2']").attr('value', crtelsplit[1]);
			$("input[name='rtel3']").attr('value', crtelsplit[2]);
			if(eres.drinking == 'Y'){
				$("input:checkbox[name='drkYn']").prop('checked', true);
			}
			if(eres.smoking == 'Y'){
				$("input:checkbox[name='smkYn']").prop('checked', true);
			}
			if(eres.pregnancy == 'Y'){
				$("input:checkbox[name='prgntYn']").prop('checked', true);
			}
		}
	})
}

//수정 시 체크박스 체크 여부 
function editcomp() {
	
	if(document.getElementById("drkYn_check").checked) {
	    document.getElementById("drkYn_hidden").disabled = true;
	}
	if(document.getElementById("smkYn_check").checked) {
	    document.getElementById("smkYn_hidden").disabled = true;
	}
	if(document.getElementById("prgntYn_check").checked) {
	    document.getElementById("prgntYn_hidden").disabled = true;
	}

	//console.log(patientsVo)
	$("#patientsVo").submit();
	
}

	//바이탈 정보 등록
function insertVital(i) {
		
	$("input[name='pntCd']").attr('value', $(i).val());

	$(document).on("click", "#invitalcom", function() {
		var tmp = $("#vsTmp").val()
		var weight = $("#weight").val()
		var height = $("#height").val()
		var vsBpMax = $("#vsBpMax").val()
		var vsBpMin = $("#vsBpMin").val()
		var vsBs = $("#vsBs").val()
		
		if(tmp.trim()=='' || weight.trim()=='' || height.trim()==''
				|| vsBpMax.trim()=='' || vsBpMin.trim()=='' || vsBs.trim()==''){

			alert("값을 입력하세요 ");

		}else{
			//console.log($(i).val());
			$("#vitalInsertForm").submit();
			
			var data = $("form[name=vitalInsertForm]").serialize() ;
			
			$.ajax({
				url:"/patients/insertVital",
				method:"get",
				data: data,
				success: function () {
					
				}
			});
			
		} 
	})
	
	
}

//바이탈 리스트 삭제	
function deleteVital(){
	
	//삭제를 누르면 체크박스 활성화 되고, 바이탈 삭제 목록을 체크하면 alert띄우고 삭제
	$(".vdi").css("display", "block");
	$("#dbtn").css("display", "block");

}


//바이탈 삭제
function vitaldcom(){
	var datas = $("input:checkbox[id=vcheck]");
	var list = [];
	$.each(datas,function(i,v){
		if(this.checked){
			var map = {}
			map["pntCd"] = this.name;
			map["vsDt"] = this.value;
			list.push(map);
		}
	});
	console.log(list);
// 	$.ajaxSettings.traditional = true;
	
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
		    Swal.fire(
		      '삭제 완료!',
		      'Your file has been deleted.',
		      'success'
		      
		    )
			$.ajax({
		    	url:"/patients/deleteVital",
				method:"post",
				contentType: "application/json",
				data: JSON.stringify(list),
				beforeSend : function(xhr){   
					xhr.setRequestHeader(csrfHeader, csrfToken);
		        },
				success: function (res) {
					$.each(datas,function(i,v){
						if(this.checked){
							$(this).parent().parent().parent().css("display", "none")
						}
					});
				}
			});
		  }
		  if(!result.isConfirmed){
			 // alert("!!!!!!");
			  $(".vdi").css("display", "none");
		  }
//		    location.reload();
		}).then(function(){
			$(".swal2-confirm").on("click", function() {
				location.reload();
			});
		});
}		
	
$(document).ready(function(){
	//버튼 클릭 시 입력DB 자동으로 들어가게 (시연 시 사용 예정)
    $("#demo").on("click", function(){
    	$("#vsTmp").attr("value", "37.5");
    	$("#weight").attr("value", "60");
    	$("#height").attr("value", "170");
    	$("#vsBpMax").attr("value", "116");
    	$("#vsBpMin").attr("value", "73");
    	$("#vsBs").attr("value", "80");
    })
	
})	
</script>

<!-- 본문 컨텐츠 시작 -->
<div class="main_content_iner ">
	<div class="container-fluid p-0">
	<div class="row justify-content-center">
	<div class="col-12">
	<div class="QA_section">
	<div class="white_box_tittle list_header">
		<h4>환자 목록</h4>
	<div class="box_right d-flex lms_block">
<!-- 	/patients/patientsList -->
	<div class="serach_field_2">
	<div class="search_inner">
		<form name="searchForm" id="searchForm" action="/patients/patientsList" method="get">
		<div class="search_field">
			<input type="search"  id="keyWord" style="border:1px solid #ad9aee;" name="keyWord" placeholder="찾으실 환자의 정보를 입력하세요.. (ex, 환자 코드/이름/생년월일)" value="${keyword}">
		</div>
		<button type="submit"> <i class="ti-search"></i> </button>
		</form>
	</div>
	</div>

	</div>
	<div>
	<!-- javascript:fn_doExcelDownloadProcess() -->
		<a href="/downloadExcelFile?where=patients" class="btn btn-outline-primary">엑셀 다운로드</a>
		<a href="/patients/insertPage" class="btn btn-outline-danger">신규등록</a>
	</div>
	</div>
	<div class="QA_table mb_30">

	<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
		<table class="table lms_table_active dataTable no-footer dtr-inline" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width:100%; text-align: center;">
	<thead>
		<tr role="row"  >
			<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width:6%; background-color: #6e9fed;">환자 코드 ∨</th>
			<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width:6%; background-color: #6e9fed;">환자 이름 ∨</th>
			<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width:1%; background-color: #6e9fed;">성별 ∨</th>
			<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width:20%; background-color: #6e9fed;">주민번호 ∨</th>
			<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width:20%; background-color: #6e9fed;">환자 연락처 ∨</th>
			<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width:25%; background-color: #6e9fed;">주소 ∨</th>
			<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width:7%; background-color: #6e9fed;">보호자 이름 ∨</th>
			<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width:27%; background-color: #6e9fed;">보호자 연락처 ∨</th>
			<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width:1%; background-color: #6e9fed;"></th>
		</tr>
	</thead>
<tbody>
<c:forEach var="plist" items="${list}">
	
<tr role="row" class="odd">
	<th scope="row" tabindex="0" class="sorting_1">
			<p>${plist.pntCd}</p>
	</th>
	<td>${plist.pntNm}</td>
	<c:set var="gender" value="${plist.pntSex}"/>
	<c:if test="${gender eq 'M'}">
		<td><span class="badge badge-pill badge-primary">${gender}</span></td>
	</c:if>
	<c:if test="${gender eq 'F'}">
		<td><span class="badge badge-pill badge-danger" style="width: 23.1px;">${gender}</span></td>
	</c:if>
	<td>${plist.pntPrno}</td>
	<td>${plist.pntHp}</td>
	<td style="text-align: left;"><p id="addr">${plist.pntAddr.split('_')[0]} ${plist.pntAddr.split('_')[1]}<p></td>
	<td>${plist.prtcrNm}</td>
	<td>${plist.prtcrTel}</td>
 	<td>
		<div class="amoutn_action d-flex align-items-center">
			 
		<div class="dropdown ml-4">
		<a class=" dropdown-toggle hide_pils" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			<i class="fas fa-ellipsis-v"></i>
		</a>
		<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-147px, 23px, 0px);">
			<a class="dropdown-item" data-toggle="modal" href="#ModalSlide" id="${plist.pntCd}" onclick="modalAjax(this)">상세정보</a>
			<a class="dropdown-item" data-toggle="modal" href=".editModal" id="${plist.pntCd}" onclick="editeAjax(this)">수정</a>
			<a class="dropdown-item" id="${plist.pntCd}" onclick="deletePnt(this)">삭제</a>
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
</div>
</div>
</div>


<!-- 상세정보 조회 modal -->
<div class="modal fade" id="ModalSlide" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
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
        			<td class="addr1" valign="top"></td>
        		</tr>
        		<tr>
        			<td colspan="4"></td>
        			<td class="addr2" valign="top"></td>
        		</tr>
        	</table>
        </div>
        <div class="alert alert-primary" role="alert">
			<div style="margin-bottom: 10px;">
				<div style=" float: left;"><h6 style="font-weight: bold;">건강 기록</h6></div>
				<div class="dropdown ml-4" style="float: right;">
					<a class=" dropdown-toggle hide_pils" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						<i class="fas fa-ellipsis-v"></i>
					</a>
					<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-147px, 23px, 0px);">
						<a class="dropdown-item" data-toggle="modal" href=".vitalInsert" id="vitalInsert" onclick="insertVital(this)">등록</a>
						<div class="dropdown-item" data-toggle="modal" id="vitalDelete" onclick="deleteVital()">삭제</div>
					</div>
				</div>
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
						<td>
						<div class="pregN"></div>
						<div><div class="pregY" style="float: left; margin-right: 6px;"></div><div class="badge badge-danger" id="prgck">♥</div></div>
						</td>
					</tr>
					</table>
					<br>
					
					<div class="type2" style="width: 100%; height: 200px; overflow-y: scroll; overflow-x:hidden; ">
					<div id="vital" class="dataTables_wrapper no-footer">
						
					</div>
					</div>
			</div>
		</div>
		<div class="alert alert-success" role="alert">
			<div style="margin-bottom: 10px;">
				<div style=" float: left;"><h6 style="font-weight: bold;">예약 내역</h6></div>
				<div style="float: right;"><a class="btn btn-outline-primary" id="resvbtn">예약</a></div>
			</div>
			<br><br>
			<!-- 예약내역 시작 -->
			
			<div class="type2" style="width: 100%; height: 200px; overflow-y: scroll; overflow-x:hidden; ">
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
			<!-- 진료내역 시작 -->
			<div class="alert alert-secondary" role="alert">
			<div style="margin-bottom: 10px;">
				<div style=" float: left;"><h6 style="font-weight: bold;">진료 내역</h6></div>
			</div>
			<br><br>
			<div class="type2" style="width: 100%; height: 200px; overflow-y: scroll; overflow-x:hidden; ">
			<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
				<table  class="table dataTable no-footer dtr-inline table-hover" id="DataTables_Table_0" role="grid" style="width: 600px; text-align: center;">
					<thead>
						<tr role="row">
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">진료번호</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">환자명</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">진료일자</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 90px; position: sticky; top: 0px; background: #ffffe3;">의사소견</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">담당의사</th>
						</tr>
					</thead>
					<tbody class="treatcon">

					</tbody>
				</table>
			</div>
			</div>
			<!-- 진료내역 끝 -->
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <a class="btn btn-success" href="/ent/entHome" >입원</a>
      </div>
    </div>
  </div>
</div>


<!-- 정보 수정 modal -->
<div class="modal fade editModal" id="ModalSlide" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-slideout" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div style="float: left;"><h5 class="modal-title align-right" id="exampleModalLabel" style="font-weight: bolder; font-size: 20px;">환자 정보 수정</h5></div>
		<button class="btn btn-outline-danger" style="float: right;" type="button" onclick="editcomp()" >완료</button>
      </div>
      <div class="modal-body type2">
	<form:form modelAttribute="patientsVo" action="/patients/updateInfo" method="post">
	      <sec:csrfInput/>
	      <div class="Activity_timeline">
		      <ul>
				<li class="line">
		      		<div class="activity_bell"></div>
					<div class="activity_wrap">
		      			<div style="width: 20px; float: left; margin-right: 20px;"><h6>no.</h6></div>
		      			<input id=pntCd type="text" name="pntCd" class="inp" readonly="readonly"/>
		      		</div>
		     	</li>
				<li class="line">
		      		<div class="activity_bell"></div>
					<div class="activity_wrap">
		      			<h6>이름</h6>
		      			<input id="pntNm" type="text" name="pntNm" class="inp"/>
		      		</div>
		     	</li>
				<li class="line">
		      		<div class="activity_bell"></div>
					<div class="activity_wrap">
		      			<h6>주민등록번호</h6>
		      			<input type="text" id="fPrno" class="inp pnos" maxlength="6" name="fPrno" readonly="readonly"/>
						-
						<input type="text" id="bPrno" class="inp pnos" maxlength="7" name="bPrno" readonly="readonly"/>
		      		</div>
		     	</li>
				<li class="line">
		      		<div class="activity_bell"></div>
					<div class="activity_wrap">
		      			<h6>환자 연락처</h6>
		      			<input type="text" class="inp pnos" maxlength="3" name="pntHp1"/>
						-
						<input type="text" class="inp pnos" maxlength="4" name="pntHp2"/>
						-
						<input type="text" class="inp pnos" maxlength="4" name="pntHp3"/>
		      		</div>
		     	</li>
				<li class="line">
					<div class="activity_bell"></div>
					<div class="activity_wrap">
						<div style="float: left; margin-right: 50px;"><h6>주소</h6></div>
						<button class="btn btn-secondary" type="button" onclick="openHomeSearch()">검색</button>
						<br><br>
						<span>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 : </span>
						<input type="text" style="width: 300px;" name="addr" class="inp" />
						<br><br>
						<span>상세주소 : </span><input type="text" style="width: 300px;" name="detaddr" class="inp" />
					</div>
				</li>
				<li class="line">
		      		<div class="activity_bell"></div>
					<div class="activity_wrap">
		      			<h6>보호자 이름</h6>
		      			<input type="text" name="prtcrNm" class="inp"/>
		      		</div>
		     	</li>
				<li class="line">
		      		<div class="activity_bell"></div>
					<div class="activity_wrap">
		      			<h6>보호자 연락처</h6>
		      			<input type="text" class="inp pnos" maxlength="3" name="rtel1"/>
						-
						<input type="text" class="inp pnos" maxlength="4" name="rtel2"/>
						-
						<input type="text" class="inp pnos" maxlength="4" name="rtel3"/>
		      		</div>
		     	</li>
		     	<li class="line">
					<div class="activity_bell"></div>
					<div class="activity_wrap">
						<h6>음주, 흡연 여부</h6>
						<input type="checkbox" id="drkYn_check" value='1' name="drkYn" /><label>_음주</label>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="hidden" id="drkYn_hidden" value='0' name="drkYn"/>
						<input type="checkbox" id="smkYn_check" value='1' name="smkYn" /><label>_흡연</label>
						<input type="hidden" id="smkYn_hidden" value='0' name="smkYn"/>
					</div>
				</li>
				<li class="line">
					<div class="activity_bell"></div>
					<div class="activity_wrap">
						<h6>임신 여부</h6>
						<input type="checkbox" id="prgntYn_check" value='1' name="prgntYn" ><label>_임신</label>
						<input type="hidden" id="prgntYn_hidden" value='0' name="prgntYn"/>
					</div>
				</li>
		      </ul>
	      </div>
      </form:form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


<!-- 바이탈사인 등록 modal -->
<div class="modal fade vitalInsert" id="ModalSlide" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-slideout" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div style="float: left;"><h5 class="modal-title align-right" id="exampleModalLabel" style="font-weight: bolder; font-size: 20px;">바이탈 사인 등록</h5></div>
      </div>
      <div class="modal-body type2">
	<form id="vitalInsertForm" name="vitalInsertForm" action="/patients/insertVital" method="post">
	<sec:csrfInput/>
		<button class="btn btn-outline-danger" type="button" style="float: right;" id="invitalcom">완료</button>
		<button type="button" class="btn btn-light" id="demo" style="float: right; margin-right: 20px;" >demo</button>
	      <sec:csrfInput/>
	      <div class="Activity_timeline">
	      <br><br>
		      <ul>
				<li>
				<div class="activity_bell"></div>
					<div class="activity_wrap">
						<h6>no.</h6>
						<input type="text" class="inp" name="pntCd" readonly="readonly"/>&nbsp;
					</div>
				</li>
				<li>
				<div class="activity_bell"></div>
				<li>
				<div class="activity_bell"></div>
					<div class="activity_wrap">
						<h6>체온</h6>
						<input type="text" class="inp" id="vsTmp" name="vsTmp"/>&nbsp;(℃)
					</div>
				</li>
				<li>
				<div class="activity_bell"></div>
					<div class="activity_wrap">
						<h6>체중</h6>
						<input type="text" class="inp" id="weight" name="weight"/>&nbsp;(kg)
					</div>
				</li>
				<li>
				<div class="activity_bell"></div>
					<div class="activity_wrap">
						<h6>신장</h6>
						<input type="text" class="inp" id="height" name="height"/>&nbsp;(cm)
					</div>
				</li>
				<li>
				<div class="activity_bell"></div>
					<div class="activity_wrap">
						<h6>최고혈압</h6>
						<input type="text" class="inp" id="vsBpMax" name="vsBpMax"/>&nbsp;(mmHg)
					</div>
				</li>
				<li>
				<div class="activity_bell"></div>
					<div class="activity_wrap">
						<h6>최저혈압</h6>
						<input type="text" class="inp" id="vsBpMin" name="vsBpMin"/>&nbsp;(mmHg)
					</div>
				</li>
				<li>
				<div class="activity_bell"></div>
					<div class="activity_wrap">
						<h6>혈당</h6>
						<input type="text" class="inp" id="vsBs" name="vsBs"/>&nbsp;(mg/dl)
					</div>
				</li>
		      </ul>
	      </div>
      </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


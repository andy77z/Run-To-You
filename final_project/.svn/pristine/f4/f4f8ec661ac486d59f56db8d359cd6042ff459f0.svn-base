<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/patients/insertPage.css" type="text/css">
﻿<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
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


$(document).on("change","#selectmajor", function() {
	
	//var data = {"major" : $("#selectmajor option:selected").val()};
	
	var data = {};

	data[csrfParameter]=csrfToken;
	data["major"] = $("#selectmajor option:selected").val();
	
	$.ajax({
		url:"/patients/doctorList",
		method: "post",
		data: data,
		success: function(dres) {
			//console.log(dres);
			//alert(dres)
			var listHtml = '';
			if(dres!=''){
				for(var i in dres){
					listHtml +='<option id="optdoc" label="'+dres[i].empNm+'">'+dres[i].empNm+'</option>';
				}
			}
			$("#chrDr").html(listHtml);
			//alert(listHtml);
			
		}
	})
})



$(document).ready(function(){
	
	$("#success").on('click',function(){
		if(document.getElementById("drkYn_check").checked) {
		    document.getElementById("drkYn_hidden").disabled = true;
		}
		if(document.getElementById("smkYn_check").checked) {
		    document.getElementById("smkYn_hidden").disabled = true;
		}
		if(document.getElementById("prgntYn_check").checked) {
		    document.getElementById("prgntYn_hidden").disabled = true;
		}
		
		//성별 체크 
		$("#pntSex").val($('input[name=pntSexR]:checked').val());
		//console.log( "value : " + $("#pntSex").val())
//===================================================================
		var regExpNm = /^[가-힣]+$/;
		var pntNm = $('#pntNm').val();
		
		//이름 입력여부
 		if (pntNm == null || pntNm == "" ){
//  			alert("이름을 입력하세요.")
 			swal("이름을 입력하세요", "", "warning");
//  			event.preventDefault();
	 		// 서브밋 이벤트를 발생하지 않겠다..
 			return false;
 		}else if(!regExpNm.test(pntNm)){
			alert("이름은 한글만 입력 가능합니다.")
			$("#pntNm").focus();
			return false;
		}
//===================================================================		
		var fprno = $('#fPrno').val().trim();	//주민 앞자리
		var bprno = $('#bPrno').val().trim();	//주민 뒷자리
		var regno = fprno+bprno;
		
		//주민번호 유효성검사
		if ($('#fPrno').val() == null || $('#fPrno').val() == "" || $('#bPrno').val() == "" || $('#bPrno').val() == ""){
 			swal("주민번호를 입력하세요", "", "warning");
	 		// 서브밋 이벤트를 발생하지 않겠다..
 			return false;	
 		}
		else{
	 
			var sum = 0;
			for(let i = 0; i < regno.length - 1; i++){
				sum += parseInt(regno.substr(i, 1)) * (i % 8 + 2);
			}
			var res = 11 - (sum % 11);
			res = res % 10;
			
			if(res == parseInt(regno.substr(regno.length - 1, 1))){
				
			}else{
				alert("주민등록번호가 유효하지 않습니다.")
				return false;
			}
		}
//===================================================================
		var regExpPh = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
		
			var a = $('#pntHp1').val();
			var b = $('#pntHp2').val();
			var c = $('#pntHp3').val();
			var d = "-"
			pntHp = [a, d, b, d, c].join('');
		
		if (a == null || a == "" || b == "" || b == "" || c == "" || c == ""){
 			swal("연락처를 입력하세요", "", "warning");
	 		// 서브밋 이벤트를 발생하지 않겠다..
 			return false;	
 		}else if(!regExpPh.test(pntHp)){
			alert("전화번호 형식에 맞지 않습니다.");
			return false;
		}
		
		//===================================================================
		
		//val() == null || $('#pntSex').val() == "" 
 		if ($("#pntSex").val() == null || $("#pntSex").val() == ""){
 			swal("성별을 선택하세요", "", "warning");
	 		// 서브밋 이벤트를 발생하지 않겠다..
 			return false;	
 		}
 		else if ($('#addr').val() == null || $('#addr').val() == ""){
 			swal("주소를 입력하세요", "", "warning");
	 		// 서브밋 이벤트를 발생하지 않겠다..
 			return false;	
 		}
 		else{
	 		// 서브밋 이벤트를 진행 하겠다..
// 	 		return true;
 			$("#patientsVo").submit()
 		}
        
    }); // end submit()
    
    
  //버튼 클릭 시 입력DB 자동으로 들어가게 (시연 시 사용 예정)
    $("#demo").on("click", function(){
    	$("input[name='pntNm']").attr("value", "박슬기");
    	$("input[name='fPrno']").attr("value", "921112");
    	$("input[name='bPrno']").attr("value", "2403514");
    	$("input[name='pntHp1']").attr("value", "010");
    	$("input[name='pntHp2']").attr("value", "5396");
    	$("input[name='pntHp3']").attr("value", "1551");
    	$("input[name='prtcrNm']").attr("value", "이수보");
    	$("input[name='rtel1']").attr("value", "010");
    	$("input[name='rtel2']").attr("value", "3431");
    	$("input[name='rtel3']").attr("value", "1551");
    	
    	
    })
}); // end ready()



</script>

<!-- 본문 컨텐츠 시작 -->
<div class="main_content_iner ">
	<div class="container-fluid p-0">
	<form:form modelAttribute="patientsVo" method="post" action="/patients/patientsInsert" name="patientsVo">
	<sec:csrfInput/>
	<form:button class="btn btn-outline-danger" id="success" type="button" style="float: right; margin-right: 20px;" >등록</form:button>
	<button type="button" class="btn btn-light" id="demo" style="float: right; margin-right: 20px;" >demo</button>
	<br><br><br>
	<div class="row justify-content-center">
	<div class="range">
		<div class="white_box card_height_100">
			<div class="box_header border_bottom_1px">
				<div class="main-title">
					<h3 class="mb_25">신규 환자 등록</h3>
				</div>
			</div>
				<div class="Activity_timeline">
					<ul>
						<li>
						<div class="activity_bell"></div>
							<div class="activity_wrap">
								<h6>이름</h6>
								<form:input type="text" path="pntNm" />
								
							</div>
						</li>
						<li>
						<div class="activity_bell"></div>
							<div class="activity_wrap">
								<h6>주민등록번호</h6>
								<form:input type="text" class="pno" maxlength="6" path="fPrno" />
								-
								<form:input type="password" class="pno inpstyle" maxlength="7" path="bPrno" />
							</div>
						</li>
						<li>
						<div class="activity_bell"></div>
							<div class="activity_wrap">
								<h6>환자 연락처</h6>
								<form:input type="text" class="pno" maxlength="3" path="pntHp1"/>
								-
								<form:input type="text" class="pno" maxlength="4" path="pntHp2"/>
								-
								<form:input type="text" class="pno" maxlength="4" path="pntHp3"/>
							</div>
						</li>
						<li style="width: 200px;">
						<div class="activity_bell"></div>
							<div class="activity_wrap">
								<h6>성별</h6>
								<form:hidden path="pntSex"/>
								<input type="radio" name="pntSexR" value="M" />_남성&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="radio" name="pntSexR" value="F" />_여성
							</div>
						</li>
						<li>
						<div class="activity_bell"></div>
							<div class="activity_wrap">
								<div style="float: left; margin-right: 50px;"><h6>주소</h6></div>
								<button class="btn btn-secondary" type="button" onclick="openHomeSearch()">검색</button>
								<br><br>
								<span>주&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;소 : </span>
								<form:input type="text" style="width: 60%;" path="addr" name="addr" />
								<br><br>
								<span>상세주소 : </span><form:input type="text" style="width: 60%;" path="detaddr" name="detaddr" />
							</div>
						</li>
						<li>
						<div class="activity_bell"></div>
							<div class="activity_wrap">
								<h6>보호자 이름</h6>
								<form:input type="text" path="prtcrNm"/>
							</div>
						</li>
						<li>
						<div class="activity_bell"></div>
							<div class="activity_wrap">
								<h6>보호자 연락처</h6>
								<form:input type="text" class="pno" maxlength="3" path="rtel1"/>
								-
								<form:input type="text" class="pno" maxlength="4" path="rtel2"/>
								-
								<form:input type="text" class="pno" maxlength="4" path="rtel3"/>
							</div>
						</li>
					</ul>
						<hr>
				</div>
			</div>
	</div>
	<div class="range" style="margin-right: 20px;">
			<div class="white_box card_height_100">
				<div class="box_header border_bottom_1px  ">
					<div class="main-title">
						<h3 class="mb_25">신규 환자 등록</h3>
					</div>
				</div>
			<div class="Activity_timeline">
				<ul>
					<li>
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
				<br><hr>
			</div>
			</div>
	</div>
		</div>
	
		</form:form>
	</div>
</div>



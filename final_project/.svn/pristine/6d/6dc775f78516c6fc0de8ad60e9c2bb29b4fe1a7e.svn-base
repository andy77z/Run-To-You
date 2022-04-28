<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<style>
.emp-profile{
    padding: 3%;
    margin-top: 3%;
    margin-bottom: 3%;
    border-radius: 0.5rem;
    background: #fff;
}
.profile-img-div{
	text-align:center;
	display:table;
	width: 200px;
	height: 200px;
}
.profile-img{
    display: table-cell;
    vertical-align: middle;
}
.profile-img img{
    max-width: 200px;
    max-height: 200px;
}
.profile-img .file, .file {
    position: relative;
    overflow: hidden;
/*     margin-top: -20%; */
    width: 70%;
    border: none;
    border-radius: 0;
    font-size: 15px;
    background: #212529b8;
}
.profile-img .file input, .file input {
    position: absolute;
    opacity: 0;
    right: 0;
    top: 0;
}
.profile-head h5{
    color: #333;
}
.profile-head h6{
    color: #0062cc;
}
.profile-edit-btn{
    border: none;
    border-radius: 1.5rem;
    width: 70%;
    padding: 2%;
    font-weight: 600;
    color: #6c757d;
    cursor: pointer;
}
.proile-rating{
    font-size: 12px;
    color: #818182;
    margin-top: 5%;
}
.proile-rating span{
    color: #495057;
    font-size: 15px;
    font-weight: 600;
}
.profile-head .nav-tabs{
    margin-bottom:5%;
}
.profile-head .nav-tabs .nav-link{
    font-weight:600;
    border: none;
}
.profile-head .nav-tabs .nav-link.active{
    border: none;
    border-bottom:2px solid #0062cc;
}
.profile-work{
    padding: 14%;
    margin-top: -15%;
}
.profile-work p{
    font-size: 12px;
    color: #818182;
    font-weight: 600;
    margin-top: 10%;
}
.profile-work a, .profile-work span{
    text-decoration: none;
    color: #495057;
    font-weight: 600;
    font-size: 14px;
}
.profile-work ul{
    list-style: none;
}
.profile-tab label{
    font-weight: 600;
}
.profile-tab a{
    font-weight: 600;
    color: #0062cc;
}
</style>

<script>
$(function(){
	// 수정버튼 클릭
	$("#basicModify").on("click",function(){
		$(".basic-info").prop("hidden",true);
		$(".basic-info-input").prop("hidden",false);
		var mails = "${empVO.empMail}".split('@');
		$("#email").val(mails[0]);
		$("#email2").val("@" + mails[1]);
		var empHp = "${empVO.empHp}".replace(/-/gi,"");
		$("#empHp").val(empHp);
	});
	
	$(".actionBtn").on("click",function(){
		var name = this.name;
		
		if(name=="cancel"){
			$(".basic-info").prop("hidden",false);
			$(".basic-info-input").prop("hidden",true);
		}else if(name=="pwCancel"){
			$(".pwSwitch").prop("hidden",false);
			$(".pwModify-input").prop("hidden",true);
		}else if(name=="doPwModify"){
			var regExpPw = /^(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
			
			var empPw = $("#passwordF").val();
			var empPw2 = $("#passwordF2").val();
			
			if(empPw == ""){
				alert("비밀번호를 입력해주세요");
				//해당 입력 항목에 커서가 놓임
				$("#passwordF").select();
				return false;
			}else if(empPw!=empPw2){
				alert("비밀번호가 일치하지 않습니다.");
				$("#passwordF").select();
				return false;
			}else if(!regExpPw.test(empPw)){
				alert("영문자 대소문자,숫자,특수문자를 1회이상 사용하여 8자 이상 입력해주세요.");
				$("#passwordF").select();
				return false;
			}
			
// 			$("#modifyEmpPw").val(empPw);
			$("#pwFrm").submit();
			
			$(".pwSwitch").prop("hidden",false);
			$(".pwModify-input").prop("hidden",true);
		}else if(name="doModify"){
			var regExpPh = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
			var regExpMail  = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
			
			var addr = $('#zipCode').val() + " " + $('#addr1').val() + " " + $('#addr2').val();
			var empHp = $("#empHp").val();
			
			if(empHp.length > 10){
				var a = empHp.slice(0,3);
				var b = empHp.slice(3,7);
				var c = empHp.slice(-4);
				var d = "-"
				empHp = [a, d, b, d, c].join('');
			}else{
				var a = empHp.slice(0,3);
				var b = empHp.slice(3,6);
				var c = empHp.slice(-4);
				var d = "-"
				empHp = [a, d, b, d, c].join('');
			}
			var mail1 = $("#email").val();
			var mail2 = $("#email2").val();
			var empMail = $("#email").val() + $("#email2").val();
			$("#empMail").val(empMail);
			
			if(empHp == ""){
				alert("전화번호를 입력해주세요");
				//해당 입력 항목에 커서가 놓임
				$("#empHp").select();
				return false;
			}else if(!regExpPh.test(empHp)){
				alert("전화번호 형식에 맞지 않습니다.");
				$("#empHp").focus();
				return false;
			}
			$("#empHp").val(empHp);
			
			if(mail1 == ""){
				alert("이메일을 입력해주세요");
				//해당 입력 항목에 커서가 놓임
				$("#email").select();
				return false;
			}else if(mail1 == ""){
				alert("이메일을 입력해주세요");
				$("#email").select();
				return false;
			}else if(!regExpMail.test(empMail)){
				alert("이메일 형식에 맞지 않습니다.");
				$("#email").focus();
				return false;
			}
			
			if(addr.trim()!=''){
				$("#empAddr").val(addr);
			}
			$("#basicFrm").submit();
		}
		return false;
	})
	
	
	//개인정보 탭 클릭
	$("#home-tab").on("show.bs.tab",function(){
		$("#profile-tab").prop('hidden',true);
		$("#fake-profile-tab").prop('hidden',false);
	})
	
	$("#pwModify").on("click",function(){
		$(".pwSwitch").prop("hidden",true);
		$(".pwModify-input").prop("hidden",false);
	});
	
	$("#input_img").on("change", handleImgFileSelect);
	
	function handleImgFileSelect(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("이미지만 가능합니다");
				return;
			}
			
			//파일을 읽어주는 객체 생성
			var reader = new FileReader();
			reader.onload = function(e){
 				$("#empPic").attr("src",e.target.result);
//  				var img = $(".profile_info").children()[0];
//  				$(img).attr('src', e.target.result);
//  				console.log(img);
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
	
	// 이메일
	$('#feInputState').change(function(){
	   $("#feInputState option:selected").each(function () {
			
			if($(this).val()== '1'){ //직접입력일 경우
				 $("#email2").val('@');                //값 초기화
				 $("#email2").attr("disabled",false); //활성화
			}else{ //직접입력이 아닐경우
				 $("#email2").val($(this).val());   //선택값 입력
				 $("#email2").attr("disabled",true); //비활성화
			}
	   });
	});
		
});

function fn_checkPwTab(){
	if("${loginUser.empCd}" != "${empVO.empCd}"){
		swal('','본인 외에는 확인할 수 없습니다.','error')
		return false;
	}
	var flag = swal({
		title: '본인 확인',
		text: '비밀번호를 입력해주세요!',
		icon: 'warning',
		content: {
			element: 'input',
			attributes: {
				placeholder: '비밀 번호',
				type: 'password'
			}
		},
		buttons: {
			cancle: {
				text: '취소',
				value: false,
				className: 'btn btn-danger'
			},
			confirm: {
				text: '확인',
				value: false,
				className: 'btn btn-success'
			}
		}
	}).then((result) => {
		if(result==null){
			swal('입력값 없음','비밀번호를 입력 해주시기 바랍니다','warning');
		}else if(result==''){
			swal('입력값 없음','비밀번호를 입력 해주시기 바랍니다','warning');
		}else{
			$.ajax({
				url:'/profile/pwMatches',
				data:{"empPw":result, "empCd":"${loginUser.empCd}"},
				type: 'post',
				beforeSend: function (jqXHR, settings) {
					// ajax 사용시 헤더에 스프링시큐리티 토큰 설정
					var token = '${_csrf.token}'
					var header = '${_csrf.headerName}'
					jqXHR.setRequestHeader(header, token);
				},
				success:function(res){
					if(res){
						$("#home-tab").attr('aria-selected',false);
			 			$("#home-tab").attr('class','nav-link');
			 			$("#home").attr('class','tab-pane fade');
			 			$("#profile-tab").attr('aria-selected',true);
			 			$("#profile-tab").prop('hidden',false);
			 			$("#fake-profile-tab").prop('hidden',true);
			 			$("#profile-tab").attr('class','nav-link active');
			 			$("#profile").attr('class','tab-pane fade show active');
					}else{
						swal('비밀번호가 일치하지 않습니다.','비밀번호를 확인 해주시기 바랍니다','warning');
					}
				}
			})
		}
// 		}else if(result!='${empVO.empPw}'){
// 			swal('비밀번호가 일치하지 않습니다.','비밀번호를 확인 해주시기 바랍니다','warning');
// 		}else{
// 			$("#home-tab").attr('aria-selected',false);
// 			$("#home-tab").attr('class','nav-link');
// 			$("#home").attr('class','tab-pane fade');
// 			$("#profile-tab").attr('aria-selected',true);
// 			$("#profile-tab").prop('hidden',false);
// 			$("#fake-profile-tab").prop('hidden',true);
// 			$("#profile-tab").attr('class','nav-link active');
// 			$("#profile").attr('class','tab-pane fade show active');
// 		}
	});
	
}
</script>

<h2>&nbsp;</h2>

<div class="container emp-profile">
        <div class="row">
            <div class="col-md-4 profile-img-div">
                <div class="profile-img">
                    <img id="empPic" src="${empVO.empPic}" alt=""/>
                </div>
            </div>
            <div class="col-md-6">
                <div class="profile-head">
                            <h5>
                                ${empVO.empNm}
                            </h5>
                            <h6>
                                ${empVO.secNm}
                            </h6>
                            <p class="proile-rating">
                            	직급 : <span>${empVO.position}</span>
                            </p>
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">기본정보</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false" hidden="true">개인정보</a>
                            <a class="nav-link" id="fake-profile-tab" href="javascript:fn_checkPwTab()">개인정보</a>
                        </li>
                    </ul>
                </div>
            </div>
            <c:if test='${empVO.empCd eq loginUser.empCd}'>
            <div class="col-md-2">
                <button id="basicModify" type="button" class="profile-edit-btn basic-info">수정</button>
            </div>
            </c:if>
        </div>
        <div class="row">
            <div class="col-md-4">
                <div class="profile-work">
                    <p>메뉴</p>
                    <a href="/schedule/main">일정</a><br/>
                    <p>입사일</p>
                    <span>${empVO.hireDate}</span>
                    <br/>
                </div>
            </div>
            <div class="col-md-8">
                <div class="tab-content profile-tab" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <form:form id="basicFrm" modelAttribute="empVO" method="post"
                                	 action="/profile/basicModify" enctype="multipart/form-data">
        						<sec:csrfInput/>
        						<div class="file btn btn-lg btn-primary basic-info-input" hidden="true">
			                        	사진 바꾸기
			                        <input id="input_img" type="file" name="uploadFile"/>
			                    </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>사원 번호</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>
                                        	${empVO.empCd}
                                        	<form:hidden path="empCd"/>
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>연락처</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>
                                        	<span class="basic-info">${empVO.empHp}</span>
                                        	<form:input path="empHp" class="basic-info-input" hidden="true"/>
                                        </p>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>메일 주소</label>
                                    </div>
                                    <div class="col-md-6">
<!--                                         <p> -->
                                        	<span class="basic-info">${empVO.empMail}</span>
                                        	<form:hidden path="empMail"/>
                                        	<div class="form-row basic-info-input" hidden="true">
						                        <div class="form-group col-md-4">
						                          <label for="email">&nbsp;</label>
						                          <input type="text" class="form-control" id="email" placeholder="이메일"> </div>
						                        <div class="form-group col-md-4">
						                          <label for="email2">&nbsp;</label>
						                          <input type="text" class="form-control" id="email2" disabled> </div>
						                        <div class="form-group col-md-4">
						                          <label for="feInputState">&nbsp;</label>
						                          <select id="feInputState" class="form-control">
						                            <option value="1">직접입력</option>
													<option value="@naver.com" selected>naver.com</option>
													<option value="@hanmail.net">hanmail.net</option>
													<option value="@hotmail.com">hotmail.com</option>
													<option value="@nate.com">nate.com</option>
													<option value="@yahoo.co.kr">yahoo.co.kr</option>
													<option value="@gmail.com">gmail.com</option>
						                          </select>
						                        </div>
						                    </div>
<!--                                         </p> -->
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>주소</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>
                                        	<span class="basic-info" id="exAddr">${empVO.empAddr}</span>
                                        	<form:input path="empAddr" hidden="true"/>
                                        </p>
                                        <div class="form-row basic-info-input" hidden="true">
<!-- 									        <div class="form-group col-md-4"> -->
									            <input type="text" class="form-control" id="zipCode" readonly>
<!-- 									        </div> -->
<!-- 									        <div class="form-group col-md-4"> -->
									            <button id="searchZip" type="button" class="mb-2 btn btn-sm btn-info mr-1 basic-info-input">우편번호 검색</button>
<!-- 									        </div> -->
								        </div>
								        <div class="form-group basic-info-input" hidden="true">
								            <input type="text" class="form-control" id="addr1" readonly>
								        </div>
								        <div class="form-group basic-info-input" hidden="true">
								            <input type="text" class="form-control" id="addr2" readonly>
								        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>면허 번호</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>
                                        	<span class="basic-info">${empVO.lcnsNo}</span>
                                        	<form:input path="lcnsNo" class="basic-info-input" hidden="true"/>
                                        </p>
                                    </div>
                                    <button name="doModify" type="button" class="btn btn-primary basic-info-input actionBtn" hidden="true">수정</button>
                                    <button name="cancel" type="button" class="btn btn-secondary basic-info-input actionBtn" hidden="true">취소</button>
                                </div>
                    	</form:form>
                    </div>
                    <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
	                    
                                <form:hidden path="empCd"/>
                                <div class="row">
                                    <div class="col-md-3">
                                        <label>주민등록번호</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>${empVO.viewSecurityEmpPrno()}</p>
                                    </div>
                                </div>
                                <div class="row pwSwitch">
                                    <div class="col-md-3">
                                        <label>비밀번호</label>
                                    </div>
                                    <div class="col-md-6">
                                        <p>********</p>
                                    </div>
                                </div>
                        <div class="row">
					        <form id="pwFrm" method="post" action="/profile/pwModify">
		        				<sec:csrfInput/>
	                            <div class="col-md-12">
	                            <div>
					                <button id="pwModify" type="button" class="profile-edit-btn pwSwitch">비밀번호 변경</button>
					            </div>
	                                <div class="form-row pwModify-input" hidden="true">
				                        <div class="form-group col-md-6">
				                        	<input type="hidden" name="empCdPw" value="${empVO.empCd}"/>
				                          <label for="password">비밀번호</label>
				                          <input type="password" class="form-control" id="passwordF" name="pw1" placeholder="비밀번호"> </div>
				                        <div class="form-group col-md-6">
					                        <label for="password-check">비밀번호 확인</label>
					                        <input type="password" class="form-control" id="passwordF2" placeholder="비밀번호 확인"> </div>
				                    </div>
				                    <button name="doPwModify" type="button" class="btn btn-primary pwModify-input actionBtn" hidden="true">변경</button>
	                                <button name="pwCancel" type="button" class="btn btn-secondary pwModify-input actionBtn" hidden="true">취소</button>
	                            </div>
	                    	</form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</div>




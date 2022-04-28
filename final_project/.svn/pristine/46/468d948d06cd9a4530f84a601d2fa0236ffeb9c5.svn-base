<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script>
	function fn_settingPw(){
		var regExpPw = /^(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
		var pws = $(".pw");
		
		if(pws[0].value == ""){
			alert("비밀번호를 입력해주세요");
			//해당 입력 항목에 커서가 놓임
			$(".pw")[0].select();
			return false;
		}else if(pws[0].value!=pws[1].value){
			alert("비밀번호가 일치하지 않습니다.");
			$(".pw")[0].select();
			return false;
		}else if(!regExpPw.test(pws[0].value)){
			alert("영문자 대소문자,숫자,특수문자를 1회이상 사용하여 8자 이상 입력해주세요.");
			$(".pw")[0].select();
			return false;
		}
		$("form").submit();
	}
</script>

<div class="white_box mb_30">
	<div class="row justify-content-center">
		<div class="col-lg-6">
			<div class="modal-content cs_modal">
				<div class="modal-header">
					<h5 class="modal-title">비밀번호 재설정</h5>
				</div>
				<c:if test="${match}">
					<div class="modal-body">
						<form action="/settingPwDone" method="post">
							<sec:csrfInput/>
							<input type="hidden" name="empCd" value="${empCd}">
							<div class="form-group">
								<input type="password" name="empPw" class="form-control pw" placeholder="비밀번호">
								<input type="password" class="form-control pw" placeholder="비밀번호 확인">
							</div>
							<a href="javascript:fn_settingPw()" class="btn_1 full_width text-center">재설정</a>
						</form>
					</div>
				</c:if>
				<c:if test="${!match}">
					<div class="modal-body">
						<div class="form-group">
							<h4>비밀번호 변경가능 시간이 만료되었습니다.</h4>
						</div>
						<a href="/login" class="btn_1 full_width text-center">로그인 화면으로</a>
					</div>
				</c:if>
			</div>
		</div>
	</div>
</div>

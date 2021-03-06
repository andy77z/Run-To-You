<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- <script src="/resources/js/jquery-3.4.1.min.js"></script> -->

<script type="text/javascript">
$(function(){
	console.log("${param.asdas}")
	$("input[name='username']").focus();
	
	$("#login-btn").on("click",function(){
		login();
	});
	$("input[name='username']").on('keydown',function(e){
		if(e.key=='Enter'){
			login();
		}
	});
	$("input[name='password']").on('keydown',function(e){
		if(e.key=='Enter'){
			login();
		}
	});
	$("#demo").on('click',function(){
		$("#nm").val('정지현');
		$("#rrno1").val('950905')
		$("#rrno2").val('2371659')
		$("#empHp").val('01062514253');
		$("#passwordF").val('qwerQwer1!');
		$("#passwordF2").val('qwerQwer1!');
		$("#email").val('nny1130');
		$("#email2").val('@naver.com');
		$('#zipCode').val('34933');
		$('#addr1').val('대전 중구 충무로107번길 100');
		$('#addr2').val('센트럴자이 101동 1201호');
	})
	function login(){
		var username = $("input[name='username']").val();
		var password = $("input[name='password']").val();
		
		if(username == ""){
			swal("","ID를 입력해주세요","warning");
			$("input[name='username']").focus();
			return false;
		}else if(password == ""){
			swal("","비밀번호를 입력해주세요","warning");
			$("input[name='password']").focus();
			return false;
		}
		
		$.ajax({
			url:'/first',
			method:'get',
			data:{"username":username,"password":password},
			success:function(res){
				if(res == 1){
					$("#myModal").modal('show');
				}else{
					if(res == 3){
						swal("","아이디 또는 비밀번호가 잘못되었습니다.","warning");
						$("input[name='username']").focus();
						return false;
					}
					$("#login-form").submit();
				}
			}
		});
	}
	
	// 최초 로그인 모달 닫기
	function cancel(){
		$("input[name='username']").val('');
		$("input[name='password']").val('');
		$("#nm").val('');
		$("#rrno1").val('')
		$("#rrno2").val('')
		$("#empHp").val('');
		$("#passwordF").val('');
		$("#passwordF2").val('');
		$("#email").val('');
		$("#email2").val('@naver.com');
		$('#zipCode').val('');
		$('#addr1').val('');
		$('#addr2').val('');
		
		$("#myModal").modal('hide');
	}
	var close = $(".cancel");
	close[0].addEventListener("click",cancel);
	close[1].addEventListener("click",cancel);
	
	// 최초 로그인 - 이메일
	$('#selectEmail').change(function(){
	   $("#selectEmail option:selected").each(function () {
			
			if($(this).val()== '1'){ //직접입력일 경우
				 $("#email2").val('@');                //값 초기화
				 $("#email2").attr("disabled",false); //활성화
			}else{ //직접입력이 아닐경우
				 $("#email2").val($(this).val());   //선택값 입력
				 $("#email2").attr("disabled",true); //비활성화
			}
	   });
	});
	
	// 최초로그인 등록버튼
	$("#firstBtn").on("click",function(){
		var regExpPw = /^(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
		var regExpNm = /^[가-힣]+$/;
		var regExpPh = /^01(?:0|1|[6-9])-(?:\d{3}|\d{4})-\d{4}$/;
		var regExpMail  = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		var empCd = $("input[name='username']").val();
		var empNm = $("#nm").val();
		var regno = $("#rrno1").val() + $("#rrno2").val();
		var empPrno = $("#rrno1").val() + "-" + $("#rrno2").val()
		var empHp = $("#empHp").val();
		if(empHp.length > 10){
			var a = empHp.slice(0,3);
			var b = empHp.slice(3,7);
			var c = empHp.slice(-4);
			var d = "-"
			empHp = [a, d, b, d, c].join('');
		}
		
		var empPw = $("#passwordF").val();
		var empPw2 = $("#passwordF2").val();
		var mail1 = $("#email").val();
		var mail2 = $("#email2").val();
		var empMail = $("#email").val() + $("#email2").val();
		var empAddr = $('#zipCode').val() + " " + $('#addr1').val() + " " + $('#addr2').val();
		
		console.log(empCd,empNm,empHp,empPrno,empPw,empPw2,empMail,empAddr)
		
		if(empNm == ""){
			swal("","이름을 입력해주세요","warning");
			//해당 입력 항목에 커서가 놓임
			$("#nm").focus();
			return false;
		}else if(!regExpNm.test(empNm)){
			swal("","이름은 한글만 입력 가능합니다.","warning");
			$("#nm").focus();
			return false;
		}
		
		var sum = 0;
		for(let i = 0; i < regno.length - 1; i++){
			sum += parseInt(regno.substr(i, 1)) * (i % 8 + 2);
		}
		var res = 11 - (sum % 11);
		res = res % 10;
		
		if(res == parseInt(regno.substr(regno.length - 1, 1))){
			
		}else{
			swal("","주민등록번호가 유효하지 않습니다.","warning");
			return false;
		}
		
		if(empHp == ""){
			swal("","전화번호를 입력해주세요","warning");
			//해당 입력 항목에 커서가 놓임
			$("#hp").select();
			return false;
		}else if(!regExpPh.test(empHp)){
			swal("","전화번호 형식에 맞지 않습니다.","warning");
			$("#hp").focus();
			return false;
		}
		
		if(empPw == ""){
			swal("","비밀번호를 입력해주세요","warning");
			//해당 입력 항목에 커서가 놓임
			$("#passwordF").select();
			return false;
		}else if(empPw!=empPw2){
			swal("","비밀번호가 일치하지 않습니다.","warning");
			$("#passwordF").select();
			return false;
		}else if(!regExpPw.test(empPw)){
			swal("","영문자 대소문자,숫자,특수문자를 1회이상 사용하여 8자 이상 입력해주세요.","warning");
			$("#passwordF").select();
			return false;
		}
		
		if(mail1 == ""){
			swal("","이메일을 입력해주세요","warning");
			//해당 입력 항목에 커서가 놓임
			$("#email").select();
			return false;
		}else if(mail1 == ""){
			swal("","이메일을 입력해주세요","warning");
			$("#email").select();
			return false;
		}else if(!regExpMail.test(empMail)){
			swal("","이메일 형식에 맞지 않습니다.","warning");
			$("#email").focus();
			return false;
		}
		
		$.ajax({
			url:'/first/infoReg',
			method:'get',
			data:{"empCd":empCd,"empNm":empNm,"empPrno":empPrno,
				  "empHp":empHp,"empPw":empPw,"empMail":empMail,
				  "empAddr":empAddr},
			success:function(res){
				if(res){
					swal({
						title: '',
						text: '정보등록성공!',
						icon: 'success',
						buttons: {
							confirm: {
								text: '확인',
								value: false,
								className: 'btn btn-success'
							}
						}
					}).then((result) => {
						cancel();
					})
				}else{
					swal("","정보등록실패! 다시 시도 해주세요.","warning");
				}
			}
		});
	});
	
	// 비밀번호 찾기 - 이메일
	$('#s_selectEmail').change(function(){
		   $("#s_selectEmail option:selected").each(function () {
				
				if($(this).val()== '1'){ //직접입력일 경우
					 $("#s_email2").val('@');                //값 초기화
					 $("#s_email2").attr("disabled",false); //활성화
				}else{ //직접입력이 아닐경우
					 $("#s_email2").val($(this).val());   //선택값 입력
					 $("#s_email2").attr("disabled",true); //비활성화
				}
		   });
		});
	
	// 비밀번호 찾기
	$("#s_pwBtn").on("click",function(){
		$("#forgot_password").modal('hide');
		$('html').loading('start');
		var empCd = $("#s_empCd").val();
		var email = $("#s_email").val() + $("#s_email2").val();
		
		$.ajax({
			url:'/findPw',
			method:'get',
			data: {"empCd":empCd,"email":email},
			success:function(res){
				if(res){
					$('html').loading('stop');
					swal("전송 성공", "이메일을 확인하세요!","success");
					$("#s_empCd").val('');
					$("#s_email").val('');
					$("#s_selectEmail option:first").prop("selected",true);
				}else{
					$('html').loading('stop');
					swal("전송 실패", "다시 시도해 주세요.","error");
					$("#forgot_password").modal('show');
				}
			}
		})
	});
});

</script>
<!-- 본문 컨텐츠 시작 -->
<div class="main_content_iner bg">
	<div class="container-fluid p-0">
		<div class="row">
			<div class="col-lg-12">
				<div class="white_box mb_30">
					<div class="row justify-content-center">
						<div class="col-lg-6">
							<div class="modal-content cs_modal">
								<div class="modal-header">
									<h5 class="modal-title">로그인</h5>
								</div>
								<div class="modal-body">
									<form id="login-form" class="user" action="/login" method="post">
									<sec:csrfInput/>
<!-- 										<div class="form-row social_login_btn"> -->
<!-- 											<div class="form-group col-md-12 text-center"> -->
<!-- 												<a href="#" class="btn_1 full_width"><i class="fab fa-facebook-square"></i>Log in with Facebook</a> -->
<!-- 											</div> -->
<!-- 											<div class="form-group col-md-12 text-center"> -->
<!-- 												<a href="#" class="btn_1 full_width"><i class="fab fa-google"></i>Log in with Google</a> -->
<!-- 											</div> -->
<!-- 										</div> -->
<!-- 										<div class="border_style"> -->
<!-- 											<span>Or</span> -->
<!-- 										</div> -->
										<div class="form-group">
											<input type="text" name="username" class="form-control" placeholder="사번" value="EMP00001" tabindex="1">
										</div>
										<div class="form-group">
											<input type="password" name="password" class="form-control" placeholder="비밀번호" value="EMP00001" tabindex="2">
										</div>
										<div class="form-group">
				                            <div class="custom-control custom-checkbox small">
				                                <input type="checkbox" name="remember-me" class="custom-control-input" id="customCheck">
				                                <label class="custom-control-label" for="customCheck">ID 기억하기</label>
				                            </div>
				                        </div>
										<button type="button" id="login-btn" class="btn_1 full_width text-center">로그인</button>
<!-- 										<p><a data-toggle="modal" data-target="#sing_up" data-dismiss="modal" href="#">회원가입</a></p> -->
										<div class="text-center">
											<a href="#" data-toggle="modal" data-target="#forgot_password" data-dismiss="modal" class="pass_forget_btn">비밀번호 찾기</a>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- The Modal -->
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">최초 로그인 입니다</h4>
	        <button type="button" id="demo">demo</button>
	        <button type="button" class="close cancel" data-dismiss="modal">&times;</button>
	      </div>
		  
		  <form>
	      <!-- Modal body -->
	      <div class="modal-body">
	        <ul class="list-group list-group-flush">
              <li class="list-group-item p-3">
                <div class="row">
                  <div class="col">
                    
                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="nm">이름</label>
                          <input type="text" class="form-control" id="nm" placeholder="이름을 입력하세요"> </div>
                      </div>
                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="rrno1">주민등록번호</label>
                          <input type="text" class="form-control" id="rrno1" placeholder="앞자리"> </div>
                        <div class="form-group col-md-6">
                          <label for="rrno2">&nbsp;</label>
                          <input type="password" class="form-control" id="rrno2" placeholder=*******> </div>
                      </div>
                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="empHp">연락처</label>
                          <input type="text" class="form-control" id="empHp" placeholder="'-'를 제외하고 입력"> </div>
                      </div>
                      <div class="form-row">
                        <div class="form-group col-md-6">
                          <label for="password">비밀번호</label>
                          <input type="password" class="form-control" id="passwordF" placeholder="비밀번호"> </div>
                        <div class="form-group col-md-6">
                          <label for="password-check">비밀번호 확인</label>
                          <input type="password" class="form-control" id="passwordF2" placeholder="비밀번호 확인"> </div>
                      </div>
                      <div class="form-row">
                        <div class="form-group col-md-4">
                          <label for="email">이메일</label>
                          <input type="text" class="form-control" id="email" placeholder="이메일"> </div>
                        <div class="form-group col-md-4">
                          <label for="email2">&nbsp;</label>
                          <input type="text" class="form-control" id="email2" disabled value="@naver.com"> </div>
                        <div class="form-group col-md-4">
                          <label for="feInputState">&nbsp;</label>
                          <select id="selectEmail" class="form-control selectEmail">
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
                      <div class="form-row">
                      	  <input type="hidden" id="addr"/>
				          <div class="form-group col-md-4">
				          	<label for="zipCode">주소</label>
				            <input type="text" class="form-control" id="zipCode" readonly>
				          </div>
				          <div class="form-group col-md-4">
				            <button id="searchZip" type="button" class="mb-2 btn btn-sm btn-info mr-1">우편번호 검색</button>
				          </div>
			          </div>
			          <div class="form-group">
			            <input type="text" class="form-control" id="addr1" readonly>
			          </div>
			          <div class="form-group">
			            <input type="text" class="form-control" id="addr2" readonly>
			          </div>
<!--                       <div class="form-group"> -->
<!--                         <label for="feInputAddress">주소</label> -->
<!--                         <input type="text" class="form-control" id="feInputAddress" placeholder=""> </div> -->
                  </div>
                </div>
              </li>
            </ul>
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" id="firstBtn" class="btn btn-primary" data-dismiss="modal">등록</button>
	        <button type="button" class="btn btn-danger cancel" data-dismiss="modal">취소</button>
	      </div>
	      </form>
	    </div>
	  </div>
	</div>
	
	
	<div class="modal" id="forgot_password">
		<div class="row justify-content-center">
			<div class="col-lg-6">
			
				<div class="modal-content cs_modal">
					<div class="modal-header">
						<h5 class="modal-title">비밀번호 찾기</h5>
						<button type="button" class="close cancel" data-dismiss="modal">&times;</button>
					</div>
					<div class="modal-body">
						<p>사번과 등록한 EMAIL을 입력해주세요</p>
						<p>정보가 일치하면 이메일로 비밀번호 재설정 URL을 전송합니다</p>
						<div class="form-group">
							<input type="text" id="s_empCd" class="form-control" placeholder="사번">
							<div class="form-row">
		                        <div class="form-group col-md-4">
		                          	<label for="s_email">이메일</label>
		                          	<input type="email" class="form-control" id="s_email" placeholder="이메일"> </div>
		                        <div class="form-group col-md-4">
		                          	<label for="s_email2">&nbsp;</label>
		                          	<input type="email" class="form-control" id="s_email2" disabled value="@naver.com"> </div>
		                        <div class="form-group col-md-4">
		                          	<label for="feInputState">&nbsp;</label>
		                          	<select id="s_selectEmail" class="form-control selectEmail">
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
						</div>
						<button id="s_pwBtn" class="btn_1 full_width text-center">전송</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	
</div>

<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script type="text/javascript">
var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
var csrfHeader = $("meta[name=_csrf_header]").attr("content");
var csrfToken = $("meta[name=_csrf]").attr("content");
var socket = null;

$('html').loading('start');

$(function(){
	connectWs();
	
	function connectWs(){
	   	sock = new SockJS( "<c:url value="/echo"/>" );
	   	//sock = new SockJS('/replyEcho');
	   	socket = sock;
	   	
	   	sock.onopen = function() {
// 	           console.log('info: connection opened.');
// 	           console.log(socket)
	           socket.send('${loginUser.empCd}');
	   	};
	    sock.onclose = function() {
// 	      	console.log('connect close');
	      	/* setTimeout(function(){conntectWs();} , 1000); */
	    };

	    sock.onerror = function (err) {console.log('Errors : ' , err);};

	};
	
	$('html').loading('stop');
	$("#searchInput").autocomplete({
		source : function( request, response ) {
             $.ajax({
                    type: 'get',
                    url: "/main/searchData",
                   	data: {"data":$("#searchInput").val()},
                    success: function(data) {
                        response(
                            $.map(data, function(item) {	//json[i] 번째 에 있는게 item 임.
                                return {
                                    label: item.nm,	//UI 에서 보여지는 글자, 실제 검색어랑 비교 대상
                                    cd: item.cd,
                                    cls : item.cls
                                }
                            })
                        );
                    }
               });
            },	// source 는 자동 완성 대상
		select : function(event, ui) {	//아이템 선택시
			if(ui.item.cls=='환자'){
				location.href='/patients/patientsList?keyWord='+ui.item.label;
			}else if(ui.item.cls=='직원'){
				location.href='/profile/'+ui.item.cd;
			}else if(ui.item.cls=='예약'){
				location.href='/reservation/main'
			}
			
		},
		focus : function(event, ui) {	//포커스 가면
			return false;//한글 에러 잡기용도로 사용됨
		},
		minLength: 1,// 최소 글자수
		autoFocus: true, //첫번째 항목 자동 포커스 기본값 false
		classes: {	//잘 모르겠음
		    "ui-autocomplete": "highlight"
		},
		delay: 100,	//검색창에 글자 써지고 나서 autocomplete 창 뜰 때 까지 딜레이 시간(ms)
// 		disabled: true, //자동완성 기능 끄기
		position: { my : "left top", at: "left bottom" },	//잘 모르겠음
		close : function(event){	//자동완성창 닫아질때 호출
// 			console.log(event);
		}
	}).autocomplete( "instance" )._renderItem = function( ul, item ) {    //요 부분이 UI를 마음대로 변경하는 부분
	        ul.css("background","#f5f7fd");
			return $( "<li>" )	//기본 tag가 li로 되어 있음 
	        .append( "<div>" + item.cls + "<br>" + item.label + "</div>" )	//여기에다가 원하는 모양의 HTML을 만들면 UI가 원하는 모양으로 변함.
	        .appendTo( ul );
 	};
	
	var secCd = $('#secSelectBox option:selected').val();
	var empCd = "${loginUser.empCd}";
	
	if(empCd!=''){
		fn_loadInfo();
		loadNotification();
		//10초마다 알림 불러오기
// 		let notiInterval = setInterval(loadNotification,5000);
	
		//직원상태
		function fn_loadInfo(){
			var data = {};

			data[csrfParameter]=csrfToken;
		    data["secCd"]=secCd;
		    data["empCd"]=empCd;
		    
		    $.ajax({ 
				url : "/main/secEmpList", 
				type : "post", 
				dataType : "html", 
				data : data, 
				traditional: true,
				success: function(res){
					var html = $("<div>").html(res);
					var contents = html.find("div#secEmpList").html();
					$("#secEmpListWrap").html(contents);
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert(textStatus)
				}
			});
		}
		
		function loadNotification(){
			var data = {};

			data[csrfParameter]=csrfToken;
		    data["secCd"]=secCd;
		    data["empCd"]=empCd;
		    
		    //알림 토스트
		    $.ajax({ 
				url : "/notification/toast",
				type : "post",
				data : data, 
				success: function(res){
					$.each(res,function(i,v){
						toastr.options.escapeHtml = true;
						toastr.options.closeButton = true;
						toastr.options.newestOnTop = false;
						toastr.options.progressBar = true;
						toastr.options.onclick = function() {
							data["notNo"]=v.notNo;
							
							$.ajax({ 
								url : "/notification/click", 
								type : "post",
								data : data,
								success: function(res){
									location.href = v.notUrl;
								},
								error: function(jqXHR, textStatus, errorThrown){
									alert(textStatus)
								}
							});
						};
						if(v.cmCd=='NS1'){
							toastr.info(v.notDt, v.opt, {timeOut: 7500});
						}else{
							toastr.info(v.notDt, v.pntNm + ' 님이 ' + v.opt, {timeOut: 7500});
						}
					});
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert(textStatus)
				}
			});
		    
		    //알림 div에 찍기
		    $.ajax({ 
				url : "/notification/list", 
				type : "post",
				data : data,
				dataType : "html",
				success: function(res){
					var html = $("<div>").html(res);
					var contents = html.find("div#ajaxData").html();
					$("#notification").html(contents);
				},
				error: function(jqXHR, textStatus, errorThrown){
					alert(textStatus)
				}
			});
		}
	}
	
	$("#secSelectBox").on("change",function(){
		secCd = $('option:selected',this).attr('value');
		fn_loadInfo();
	})
	
	$(document).on('click',"#allRead",function(){
		$.ajax({ 
			url : "/notification/allRead", 
			type : "post",
			data : {"empCd":"${loginUser.empCd}"},
			beforeSend: function (jqXHR, settings) {
				/* ajax 사용시 헤더에 스프링시큐리티 토큰 설정 */
				var token = '${_csrf.token}'
				var header = '${_csrf.headerName}'
				jqXHR.setRequestHeader(header, token);
			},
			success: function(res){
// 				$("#notification").empty();
				loadNotification();
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert(textStatus)
			}
		});
	})
	
	var searchInput = $("#searchInput");
	searchInput.focus(function(){
		$(".searchBox").prop("hidden",false);
	});
	
	/*알림 클릭*/
	$(".notification_info a").on("click", function(){
		$(".notification_info_iner.notification").addClass("on");
	});
	
	/*알림 닫기버튼 클릭*/
	$(".notification_info .notification button.btn-close").on("click",function(){
		$(".notification_info_iner.notification").removeClass("on");
	});

	
})



function fn_clickNotification(t){
	console.log(t.id)
	console.log(t.name)
	var data = {};

	data[csrfParameter]=csrfToken;
	data["notNo"]=t.id;
	
	$.ajax({ 
		url : "/notification/click", 
		type : "post",
		data : data,
		success: function(res){
			location.href = t.name;
		},
		error: function(jqXHR, textStatus, errorThrown){
			alert(textStatus)
		}
	});
}

function fn_logout(){
	document.getElementById('logoutFrm').submit();
}

function fn_showInfo(t){
	$(t).next().prop("hidden",false);
}

function fn_closeInfo(t){
	$(t).next().prop("hidden",true);
}

</script>
<style>
.tooltip-table{
	background-color: #2e4765;
	position:absolute;
	right: 180px;
	top: 200px;
	margin: 50px; 
	padding: 20px; 
	width:300px;
	border-radius: 10px;
	height: auto;
}
.tooltip-table:after{
	content:""; 
	position: absolute; 
	top: 21px; 
	right: -30px; 
	border-left: 30px solid #2e4765; 
	border-top: 10px solid transparent; 
	border-bottom: 10px solid transparent;
}
.tooltip-table table{
	font-size: 14px;
	width: 260px;
	color: #eff1f7;
	text-align: right;
}
.tooltip-table table tr :nth-child(1){
	width: 20%;
}
.tooltip-table table tr :nth-child(2){
	width: 78%;
}
.notification li a {
    text-decoration: none;
}
.hide {
  	display: none !important;	/* 사용자가 아무것도 입력하지 않았을 때 검색창을 숨기는 용도*/
}
.rel_search {
	display:flex;
	flex-direction:column;
	justify-content : space-around;
	border-radius: 12px;
	background: #f5f7fd;
	z-index: 10;
}
.pop_rel_keywords {
  list-style: none;
  margin-right: 30%;
}
.pop_rel_keywords > li {	/* JS에서 동적으로 li를 생성할 때 적용될 스타일*/
  line-height : 250%
}
.empList{
	margin: -15px;
}
</style>

<div id="header" class="container-fluid no-gutters">
	<div class="row">
		<div class="col-lg-12 p-0">
			<div class="header_iner d-flex justify-content-between align-items-center">
				<div class="sidebar_icon d-lg-none">
					<i class="ti-menu"></i>
				</div>
				<div class="serach_field-area">
					<div class="search_inner">
						<form action="#">
							<div class="search_field">
								<input id="searchInput" type="text" placeholder="검색">
							</div>
							<button type="submit">
								<img src="/resources/img/icon/icon_search.svg" alt="">
							</button>
						</form>
					</div>
				</div>
				
				<!-- 로그인 하지 않은 경우 true -->
                <sec:authorize access="isAnonymous()">
                <div class="header_right d-flex justify-content-between align-items-center">
                	<div class="header_notification_warp d-flex align-items-center">
                		<div class="notification_info">
							<a href="#"> <img src="/resources/img/icon/bell.svg" alt=""></a>
							<div id="notification" class="notification_info_iner notification white_box shadow">
								<!-- 알림 영역 -->
								<ul class="list-group list-group-flush">
									<li class="list-group-item">
								    	<a href="/login"><span class="text-info mr-2">로그인 해주세요</span></a>
								  	</li>
								</ul>
							</div>
						</div>
                	</div>
                	<div class="profile_info">
                		<img src="/resources/img/client_img.png" alt="#">
                		<div class="profile_info_iner">
							<a href="/login"><h5><i class="ti-user"></i>로그인 해주세요</h5></a>
						</div>
                	</div>
				</div>
                </sec:authorize>
                
                <!-- 로그인 시 -->
                <sec:authorize access="isAuthenticated()">
	                <sec:authentication property="principal.user.empPic" var="empPic"/>
	                <sec:authentication property="principal.user.empCd" var="empCd"/>
	                <sec:authentication property="principal.user.empNm" var="empNm"/>
	                <sec:authentication property="principal.user.secCd" var="secCd"/>
	                <sec:authentication property="principal.user.secNm" var="secNm"/>
	                <input type="hidden" id="checkLogin" value="${empCd}">
				<div class="header_right d-flex justify-content-between align-items-center">
					<sec:authorize access='hasAnyRole("ROLE_DOCTOR","ROLE_NURSE","ROLE_ENGI","ROLE_WONMU")'>
					<div class="header_notification_warp d-flex align-items-center">
							<div class="notification_info">
								<a href="#"> <img src="/resources/img/icon/bell.svg" alt=""></a>
								<div class="notification_info_iner notification white_box shadow">
									<!-- 알림 영역(알림이 많을 경우 화면이 넘어가지 않게 스크롤 처리함) -->
									
									<div id="notification" class="notification_info_iner notification white_box shadow"
										style="max-height: 500px; overflow: auto;">
									
									</div>
									<button type="button" class="btn btn-close">닫기</button>
									<button id="allRead" type="button" class="btn btn-sm btn-danger" style="float:right;">전체 읽음 처리</button>
								</div>
							</div>
					</div>
					</sec:authorize>
					<div class="profile_info">
						<img src="${empPic}" alt="#">
						<div class="profile_info_iner">
							<p>${secNm}</p>
							<h5>${empNm}</h5>
							<div class="profile_info_details">
								<sec:authorize access='hasAnyRole("ROLE_DOCTOR","ROLE_NURSE","ROLE_ENGI","ROLE_WONMU")'>
								<a href="/profile/${empCd}">My Profile <i class="ti-user"></i></a>
								</sec:authorize>
<!-- 								<a href="#">Settings<i class="ti-settings"></i></a> -->
								<form id="logoutFrm" action="/logout" method="post">
			                    	<sec:csrfInput/>
				                    <a href="javascript:fn_logout()">Log Out <i class="ti-shift-left"></i></a>
			                    </form>
							</div>
							<sec:authorize access='hasAnyRole("ROLE_DOCTOR","ROLE_NURSE","ROLE_ENGI","ROLE_WONMU")'>
							<div class="profile_info_details">
								<h5>
									<select id="secSelectBox">
										<option value="${secCd}" selected>${secNm}</option>
										<c:forEach var="op" items="${secSelectBox}">
											<option value="${op.secCd}">${op.secNm}</option>
										</c:forEach>
									</select>
								</h5>
								<!-- 자기 팀 상태 -->
								<div id="secEmpListWrap">
									
								</div>
							</div>
							</sec:authorize>
						</div>
					</div>
				</div>
				</sec:authorize>
			</div>
		</div>
	</div>
</div>

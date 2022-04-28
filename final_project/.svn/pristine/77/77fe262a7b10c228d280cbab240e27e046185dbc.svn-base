<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 본문 컨텐츠 시작 -->
<div class="main_content_iner ">
	<div class="container-fluid p-0">
		<div class="row justify-content-center">
			<div class="col-lg-12">
				<div class="messages_box_area">
					<div class="messages_list">

						<!-- 예약 리스트 갯수에 상관 없이 높이 고정 -->
						<div class="white_box shadow-sm mb-3" style="height: 473.062px;">
							<div class="message_pre_left">
								<input type="hidden" name="setRsvtNo" id="setRsvtNo" />
								<input type="hidden" name="setRcptNo" id="setRcptNo" />
								<div class="messges_info">
									<h4 class="mb-3">예약</h4>
								</div>
							</div>

							<table class="table" id="yeyakTb">
								<thead>
									<tr>
										<th scope="col">예약시각</th>
										<th scope="col">성함</th>
										<th scope="col">생년월일</th>
									</tr>
								</thead>
							</table>
						</div>

						<!-- 대기 리스트 갯수에 상관 없이 높이 고정 -->
						<div class="white_box shadow-sm mb-3" style="height: 473.062px;">
							<div class="message_pre_left">
								<input type="hidden" name="setRcptNo" id="setRcptNo" />
								<input type="hidden" name="checkState" id="checkState" />
								<div class="messges_info">
									<h4 class="mb-3">대기</h4>
								</div>
							</div>

							<table class="table" id="daegiTb">
								<thead>
									<tr>
										<th scope="col">접수시각</th>
										<th scope="col">성함</th>
										<th scope="col">생년월일</th>
									</tr>
								</thead>
							</table>
						</div>
					</div>

					<div class="messages_list mb_30">
						<form id="frm" name="frm" class="mb-0">
							<div class="white_box shadow-sm mb-3">
								<div class="message_pre_left">
									<div class="messges_info">
										<h4 class="mb-3">환자정보</h4>
									</div>
								</div>

								<div class="form-inline">
									<div class="form-group">
										<label class="label-title px-4 py-1 mr-3">성함</label>
										<span class="py-1" style="color: #828bb2; min-width: 50px;" id="pntNm"></span>
									</div>

									<div class="form-group">
										<label class="label-title px-4 py-1 mx-3">성별</label>
										<span class="py-1" style="color: #828bb2; min-width: 50px;" id="sex"></span>
									</div>

									<div class="form-group">
										<label class="label-title px-4 py-1 mx-3">생년월일</label>
										<span class="py-1" style="color: #828bb2; min-width: 80px;" id="pntPrno"></span>
									</div>

									<div class="form-group">
										<label class="label-title px-4 py-1 mx-3">나이</label>
										<span class="py-1" style="color: #828bb2; min-width: 50px;" id="age"></span>
									</div>

									<div class="form-group">
										<label class="label-title px-4 py-1 mx-3">연락처</label>
										<span class="py-1" style="color: #828bb2; min-width: 50px;" id="pntHp"></span>
									</div>
								</div>

								<div class="form-inline mt-3">
									<div class="form-group">
										<label class="label-title px-4 py-1 mr-3">주소</label>
										<span class="py-1" style="color: #828bb2;" id="addr"></span>
									</div>
								</div>

								<hr class="my-4">

								<div class="message_pre_left">
									<div class="messges_info">
										<h4 class="mb-3">증상</h4>
									</div>
								</div>

								<div class="form">
									<div class="form-group">
										<input type="hidden" value="" id="rsvtNo" name="rsvtNo">
										<textarea id="symptoms" name="symptoms" class="form-control rounded"
											placeholder="증상 입력" style="resize: none; height: 152px;"
											aria-label="Small"></textarea>
									</div>
								</div>

								<div class="text-right">
									<button type="button" class="btn btn-outline-secondary px-4"
										onclick="javascript:fnUpdateSymptoms();">저장
									</button>
								</div>
							</div>
						</form>

						<div class="white_box shadow-sm comment">
							<div class="message_pre_left">
								<div class="messges_info">
									<h4 class="mb-3">코멘트</h4>
								</div>
							</div>

							<div class="messages_chat">

								<!-- 코멘트 갯수에 상관 없이 높이 고정 -->
								<div class="messages_list" style="height: 210px; overflow: auto;">
									<ul id="cmntList"></ul>
								</div>

								<hr class="my-4">

								<div class="form">
									<div class="form-group">
										<input type="hidden" name="cmntNo" id="cmntNo">
										<input type="hidden" name="pntCd" id="pntCd">
										<textarea id="cmntCont" name="cmntCont" class="form-control rounded"
											placeholder="코멘트 입력" style="resize: none; height: 60px;"
											aria-label="Small"></textarea>
									</div>
								</div>

								<div class="text-right">
									<button class="btn btn-outline-secondary px-4" type="button"
										onclick="javascript:fnSaveCmnt();">저장</button>
									<!-- <button class="btn btn-danger px-4" type="button" id="deleteCmntBtn" -->
									<!-- onclick="javascript:fnDeleteCmnt();">삭제</button> -->
								</div>
							</div>
						</div>

						<div class="text-right mt-3">
							<button class="btn btn-primary btn-pill px-5 mr-2" type="button" data-toggle="modal"
								data-target="#recordBackdrop" id="recordBtn">진료기록</button>
							<button class="btn btn-primary btn-pill px-5" type="button" id="treatBtn">진료하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="loding-center">
		<div class="spinner-border" role="status">
			<span class="sr-only">Loading...</span>
		</div>
	</div>
</div>

<!-- 진료 기록 Modal -->
<div class="modal fade" id="recordBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1"
	aria-labelledby="recordBackdropLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="recordBackdropLabel">진료기록</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<div class="modal-body">
				<table class="table table-sm text-center">
					<thead>
						<tr>
							<th>진료일</th>
						</tr>
					</thead>
					<tbody id="recordDtResult"></tbody>
				</table>
			</div>

			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary">확인</button>
			</div>
		</div>
	</div>
</div>

<head>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<style>
	.loding-center {
		width: 100%;
		position: relative;
		z-index: 1;
	}

	.spinner-border {
		display: block;
		position: fixed;
		top: calc(50% - (58px / 2));
		right: calc(50% - (58px / 2));
	}

	table.dataTable tbody td {
		padding: 10px;
		font-size: 14px;
		color: #000000;
		font-weight: 300;
	}

	.dataTables_filter input {
		border-width: 1px;
	}

	table.dataTable tbody tr:hover {
		background-color: #eaf2f3 !important;
	}
</style>
</head>

<script>

	/**
	 * 함수 주석 양식
	 * 메뉴 항목을 추가한다.
	 * @param {string} id 항목에 대한 고유 식별자 
	 * @param {string} url 항목 아이콘 
	 * @param {string} title 항목 타이틀
	 * @param {function} callback 실행에 대한 호출 함수
	 * @returns {boolean} 성공 여부
	*/

	var clkFlag = false;
	$(document).ready(function () {
		$('.spinner-border').hide();
		fnSelectListMedicalYeyak();
		fnSelectListMedicalDaegi();

		// 예약 테이블  row 클릭 이벤트 > 환자상세정보 셋팅
		$("#yeyakTb").on('click', 'tbody tr', function () {
			var row = $("#yeyakTb").DataTable().row($(this)).data();
			clkFlag = true;
			$('#setRsvtNo').val(row.rsvtNo);
			$('#setRcptNo').val(row.rcptNo);
			fnSelectDetailMedical(row.rsvtNo, row.pntCd);
		});

		// 접수 테이블  row 클릭 이벤트 > 환자상세정보 셋팅
		$("#daegiTb").on('click', 'tbody tr', function () {
			var row = $("#daegiTb").DataTable().row($(this)).data();
			clkFlag = true;
			$('#checkState').val(row.stateCd);
			$('#setRsvtNo').val(row.rsvtNo);
			$('#setRcptNo').val(row.rcptNo);
			fnSelectDetailMedical(row.rsvtNo);
		});

		// 환자가 선택되지 않은 상태로 진료 버튼 클릭시 alert, 선택되었을 경우에만 진료 페이지로 넘어감
		$('#treatBtn').click(function () {
			if (!clkFlag) {
				Swal.fire({
					icon: 'warning', // Alert 타입 
					title: '환자를 선택해 주세요.', // Alert 제목 
				});
				return false;
			}

			var paramObj = new Object();
			paramObj.pntCd = $('#pntCd').val();
			paramObj.state = $('#checkState').val();
			paramObj.rcptNo = $('#setRcptNo').val();
			paramObj.rsvtNo = $('#setRsvtNo').val();

			var strParam = $.param(paramObj);

			location.href = '/medical/treat?' + strParam;
		});

		// 환자가 선택되지 않은 상태로 진료기록 버튼 클릭시 alert
		$('#recordBtn').click(function () {
			if (!clkFlag) {
				Swal.fire({
					icon: 'warning', // Alert 타입 
					title: '환자를 선택해 주세요.', // Alert 제목 
				});
				return false;
			}
			fnCommonAjax('post', { 'pntCd': $('#pntCd').val() }, '/medical/selectListTreatDate', fnSelectListTreatDateSuccess);

		});

	})

	// 진료일 목록 클릭
	$(document).on("click", "#recordDtResult > tr", function () {
		var paramObj = new Object();
// 		paramObj.pntCd = $(this).find('td').data("pnt-cd");
		paramObj.treatCd = $(this).find('td').data("treat-cd");
		var strParam = $.param(paramObj);
		location.href = "/medical/treatRecord?" + strParam;
// 		window.open('/medical/treatRecord?' + strParam,'record','width=1250, height=720, top=100, left=100');
	});

	/**
	 * 환자정보를 상세 조회한다.
	 * @param {string} rsvtNo 상세정보를 위한 예약/접수 키 값
	 */
	const fnSelectDetailMedical = (rsvtNo, pntCd) => {
		fnCommonAjax('post', { 'rsvtNo': rsvtNo, 'pntCd': pntCd }, '/medical/selectDetailMedical', fnSelectDetailMedicalSucess);
	}

	/**
	 * 환자정보를 상세 조회 성공의 Callback 함수
	 * @param {object} data 서버의 응답 데이터
	 */
	const fnSelectDetailMedicalSucess = (data) => {

		let _obj = data.response;

		// Object의 key만큼 배열을 반복한다.
		for (let i in Object.keys(_obj)) {
			var _id = Object.keys(_obj)[i];
			var _tagType = $('#' + _id).prop('tagName');
			var _value = _obj[Object.keys(_obj)[i]];

			if (_value == 'null' || _value == null) {
				_value = "";
			}

			if (_id == "cmnt") {
				var cmnts = "";
				console.log(_value)
				if (_value[0].cmntNo == null) {
					cmnts += `<h5>저장된 코멘트가 없습니다.</h5>`
				} else {
					for (var j = 0; j < _value.length; j++) {
						if (j > 0) {
							cmnts += `<br />`
						}
						cmnts += `<li>`
						cmnts += `<div class="message_pre_left">`
						cmnts += `<div class="messges_info">`
						cmnts += `<h5 style="display: inline-block;">\${_value[j].empNm}</h5>`
						if (_value[j].empCd == '${loginUser.empCd}') {
							cmnts += `<button class="btn btn-danger px-4" type="button" id="deleteCmntBtn" `
							cmnts += `onclick="javascript:fnDeleteCmnt(\${_value[j].cmntNo});" style="float:right;">삭제</button>`
						}
						cmnts += `<p>\${_value[j].cmntCont}</p>`
						cmnts += `</div>`
						cmnts += `</div>`
						cmnts += `<div class="messge_time">`
						cmnts += `<span>\${_value[j].cmntDate} \${_value[j].cmntTime}</span>`
						cmnts += `</div>`
						cmnts += `</li>`
					}
				}
				$("#cmntList").html(cmnts);
			}

			if (_tagType !== undefined && _tagType !== "INPUT") {
				$('#' + _id).text(_value);
			} else if (_tagType == "INPUT" || _tagType == "TEXTAREA") {
				$('#' + _id).val(_value);
			}
		}

	}

	/**
	 * 환자정보를 수정/삭제/저장 후 다시 상세내용을 reload하기 위한 함수
	 * @param {object} data 서버의 응답 데이터
	 */
	const fnCallSelectDetailMedical = (data) => {
		// rsvtNo이 상세조회의 where 조건
		fnSelectDetailMedical(data.response.rsvtNo);
	}

	/**
	 * 환자의 증상을 저장한다.
	 *
	 */
	const fnUpdateSymptoms = () => {

		if ($('#rsvtNo').val() == "") {
			Swal.fire({
				icon: 'warning', // Alert 타입 
				title: '환자를 선택해 주세요.', // Alert 제목 
			});
			return false;
		}

		Swal.fire({
			title: '증상을 저장하시겠습니까?',
			icon: 'info',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '저장'
		}).then(result => { // 만약 Promise리턴을 받으면, 
			if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면 
				fnCommonAjax(
					'post'
					, {
						'rsvtNo': $('#rsvtNo').val() // 예약번호
						, 'symptoms': $('#symptoms').val() // 증상내용
					}
					, '/medical/updateSymptoms'
					, fnCallSelectDetailMedical
				);
			}
		})
	}

	/**
	 * 환자의 코멘트를 저장한다.
	 */
	const fnSaveCmnt = () => {

		if ($('#rsvtNo').val() == "") {
			Swal.fire({
				icon: 'warning', // Alert 타입 
				title: '환자를 선택해 주세요.', // Alert 제목 
			});
			return false;
		}

		Swal.fire({
			title: '코멘트를 저장하시겠습니까?',
			icon: 'info',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '저장'
		}).then(result => { // 만약 Promise리턴을 받으면, 
			if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면 

				let _cmntNo = $('#cmntNo').val();
				let _data = {
					'cmntCont': $('#cmntCont').val()
					, 'pntCd': $('#pntCd').val()
					, 'rsvtNo': $('#rsvtNo').val()
					, 'empCd': '${loginUser.empCd}'

				}

				// 코멘트 키가 있으면 전송 데이터에 추가
				_cmntNo != "" ? _data.cmntNo = _cmntNo : "";
				fnCommonAjax('post', _data, '/medical/insertCmnt', fnCallSelectDetailMedical);
				$('#cmntCont').val('');
			}
		})
	}

	/**
	 * 환자의 코멘트를 삭제한다.
	 */
	const fnDeleteCmnt = (cmntNo) => {

		if ($('#rsvtNo').val() == "") {
			Swal.fire({
				icon: 'warning', // Alert 타입 
				title: '환자를 선택해 주세요.', // Alert 제목 
			});
			return false;
		}

		Swal.fire({
			title: '코멘트를 삭제하시겠습니까?',
			text: "삭제한 데이터는 복구되지 않습니다.",
			icon: 'warning',
			showCancelButton: true,
			confirmButtonColor: '#3085d6',
			cancelButtonColor: '#d33',
			confirmButtonText: '삭제'
		}).then(result => { // 만약 Promise리턴을 받으면, 
			if (result.isConfirmed) { // 만약 모달창에서 confirm 버튼을 눌렀다면 
				let _cmntNo = cmntNo;
				let _rsvtNo = $('#rsvtNo').val();
				fnCommonAjax('post', { 'cmntNo': _cmntNo, 'rsvtNo': _rsvtNo }, '/medical/deleteCmnt', fnCallSelectDetailMedical);
			}
		})
	}

	/**
	 * 예약목록을 조회한다.
	 */
	var fnSelectListMedicalYeyak = () => {
		fnCommonAjax('get', { "empCd": "${loginUser.empCd}" }, '/medical/selectListMedicalYeyak', fnSelectListMedicalYeyakSuccess);
	}

	/**
	 * 접수목록을 조회한다.
	 */
	const fnSelectListMedicalDaegi = () => {
		fnCommonAjax('get', { "empCd": "${loginUser.empCd}" }, '/medical/selectListMedicalDaegi', fnSelectListMedicalDaegiSuccess);
	}

	/**
	 * 예약목록 조회 성공의 Callback 함수
	 * @param {object} data 서버의 응답 데이터
	 */
	const fnSelectListMedicalYeyakSuccess = (data) => {
		let list = data.response;
		fnSetDataYeyekTable(list);
	}

	/**
	 * 접수목록 조회 성공의 Callback 함수
	 * @param {object} data 서버의 응답 데이터
	 */
	const fnSelectListMedicalDaegiSuccess = (data) => {
		let list = data.response;
		fnSetDataDaegiTable(list);
	}

	/**
	 * jQuery DataTable 라이브러리로 예약 목록을 셋팅한다.
	 * @param {array} list DataTable 값을 셋팅하기위한 jsonArray
	 */
	const fnSetDataYeyekTable = (list) => {

		$('#yeyakTb').DataTable({
			"data": list,
			"dataSrc": "",
			"columns": [
				{ 'data': 'rsvtRegTime', "className": "text-center" },
				{ 'data': 'pntNm', "className": "text-center" },
				{ 'data': 'pntPrno', "className": "text-center" },
			],
			"bLengthChange": false, // thought this line could hide the LengthMenu
			"pageLength": 5,
			"language": {
				"emptyTable": "예약 환자가 없습니다.",
				"info": "총 _TOTAL_명",
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

	/**
	 * jQuery DataTable 라이브러리로 대기 목록을 셋팅한다.
	 * @param {array} list DataTable 값을 셋팅하기위한 jsonArray
	 */
	const fnSetDataDaegiTable = (list) => {

		$('#daegiTb').DataTable({
			"data": list,
			"dataSrc": "",
			"columns": [
				{ 'data': 'rsvtRegTime', "className": "text-center" },
				{ 'data': 'pntNm', "className": "text-center" },
				{ 'data': 'pntPrno', "className": "text-center" },
			],
			"bLengthChange": false, // thought this line could hide the LengthMenu
			"pageLength": 5,
			"language": {
				"emptyTable": "대기 환자가 없습니다.",
				"info": "총 _TOTAL_명",
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

	// 진료일 목록조회 성공 콜백 함수
	const fnSelectListTreatDateSuccess = (data) => {
		var list = data.response;
		$('#recordDtResult').html("");
		if (list.length > 0) {
			list.forEach(function (v, i) {
				$('#recordDtResult').append('<tr><td data-pnt-cd="' + v.pntCd + '" data-treat-cd="' + v.treatCd + '" >' + v.treatDt + '</td></tr>');
			});
		} else {
			$('#recordDtResult').append('<tr><td>데이터가 없습니다.</td></tr>');
		}
	}

	/**
	 * ajax 공통호출 함수
	 * @param {string} 통신 method 타입
	 * @param {string} 서버로 전송하는 request 데이터
	 * @param {string} request 호출 주소
	 * @param {function} successFn 성공 콜백함수
	 */
	const fnCommonAjax = (type, data, url, successFn) => {
		// 로딩바 보이기
		$('.spinner-border').show();
		$.ajax({
			'type': type, 'data': data, 'url': url
			, beforeSend: function (jqXHR, settings) {
				// ajax 사용시 헤더에 스프링시큐리티 토큰 설정
				var token = '${_csrf.token}'
				var header = '${_csrf.headerName}'
				jqXHR.setRequestHeader(header, token);
			}
			, success: successFn
		})
		.done((data) => {
			// 로딩바 숨기기
			$('.spinner-border').hide();
		})
		.fail((data) => {
			Swal.fire({
				icon: 'error', // Alert 타입 
				title: '통신에러 발생', // Alert 제목 
			});
			$('.spinner-border').hide();
		});
	}

</script>

<div class="footer_part">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="footer_iner text-center">
					<p>2020 © Influence - Designed by <a href="#"><i class="ti-heart"></i></a>
						<a href="#">Dashboard</a>
					</p>
				</div>
			</div>
		</div>
	</div>
</div>
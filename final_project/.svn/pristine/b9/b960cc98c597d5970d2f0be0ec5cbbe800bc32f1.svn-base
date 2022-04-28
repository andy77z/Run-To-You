<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!-- <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script> -->

<script>
var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
var csrfHeader = $("meta[name=_csrf_header]").attr("content");
var csrfToken = $("meta[name=_csrf]").attr("content");
var oldSecNm = [];
var newSecNm = [];

$(function(){
	
	//'신규부서 버튼 클릭 시 modal show'
	$('#writeBtn').click(function(e){
		e.preventDefault();
		$('#writeModal').modal("show");
	});
	
});

// '추가' 버튼 클릭 시 과 추가 등록 modal show
function addSec(p){
	$(this).click(function(e){
		e.preventDefault();
		secNm = p.value;
		$('#addTitle').text(secNm);
	});
};

// '등록' 버튼 클릭 시 과 추가 등록
function insertAddSec(p){
	secNm = $('#insertSecNm').val();
	deptNm = $('#addTitle').text();
	
	data = {};
	data["secNm"] = secNm;
	data["deptNm"] = deptNm;
	
	$.ajax({
		url:"/sec/addSec",
		data: data,
		method:"get",
		dataType:"json",
		success: function(res){
			if(res > 0){
				 swal(
					'등록 완료!',
					'',
					'success'
				)
				$(".swal-button--confirm").on("click", function() {
					$('#addSecModal').modal("hide");
					$("#updateImgFrm").submit();
				});
			}else{
					swal(
					'등록 실패!',
					'',
					'error'
				)
			}
		}
	});
}

// 부서명, 과명 업데이트
function updateSec(p){
	newSecNm = [];
	
	data = {};
	oldDeptNm = $('#oldDeptNm').val();
	newDeptNm = $('.upDeptNm').val();
	newSecNms = $('.updateSecDiv').children().children('#updateSecNm');
	
	var flag = true;
	$.each(newSecNms,function(i,v){
		if($(v).val()==''){
			swal("경고", "값을 입력해주세요.", "warning");
			$(this).focus();
				flag = false;
			}
			newSecNm.push(v.value);
	});
	if(!flag){
		return false;
	}
	data[csrfParameter]=csrfToken;
	data["oldDeptNm"] = oldDeptNm;
	data["newDeptNm"] = newDeptNm;
	data["oldSecNm"] = JSON.stringify(oldSecNm);
	data["newSecNm"] = JSON.stringify(newSecNm);

	console.log(data);
	$.ajax({
		url:"/sec/update",
		data: data,
		method:"post",
		success: function(res){
			if(res > 0){
				swal("알림", "성공하였습니다.", "success");
				var h3 = $(my).prev("h3");
				h3.html(newDeptNm);
				
				setTimeout("location.reload()", 1300);
			}else{
				swal("에러", "실패했습니다.", "error");
			}
		}
	});
	$('#modalCancleBtn').click();
}

$(function(){
	$(".updateBtn").on("click", function(){
		my = this;
	})
})

// 수정에서 삭제버튼 클릭 시
function updateDelBtn(p){
	secCd = p.value;
	swal({
        title : "경고",
        text : "정말 삭제하시겠습니까?삭제된 데이터는 복구할 수 없습니다.", 
        icon : "warning",
        buttons : ["삭제", "취소"]
    }).then(function(result){
          if(!result){
//               $.ajax({
//                  url : '/ent/leaving',
//                  method : 'POST',
//                  data : data,
//                  success : function(res){
//                     if(res == 3){
//                        swal("알림", "퇴원처리에 성공했습니다.", "success");
//                     }else{
//                        swal("경고", "퇴원처리에 실패했습니다.", "error");
//                     }
//                  }
//               })
          }
    })
}

// 부서등록에서 과 추가 버튼 클릭 시 input 생성
function secAdd(p){
		$('.addInput').append(
				'<br><button class="deleteAddBtn" type="button" onclick="deleteAddBtn(this)" ><img id="delImg" src="../resources/images/삭제.png"></button><input id="secNm" class="form-control" type="text" placeholder="과명을 입력해주세요." />'
				)
}

//부서수정에서 과 추가 버튼 클릭 시 input 생성
function updateSecAdd(p){
		$('.updateAddInput').append(
			'<br><button class="deleteAddBtn" type="button" onclick="deleteAddBtn(this)" ><img id="delImg" src="../resources/images/삭제.png"></button><input id="secNm" class="form-control" type="text" placeholder="과명을 입력해주세요." />'
			)
}

// 부서 수정버튼 클릭 시 모달 창 띄우기
function mdfSubmit(p){
	data = {};
	deptNm = p.value;
	data["deptNm"] = deptNm;
// 	oldSecNm = [];
// 	newSecNm = [];
	
	$('#beforeDeptNm').val(deptNm);
	$('.upDeptNm').val(deptNm);
	
	$.ajax({
		url:"/sec/searchSec",
		data: data,
		method:"get",
		success: function(res){
			
		$.each(res,function(i,v){
			oldSecNm.push(v.secNm);
			$('.updateSecDiv').append(
				 '<br><div><button class="deleteAddBtn" type="button" onclick="updateDelBtn(this)" value="'+v.secCd+'"><img id="delImg" src="../resources/images/삭제.png"> '
				+ ' </button><input id="updateSecNm" style="width:95%;float:left;" class="form-control '+v.secCd+'" type="text" value="'+v.secNm+'"/></div>'
				)	
			})
			$('.updateSecDiv').append(
			 '<input id="oldDeptNm" class="form-control" type="text" value="'+deptNm+'" style="display:none;"/>'		
			)
		}
	});
	$('#updateModal').modal("show");
	$('.updateSecDiv').empty();
}

// 등록 창에서 - 아이콘 클릭 시 버튼,인풋 삭제
function deleteAddBtn(p){
	$(p).prev().remove();
	$(p).next().remove();
	p.remove();
};

// 새로운 부서 등록하기
function insertSec(p){
	var data = {};
	var secNms = $('input[id=secNm]');
	var deptNm = $('input[id=deptNm]').val();
	var secList = {};
	for(var i = 0; i < secNms.length; i++){
		secList[i] = (secNms[i].value);
	}
	data["secList"] = secList;
	data["deptNm"] = deptNm;
	
	$.ajax({
		url:"/sec/nextSec",
		data: data,
		method:"get",
		dataType:"json",
		success: function(res){
			if(res > 0){
				 swal(
					'등록 완료!',
					'',
					'success'
				)
				$(".swal-button--confirm").on("click", function() {
					$('#writeModal').modal("hide");
					$("#updateImgFrm").submit();
				});
			}else{
					swal(
					'등록 실패!',
					'',
					'error'
				)
			}
		}
	});
}

</script>

<style>
input[type="date"]::-webkit-calendar-picker-indicator { 

background-image: url("../resources/img/calendar-icon.png");
} 

.deleteAddBtn{
 width: 5%;
 height: 35px;
 border:0;
 background: white;
}
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

</style>

<div class="main_content_iner ">
<a href="#modalSlide" data-toggle="modal" class="btn_1" id="writeBtn">신규등록</a>
<div class="container-fluid p-0">
<div class="row justify-content-center">

<c:forEach var="list" items="${list}" varStatus="i">
	<div class="col-lg-12">
	<div class="white_box mb_30">
	<div class="box_header ">
	<div class="main-title">
		<h3>${list.deptNm}</h3>
		<button class="btn btn-outline-info updateBtn" value="${list.deptNm}" type="button" onclick="mdfSubmit(this)">수정</button>
		<button class="Btn Btn-Warning" type="button" value="${list.deptNm}" id="addSecBtn" data-toggle="modal" data-target="#addSecModal" onclick="addSec(this)">추가</button>
	</div>
	</div>
		<table class="table table-hover">
		<thead>
		<tr>
		<th scope="col">번호</th>
		<th scope="col">과분류</th>
		<th scope="col">직원 수</th>
		<th scope="col">Handle</th>
		</tr>
		</thead>
		<tbody>
		
		<c:forEach var="secVO" items="${list.secVO}" varStatus="i">
			<tr>
			<th scope="row">${i.count}</th>
			<td>${secVO.secNm}</td>
			<td>${secVO.empCnt}</td>
			<td>
				<a href="/emp/home?secCd=${secVO.secCd}&keyword=${secVO.secCd}" class="btn btn-outline-warning">직원조회</a>
			</td>
			</tr>
		</c:forEach>
		</tbody>
		</table>
	</div>
	</div>
</c:forEach>
</div>
</div>
</div>


<!----------------- 부서등록  Modal 시작-------------------->
		<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="exampleModalLabel">신규 부서 등록</h2>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">
						<form method="post" action="/dept/create">
							
							<!-- 부서번호 -->
							<div class="form-group">
							<input id="secCd" class="form-control" type="text" value="${nextSecCd}" hidden="true" />
							</div>
							
							<div class="form-group">
							<h4>부서명</h4>
							<input id="deptNm" class="form-control" type="text" placeholder="부서명을 입력해주세요."/>
							</div>
							
							<div class="form-group addInput">
							<h4 style="display:inline;">과명</h4>
							&nbsp;<button class="Btn Btn-Warning insertAddBtn" type="button" id="secAddBtn" onclick="secAdd(this)" style="font-size:7px;">추가</button>
							<input id="secNm" class="form-control" type="text" placeholder="과명을 입력해주세요."/>
							</div>
							
							<button class="btn btn-info" id="modalY" type="button" onclick="insertSec(this)">등록</button>
							<button class="btn btn-danger" type="button" data-dismiss="modal">취소</button>
							
						</form>

					</div>
				</div>
			</div>
		</div>
<!----------------- 부서등록 Modal 끝-------------------->

<!----------------- 부서수정  Modal 시작-------------------->
		<div class="modal fade" id="updateModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-updateTitle" id="exampleModalLabel">부서 정보 수정</h2>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">
						<form method="post" action="/dept/create">
							
							<!-- 부서번호 -->
							<div class="form-group">
							<input id="secCd" class="form-control" type="text" value="${nextSecCd}" hidden="true" />
							</div>
							
							<div class="form-group">
							<h4>부서명</h4>
							<input id="beforeDeptNm" class="form-control" type="text" disabled="disabled" /><br><br>
							<h4>새로운 부서명</h4>
							<input class="form-control upDeptNm" type="text" placeholder="수정할 부서명을 입력해주세요."/>
							</div>
							
							<div class="form-group updateAddInput">
							<h4 style="display:inline;">과명</h4>
							&nbsp;
								<div class="updateSecDiv">
								
								</div>
							</div>
							
							<button class="btn btn-info" id="modalY" type="button" onclick="updateSec(this)">완료</button>
							<button class="btn btn-danger" id="modalCancleBtn" type="button" data-dismiss="modal">취소</button>
							
						</form>

					</div>
				</div>
			</div>
		</div>
<!----------------- 부서수정 Modal 끝-------------------->

<!----------------- 과 등록  Modal 시작-------------------->
		<div class="modal fade" id="addSecModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="exampleModalLabel"><span id="addTitle"></span>&nbsp;<span>과 등록</span></h2>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">
							
							<!-- 부서번호 -->
							<div class="form-group">
							<input id="secCd" class="form-control" type="text" value="${nextSecCd}" hidden="true" />
							</div>
							
							<div class="form-group">
							<h4 style="display:inline;">과명</h4>
							<input id="insertSecNm" class="form-control" type="text" placeholder="과명을 입력해주세요."/>
							</div>
							
							<button class="btn btn-info" id="modalY" type="button" onclick="insertAddSec(this)">등록</button>
							<button class="btn btn-danger" type="button" data-dismiss="modal">취소</button>
							
					</div>
				</div>
			</div>
		</div>
<!----------------- 과 등록 Modal 끝-------------------->
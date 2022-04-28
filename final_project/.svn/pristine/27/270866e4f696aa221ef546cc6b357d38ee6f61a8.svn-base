<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>

<script>
$(function(){
	// 페이지 로드 시 비활성화
	$('.title, .content, .writer').attr('readonly', true);
	$('.privBounds').css('display','none');
	$('.cancel, .submit').css('display','none');
	$('.mdf, .del').css('display','block');
	
	
	// '등록'버튼 클릭 시 등록 modal창 띄우기
	$('#writeBtn').click(function(e){
		e.preventDefault();
		$('#writeModal').modal("show");
	});
});
		
//'삭제'버튼 클릭 시 공지사항 삭제
function delNotice(p){
	var ntcNo = $(".del").val();
	var data = {"ntcNo" : ntcNo};

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
	            '',
	            'success'
	          )
	        }
	      }).then(function(){
	         $(".swal2-confirm").on("click", function() {
	            location.reload();
	         });
	      });
	      
	   $.ajax({
		   url:"/notice/delNotice",
		method: "get",
		  data: data,
	      success: function(rres) {
	         console.log(rres);   
	      }
	   });

	

}

//'수정'버튼 클릭 시 readonly=false, 공지사항 수정 가능
function mdfNotice(p){
	$('.title, .content, .writer').attr('readonly', false);
	$('.privBounds').css('display','block');
	$('.cancel, .submit').css('display','block');
	$('.mdf, .del').hide();
}

// '등록' 버튼 클릭 시 공지사항 등록
function insNotice(p){
	var title = $('.insTitle').val();
	var writer = $('.insWriter').val();
	var content = $('.insContent').val();
	var privBounds = $('.insBounds').val();
	var data = {"title":title,"content":content,"privBounds":privBounds,"writer":writer};
	
	$.ajax({
	      url:"/notice/create",
	      data: data,
	      method: "get",
	      success: function(res) {
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

// '완료'버튼 클릭 시  공지사항 수정
function mdfSubmit(p){
	
	var ntcNo = $('.ntcNo').val();
	var title = $('.title').val();
	var content = $('.content').val();
	var writer = $('.writer').val();
	var privBounds = $('#privBounds').val();
	var data = {"ntcNo":ntcNo,"title":title,"content":content,"writer":writer,"privBounds":privBounds};
	
	 $.ajax({
	      url:"/notice/update",
	      data: data,
	      method: "get",
	      success: function(res) {
	    	  
	    	  if(res > 0){
	    		  Swal.fire(
				            '수정 완료!',
				            '',
				            'success'
				          )
				          $(".swal2-confirm").on("click", function() {
				      	 	 $('#detailModal').modal("hide");
					            location.reload();
					         });
	    	  }else{
	    		  return false;
	    	  }
	      }
	 });
}

// Ajax 실행 후 NoticeVO의 데이터 modal에 입력하기	
// 공지사항 상세보기
function modalAjax(p) {
  
	   var data = {"ntcNo" : p.id};
	
	   $.ajax({
	      url:"/notice/detail",
	      method: "get",
	      data: data,
	      success: function(res) {
	    	 $(".del").val(res.ntcNo);
	    	 $(".ntcNo").val(res.ntcNo); 
	         $(".title").val(res.title);
	         $(".content").text(res.content);
	         $(".writer").val(res.writer);
	         $(".firstRegDt").val(res.viewFRegDt);
	         if(res.lstMdfyDt!=null){
		         $(".lastMdfyDt").val(res.viewLMdfyDt);
	         }else{
	        	 $(".lastMdfyDt").val(res.viewFRegDt);
	         }
	      
	      }
	   })
	   
	$('#detailModal').modal("show");
	
	// 'X' 클릭 시 리로드하여 조회수 증가   
	$('.close, .cancel').click(function(){
		location.reload();
	})   
}	   
</script>  

<style>
	input[type="date"]::-webkit-calendar-picker-indicator { 

	background-image: url("../resources/img/calendar-icon.png");
	} 

  .cancel, .submit{
  	display: none;
  }	
 
  .btn1{
    background-color: white;
    border: none;
  }	   

  #hideWriter{
  	display: none;
  }

  #bounds {
      width: 10%;
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
<div class="container-fluid p-0">
<div class="row justify-content-center">
<div class="col-12">
<div class="QA_section">
<div class="white_box_tittle list_header">
<h3>공지사항</h3>
<div class="box_right d-flex lms_block">
<div class="serach_field_2">
<div class="search_inner">
<form active="#">
<div class="search_field">
<input type="text" placeholder="Search content here...">
</div>
<button type="submit"> <i class="ti-search"></i> </button>
</form>
</div>
</div>
<div class="add_button ml-10">
<a href="#" data-toggle="modal" data-target="#addcategory" class="btn_1">검색</a>
</div>
</div>
</div>
<div class="QA_table mb_30">

<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
<table class="table lms_table_active dataTable no-footer dtr-inline" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width: 1586px; text-align: center;">
<thead>
	<tr role="row"><th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 143px;" aria-sort="ascending" aria-label="title: activate to sort column descending">번호</th>
		<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 219px;" aria-label="Category: activate to sort column ascending">제목</th>
		<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 215px;" aria-label="Teacher: activate to sort column ascending">작성자</th>
		<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 202px;" aria-label="Lesson: activate to sort column ascending">작성일</th>
		<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 115px;" aria-label="Enrolled: activate to sort column ascending">조회수</th>
	</tr>
</thead>
<tbody>
	<!-- 공지사항 목록 출력 시작-->
      <c:forEach var="notList" items="${list}" varStatus="i">
		<tr>
		 <td><a href="#modalSlide" data-toggle="modal" class="btn_1 btn1" id="${notList.ntcNo}" onclick="modalAjax(this)">${i.count}</a></td>
		 <td><a href="#modalSlide" data-toggle="modal" class="btn_1 btn1" id="${notList.ntcNo}" onclick="modalAjax(this)">${notList.title}</a></td>
		 <td>${notList.writer}</td>
		 <td>${notList.viewFirstRegDt()}</td>
		 <td>${notList.hits}</td>
	    </tr>
	  </c:forEach>
    <!-- 공지사항 목록 출력  끝-->
</tbody>
</table>

<sec:authorize access="hasRole('ROLE_ADMIN')">
<a href="#modalSlide" data-toggle="modal" class="btn_1" id="writeBtn">글쓰기</a>
</sec:authorize>
<!----------------- 공지사항 작성 Modal 시작-------------------->
		<div class="modal fade" id="writeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="exampleModalLabel">공지사항 작성</h2>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">
						<form:form modelAttribute="noticeVO" method="post" action="/notice/create" >
							<div class="form-group">
							<h4>제목</h4>
							<form:input path="title" class="form-control insTitle" placeholder="제목을 입력해주세요."/>
							</div>
							
							<div class="form-group">
							<h4>내용</h4>
							<form:textarea path="content" rows="10" class="form-control insContent" placeholder="내용을 입력해주세요." ></form:textarea>
							</div>
							
							<div class="form-group">
							<h4>공개범위</h4>
							<form:select path="privBounds" class="selectpicker insBounds" data-style="btn-success">
								<form:option value="ALL">전체</form:option>
								<form:option value="EMP">직원</form:option>
								<form:option value="PATIENT">환자</form:option>
							</form:select>
							</div>
							
							<div class="form-group" id="hideWriter">
							<h4>작성자</h4>
							<form:input path="writer" class="form-control insWriter" value="테스트"></form:input>
							</div>
						
					<div class="modal-footer">
<%-- 						<form:button class="btn btn-info" id="modalY" type="submit">등록</form:button> --%>
						<button class="btn btn-info" id="modalY" type="button" onclick="insNotice(this)">등록</button>
						<form:button class="btn btn-danger" type="button" data-dismiss="modal">취소</form:button>
					</div>
					</form:form>
					</div>
					
				</div>
			</div>
		</div>
<!----------------- 공지사항 작성 Modal 끝-------------------->

<!----------------- 공지사항 상세보기 Modal 시작-------------------->
	  <!-- 공지사항 상세보기 Modal-->
		<div class="modal fade" id="detailModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h2 class="modal-title" id="exampleModalLabel">공지사항 상세보기</h2>
						<button class="close" type="button" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">X</span>
						</button>
					</div>
					<div class="modal-body">
						<form:form modelAttribute="noticeVO" id="test" method="post" action="/emp/update" >
							<div class="form-group">
							<h4>제목</h4>
							<form:input path="title" class="form-control title" readonly="true"/>
							</div>
							
							<div class="form-group">
							<h4>내용</h4>
							<form:textarea path="content" rows="10" class="form-control content" readonly="true"></form:textarea>
							</div>
							
							<!-- 공개범위 보이지않고, 관리자 ID로 수정 버튼 클릭시 나타남 -->
							<div class="form-group privBounds" style="display: none;">
							<h4>공개범위</h4>
							<form:select path="privBounds" class="selectpicker" data-style="btn-success" >
								<form:option value="ALL">전체</form:option>
								<form:option value="EMP">직원</form:option>
								<form:option value="PATIENT">환자</form:option>
							</form:select>
							</div>
							
							<div class="form-group">
							<h4>작성자</h4>
							<form:input path="writer" class="form-control writer" readonly="true"></form:input>
							</div>
							
							<div class="form-group">
							<h4>작성일</h4>
							<form:input path="firstRegDt" class="form-control firstRegDt" readonly="true"></form:input>
							</div>
							
							<div class="form-group">
							<h4>최근 수정일</h4>
							<form:input path="lastMdfyDt" class="form-control lastMdfyDt" readonly="true"></form:input>
							</div>
						
							<div class="form-group" style="display: none;">
							<h4>글번호</h4>
							<form:input path="ntcNo" class="form-control ntcNo" ></form:input>
							</div>
							
							
					<!-- 수정/삭제 버튼 보이지않고, 관리자 ID로 조회 시 나타남  style="display: none;"-->	
					<div class="modal-footer">
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<button class="btn btn-info mdf" type="button" onclick="mdfNotice(this)">수정</button>
						<button class="btn btn-danger del" type="button" onclick="delNotice(this)">삭제</button>
						<button class="btn btn-info submit" type="button" onclick="mdfSubmit(this)">완료</button>
						<button class="btn btn-danger cancel" type="button" data-dismiss="modal">취소 </button>
						</sec:authorize>
					</div>
					</form:form>
					</div>
					
				</div>
			</div>
		</div>
<!----------------- 공지사항 상세보기 Modal 끝-------------------->

		
</div>
</div>
</div>
</div>
</div>
</div>
</div>

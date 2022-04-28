<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<link rel="stylesheet" href="/resources/css/ent/entCommon.css" type="text/css"/>

<style>
 #searchArea{
 	display: inline-block;
 }
</style>

<script>
	

	$(function(){
		var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
		var csrfHeader = $("meta[name=_csrf_header]").attr("content");
		var csrfToken = $("meta[name=_csrf]").attr("content");
		var data = {};
		
		$("#enting").on("click", function(){
			location.href = "/ent/enting";
		})
		$("#notenting").on("click", function(){
			location.href = "/ent/entHome";
		})
		$("#entList").on("click", function(){
			$("#entPosition").show();
			$("#entList").hide();
			$("#entListTable").show();
			$("#searchArea").show();
			$("#positionMap").hide();
		})
		$("#entPosition").on("click", function(){
			$("#entList").show();
			$("#entPosition").hide();
			$("#entListTable").hide();
			$("#searchArea").hide();
			$("#positionMap").show();
		})
		
		$(".wardNO").on("click", function(){
			$.ajax({
				url : '/ent/',
				method : 'get',
				data : data,
				success : function(){
					
				}
			})
		})
		
	})
</script>

<div class="col-lg-12">
<div class="single_element">
	<div class="quick_activity">
		<div class="row">
			<div class="col-12">
				<div class="quick_activity_wrap">
					<div id="enting" class="single_quick_activity d-flex">
						<div class="icon">
							<img src="/resources/img/icon/wheel.svg" alt="">
						</div>
						<div class="count_content">
							<h3>
								<span class="counter">${entVO.size()}</span>
							</h3>
							<p>입원 중</p>
						</div>
					</div>
					<div id="notenting" class="single_quick_activity d-flex">
						<div class="icon">
							<img src="/resources/img/icon/wheel.svg" alt="">
						</div>
						<div class="count_content">
							<h3>
								<span class="counter">${waitPnt.size()}</span>
							</h3>
							<p>입원 대기</p>
						</div>
					</div>
					<div id="Wdteam" class="single_quick_activity d-flex">
						<div class="icon">
							<img src="/resources/img/icon/pharma.svg" alt="">
						</div>
						<div class="count_content">
							<h3>
								<span class="counter">10</span>
							</h3>
							<p>병동근무직원</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</div>

<div class="main_content_iner ">
	<div class="container-fluid p-0">
	<div class="row justify-content-center">
		<div class="col-12">
		<div class="QA_section">
				<h4 id="txtTitle">입원 중인 환자</h4>
				<button type="button" id="entPosition" class="btn btn-warning" style="margin:1%; float:left;">자리배치도</button> <!-- 컨트롤러에서 기본값으로 주고  requestParam이 1이면 목록으로 2이면 자리배치로 뜨게 설정 해놓기-->
				<button type="button" id="entList" class="btn btn-info" style="margin:1%; float:left; display:none;">목록으로</button>
			<div  id="searchArea" class="white_box_tittle list_header" style="float:right;">
					<div class="box_right d-flex lms_block">
					<div class="serach_field_2">
					<div class="search_inner">
					<form action="#">
						<div class="search_field">
							<input type="text" placeholder="Search content here...">
						</div>
						<button type="submit"> <i class="ti-search"></i> </button>
					</form>
					</div>
					</div>
				<div class="add_button ml-10">
				<a href="#"data-toggle="modal" data-target="#addcategory" class="btn_1">검색</a>
				</div>
				</div>
			</div>
				<div id="entListTable" class="QA_table mb_30">
				<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
				<table class="table lms_table_active dataTable no-footer dtr-inline" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width: 1586px; text-align: center;">
				<thead>
				<tr role="row">
					<th id="th1" scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 143px;" aria-sort="ascending" aria-label="title: activate to sort column descending">
						환자명</th>
					<th id="th2" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 180px;" aria-label="Category: activate to sort column ascending">
						환자 연락처</th>
					<th id="th2" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 180px;" aria-label="Category: activate to sort column ascending">
						상병</th>
					<th id="th3" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 110px;" aria-label="Teacher: activate to sort column ascending">
						자리</th>
					<th id="th4" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 120px;" aria-label="Lesson: activate to sort column ascending">
						담당의</th>
					<th id="th5" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 100px;" aria-label="Enrolled: activate to sort column ascending">
						보호자</th>
					<th id="th6" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 140px;" aria-label="Price: activate to sort column ascending">
						보호자 연락처</th>
					<th id="th7" scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 90px;" aria-label="Status: activate to sort column ascending">
						비고</th>
				</tr>
				</thead>
				<tbody id="tbdy">
					<c:forEach var="ent" items="${entVO}" varStatus="status">
						<tr role="row" id="${status.count}">
							<th scope="row" class="sorting_1" style="color:black; font-size:1.1em; font-weight:bold;">${ent.pntNm}</th>
							<td>${ent.pntHp}</td>
							<td></td>
							<td>${ent.bed}</td>
							<td>${ent.chrDr}</td>
							<td>${ent.prtcrNm}</td>
							<td>${ent.prtcrTel}</td>
							<td>
								<div class="amoutn_action d-flex align-items-center">
									<div class="dropdown ml-4">
										<a class=" dropdown-toggle hide_pils" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
											<i class="fas fa-ellipsis-v"></i>
										</a>
										<div class="dropdown-menu dropdown-menu-left" aria-labelledby="dropdownMenuLink" x-placement="bottom-end" style="position: absolute; will-change: transform; top: 0px; left: 0px; transform: translate3d(-147px, 23px, 0px);">
											<a class="dropdown-item" style="cursor: pointer;">상세정보</a>
											<a class="dropdown-item" style="cursor: pointer;">수정</a>
											<a class="dropdown-item" style="cursor: pointer;">삭제</a>
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
			<div id="positionMap" class="alert alert-light" style="padding:2.8%; display:none; width: 100%; height:100%;">
				<div id="positionHead" class="alert alert-warning" style="width:100%; height:10%;">
					헤더
				</div>
				<div id="positionAside" class="alert alert-danger" style="float:left; width:20%; height:80%;">
				  <ul class="tree">
				    <li>
				      <input type="checkbox" id="root">
				      <label for="root">병동정보</label>
				      <ul>
				      <c:forEach var="wardVO" items="${wardVOList}">
				        <li>
				          <input type="checkbox" id="node${wardVO.wardCls}">
				          <label for="node${wardVO.wardCls}">${wardVO.wardCls}&nbsp;동</label>
				          <ul>
				          	<c:forEach var="roomVO" items="${wardVO.roomVO}">
				          		<li id="${roomVO.roomCls}" onclick="getRoom(this)">${roomVO.roomCls}&nbsp;호</li>
				          	</c:forEach>
				          </ul>
				        </li>
				        </c:forEach>
				      </ul>
				    </li>
				  </ul>
				</div>
				<div id="positionNav" class="alert alert-secondary" style="float:right; width: 80%; height:80%;">
					나브
				</div>
			</div>
	</div>
</div>

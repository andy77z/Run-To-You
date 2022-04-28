<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="/resources/css/receive/receiveCommon.css" type="text/css" />
<script src="/resources/js/receiveCommon.js"></script>

<script>
$(function(){
	$("#searchBtn").on("click", sendKeyword2)

	$("#keyword").on("keyup", function(){
		if(window.event.keyCode == 13){
			sendKeyword2();
		}
	})
})

$(document).on("click", ".treatMemory", function(){
	var data = {"pntCd":$(this).attr("pntCd")};

	$.ajax({
		url:"/receive/getTreatMemory",
		method: "get",
		data: data,
		success: function(rres) {
			var listHtml='';
			if(rres!=''){
				for(var i in rres){
					
					listHtml +="<tr class='treatRow2' pntCd='"+ rres[i].pntCd + "' treatCd='"+rres[i].treatCd+"'>";
					listHtml +="<td>"+rres[i].treatCd+"</td>";
					listHtml +="<td>"+rres[i].pntNm+"</td>";
					listHtml +="<td>"+rres[i].treatDt+"</td>";
					listHtml +="<td><p id='treop'>"+rres[i].disNm+"</p></td>";
					listHtml +="<td>"+rres[i].chrDr+"</td>";
					listHtml +="<td>"+rres[i].nRcvAmt+"</td>";
					listHtml +="</tr>";
				}
			}
			else{
				listHtml +="<tr role='row'>";
				listHtml +="<td colspan='6' style='text-align: center;'>환자의 진료내역이 없습니다.</td>;"
				listHtml +="</tr>";
			}
			$(".treatcon").html(listHtml);
		}
	});
})
</script>

<ul class="nav nav-tabs" style="padding-left:3%;">
   <li class="nav-item">
     <a class="nav-link active stats" aria-current="page" href="/receive/receiveHome?color=0"
       <c:if test="${param.color == 0}"> style="background-color:#cd5c5c;"</c:if> >수납</a>    
   </li>
   <li class="nav-item">
      <a class="nav-link active stats" aria-current="page" href="/receive/receiveMemoryHome?color=1"
      <c:if test="${param.color == 1}"> style="background-color:#cd5c5c;"</c:if> >내역</a>
   </li>
</ul>
<div class="white_box mb_30">
	<div class="box_header">
	<div class="main-title" style="width:100%;">
		<h3 class="mb-0">수납 내역</h3>
			<div class="box_right d-flex lms_block" style="margin-left:60%;">
			<div class="serach_field_2">
				<div class="search_inner">
					<form>
						<div class="search_field">
							<input type="text" id="keyword" placeholder="이름으로 검색..." value="${param.keyword}">
						</div>
						<button type="button"> <i class="ti-search"></i> </button>
					</form>
				</div>
			</div>
			<div class="add_button ml-10">
				<button type="button" id="searchBtn" class="btn_1">검색</button>
			</div>
		</div>
	</div>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">환자명</th>
				<th scope="col">환자연락처</th>
				<th scope="col">방문일자</th>
				<th scope="col">증상</th>
				<th scope="col">수납금</th>
				<th scope="col">미수납금</th>
				<th scope="col">총액</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="list" items="${list}">
			<tr id="receiveedTr" class="treatMemory" pntCd="${list.pntCd}" data-toggle="modal" data-target="#ModalSlide">
				<td>${list.pntNm}</td>
				<td>${list.pntHp}</td>
				<td>${list.treatDt}</td>
				<td>${list.disNm}</td>
				<td style="text-align: right;">${list.saveMoney}</td>
				<td style="text-align: right; background-color: rgb(226, 227, 229);">${list.nRcvAmt}</td>
				<td style="text-align: right;">${list.rcvAmt}</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	      <!-- 페이징 처리 시작 -->
         <ul class="pagination" style="margin:4% 0% 5% 35%;">
            <!-- Previous 시작 -->
            <li
               class="paginate_button page-item previous <c:if test='${page.startPage<page.pagingCount+1}'>disabled</c:if>"
               id="dataTable_previous"><a
               href="/receive/receiveMemoryHome?color=1&currentPage=${page.startPage-page.pagingCount}&keyword=${param.keyword}"
               aria-controls="dataTable" data-dt-idx="0" tabindex="0"
               class="page-link">Previous</a></li>
            <!-- Previous 끝 -->
            <!-- Page번호 시작 -->
            <c:forEach var="pNo" begin="${page.startPage}" end="${page.endPage}"
               step="1">
               <li
                  class="paginate_button page-item <c:if test='${page.currentPage eq pNo}'>active</c:if>"><a
                  href="/receive/receiveMemoryHome?color=1&currentPage=${pNo}&keyword=${param.keyword}" aria-controls="dataTable"
                  data-dt-idx="1" tabindex="0" class="page-link">${pNo}</a></li>
            </c:forEach>
            <!-- Page번호 끝 -->
            <!-- Next 시작 -->
            <li
               class="paginate_button page-item next <c:if test='${page.endPage>=page.totalPage}'>disabled</c:if>"
               id="dataTable_next"><a
               href="/receive/receiveMemoryHome?color=1&currentPage=${page.startPage+page.pagingCount}&keyword=${param.keyword}"
               aria-controls="dataTable" data-dt-idx="7" tabindex="0"
               class="page-link">Next</a></li>
            <!-- Next 끝 -->
         </ul>
         <!-- 페이징 처리 끝 -->
</div>


<div class="modal fade" id="ModalSlide" tabindex="-1" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-lg" style="width:70%; height:40%; margin-top:16%; margin-left: 30%;"> 
    <div class="modal-content">
    	    <!-- 진료내역 시작 -->
			<div class="alert alert-secondary" role="alert">
			<div style="margin-bottom: 10px;">
				<div style=" float: left; margin-top:1.5%; margin-left: 1%;"><h6 style="font-weight: bold;">진료 내역</h6></div>
			</div>
			<br><br>
			<div class="type2" style="overflow-y: scroll; overflow-x:hidden; ">
			<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer">
				<table  class="table dataTable no-footer" id="DataTables_Table_0" role="grid" style="width: 600px; text-align: center;">
					<thead>
						<tr role="row">
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">진료번호</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">환자명</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">진료일자</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 90px; position: sticky; top: 0px; background: #ffffe3;">질병</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">담당의사</th>
							<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background: #ffffe3;">미수납금</th>
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
</div>
</div>

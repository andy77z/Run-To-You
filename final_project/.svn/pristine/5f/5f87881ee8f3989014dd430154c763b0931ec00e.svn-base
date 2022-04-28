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
				<th scope="col">여긴 뭘로</th>
				<th scope="col">여긴 뭘로</th>
				<th scope="col">여긴 뭘로</th>
				<th scope="col">여긴 뭘로</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="list" items="${list}">
			<tr id="receiveedTr" pntCd="${list.pntCd}">
				<td>${list.pntNm}</td>
				<td>${list.pntHp}</td>
				<td>${list.pntCd}</td>
				<td>${list.chrDr}</td>
				<td>${list.chrDr}</td>
				<td>${list.chrDr}</td>
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


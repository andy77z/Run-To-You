<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div id="respData">
	<div class="QA_table mb_30 list" id="main">
		<div id="DataTables_Table_0_wrapper" class="dataTables_wrapper no-footer deptTable">
			<table class="table lms_table_active dataTable no-footer dtr-inline" id="DataTables_Table_0" role="grid" aria-describedby="DataTables_Table_0_info" style="width: 1175px;">
				<thead>
				<tr role="row">
					<th scope="col" class="sorting_asc" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 99px;" aria-sort="ascending" aria-label="title: activate to sort column descending">사번</th>
					<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 141px;" aria-label="Category: activate to sort column ascending">이름</th>
					<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 133px;" aria-label="Teacher: activate to sort column ascending">생년월일</th>
					<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 130px;" aria-label="Lesson: activate to sort column ascending">성별</th>
					<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 130px;" aria-label="Lesson: activate to sort column ascending">부서</th>
					<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 76px;" aria-label="Enrolled: activate to sort column ascending">직급</th>
					<th scope="col" class="sorting" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 70px;" aria-label="Price: activate to sort column ascending">상태</th>
				</tr>
				</thead>
				
				<tbody>
		<!--------------------------- 직원 전체 목록 출력 시작--------------------------->		
				<c:forEach var="list" items="${list}" varStatus="i">
				<tr role="row" class="odd">
					<th scope="row" tabindex="0" class="sorting_1"> 
					<button class="btn empDetailBtn empCdBtn" class="btn btn-outline-Secondary" type="button" onclick="empDetail(this)" id="${list.empCd}"> ${list.empCd}</button></th>
					<td><button class="btn empDetailBtn empNmBtn" type="button" onclick="empDetail(this)" id="${list.empCd}">${list.empNm}</button></td>
					<td><button class="btn empDetailBtn prnoBtn" type="button">${list.empPrno.substring(0,6)}</button></td>
					<td><button class="btn btn-outline-Secondary empDetailBtn sexBtn" type="button">${list.empSex}</button></td>
					<td><button class="btn btn-outline-Secondary empDetailBtn deptBtn" type="button">${list.secNm}</button></td>
					<td><button class="btn btn-outline-Secondary empDetailBtn positionBtn" type="button">${list.position}</button></td>
					<td><button class="btn btn-outline-Secondary empDetailBtn stateBtn" type="button">${list.stateCd}</button></td>
				</tr>
				</c:forEach>
		<!--------------------------- 직원 전체 목록 끝 --------------------------->		
				</tbody>
			</table>
            <!-- 페이징 처리 시작 -->
          <ul class="pagination" style="margin:4% 0% 5% 35%;">
            <!-- Previous 시작 -->
            <li
               class="paginate_button page-item previous <c:if test='${page.startPage<page.pagingCount+1}'>disabled</c:if>"
               id="dataTable_previous"><a
               href="/emp/home?currentPage=${page.startPage-page.pagingCount}&keyword=${param.keyword}"
               aria-controls="dataTable" data-dt-idx="0" tabindex="0"
               class="page-link">Previous</a></li>
            <!-- Previous 끝 -->
            <!-- Page번호 시작 -->
            <c:forEach var="pNo" begin="${page.startPage}" end="${page.endPage}"
               step="1">
               <li
                  class="paginate_button page-item <c:if test='${page.currentPage eq pNo}'>active</c:if>"><a
                  href="/emp/home?currentPage=${pNo}&keyword=${param.keyword}" aria-controls="dataTable"
                  data-dt-idx="1" tabindex="0" class="page-link">${pNo}</a></li>
            </c:forEach>
            <!-- Page번호 끝 -->
            <!-- Next 시작 -->
            <li
               class="paginate_button page-item next <c:if test='${page.endPage>=page.totalPage}'>disabled</c:if>"
               id="dataTable_next"><a
               href="/emp/homeAjax?secCd=${param.secCd}&currentPage=${page.startPage+page.pagingCount}&keyword=${param.keyword}"
               aria-controls="dataTable" data-dt-idx="7" tabindex="0"
               class="page-link">Next</a></li>
            <!-- Next 끝 -->
         </ul>
         <!-- 페이징 처리 끝 -->
			
		</div>
	</div>
</div>

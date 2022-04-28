<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<div id="data">
        <div class="alert alert-warning" role="alert">
         <h4>${empDetail.empNm}</h4><span class="pntcd title"></span>
         	<img alt="프로필 사진" src="${empDetail.empPic}">
      </div> 
      <div class="alert alert-success" role="alert">
         <!------------------- 상세정보 출력 시작 ------------------->
            <table  class="table dataTable no-footer dtr-inline table-hover" id="detailTable" role="grid" style="width: 600px; text-align: center;">
               <thead style="background: #ffffe3;">
                  <tr role="row">
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">사번</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">부서</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;" class="adminView">부서코드</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">이름</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">생년월일</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;" class="adminView">주민등록번호</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 110px;">성별</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;" class="adminView">주소</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">전화번호</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">직급</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;" class="adminView">면허번호</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">상태</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">입사일</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;" class="adminView">퇴사여부</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;" class="adminView">활성화</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">메일</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;" class="adminView">비밀번호</th>
                  </tr>
               </thead>
               <tbody class="rescon">
					<tr>
						<td id="dt_empCd">${empDetail.empCd}</td>
						<td id="dt_secNm">${empDetail.secNm}</td>
						<td class="adminView" id="dt_empPic">${empDetail.empPic}</td>
						<td class="adminView" id="dt_secCd">${empDetail.secCd}</td>
						<td id="dt_empNm">${empDetail.empNm}</td>
						<td id="dt_empPrno">${empDetail.empPrno}</td>
						<td id="dt_empSex">${empDetail.empSex}</td>
						<td class="adminView" id="dt_empAddr">${empDetail.empAddr}</td>
						<td id="dt_empHp">${empDetail.empHp}</td>
						<td id="dt_position">${empDetail.position}</td>
						<td class="adminView" id="dt_lcnsNo">${empDetail.lcnsNo}</td>
						<td id="dt_stateCd">${empDetail.stateCd}</td>
						<td id="dt_hireDate">${empDetail.hireDate}</td>
						<td class="adminView" id="dt_leaveYn">${empDetail.leaveYn}</td>
						<td class="adminView" id="dt_enabled">${empDetail.enabled}</td>
						<td id="dt_empMail">${empDetail.empMail}</td>
						<td class="adminView" id="dt_empPw">${empDetail.empPw}</td>
					</tr>
               </tbody>
            </table>
         <!-- 예약내역 끝 -->
      </div>
      
      <div class="btnset">
         <button type="button" class="btn btn-outline-primary" onclick="updateEmp(this)" value="${empDetail.empCd}">수정</button>&nbsp;&nbsp;&nbsp;&nbsp;
         <button type="button" class="btn btn-outline-danger" onclick="deleteEmp(this)" value="${empDetail.empCd}">삭제</button>
      </div>
</div>


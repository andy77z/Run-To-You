<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-slideout" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <div style="float: left;"><h5 class="modal-title align-right" id="exampleModalLabel" style="font-weight: bolder; font-size: 20px;">환자 상세 정보</h5></div>
      <a class="btn btn-outline-danger" style="float: right;" href="#">차트</a>
      </div>
      <div class="modal-body">
        <div class="alert alert-warning" role="alert">
           <table >
              <tr>
                 <td class="title">no.&nbsp;<span class="pntcd title"></span></td>
              </tr>
           </table>   
           <span class="pntnm"></span>&nbsp;
           (<span class="gender"></span>) &nbsp;&nbsp;만 <span class="age"></span>세
           <br><br>
           <table class="tab">
              <tr>
                 <td class="title">주민등록번호</td>
                 <td class="title">환자연락처</td>
                 <td class="title">보호자이름</td>
                 <td class="title">보호자연락처</td>
                 <td class="titlea">주소</td>
              </tr>
              <tr>
                 <td class="pno" valign="top"></td>
                 <td class="tel"  valign="top"></td>
                 <td class="prtnm"  valign="top"></td>
                 <td class="tel2"  valign="top"></td>
                 <td class="addr" valign="top"></td>
              </tr>
           </table>
        </div>
        <div class="alert alert-primary" role="alert">
         <h6 style="font-weight: bold;">건강 기록</h6>
         <br>
         <table>
            <tr>
               <td class="title">흡연여부</td>
               <td class="title">음주여부</td>
               <td class="title">임신여부</td>
            </tr>
            <tr>
               <td class="smk"></td>
               <td class="drk"></td>
               <td class="preg"></td>
            </tr>
            </table>
            <br>
            <table>
            <tr>
               <td class="title">체온</td>
               <td class="title">체중</td>
               <td class="title">신장</td>
               <td class="title">혈압</td>
               <td class="title">혈당</td>
               <td class="title">측정일자</td>
            </tr>
            <tbody id="vtable">
               
            </tbody>
            <!-- <tr>
               <td class="tem"></td>
               <td class="wei"></td>
               <td class="hei"></td>
               <td class="bp"></td>
               <td class="bs"></td>
               <td class="date"></td>
            </tr> -->
         </table>
         <!-- 페이지 -->
         
         <!-- 페이지 -->
      </div>
      <div class="alert alert-success" role="alert">
         <h6 style="font-weight: bold;">예약 내역</h6>
         <br>
         <!-- 예약내역 시작 -->
            <table  class="table dataTable no-footer dtr-inline table-hover" id="DataTables_Table_0" role="grid" style="width: 600px; text-align: center;">
               <thead style="background: #ffffe3;">
                  <tr role="row">
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">예약번호</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">환자명</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">예약일자</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">예약시간</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 110px;">증상</th>
                     <th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px;">담당의사</th>
                  </tr>
               </thead>
               <tbody class="rescon">

               </tbody>
            </table>
         <!-- 예약내역 끝 -->
      </div>
      <div class="btnset">
         <a class="btn btn-outline-secondary" href="#">수정 지워</a>&nbsp;&nbsp;&nbsp;&nbsp;
         <a class="btn btn-outline-primary" href="#">예약 지워</a>&nbsp;&nbsp;&nbsp;&nbsp;
         <a class="btn btn-outline-success" href="/ent/main" >입원 지워</a>
      </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" style="float: right;">Close</button>
      </div>
    </div>
  </div>
</div>
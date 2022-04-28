<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<script src="/resources/js/entCommon.js"></script>
<link rel="stylesheet" href="/resources/css/ent/entCommon.css" type="text/css"/>

<style>
.tg {border-collapse:collapse; border-spacing:0;}
.tg td{border:1px solid black; overflow:hidden;}
.tg th{border:1px solid black; overflow:hidden;}
.tg .tg-0lax{text-align:center; }
.tg .tg-0pky{text-align:center;}

.empCard{
	background-color: #f8f8f8;
	font-weight: bold;
}

.cardTd{
	text-align: center;
}

.emp:hover{
	transition: all 0.3s ease;
	transform: scale(1.09);
}
#picTd{
	height:210px;
	width: 180px;
}
.col2{
	width: 260px;
}
th{
	background-color: #f8f8f8;
	text-align: center;
	font-size:1.08em;
}

</style>
<script>
	$(function(){
		
		var csrfParameter = $("meta[name=_csrf_parameter]").attr("content");
		var csrfHeader = $("meta[name=_csrf_header]").attr("content");
		var csrfToken = $("meta[name=_csrf]").attr("content");
		
		empCd = "${loginUser.empCd}";
		setInterval(getNotiCnt, 2000, empCd);
		setInterval(insertDrugNotiContent, 60000);
		
		
		$(".white_box").on("click", function(){
			var empCd = this.id;

			var data = {};
		    data[csrfParameter]=csrfToken;
		    data["empCd"]=empCd;
			
			$.ajax({
				url : '/ent/getEntEmpDetail',
				method : 'post',
				data : data,
				success : function(res){
					$("#picTd").html("<img src='" + res.empPic + "'/>");
					$("#detailHead").html(res.empNm + " 직원 상세정보");
					$("#detailName").html(res.empNm);
					$("#detailPosition").html(res.position);
					$("#detailLcNo").html(res.lcnsNo);
					var prno = maskingFunc.rrn(res.empPrno);
					$("#detailBirth").html(prno);
					$("#detailHp").html(res.empHp);
					$("#detailAddr").html(res.empAddr);
					$("#detailEmpNo").html(res.deptNm);
					$("#detailSec").html(res.secNm);
					$("#detailMail").html(res.empMail);
			    	if(res.stateCd == 'ES1'){$("#detailState").html('<span class="badge badge-success">온라인</span>');}
			    	if(res.stateCd == 'ES2'){$("#detailState").html('<span class="badge badge-primary">업무중</span>');}
			    	if(res.stateCd == 'ES3'){$("#detailState").html('<span class="badge badge-secondary">진료중</span>');}
			    	if(res.stateCd == 'ES4'){$("#detailState").html('<span class="badge badge-info">수술중</span>');}
			    	if(res.stateCd == 'ES5'){$("#detailState").html('<span class="badge badge-warning">자리비움</span>');}
			    	if(res.stateCd == 'ES6'){$("#detailState").html('<span class="badge badge-danger">오프라인</span>');}
					
					$("#email").attr("empMail", res.empMail);  
					$("#email").attr("empNm", res.empNm);
				}
			})
		})
		
		$("#email").on("click", function(){
			var empMail = $(this).attr("empMail");
			var empNm = $(this).attr("empNm");
			
			window.open("/ent/goEmailForm?empMail="+empMail + "&empNm=" + empNm
					    ,"zusaList"
					    ,"width=650, height=600, resizable=no, left=450px, top=200px");
		})
		
		
	})
</script>

<div class="col-lg-12">
<div class="single_element">
		<div class="quick_activity">
			<div class="row">
				<div class="col-12">
					<div class="quick_activity_wrap">
						<div id="enting" class="single_quick_activity d-flex mainHeaderCount">
							<div class="icon">
								<img src="/resources/img/icon/wheel.svg" alt="">
							</div>
							<div class="count_content">
								<h3>
									<span class="counter">${entVOCnt}</span>
								</h3>
								<p>입원 중</p>
							</div>
						</div>
						<div id="notenting" class="single_quick_activity d-flex mainHeaderCount">
							<div class="icon">
								<img src="/resources/img/icon/pharma.svg" alt="">
							</div>
							<div class="count_content">
								<h3>
									<span class="counter">${waitPntCnt}</span>
								</h3>
								<p>입원 대기</p>
							</div>
						</div>
						<div id="Wdteam" class="single_quick_activity d-flex mainHeaderCount">
							<div class="icon">
								<img src="/resources/img/icon/cap.svg" alt="">
							</div>
							<div class="count_content">
								<h3>
									<span class="counter">${entEmpCnt}</span>
								</h3>
								<p>병동근무직원</p>
							</div>
						</div>
						<div id="entNotice" class="single_quick_activity d-flex">
							<div class="icon">
								<img src="/resources/img/bell.png">
							</div>
							<div class="count_content">
								<h3>
									<span id="notiCnt"></span>
								</h3>
								<p>알림</p>
							</div>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
</div>

	<h4 id="txtTitle" style="display:inline-block; margin-left:8%;">병동 근무 직원</h4>
	<div class="box_left d-flex lms_block" style="display:inline-block; margin-left:57.5%;">
		<div class="serach_field_2">
			<div class="search_inner">
				<div class="search_field">
					<input type="text" id="keyword3" placeholder="이름으로 검색" value="${param.keyword}">
				</div>
				<button type="submit"> <i class="ti-search"></i> </button>
			</div>
		</div>
		<div class="add_button ml-10">
			<button type="button" id="searchBtn3" style="margin:0%;" class="btn_1">검색</button>
		</div>
	</div>

	<div class="wrapper" style="margin-left: 7%;">
		<c:forEach var="worker" items="${entWorker}">
			<div id="${worker.empCd}" class="white_box mb_30 emp" data-toggle="modal" data-target="#myModal" style="font-size:0.9em; padding:1%; width:20%; margin:1%; height:30%; display:inline-block;">
				<div id="empHeader" style="width:100%; height:45%;">
					<img src="${worker.empPic}" style="width: 50%; height:100%;"/>
					<h4 style="display:inline-block;">&nbsp;&nbsp;&nbsp; ${worker.empNm}</h4> 
				</div>
				<div id="empBody" style="width:100%; height:60%; padding:2%;">
				<table style="width:100%; font-size:1.1em; height:100%;">
					<thead>
						  <tr>
						    <td class="empCard">면허번호</td>
						    <td class="cardTd">${worker.lcnsNo}</td>
						  </tr>
					</thead>
					<tbody>
						  <tr>
						    <td class="empCard">연락처</td>
						    <td class="cardTd">${worker.empHp}</td>
						  </tr>
						  <tr>
						    <td class="empCard">상태</td>
						    <td class="cardTd">
						    	<c:if test="${worker.stateCd eq 'ES1'}"><span class="badge badge-success">온라인</span></c:if>
						    	<c:if test="${worker.stateCd eq 'ES2'}"><span class="badge badge-primary">업무중</span></c:if>
						    	<c:if test="${worker.stateCd eq 'ES3'}"><span class="badge badge-secondary">진료중</span></c:if>
						    	<c:if test="${worker.stateCd eq 'ES4'}"><span class="badge badge-info">수술중</span></c:if>
						    	<c:if test="${worker.stateCd eq 'ES5'}"><span class="badge badge-warning">자리비움</span></c:if>
						    	<c:if test="${worker.stateCd eq 'ES6'}"><span class="badge badge-danger">오프라인</span></c:if>
						    </td>
						  </tr>
						  <tr>
						    <td class="empCard">직급</td>
						    <td class="cardTd">${worker.position}</td>
						  </tr>
						  <tr>
						    <td class="empCard">소속 과</td>
						    <td class="cardTd">${worker.secNm}</td>
						  </tr>
					</tbody>
				</table>
				</div>
			</div>
		</c:forEach>
		
            <!-- 페이징 처리 시작 -->
         <ul class="pagination" style="margin:4% 0% 5% 35%;">
            <!-- Previous 시작 -->
            <li
               class="paginate_button page-item previous <c:if test='${page.startPage<page.pagingCount+1}'>disabled</c:if>"
               id="dataTable_previous"><a
               href="/ent/entEmp?currentPage=${page.startPage-page.pagingCount}&keyword=${param.keyword}"
               aria-controls="dataTable" data-dt-idx="0" tabindex="0"
               class="page-link">Previous</a></li>
            <!-- Previous 끝 -->
            <!-- Page번호 시작 -->
            <c:forEach var="pNo" begin="${page.startPage}" end="${page.endPage}"
               step="1">
               <li
                  class="paginate_button page-item <c:if test='${page.currentPage eq pNo}'>active</c:if>"><a
                  href="/ent/entEmp?currentPage=${pNo}&keyword=${param.keyword}" aria-controls="dataTable"
                  data-dt-idx="1" tabindex="0" class="page-link">${pNo}</a></li>
            </c:forEach>
            <!-- Page번호 끝 -->
            <!-- Next 시작 -->
            <li
               class="paginate_button page-item next <c:if test='${page.endPage>=page.totalPage}'>disabled</c:if>"
               id="dataTable_next"><a
               href="/ent/entEmp?currentPage=${page.startPage+page.pagingCount}&keyword=${param.keyword}"
               aria-controls="dataTable" data-dt-idx="7" tabindex="0"
               class="page-link">Next</a></li>
            <!-- Next 끝 -->
         </ul>
         <!-- 페이징 처리 끝 -->
	</div>
	
	<!-- 직원 상세정보 조회 Modal -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
  <div class="modal-dialog modal-dialog-slideout modal-sm" role="document" style="width:600px; height:500px;">
    <div class="modal-content">
      <div class="modal-header">
		 <h4 id="detailHead" style="display:inline-block;"></h4>
		 <button type="button" id="email" class="btn btn-outline-success" style="float:right;">메일</button>
      </div>
      <div class="modal-body" style="height:100%; width:100%; padding:2%;">
			<table style="width: 100%; height:500px; text-align:center;">
				<thead>
					  <tr>
					    <th rowspan="3" id="picTd">사진</th>
					    <th colspan="2" class="space">이름</th>
					    <td class="col2 dttd" id="detailName"></td>
					  </tr>
					  <tr>
					    <th colspan="2" class="space">직급</th>
					    <td class="col2 dttd" id="detailPosition"></td>
					  </tr>
					  <tr>
					    <th colspan="2" class="space">상태</th>
					    <td class="col2 dttd" id="detailState"></td>
					  </tr>
				</thead>
				<tbody>
					  <tr>
					    <th>면허번호</th>
					    <td colspan="3" id="detailLcNo" class="dttd"></td>
					  </tr>
					  <tr>
					    <th>생년월일</th>
					    <td colspan="3" id="detailBirth" class="dttd"></td>
					  </tr>
					  <tr>
					    <th>연락처</th>
					    <td colspan="3" id="detailHp" class="dttd"></td>
					  </tr>
					  <tr>
					    <th>주소</th>
					    <td colspan="3" id="detailAddr" class="dttd"></td>
					  </tr>
					  <tr>
					    <th>부서</th>
					    <td style="width:200px;" id="detailEmpNo" class="dttd"></td>
					    <th style="width:100px;">과</th>
					    <td id="detailSec" class="dttd"></td>
					  </tr>
					  <tr>
					    <th>직원메일</th>
					    <td colspan="3" id="detailMail" class="dttd"></td>
					  </tr>
				</tbody>
			</table>

	  </div>
      <div class="modal-footer">
        <button type="button" id="detailModalCloseBtn" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>


<!-- 우측 슬라이드 메뉴 -->
<div id="mask"></div>
<div class="slide_notice type2"> 
	<div class="menu_close" style="padding:5%;">
		<p style="color:white; text-align:center; font-weight: 1.4em;">입원 상세 알림</p>
		<button type="button" class="btn_menu_close">닫기</button>
	</div> 
	<ul class="menu_list" id="noticeContent"> 
	</ul> 
</div> 
<!-- 우측 슬라이드 메뉴 끝 -->
<script src="/resources/js/entCommon.js"></script>

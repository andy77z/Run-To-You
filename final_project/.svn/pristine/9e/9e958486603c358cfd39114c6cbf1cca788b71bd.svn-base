<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	Date now = new Date();
%>


<div id="doctoroutput">
	<c:if test="${resdoctorList.size() <= 0}">
			<div class="nores">
			<h2 id="textre">금일 예약 내역이 없습니다.</h2>
		</div>
	</c:if>
	<c:set var="list" value="${resdoctorList}"></c:set>	
	<c:forEach items="${resdoctorList}" var="vo">
		<fmt:formatDate pattern="yyyyMMdd" value="<%=now %>" var="nowDate"/>
		<fmt:formatDate pattern="HHmm" value="<%=now %>" var="nowTime"/>
		<!-- empdc1 : 현재 접속중인 직원 코드
			 empdc2 : 예약목록에 있는 직원 코드 -->
		<c:set var="empcd1" value="${loginUser.empCd}"></c:set>
		<c:set var="empcd2" value="${vo.empCd}"></c:set>
		
		<c:if test="${empcd1 eq empcd2}">
			<div class="card docard">
			<div class="cardl">
			<div>
				<img class="imgpro" alt="프로필 사진" src="${vo.empPic}">
			</div>
			<p class="title">${vo.major}</p>
			<h5 class="card-title title">${vo.empNm}(${vo.empCd})</h5>
			</div>
			<div class="cardr">
				<div class="card-body">
				<div class="type2 tblout">
				<table border="1" id="tbl" style="border-color: gray;">
					<tr>
						<td class="td tblti">예약시간</td>
						<td class="td tblti">환자이름</td>
						<td class="td tblti">접수여부</td>
					</tr>
					<c:forEach items="${vo.reservation}" var="rvst">
					<c:set var="nowDate" value="${nowDate}"/>
					<c:set var="nowTime" value="${nowTime}"/>
					<c:set var="resDate" value="${rvst.rsvtDt.substring(0,8)}"/>
					<c:set var="resTime" value="${rvst.rsvtDt.substring(8,12)}"/>
					<c:if test="${nowDate eq resDate}">
						<tr id="tbltr" empCd="${vo.empCd}" rsvtNo="${rvst.rsvtNo}" pntCd="${rvst.pntCd}">
							<td class="td">${rvst.rsvtDt.substring(8,10)}:${rvst.rsvtDt.substring(10,12)}</td>
							<td class="td">${rvst.pntNm}</td>
							<c:set var="rcptYn" value="${rvst.rcptYn}"/>
							<c:if test="${rcptYn eq '1'}">
								<td class="td">완료</td>
							</c:if>
							<c:if test="${rcptYn eq '0'}">
								<td class="td">미완료</td>
							</c:if>
						</tr>
					</c:if>
				
	
					</c:forEach>
				</table>
				</div>
				</div>
			</div>
			</div>
		</c:if>
	</c:forEach>
	<c:if test="${empcd1 != empcd2}">
		<div class="nores">
			<h2 id="textre">금일 예약 내역이 없습니다.</h2>
		</div>
	</c:if>
</div>

<div id="otheroutput">	
<c:if test="${resdoctorList.size() <= 0}">
		<div class="nores">
		<h2 id="textre">금일 예약 내역이 없습니다.</h2>
	</div>
</c:if>	
			
		<c:forEach items="${resdoctorList}" var="vo">
		<fmt:formatDate pattern="yyyyMMdd" value="<%=now %>" var="nowDate"/>
		<fmt:formatDate pattern="HHmm" value="<%=now %>" var="nowTime"/>
			<div class="card cardst">
			<div>
				<img class="imgpro" alt="프로필 사진" src="${vo.empPic}">
			</div>
			<p class="title">${vo.major}</p>
			<h5 class="card-title title">${vo.empNm}(${vo.empCd})</h5>
			<div class="card-body">
			<div class="type2 tblout">
			<table border="1" id="tbl" style="border-color: gray;">
				<tr>
					<td class="td tblti">예약시간</td>
					<td class="td tblti">환자이름</td>
					<td class="td tblti">접수여부</td>
				</tr>
					<c:forEach items="${vo.reservation}" var="rvst">
					<c:set var="nowDate" value="${nowDate}"/>
					<c:set var="nowTime" value="${nowTime}"/>
					<c:set var="resDate" value="${rvst.rsvtDt.substring(0,8)}"/>
					<c:set var="resTime" value="${rvst.rsvtDt.substring(8,12)}"/>
					<c:if test="${nowDate eq resDate}">
						<tr id="tbltr" empCd="${vo.empCd}" rsvtNo="${rvst.rsvtNo}" pntCd="${rvst.pntCd}">
							<td class="td">${rvst.rsvtDt.substring(8,10)}:${rvst.rsvtDt.substring(10,12)}</td>
							<td class="td">${rvst.pntNm}</td>
							<c:set var="rcptYn" value="${rvst.rcptYn}"/>
							<c:if test="${rcptYn eq '1'}">
								<td class="td">완료</td>
							</c:if>
							<c:if test="${rcptYn eq '0'}">
								<td class="td">미완료</td>
							</c:if>
							<td class="td" style="display: none;">${rvst.pntCd}</td>
						</tr>
					</c:if>
					</c:forEach>
			</table>
			</div>
			</div>
			</div>
	</c:forEach>
</div>
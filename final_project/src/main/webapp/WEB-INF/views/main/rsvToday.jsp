<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="ajaxData">
	<c:if test='${list == "[]"}'>
		<div>
			<h2>금일 예약 내역이 없습니다.</h2>
		</div>
	</c:if>
	
	<c:if test='${list != "[]"}'>
		<table border="1" id="tbl">
			<tr>
				<th>예약시간</th>
				<th>환자이름</th>
			</tr>
			<c:forEach items="${list}" var="vo">
			<tr>
				<td>${vo.rsvtDt.substring(8,10)}:${vo.rsvtDt.substring(10,12)}</td>
				<td>${vo.pntNm}</td>
			</tr>
			</c:forEach>
		</table>
	</c:if>
</div>

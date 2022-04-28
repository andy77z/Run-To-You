<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="secEmpList">
	<c:forEach items="${secEmpList}" var="item"> 
		<p class="tooltip-label" onmouseover="fn_showInfo(this)" onmouseout="fn_closeInfo(this)">
			<a class="empList" href='/profile/${item.empCd}'><i class="ti-user"></i> ${item.empNm} - 
			<c:choose>
				<c:when test='${item.cdNm.equals("온라인")}'>
					<span class="badge badge-pill badge-success">${item.cdNm}</span>
				</c:when>
				<c:when test='${item.cdNm.equals("자리비움")}'>
					<span class="badge badge-pill badge-warning">${item.cdNm}</span>
				</c:when>
				<c:when test='${item.cdNm.equals("오프라인")}'>
					<span class="badge badge-pill badge-danger">${item.cdNm}</span>
				</c:when>
				<c:otherwise>
					<span class="badge badge-pill badge-info">${item.cdNm}</span>
				</c:otherwise>
			</c:choose>
			</a>
		</p>
		<div class="tooltip-table" hidden="true">
		  	<table>
		  		<tr>
					<td style="height:60px;"><img src="${item.empPic}" style="width:100%;"></td>
		  		</tr>
		  		<tr>
		  			<c:choose>
						<c:when test='${item.cdNm.equals("온라인")}'>
							<td colspan="2"><span class="badge badge-pill badge-success">${item.cdNm}</span></td>
						</c:when>
						<c:when test='${item.cdNm.equals("자리비움")}'>
							<td colspan="2"><span class="badge badge-pill badge-warning">${item.cdNm}</span></td>
						</c:when>
						<c:when test='${item.cdNm.equals("오프라인")}'>
							<td colspan="2"><span class="badge badge-pill badge-danger">${item.cdNm}</span></td>
						</c:when>
						<c:otherwise>
							<td colspan="2"><span class="badge badge-pill badge-info">${item.cdNm}</span></td>
						</c:otherwise>
					</c:choose>
		  		</tr>
		  		<tr>
		  			<td>이름 : </td>
		  			<td>${item.empNm}</td>
		  		</tr>
		  		<tr>
		  			<td>소속 : </td>
		  			<td>${item.secNm}</td>
		  		</tr>
		  		<tr>
		  			<td>직급 : </td>
		  			<td>${item.position}</td>
		  		</tr>
		  		<tr>
		  			<td>연락처 : </td>
		  			<td>${item.empHp}</td>
		  		</tr>
		  		<tr>
		  			<td>이메일 : </td>
		  			<td>${item.empMail}</td>
		  		</tr>
		  	</table>
		</div>
	</c:forEach> 
</div>

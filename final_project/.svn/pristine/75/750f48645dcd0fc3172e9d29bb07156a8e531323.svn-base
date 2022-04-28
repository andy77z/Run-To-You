<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div id="ajaxData">
	<ul class="list-group list-group-flush">
		<c:if test="${notificationVO[0].notNo==null}">
			<li class="list-group-item">
				<span class="text-info mr-2">&nbsp;&nbsp;&nbsp;</span><span>새 알림이 없습니다</span>
			</li>
		</c:if>
		<c:if test="${notificationVO[0].notNo!=null}">
<!-- 			<li><button id="allRead" type="button" class="btn btn-danger" style="float:right;">전체 읽음 처리</button></li> -->
			<c:forEach var="vo" items="${notificationVO}">
				<li class="list-group-item">
			    	<a id="${vo.notNo}" name="${vo.notUrl}" onclick="fn_clickNotification(this)" style="cursor:pointer;">
			    		<c:choose>
			    			<c:when test='${vo.cmCd.equals("NS1")}'>
			    				<span class="text-info mr-2">${vo.notDt}</span><span>${vo.opt}</span>
			    			</c:when>
				    		<c:otherwise>
				    			<span class="text-info mr-2">${vo.notDt}</span><span>${vo.pntNm} 님이 ${vo.opt}</span>
				    		</c:otherwise>
			    		</c:choose>
			    	</a>
			    	<span class="badge badge-info text-info border border-info bg-white float-right">New!</span>
			  	</li>
			</c:forEach>
		</c:if>
	</ul>
</div>
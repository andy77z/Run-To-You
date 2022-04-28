<%@page import="kr.or.ddit.operation.vo.CalendarVO"%>

<%@page import="java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


[
		
		<c:forEach var="calendarVO" items="${calendar}">	
	{
		"title" : ${calendarVO.chrDr},
		"start": ${calendarVO.operBgnHr}, 
		"end": ${calendarVO.operEndHr}, 
<%-- 		"operIng" : ${calendarVO.operIng}, --%>
		"pntCd" : ${calendarVO.pntCd},
		"pntNm" : ${calendarVO.pntNm },
		"chrDr" : ${calendarVO.chrDr},
<%-- 		"operNo" : ${calendarVO.operNo}, --%>
		"operRoom" : ${calendarVO.operRoom },
<%-- 		"operYmd" : ${calendarVO.operYmd}, --%>
		<c:if test="${calendarVO.operIng eq 'N' }">
		"editable" : false,
		"color" : "blue"
		</c:if>
		<c:if test="${calendarVO.operIng eq 'Y' }">
		"editable" : false,
		"color" : "red"
		</c:if>
		
	}
		</c:forEach>


]
  
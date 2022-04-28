<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>

<link rel="stylesheet" href="/resources/css/ent/entCommon.css" type="text/css" />
<script src="/resources/js/jquery-3.4.1.min.js"></script>
<style>
input:-ms-input-placeholder {
	color: #a8a8a8;
}

input::-webkit-input-placeholder {
	color: #a8a8a8;
}

input::-moz-placeholder {
	color: #a8a8a8;
}

#drugSearch {
	height: 40px;
	width: 400px;
	border: 1px solid #1b5ac2;
	background: #ffffff;
}

#drugSearchBox {
	font-size: 16px;
	width: 300px;
	padding: 10px;
	border: 0px;
	outline: none;
	float: left;
}

#drugSearchBtn {
	width: 50px;
	height: 100%;
	border: 0px;
	background: #005b8f;
	outline: none;
	float: right;
	color: #ffffff
}

li:hover {
	background-color: #d6d6d6;
}

li {
	margin: 0px;
}
</style>

<script>
	$(document).ready(function() {	
		$("#drugSearchBtn").on("click", function() {
			var k;
			var temp;
			var keyword = "${param.keyword}";
			
			k = $("#drugSearchBox").val();
			
			if(k == ''){
				location.href = "/ent/drugList?keyword=" + keyword;
				return false;
			}
			location.href = "/ent/drugList?keyword=" + keyword + "&search=" + k;
		})
		
		$(".search").on("click", function(){
			var drugCd = $(this).attr("drugCd");
			var drugNm = $(this).attr("value");
			var drugAmt = $(this).attr("drugAmt");
			var keyword = "${param.keyword}";
			
			var prDiv = opener.document.getElementById(keyword);
			var prDiv = $(prDiv).next().next();
			
			$(prDiv).append("<p class='selectedDrug' drugCd=" + drugCd + " admst="+keyword+ " drugAmt="+drugAmt +">" + drugNm + "</p>");
		})
		
	})
</script>

<div id="drugSearch">
	<input type="text" id="drugSearchBox" placeholder="약명 입력" />
	<button type="button" id="drugSearchBtn">검색</button>
</div>
<div id="selectedBox"></div>

<ul id="drugList">
	<c:forEach var="list" items="${list}">
		<li class="search" drugCd="${list.drugCd}" admst="${list.admst}" value="${list.drugNm}"
						   drugAmt="${list.drugAmt}">${list.drugNm}</li>
		<hr>
	</c:forEach>
</ul>

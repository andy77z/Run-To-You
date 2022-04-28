<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<link rel="stylesheet" href="/resources/vendors/niceselect/css/nice-select.css" />
<link rel="stylesheet" href="/resources/css/ent/entCommon.css" type="text/css"/>
<link rel="stylesheet" href="/resources/css/bootstrap.min.css" />
<script src="/resources/js/jquery-3.4.1.min.js"></script>
<script src="/resources/vendors/niceselect/js/jquery.nice-select.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- 이쁜 alert 창 -->

<style>
	li{
		width: 430px;
	}
</style>
<script>


$(function(){
	$("select").niceSelect();
	
	$("#regist").on("click", function(){
		var drug = $("option:selected").attr("value");
		var newDgDt = $("#upDate").val();
		var newDgTime = $("#upTime").val();	
		var injCd = "${param.injCd}";
		
		
		if(drug == '0'){
			swal("경고!", "변경할 약을 선택해 주세요.", "warning");
			return false;
		}
		
		if(newDgDt == ''){
			swal("경고!", "투약일을 선택해 주세요.", "warning");
			return false;
		}	

		var realDgDt = new Date(newDgDt);
		
		var today = new Date();
		today.setDate(today.getDate() - 1);
		if(realDgDt < today){
			swal("경고!", "이전일은 선택할 수 없습니다.", "warning");
			return false;
		}
		
		if(newDgTime == ''){
			swal("경고!", "투약시간을 선택해 주세요.", "warning");
			return false;
		}	
		
		newDt = newDgDt + " " + newDgTime.replace(":", "");
		
		var data = {"injCd":injCd, "drugCd":drug, "injDt":newDt};
		
	 	$.ajax({
	 	url : '/ent/updateInjection',
	 	method : 'get',
	 	data : data,
	 	success : function(res){
	 		if(res > 0){
	 			swal("성공", "투약정보 변경을 완료했습니다.", "success");
	 			window.opener.newEvents();
// 	 			opener.parent.newEvents();
	 		}else{
	 			swal("실패", "투약정보 변경에 실패했습니다..", "error");
	 		}
	 	}
	})
		
	})
	
})

</script>



<div style="height:800px;" class="alert alert-danger">
	<table style="width:400px; text-align:left;">
		<tr style="width:200px;">
			<td>약</td>
		</tr>
		<tr style="width:200px;">
			<td style="width:100px;">
				<select class="nice_Select" id="dgList">
						<option value="0">약 선택</option>				
					<c:forEach var="dg" items="${drug}">
						<option value="${dg.drugCd}">${dg.drugNm}</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<td>투약일</td>
		</tr>
		<tr>
			<td style="width:100px;"><input type="date" id="upDate" max="${param.levDt}" min="${param.entDt}"><input type="time" id="upTime"></td>
		</tr>
		<tr style="width:200px; text-align: right;">
			<td colspan="2" style="padding-right: 120px;"><button type="button" class="btn btn-success" id="regist">등록</button></td>
		</tr>
	</table>
</div>


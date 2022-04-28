<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<div id="vslist">
<table class="table dataTable no-footer dtr-inline table-hover" id="DataTables_Table_0" role="grid" style="width: 600px; text-align: center;">
	<thead>
		<tr role="row">
			<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 15px; vertical-align:middle; position: sticky; top: 0px; padding:2px; background-color: #dad9ff">
				<button id="dbtn" type="button" class="btn btn-outline-light" onclick="vitaldcom()" style="font-size: 5px; width: 50px; display: none;">삭제</button>
			</th>
			<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background-color: #dad9ff">측정일자</th>
			<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background-color: #dad9ff">체온</th>
			<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background-color: #dad9ff">체중</th>
			<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background-color: #dad9ff">신장</th>
			<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 110px; position: sticky; top: 0px; background-color: #dad9ff">혈압</th>
			<th scope="col" tabindex="0" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 80px; position: sticky; top: 0px; background-color: #dad9ff">혈당</th>
		</tr>
	</thead>
	<tbody id="PRtbody">
		<c:set var="vsl" value="${vslist}"/>
		<c:if test="${vsl == '[]'}">
			<tr role='row'>
				<td colspan="7" style="text-align: center;">"환자의 바이탈 측정이력이 없습니다."</td>
			</tr>
		</c:if>
		<c:forEach var="vs" items="${vslist}">
			<tr role='row' class="vtr">    
				<td class="clickTR" style="padding:0;">
				<div class="vdi" style="display: none;">
					<input type="checkbox" id="vcheck" value="${vs.vsDt}"  name="${vs.pntCd}"/>
					<input type="hidden" id="vhidden" value='0' name="vit"/>
				</div>
				</td>                            
				<td>
					<fmt:parseDate var="dateString" value="${vs.vsDt}" pattern="yyyyMMddHHmmss" />
					<fmt:formatDate value="${dateString}" pattern="yyyy-MM-dd HH:mm:ss" />
				</td>                   
				<td>${vs.vsTmp}</td>                    
				<td>${vs.weight}</td>
				<td>${vs.height}</td>                    
				<td>${vs.vsBpMax}/${vs.vsBpMin}</td>
				<td>${vs.vsBs}</td>                   
			</tr>
		</c:forEach>        
	</tbody>
</table>
</div>
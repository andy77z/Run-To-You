<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<div class="row">
	<div class="col-xl-6">
			<div class="white_box mb_30"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
				<div class="box_header ">
					<div class="main-title">
						<h3 class="mb-0">금일 환자 수</h3>
						<c:if test="${statsVO.today eq null}" >
						<h2>금일 환자가 존재하지 않습니다.</h2><br>
						</c:if>
						<c:if test="${statsVO.today ne null}" >
						<h1>${statsVO.today} 명</h1><br>
						</c:if>
						<h3 class="mb-0">기간별 조회</h3><br>
							<div class="btn btn-outline-danger">검색 시작일</div>&nbsp;<input type="date" class="btn btn-outline-danger sDate" id="patientSdate" />&nbsp;&nbsp;
							<div class="btn btn-outline-info">검색 종료일</div>&nbsp;<input type="date" class="btn btn-outline-info eDate" id="patientEdate" />
					</div>
				</div>
			<canvas style="height: 358px; display: block; width: 716px;" id="todayChart" width="716" height="358" class="chartjs-render-monitor"></canvas>
			</div>
		</div>
		
		<div class="col-xl-6">
			<div class="white_box mb_30"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
				<div class="box_header ">
					<div class="main-title">
						<h3 class="mb-0">최근 일주일 환자 수</h3>
					</div>
				</div>
			<canvas style="height: 358px; display: block; width: 716px;" id="weekChart" width="716" height="358" class="chartjs-render-monitor weekCanvas"></canvas>
			</div>
		</div>
		
	<div class="col-xl-6">
		<div class="white_box mb_30"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
			<div class="box_header ">
				<div class="main-title">
					<h3 class="mb-0">월별 환자 수</h3><br>
					<input class="btn btn-outline-success" type="month" id="selectMonth" onchange="selectMonth(this)">
				</div>
			</div>
		<canvas style="height: 358px; display: block; width: 716px;" id="monthChart" width="716" height="358" class="chartjs-render-monitor"></canvas>
		</div>
	</div>
	
	<div class="col-xl-6">
		<div class="white_box mb_30"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
			<div class="box_header ">
				<div class="main-title">
					<h3 class="mb-0">연도별 환자 수</h3><br>
					<input class="btn btn-outline-success yearpicker" type="text" id="selectYear" />
				</div>
			</div>
		<canvas style="height: 358px; display: block; width: 716px;" id="yearChart" width="716" height="358" class="chartjs-render-monitor"></canvas>
		</div>
	</div>
</div>
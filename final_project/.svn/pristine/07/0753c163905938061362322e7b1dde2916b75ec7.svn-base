<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<div class="row">
	<div class="col-xl-6">
			<div class="white_box mb_30"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
				<div class="box_header ">
					<div class="main-title">
						<h3 class="mb-0">금일 매출</h3>
						<c:if test="${statsVO.todayAmount eq null}" >
						<h2>금일 매출이 존재하지 않습니다.</h2><br>
						</c:if>
						<c:if test="${statsVO.todayAmount ne null}" >
						<h1>${statsVO.todayAmount} 원</h1><br>
						</c:if>
						<h3 class="mb-0">기간별 조회</h3><br>
							<div class="btn btn-outline-danger">검색 시작일</div>&nbsp;<input type="date" class="btn btn-outline-danger sDate" id="salesSDate" />&nbsp;&nbsp;
							<div class="btn btn-outline-info">검색 종료일</div>&nbsp;<input type="date" class="btn btn-outline-info eDate" id="salesEDate" />
					</div>
				</div>
			<canvas style="height: 358px; display: block; width: 716px;" id="todaySales" width="716" height="358" class="chartjs-render-monitor"></canvas>
			</div>
		</div>
		
		<div class="col-xl-6">
			<div class="white_box mb_30"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
				<div class="box_header ">
					<div class="main-title">
						<h3 class="mb-0">최근 일주일 매출</h3>
					</div>
				</div>
			<canvas style="height: 358px; display: block; width: 716px;" id="weekSales" width="716" height="358" class="chartjs-render-monitor weekCanvas"></canvas>
			</div>
		</div>
		
	<div class="col-xl-6">
		<div class="white_box mb_30"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
			<div class="box_header ">
				<div class="main-title">
					<h3 class="mb-0">월간 매출</h3><br>
					<input class="btn btn-outline-success" type="month" id="selectMonthSales" onchange="selectMonth(this)">
				</div>
			</div>
		<canvas style="height: 358px; display: block; width: 716px;" id="monthSales" width="716" height="358" class="chartjs-render-monitor"></canvas>
		</div>
	</div>
	
	<div class="col-xl-6">
		<div class="white_box mb_30"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
			<div class="box_header ">
				<div class="main-title">
					<h3 class="mb-0">연도별 매출</h3><br>
					<input class="btn btn-outline-success yearpicker" type="text" id="selectYearSales" />
				</div>
			</div>
		<canvas style="height: 358px; display: block; width: 716px;" id="yearSales" width="716" height="358" class="chartjs-render-monitor"></canvas>
		</div>
	</div>
</div>
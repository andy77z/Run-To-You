<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="row">
	<div class="col-xl-6">
			<div class="white_box mb_30"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
				<div class="box_header ">
					<div class="main-title">
						<h3 class="mb-0">기간별 질병</h3><br>
							<div class="btn btn-outline-danger">검색 시작일</div>&nbsp;<input type="date" class="btn btn-outline-danger sDate" id="diseaseSdate" />&nbsp;&nbsp;
							<div class="btn btn-outline-info">검색 종료일</div>&nbsp;<input type="date" class="btn btn-outline-info eDate" id="diseaseEdate" />
						<h1></h1>
					</div>
				</div>
			<canvas style="height: 358px; display: block; width: 716px;" id="mainDisease" width="716" height="358" class="chartjs-render-monitor"></canvas>
			</div>
		</div>
		
		<div class="col-xl-6">
			<div class="white_box mb_30"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
				<div class="box_header ">
					<div class="main-title">
						<h3 class="mb-0">의사별 매출 조회</h3><br>
						<select class="btn btn-outline-warning" id="selectSec">
							<option>의사선택</option>
							<option value="SEC00001">내과</option>
							<option value="SEC00002">외과</option>
							<option value="SEC00003">정형외과</option>
						</select>
						&nbsp;<button type="button" id="doctorName" class="btn btn-outline-info" hidden="true"></button>
						<br><br>
						<div class="btn btn-outline-danger">검색 시작일</div>&nbsp;<input type="date" class="btn btn-outline-danger sDate" id="docterSdate" />&nbsp;&nbsp;
							<div class="btn btn-outline-info">검색 종료일</div>&nbsp;<input type="date" class="btn btn-outline-info eDate" id="docterEdate" />
					</div>
				</div>
				<!-- 과 클릭시 해당 과 의사 리스트 출력 -->
				<div class="docList">
				
				</div>
			<canvas style="height: 358px; display: block; width: 716px;"  id="docterSales" width="716" height="358" class="chartjs-render-monitor weekCanvas"></canvas>
			</div>
		</div>
		
	
</div>
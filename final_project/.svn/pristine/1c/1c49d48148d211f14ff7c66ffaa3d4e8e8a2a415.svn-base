package kr.or.ddit.stats.service.impl;

import java.util.List;
import java.util.Map;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.sec.vo.SecVO;
import kr.or.ddit.stats.vo.StatsVO;

public interface StatsService {
	
	// 금일 매출액 조회
	public String todayAmount();
	
	// 금일 부서별 매출액 조회
	public Map<String, String> deptAmount(Map<String, String> map);

	// 기간별 매출액 조회 
	public StatsVO selectAmount(StatsVO statsVO);
	
	// 의사 기간별 매출액 조회
	public Map<String, String> selectDoctorSales(Map<String, String> map);
	
	// 금일 환자 수 조회
	public String todayPatient();
	
	// 기간별 부서별 환자 조회
	public Map<String, String> selectDatePatient(Map<String, String> map);
	
	// 금일 부서별 환자 수 조회
	public StatsVO todayDeptPatient();
	
	// 주간 환자 수 조회
	public StatsVO selectWeekPnt();
	
	// 주간 매출 조회
	public StatsVO selectWeekAmount();
	
	// 월간 환자 수 조회
	public StatsVO selectMonthPnt(String selectDate);
	
	// 월간 매출 조회
	public StatsVO selectMonthAmount(String selectDate);
	
	// 최근 5년 환자 수 조회
	public List<Map<String, String>> selectYearPnt();
	
	// 최근 5년 매출 조회
	public List<Map<String, String>> selectYearSales();
	
	// 연도별 환자 수 조회
	public List<Map<String, String>> selectYear(String selectYear);
	
	// 연도별 환자 수 조회
	public List<Map<String, String>> selectYearAmount(String selectYear);
	
	// 기간별 질병 순위
	public List<Map<String, String>> selectDiseaseRank(Map<String, String> map);
}

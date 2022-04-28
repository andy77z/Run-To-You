package kr.or.ddit.stats.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.emp.mapper.EmpMapper;
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.notice.mapper.NoticeMapper;
import kr.or.ddit.notice.service.NoticeService;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.sec.mapper.SecMapper;
import kr.or.ddit.sec.vo.SecVO;
import kr.or.ddit.stats.mapper.StatsMapper;
import kr.or.ddit.stats.vo.StatsVO;

@Service
public class StatsServiceImpl implements StatsService {
	
	@Autowired
	StatsMapper statsMapper;
	
	// 금일 매출액 조회
	@Override
	public String todayAmount() {
		return statsMapper.todayAmount();
	}
	
	// 금일 부서별 매출액 조회
	@Override
	public Map<String, String> deptAmount(Map<String, String> map) {
		return statsMapper.deptAmount(map);
	}
	
	// 기간별 매출액 조회
	@Override
	public StatsVO selectAmount(StatsVO statsVO) {
		return statsMapper.selectAmount(statsVO);
	}

	// 금일 환자 수 조회
	@Override
	public String todayPatient() {
		return statsMapper.todayPatient();
	}
	
	// 기간별 부서별 매출액 조회
	@Override
	public Map<String, String> selectDatePatient(Map<String, String> map) {
		return statsMapper.selectDatePatient(map);
	}
	
	// 의사 기간별 매출액 조회
	@Override
	public Map<String, String> selectDoctorSales(Map<String, String> map){
		return statsMapper.selectDoctorSales(map);
	}

	// 금일 부서별 환자 수 조회
	@Override
	public StatsVO todayDeptPatient() {
		return statsMapper.todayDeptPatient();
	}
	
	// 주간 환자 수 조회
	@Override
	public StatsVO selectWeekPnt() {
		return statsMapper.selectWeekPnt();
	}
	
	// 주간 매출 조회
	@Override
	public StatsVO selectWeekAmount() {
		return statsMapper.selectWeekAmount();
	}
	
	// 월간 환자 수 조회
	@Override
	public StatsVO selectMonthPnt(String selectDate) {
		return statsMapper.selectMonthPnt(selectDate);
	}
	
	// 월간 매출 조회
	@Override
	public StatsVO selectMonthAmount(String selectDate) {
		return statsMapper.selectMonthAmount(selectDate);
	}


	// 최근 5년 환자 수 조회
	@Override
	public List<Map<String, String>> selectYearPnt() {
		return statsMapper.selectYearPnt();
	}
	
	// 최근 5년 환자 수 조회
	@Override
	public List<Map<String, String>> selectYearSales() {
		return statsMapper.selectYearSales();
	}
	
	// 년도별 환자 수 조회
	@Override
	public List<Map<String, String>> selectYear(String selectYear) {
		return statsMapper.selectYear(selectYear);
	}
	
	// 년도별 환자 수 조회
	@Override
	public List<Map<String, String>> selectYearAmount(String selectYear) {
		return statsMapper.selectYearAmount(selectYear);
	}
	
	// 기간별 질병 순위
	@Override
	public List<Map<String, String>> selectDiseaseRank(Map<String, String> map) {
		return statsMapper.selectDiseaseRank(map);
	}
	
	}

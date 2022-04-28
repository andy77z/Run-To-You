package kr.or.ddit.inject.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.inject.vo.InjectVO;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.operation.vo.PatientVO;

public interface InjectMapper {
	
	// 환자 검색
	public List<PatientVO> selectPatient(String keyword);
	
	// 환자 투약 정보 조회
	public List<InjectVO> injectDetail(Map<String, String>map);
}

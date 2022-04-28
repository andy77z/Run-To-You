package kr.or.ddit.emp.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.notice.vo.NoticeVO;

public interface EmpMapper {
	
	// 전체 직원 조회
	public List<EmpVO> selectAll();
	
	// 전체 직원 조회
	public List<EmpVO> empList();
	
	// 과별 직원 조회
	public List<EmpVO> selectDept(Map<String, Object> map);
	
	
	public int listCount(String keyword);
	
	// 진료부 직원 조회
	public List<EmpVO> medicalDept();
	
	// 간호부 직원 조회
	public List<EmpVO> nurseDept();	
	
	// 의료/행정부 직원 조회
	public List<EmpVO> adminDept();	
		
	// 직원 상세조회 
	public EmpVO selectOne(String empCd);
		
	// 직원 등록 시, 최대 직원코드값 +1 구하기
	public String nextEmpCD();
	
	// 직원 등록
	public int create(EmpVO empVO);
	
	// 직원 삭제
	public int delete(String empCd);
		
	// 직원 정보 수정
	public int update(EmpVO empVO);
	
	// 직원 정보 수정 시 프로필사진 수정
	public int updateImg(EmpVO empVO);
	
	// 마이프로필 기본 정보 수정
	public int basicModify(EmpVO empVO);
	
	//비밀번호 수정
	public int pwModify(EmpVO empVO);
	
	// 헤더 셀렉트박스 가져오기
	public List<EmpVO> secSelectBox();
	
	// 자기 소속과 직원정보 가져오기
	public List<EmpVO> mySecEmpInfo(EmpVO empVO);
	
	public int insertDoctor(EmpVO empVO);
	public int insertNurse(EmpVO empVO);
	public int insertNMdlTeam(EmpVO empVO);
	
}

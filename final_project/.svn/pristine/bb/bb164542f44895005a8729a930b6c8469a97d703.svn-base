package kr.or.ddit.sec.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.sec.vo.SecVO;

public interface SecMapper {
	
	// 전체 부서 조회
	public List<SecVO> selectAll();
	
	// 등록 시 다음 부서 코드 구하기
	public String nextSecCd();
	
	// 부서등록
	public int insertSec(SecVO secVO);
	
	// 부서별 과 조회
	public List<SecVO> searchSec(String deptNm);
	
	// 부서명 수정
	public int updateDeptNm(SecVO secVO);
	
	// 과명 수정
	public int updateSecNm(SecVO secVO);
}

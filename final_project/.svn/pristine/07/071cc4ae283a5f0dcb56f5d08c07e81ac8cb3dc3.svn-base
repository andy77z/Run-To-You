package kr.or.ddit.sec.service.impl;

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

@Service
public class SectServiceImpl implements SecService {
	
	@Autowired
	SecMapper secMapper;

	// 부서목록 
	@Override
	public List<SecVO> selectAll() {
		return secMapper.selectAll();
	}

	// 등록시 다음 부서코드
	@Override
	public String nextSecCd() {
		return secMapper.nextSecCd();
	}
	
	// 부서등록
	@Override
	public int insertSec(SecVO secVO) {
		return secMapper.insertSec(secVO);
	}
	
	// 부서별 과 조회
	@Override
	public List<SecVO> searchSec(String deptNm) {
		return secMapper.searchSec(deptNm);
	}
	
	// 부서명 변경
	@Override
	public int updateDeptNm(SecVO secVO) {
		return secMapper.updateDeptNm(secVO);
	}

	// 과명 변경
	@Override
	public int updateSecNm(SecVO secVO) {
		return secMapper.updateSecNm(secVO);
	}
	
	
}

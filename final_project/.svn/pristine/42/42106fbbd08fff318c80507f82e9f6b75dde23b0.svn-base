package kr.or.ddit.inject.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.emp.mapper.EmpMapper;
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.inject.mapper.InjectMapper;
import kr.or.ddit.inject.service.InjectService;
import kr.or.ddit.inject.vo.InjectVO;
import kr.or.ddit.notice.mapper.NoticeMapper;
import kr.or.ddit.notice.service.NoticeService;
import kr.or.ddit.notice.vo.NoticeVO;
import kr.or.ddit.operation.vo.PatientVO;

@Service
public class InjectServiceImpl implements InjectService {
	
	@Autowired
	InjectMapper injectMapper;

	// 환자 검색
	@Override
	public List<PatientVO> selectPatient(String keyword) {
		return injectMapper.selectPatient(keyword);
	}

	// 투약 내역 조회
	@Override
	public List<InjectVO> injectDetail(Map<String, String>map) {
		return injectMapper.injectDetail(map);
	}

	
}

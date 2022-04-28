package kr.or.ddit.emp.service.impl;

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

@Service
public class EmpServiceImpl implements EmpService {
	
	@Autowired
	EmpMapper empMapper;

	// 직원 전체목록 
	@Override
	public List<EmpVO> selectAll() {
		return empMapper.selectAll();
	}

	// 직원 전체목록 
	@Override
	public List<EmpVO> empList() {
		return empMapper.empList();
	}
	
	// 부서별 직원 조회
	@Override
	public List<EmpVO> selectDept(Map<String, Object> map){
		return empMapper.selectDept(map);
	}
	
	public int listCount(String keyword) {
		return empMapper.listCount(keyword);
	};
	
	// 진료부 직원목록
	@Override
	public List<EmpVO> medicalDept() {
		return empMapper.medicalDept();
	}
	
	// 간호부 직원목록
	@Override
	public List<EmpVO> nurseDept() {
		return empMapper.nurseDept();
	}
	
	// 의료/행정부 직원 조회
	@Override
	public List<EmpVO> adminDept() {
		return empMapper.adminDept();
	}
	
	// 직원 상세보기
	@Override
	public EmpVO selectOne(String empCd) {
		return empMapper.selectOne(empCd);
	}
	
	// 직원 등록 시, 최대 직원코드값 +1 구하기
	@Override
	public String nextEmpCD() {
		return empMapper.nextEmpCD();
	}

	// 직원 등록
	@Override
	public int create(EmpVO empVO) {
		return empMapper.create(empVO);
	}

	// 직원 삭제
	@Override
	public int delete(String empCd) {
		return empMapper.delete(empCd);
	}

	// 직원 정보 수정
	@Override
	public int update(EmpVO empVO) {
		return empMapper.update(empVO);
	}
	
	// 직원 정보 수정 시 프로필사진 수정
	@Override
	public int updateImg(EmpVO empVO) {
		return empMapper.updateImg(empVO);
	}

	@Override
	public int basicModify(EmpVO empVO) {
		return empMapper.basicModify(empVO);
	}

	@Override
	public int pwModify(EmpVO empVO) {
		return empMapper.pwModify(empVO);
	}

	@Override
	public List<EmpVO> secSelectBox() {
		return empMapper.secSelectBox();
	}

	@Override
	public List<EmpVO> mySecEmpInfo(EmpVO empVO) {
		return empMapper.mySecEmpInfo(empVO);
	}

	@Override
	public int insertDoctor(EmpVO empVO) {
		return empMapper.insertDoctor(empVO);
	}

	@Override
	public int insertNurse(EmpVO empVO) {
		return empMapper.insertNurse(empVO);
	}

	@Override
	public int insertNMdlTeam(EmpVO empVO) {
		return empMapper.insertNMdlTeam(empVO);
	}
}

package kr.or.ddit.patients.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.patients.mapper.PatientsMapper;
import kr.or.ddit.patients.service.PatientsService;
import kr.or.ddit.patients.vo.PatientsEmpVO;
import kr.or.ddit.patients.vo.PatientsVO;

@Service
public class PatientsServiceImpl  implements PatientsService {

	@Autowired
	PatientsMapper patientsMapper;
	
	//환자 목록
	@Override
	public List<PatientsVO> patientsList(String keyWord) {
		return patientsMapper.patientsList(keyWord);
	}

	//환자 상세목록
	@Override
	public PatientsVO detail(String pntCd) {
		return patientsMapper.detail(pntCd);
	}

	//환자 등록
	@Override
	public int insertPatients(PatientsVO patientsVo) {
		int result = patientsMapper.insertPatients(patientsVo);
		return result;
	}

	//환자 삭제
	@Override
	public int deletePatients(String pntCd) {
		int result = patientsMapper.deletePatients(pntCd);
		return result;
	}

	//바이탈사인 리스트
	@Override
	public List<PatientsVO> vslist(String pntCd) {
		return patientsMapper.vslist(pntCd);
	}

	//바이탈사인 등록
	@Override
	public int insertVital(PatientsVO patientsVo) {
		return patientsMapper.insertVital(patientsVo);
	}
	
	//바이탈사인 삭제
	@Override
	public int deleteVital(Map<String, String> map) {
		return patientsMapper.deleteVital(map);
	}

	//환자 수정
	@Override
	public int updateInfo(PatientsVO patientsVo) {
		return patientsMapper.updateInfo(patientsVo);
	}

	//진료목록 출력
	@Override
	public List<PatientsVO> treatlist(String pntCd) {
		return patientsMapper.treatlist(pntCd);
	}

}

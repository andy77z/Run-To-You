package kr.or.ddit.patients.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.patients.vo.PatientsEmpVO;
import kr.or.ddit.patients.vo.PatientsVO;

public interface PatientsService {

	//환자 목록
	public List<PatientsVO> patientsList(String keyWord);
	
	//환자 상세 목록
	public PatientsVO detail(String pntCd);
	
	//환자 등록
	public int insertPatients(PatientsVO patientsVo);

	//환자 삭제
	public int deletePatients(String pntCd);
	
	//환자 수정
	public int updateInfo(PatientsVO patientsVo);
	
	//바이탈사인 리스트
	public List<PatientsVO> vslist(String pntCd);

	//바이탈사인 등록
	public int insertVital(PatientsVO patientsVo);

	//바이탈사인 삭제
	public int deleteVital(Map<String, String> map);
	
	//진료목록 출력
	public List<PatientsVO> treatlist(String pntCd);
}

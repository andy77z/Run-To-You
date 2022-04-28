package kr.or.ddit.inspection.service;

import java.util.List;

import kr.or.ddit.inspection.vo.InspectionVO;
import kr.or.ddit.medical.vo.MedicalVo;
import kr.or.ddit.patients.vo.PatientsVO;

public interface InspectionService {

	public List<PatientsVO> inspWaitList(String empCd);
	
	public List<InspectionVO> inspList(String treatCd);
	
	public int insertInspFile(InspectionVO vo);
	
	public int osDaegi(String pntCd);
	
	public int updateInsp(InspectionVO vo);
	
	public int insertInspItems(InspectionVO vo);
}

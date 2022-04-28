package kr.or.ddit.receive.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.receive.vo.ReceiveVO;
import kr.or.ddit.receive.vo.receivePntVO;

public interface ReceiveMapper {
	
	public List<ReceiveVO> getReceivePatient(Map<String, Object> map);
	
	public int getReceivePatientCount(String keyword);
	
	public List<ReceiveVO> getReceiveCommitPatient(Map<String, Object> map);
	
	public int getReceiveCommitPatientCount(String keyword);
	
	public ReceiveVO getPatientRCV(Map<String, Object> map);
	
	public ReceiveVO getPatientRCV2(Map<String, Object> map);
	
	public List<ReceiveVO> getDigRCV(String treatCd);
	
	public List<ReceiveVO> getInspecRCV(String treatCd);

	public List<ReceiveVO> getOperRCV(String treatCd);
	
	public List<ReceiveVO> getInjectRCV(String treatCd);

	public List<ReceiveVO> getPrspRCV(String treatCd);
	
	public int minusRCV(Map<String, Object> map);
	
	public List<ReceiveVO> getTreatMemory(String pntCd);
	
	public int updateState7(Map<String, Object> map);
}

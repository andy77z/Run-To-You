package kr.or.ddit.receive.service.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.receive.mapper.ReceiveMapper;
import kr.or.ddit.receive.service.ReceiveService;
import kr.or.ddit.receive.vo.ReceiveVO;
import kr.or.ddit.receive.vo.receivePntVO;

@Service
public class ReceiveServiceImpl implements ReceiveService{

	@Autowired
	ReceiveMapper rcMapper;
	
	@Override
	public List<ReceiveVO> getReceivePatient(Map<String, Object> map) throws Exception{
		return rcMapper.getReceivePatient(map);
	}

	@Override
	public int getReceivePatientCount(String keyword) throws Exception {
		return rcMapper.getReceivePatientCount(keyword);
	}

	@Override
	public List<ReceiveVO> getReceiveCommitPatient(Map<String, Object> map) throws Exception {
		return rcMapper.getReceiveCommitPatient(map);
	}

	@Override
	public int getReceiveCommitPatientCount(String keyword) throws Exception {
		return rcMapper.getReceiveCommitPatientCount(keyword);
	}

	@Override
	public ReceiveVO getPatientRCV(Map<String, Object> map) throws Exception {
		return rcMapper.getPatientRCV(map);
	}

	@Override
	public List<ReceiveVO> getDigRCV(String treatCd) throws Exception {
		return rcMapper.getDigRCV(treatCd);
	}

	@Override
	public List<ReceiveVO> getInspecRCV(String treatCd) throws Exception {
		return rcMapper.getInspecRCV(treatCd);
	}

	@Override
	public List<ReceiveVO> getOperRCV(String treatCd) throws Exception {
		return rcMapper.getOperRCV(treatCd);
	}

	@Override
	public List<ReceiveVO> getInjectRCV(String treatCd) throws Exception {
		return rcMapper.getInjectRCV(treatCd);
	}

	@Override
	public int minusRCV(Map<String, Object> map) throws Exception {
		return rcMapper.minusRCV(map);
	}

	@Override
	public ReceiveVO getPatientRCV2(Map<String, Object> map) throws Exception {
		return rcMapper.getPatientRCV2(map);
	}

	@Override
	public List<ReceiveVO> getPrspRCV(String treatCd) throws Exception {
		return rcMapper.getPrspRCV(treatCd);
	}

	@Override
	public List<ReceiveVO> getTreatMemory(String pntCd) throws Exception {
		return rcMapper.getTreatMemory(pntCd);
	}

	@Override
	public int updateState7(Map<String, Object> map) throws Exception {
		return rcMapper.updateState7(map);
	}

	
	
}

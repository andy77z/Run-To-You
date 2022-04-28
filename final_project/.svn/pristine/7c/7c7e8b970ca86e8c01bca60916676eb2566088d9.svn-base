package kr.or.ddit.inspection.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.inspection.mapper.InspectionMapper;
import kr.or.ddit.inspection.service.InspectionService;
import kr.or.ddit.inspection.vo.InspectionVO;
import kr.or.ddit.patients.vo.PatientsVO;

@Service
public class InspectionServiceImpl implements InspectionService {
	@Autowired
	InspectionMapper inspectionMapper;
	
	@Override
	public List<PatientsVO> inspWaitList(String empCd) {
		return inspectionMapper.inspWaitList(empCd);
	}

	@Override
	public List<InspectionVO> inspList(String treatCd) {
		
		return inspectionMapper.inspList(treatCd);
	}

	@Override
	public int insertInspFile(InspectionVO vo) {
		return inspectionMapper.insertInspFile(vo);
	}

	@Override
	public int osDaegi(String pntCd) {
		return inspectionMapper.osDaegi(pntCd);
	}

	@Override
	public int updateInsp(InspectionVO vo) {
		return inspectionMapper.updateInsp(vo);
	}

	@Override
	public int insertInspItems(InspectionVO vo) {
		return inspectionMapper.insertInspItems(vo);
	}

}

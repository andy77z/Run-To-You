package kr.or.ddit.operation.service.Impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.operation.mapper.OperationMapper;
import kr.or.ddit.operation.service.OperationService;
import kr.or.ddit.operation.vo.CalendarVO;
import kr.or.ddit.operation.vo.ChartVO;
import kr.or.ddit.operation.vo.OpcVO;
import kr.or.ddit.operation.vo.OperDetailVO;
import kr.or.ddit.operation.vo.OperReservationVO;
import kr.or.ddit.operation.vo.OperTeamVO;
import kr.or.ddit.operation.vo.OperationVO;
import kr.or.ddit.operation.vo.PatientVO;
import kr.or.ddit.operation.vo.PntVSVO;


import kr.or.ddit.operation.vo.SgCodeVO;
import kr.or.ddit.operation.vo.TreatVO;
import kr.or.ddit.operation.vo.operationRoomVO;


@Service
public class OperationServiceImpl implements OperationService {

	@Autowired
	OperationMapper operationMapper;

	@Override
	public List<OperationVO> selectOperList() {
		
		return operationMapper.selectOperList();
	}

	@Override
	public ArrayList<CalendarVO> operCalendar() {

		return operationMapper.operCalendar();
	}

	@Override
	public ArrayList<ChartVO> operChart() {

		return operationMapper.operChart();
	}

	@Override
	public OperDetailVO operPntInfo(String operCd) {
		
		return operationMapper.operPntInfo(operCd);
	}

	@Override
	public ArrayList<OperDetailVO> operPntVS(String pntCd) {
		
		return operationMapper.operPntVS(pntCd);
	}

	@Override
	public ArrayList<OperDetailVO> operPntInj(String pntCd) {
	
		return operationMapper.operPntInj(pntCd);
	}

	@Override
	public ArrayList<OperDetailVO> operIns(String pntCd) {
		
		return operationMapper.operIns(pntCd);
	}

	@Override
	public ArrayList<OperDetailVO> operTeam(String operCd) {

		return operationMapper.operTeam(operCd);
	}

	@Override
	public OperDetailVO pntInfo(String pntCd) {
		
		return operationMapper.pntInfo(pntCd);
	}

	@Override
	public ArrayList<PntVSVO> pntVS(String pntCd) {
		
		return operationMapper.pntVS(pntCd);
	}

	@Override
	public List<PatientVO> pntSearch(String pntNm) {
		
		return operationMapper.pntSearch(pntNm);
	}

	@Override
	public OperationVO operCd() {
		
		return operationMapper.operCd();
	}

	@Override
	public PatientVO writeOperPnt(String pntCd) {

		return operationMapper.writeOperPnt(pntCd);
	}

	@Override
	public List<OperTeamVO> operTeam2(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return operationMapper.operTeam2(map);
	}

	@Override
	public OperTeamVO writeOperTeam(String empCd) {
		
		return operationMapper.writeOperTeam(empCd);
	}

	@Override
	public List<OperationVO> selectOperRoom() {
		
		return operationMapper.selectOperRoom();
	}

	@Override
	public List<SgCodeVO> selectSgCode() {
		
		return operationMapper.selectSgCode();
	}

	@Override
	public SgCodeVO writeSgCode(String sgNm) {
		
		return operationMapper.writeSgCode(sgNm);
	}

	@Override
	public operationRoomVO writeOpRoomNo(int opRoomNo) {
		
		return operationMapper.writeOpRoomNo(opRoomNo);
	}

	@Override
	public OperReservationVO writeReservation(Map<String, Object> map) {
		
		return operationMapper.writeReservation(map);
	}

	@Override
	public List<TreatVO> selectTreatCode(String pntNm) {
		
		return operationMapper.selectTreatCode(pntNm);
	}

	@Override
	public int insertOperation(Map<String,Object>map) {
		
		return operationMapper.insertOperation(map);
	}

	@Override
	public int insertOperProc(Map<String, Object> map) {
		
		return operationMapper.insertOperProc(map);
	}
	
	@Override
	public int insertOperTeam(Map<String, Object> map) {
		
		return operationMapper.insertOperTeam(map);
	}

	@Override
	public List<OperationVO> operationList(String empNm) {
		
		return operationMapper.operationList(empNm);
	}

	@Override
	public int updateOperation(Map<String, Object>map) {
		int result = operationMapper.updateOperProc(map);
		result += operationMapper.updateOperation(map);
		return result;
	}

	@Override
	public int deleteOperation(String operCd) {
			int result = operationMapper.deleteOperProc(operCd);
			    result += operationMapper.deleteOperation(operCd);
		return result;
	}

	@Override
	public List<OperationVO> recordPntList(String empCd) {
		
		return operationMapper.recordPntList(empCd);
	}

	@Override
	public List<TreatVO> selectDis(String treatCd) {
		return operationMapper.selectDis(treatCd);
	}

	@Override
	public List<OperationVO> loadRecord(Map<String, String>map) {
		
		return operationMapper.loadRecord(map);
	}

	@Override
	public List<OperationVO> loadRecordProc(String operCd) {
		
		return operationMapper.loadRecordProc(operCd);
	}

	@Override
	public int updateRecordYN(String operCd) {
		
		return operationMapper.updateRecordYN(operCd);
	}

	@Override
	public int insertOperRec(Map<String, Object> map) {
		
		return operationMapper.insertOperRec(map);
	}

	@Override
	public OperationVO completeLoadRecord(String operCd) {
		
		return operationMapper.completeLoadRecord(operCd);
	}

	@Override
	public List<OperationVO> myOperation(String empCd) {
		
		return operationMapper.myOperation(empCd);
	}
	
	
	
	
	
}

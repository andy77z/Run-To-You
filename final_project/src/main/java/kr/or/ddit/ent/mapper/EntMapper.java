package kr.or.ddit.ent.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.drug.vo.DrugVO;
import kr.or.ddit.ent.vo.EntNotiVO;
import kr.or.ddit.ent.vo.EntVO;
import kr.or.ddit.ent.vo.WardVO;

public interface EntMapper {
	
	public List<EntVO> entPatientList(String keyword);
	
	public int entPatientCount();
	
	public EntVO patientDetail(String pntCd);
	
	public List<EntVO> entWardPntList(Map<String, Object> map);
	
	public int entWardPntCount();
	
	public int updatePntEnt(String pntCd);
	
	public List<WardVO> getWard();
	
	public List<EntVO> getRoom(String roomCls);
	
	public int saveRoom(Map<String, Object> map);
	
	public int updateEnt(String pntCd);
	
	public int insertEnt(Map<String, Object> map);
	
	public EntVO getEntDetail(String pntCd);
	
	public List<EntVO> getCareNote(String entCd);
	
	public List<EntVO> getVital(String pntCd);
	
	public EntVO getCurrentVital(String pntCd);
	
	public int insertVital(Map<String, Object> entVO);
	
	public int insertCareNote(Map<String, Object> entVO);
	
	public List<EntVO> getEntWorker(Map<String, Object> map);
	
	public int getEntWorkerCount(String keyword);
	
	public EntVO getEntEmpDetail(String empCd);
	
	public int getNoPagingWorkerCount();
	
	public List<EntVO> getDietList();
	
	public int updateLevDt(Map<String, Object> map);
	
	public int updateLiskCd(Map<String, Object> map);
	
	public int updateEntAmt(Map<String, Object> map);
	
	public int insertTreatItemAmt(Map<String, Object> map);
	
	public int updateLeavingPnt(Map<String, Object> map);
	
	public int insertRcv(String treatCd);
	
	public List<DrugVO> getDrugList(Map<String, Object> map);
	
	public int insertEntInject(Map<String, Object> map);
	
	public int deleteInjection(String injCd);
	
	public EntVO getOneInjection(String injCd);
	
	public int updateInjection(Map<String, Object> map);
	
	public List<EntVO> getDrugSchedule(String pntCd);
	
	public EntVO getEntLevDt(String pntCd);
	
	public int getNotiCount(String empCd);
	
	public List<EntNotiVO> getNotiContent(String empCd);
	
	public int confirmNoti(String notNo);
	
	public int insertDrugNotiContent();
	
	public int insertTreatItemAmtDiet(Map<String, Object> map);
	
	public int deleteCN(Map<String, Object> map);
	
	public int insertTreatItemAmtInject(String treatCd);
}

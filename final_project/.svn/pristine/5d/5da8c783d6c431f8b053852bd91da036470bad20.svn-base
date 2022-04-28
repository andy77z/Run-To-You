package kr.or.ddit.ent.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.drug.vo.DrugVO;
import kr.or.ddit.ent.vo.EntNotiVO;
import kr.or.ddit.ent.vo.EntVO;
import kr.or.ddit.ent.vo.WardVO;


public interface EntService {
	
	public List<EntVO> entPatientList(String keyword)  throws Exception;
	
	public int entPatientCount() throws Exception;
	
	public EntVO patientDetail(String pntCd) throws Exception;

	public List<EntVO> entWardPntList(Map<String, Object> map) throws Exception;
	
	public int entWardPntCount() throws Exception;
	
	public int updatePntEnt(String pntCd)throws Exception;
	
	public int insertRcv(String treatCd)throws Exception;
	
	public List<WardVO> getWard()throws Exception;
	
	public List<EntVO> getRoom(String roomCls)throws Exception;
	
	public int saveRoom(Map<String, Object> map)throws Exception;
	
	public int updateEnts(Map<String, Object> map) throws Exception;
	
	public int updateEnt(String pntCd)throws Exception;
	
	public int insertEnt(Map<String, Object> map) throws Exception;
	
	public EntVO getEntDetail(String pntCd)throws Exception;
	
	public List<EntVO> getCareNote(String entCd)throws Exception;
	
	public List<EntVO> getVital(String pntCd)throws Exception;
	
	public EntVO getCurrentVital(String pntCd) throws Exception;
	
	public int insertVital(Map<String, Object> entVO)throws Exception;
	
	public int insertCareNote(Map<String, Object> map) throws Exception;
	
	public List<EntVO> getEntWorker(Map<String, Object> map)throws Exception;
	
	public int getEntWorkerCount(String keyword)throws Exception;
	
	public EntVO getEntEmpDetail(String empCd)throws Exception;
	
	public int getNoPagingWorkerCount()throws Exception;

	public List<EntVO> getDietList()throws Exception;
	
	public int updateLevDt(Map<String, Object> map) throws Exception;
	
	public int updateLiskCd(Map<String, Object> map) throws Exception;
	
	public int updateEntAmt(Map<String, Object> map) throws Exception;
	
	public int insertTreatItemAmt(Map<String, Object> map) throws Exception;
	
	public int updateLeavingPnt(Map<String, Object> map) throws Exception;
	
	public List<DrugVO> getDrugList(Map<String, Object> map) throws Exception;
	
	public int insertEntInject(Map<String, Object> map) throws Exception;
	
	public int deleteInjection(String injCd) throws Exception;
	
	public EntVO getOneInjection(String injCd) throws Exception;
	
	public int updateInjection(Map<String, Object> map) throws Exception;
	
	public List<EntVO> getDrugSchedule(String pntCd) throws Exception;
	
	public EntVO getEntLevDt(String pntCd)throws Exception;
	
	public int getNotiCount(String empCd) throws Exception;
	
	public List<EntNotiVO> getNotiContent(String empCd) throws Exception;
	
	public int confirmNoti(String notNo) throws Exception;
	
	public int insertDrugNotiContent() throws Exception;
	
	public int insertTreatItemAmtDiet(Map<String, Object> map) throws Exception;
	
	public int deleteCN(Map<String, Object> map) throws Exception;
	
	public int insertTreatItemAmtInject(String treatCd) throws Exception;
}

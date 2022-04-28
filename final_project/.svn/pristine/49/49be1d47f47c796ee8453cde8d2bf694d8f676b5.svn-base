package kr.or.ddit.ent.service.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.drug.vo.DrugVO;
import kr.or.ddit.ent.mapper.EntMapper;
import kr.or.ddit.ent.service.EntService;
import kr.or.ddit.ent.vo.EntNotiVO;
import kr.or.ddit.ent.vo.EntVO;
import kr.or.ddit.ent.vo.WardVO;

@Service
public class EntServiceImpl implements EntService {

	@Autowired
	EntMapper entMapper;

	@Override
	public List<EntVO> entPatientList(String keyword) throws Exception {
		return entMapper.entPatientList(keyword);
	}

	@Override
	public int entPatientCount() throws Exception {
		return entMapper.entPatientCount();
	}

	@Override
	public EntVO patientDetail(String pntCd) throws Exception {
		return entMapper.patientDetail(pntCd);
	}

	@Override
	public List<EntVO> entWardPntList(Map<String, Object> map) throws Exception {
		return entMapper.entWardPntList(map);
	}

	@Override
	public int entWardPntCount() throws Exception {
		return entMapper.entWardPntCount();
	}

	@Override
	public int updatePntEnt(String pntCd) throws Exception {
		return entMapper.updatePntEnt(pntCd);
	}

	@Override
	public List<WardVO> getWard() throws Exception {
		return entMapper.getWard();
	}

	@Override
	public List<EntVO> getRoom(String roomCls) throws Exception {
		return entMapper.getRoom(roomCls);
	}

	@Override
	public int saveRoom(Map<String, Object> map) throws Exception {
		return entMapper.saveRoom(map);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public int updateEnts(Map<String, Object> map) throws Exception {
		int cnt = 0;

		try {
			cnt += entMapper.updateEnt((String) map.get("pntCd"));
			entMapper.insertEnt(map);
			cnt++;
		} catch (RuntimeException e) {
			throw e;
		}

		return cnt;
	}

	@Override
	public int updateEnt(String pntCd) throws Exception {
		return entMapper.updateEnt(pntCd);
	}

	@Override
	public int insertEnt(Map<String, Object> map) throws Exception {
		return entMapper.insertEnt(map);
	}

	@Override
	public EntVO getEntDetail(String pntCd) throws Exception {
		return entMapper.getEntDetail(pntCd);
	}

	@Override
	public List<EntVO> getCareNote(String entCd) throws Exception {
		return entMapper.getCareNote(entCd);
	}

	@Override
	public List<EntVO> getVital(String pntCd) throws Exception {
		return entMapper.getVital(pntCd);
	}

	@Override
	public EntVO getCurrentVital(String pntCd) throws Exception {
		return entMapper.getCurrentVital(pntCd);
	}

	@Override
	public int insertVital(Map<String, Object> entVO) throws Exception {
		return entMapper.insertVital(entVO);
	}

	@Override
	public int insertCareNote(Map<String, Object> entVO) throws Exception {
		return entMapper.insertCareNote(entVO);
	}

	@Override
	public List<EntVO> getEntWorker(Map<String, Object> map) throws Exception {
		return entMapper.getEntWorker(map);
	}

	@Override
	public int getEntWorkerCount(String keyword) throws Exception {
		return entMapper.getEntWorkerCount(keyword);
	}

	@Override
	public EntVO getEntEmpDetail(String empCd) throws Exception {
		return entMapper.getEntEmpDetail(empCd);
	}

	@Override
	public int getNoPagingWorkerCount() throws Exception {
		return entMapper.getNoPagingWorkerCount();
	}

	@Override
	public List<EntVO> getDietList() throws Exception {
		return entMapper.getDietList();
	}

	@Override
	public int updateEntAmt(Map<String, Object> map) {
		return 0;
	}

	@Override
	public int updateLeavingPnt(Map<String, Object> map) throws Exception {
		return 0;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	@Override
	public int insertTreatItemAmt(Map<String, Object> map) throws Exception {
		int result = entMapper.updateEntAmt(map); // ent 테이블 환자의 퇴원일을 오늘로 함
		result += entMapper.updateLeavingPnt(map); // ent였던 pnt 입원 여부 N 으로 상태코드는 수납대기로
		result += entMapper.insertTreatItemAmt(map); // treatItemAmt로 입원비만 인서트
		result += entMapper.insertTreatItemAmtDiet(map); // 식비만 따로 인서트
		result += entMapper.insertTreatItemAmtInject((String)map.get("treatCd"));
		result += entMapper.insertRcv((String) map.get("treatCd")); // 얘를 마지막으로 해야함

		return result;
	}

	@Override
	public int updateLevDt(Map<String, Object> map) throws Exception {
		return entMapper.updateLevDt(map);
	}

	@Override
	public List<DrugVO> getDrugList(Map<String, Object> map) throws Exception {
		return entMapper.getDrugList(map);
	}

	@Override
	public int insertEntInject(Map<String, Object> map) throws Exception {
		return entMapper.insertEntInject(map);
	}

	@Override
	public int deleteInjection(String injCd) throws Exception {
		return entMapper.deleteInjection(injCd);
	}

	@Override
	public EntVO getOneInjection(String injCd) throws Exception {
		return entMapper.getOneInjection(injCd);
	}

	@Override
	public int updateInjection(Map<String, Object> map) throws Exception {
		return entMapper.updateInjection(map);
	}

	@Override
	public List<EntVO> getDrugSchedule(String pntCd) throws Exception {
		return entMapper.getDrugSchedule(pntCd);
	}

	@Override
	public EntVO getEntLevDt(String pntCd) throws Exception {
		return entMapper.getEntLevDt(pntCd);
	}

	@Override
	public int getNotiCount(String empCd) throws Exception {
		return entMapper.getNotiCount(empCd);
	}

	@Override
	public List<EntNotiVO> getNotiContent(String empCd) throws Exception {
		return entMapper.getNotiContent(empCd);
	}

	@Override
	public int confirmNoti(String notNo) throws Exception {
		return entMapper.confirmNoti(notNo);
	}

	@Override
	public int insertDrugNotiContent() throws Exception {
		return entMapper.insertDrugNotiContent();
	}

	@Override
	public int updateLiskCd(Map<String, Object> map) throws Exception {
		return entMapper.updateLiskCd(map);
	}

	@Override
	public int insertTreatItemAmtDiet(Map<String, Object> map) throws Exception {
		return entMapper.insertTreatItemAmtDiet(map);
	}

	@Override
	public int insertRcv(String treatCd) throws Exception {
		return entMapper.insertRcv(treatCd);
	}

	@Override
	public int deleteCN(Map<String, Object> map) throws Exception {
		return entMapper.deleteCN(map);
	}

	@Override
	public int insertTreatItemAmtInject(String treatCd) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

}

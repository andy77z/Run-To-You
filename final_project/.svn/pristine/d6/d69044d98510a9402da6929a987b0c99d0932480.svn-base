package kr.or.ddit.reservation.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.patients.vo.PatientsEmpVO;
import kr.or.ddit.patients.vo.PatientsVO;
import kr.or.ddit.reservation.mapper.ReservationMapper;
import kr.or.ddit.reservation.service.ReservationService;
import kr.or.ddit.reservation.vo.ReceptVO;
import kr.or.ddit.reservation.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {

	@Autowired
	ReservationMapper reservationMapper;
	
	//특정 환자 예약정보 확인
	@Override
	public List<ReservationVO> reservlist(String pntCd) {
		return reservationMapper.reservlist(pntCd);
	}

	//전체 예약목록 출력
	@Override
	public List<ReservationVO> allList() {
		return reservationMapper.allList();
	}
	
	//의사별 예약목록 출력
	@Override
	public List<ReservationVO> docList(String empCd) {
		return reservationMapper.docList(empCd);
	}

	//신규 예약
	@Override
	public int addreservation(ReservationVO reservationVo) {
		return reservationMapper.addreservation(reservationVo);
	}

	//신규 예약하면 환자상태 변경 
	@Override
	public int compreservation(String pntCd) {
		return reservationMapper.compreservation(pntCd);
	}
	
	//진료과목 리스트
	@Override
	public List<PatientsEmpVO> majorList() {
		return reservationMapper.majorList();
	}

	//진료과목 별 의사 리스트
	@Override
	public List<PatientsEmpVO> doctorList(String major) {
		return reservationMapper.doctorList(major);
	}
	//진료과목 별 의사 리스트
	@Override
	public List<ReservationVO> resdoctorList(String major) {
		return reservationMapper.resdoctorList(major);
	}

	//의사 목록
	@Override
	public List<PatientsEmpVO> doctor(String empCd) {
		return reservationMapper.doctor(empCd);
	}

	//환자 목록
	@Override
	public List<PatientsVO> patientsList() {
		return reservationMapper.patientsList();
	}
	//진료부서 별 예약목록 리스트
	@Override
	public List<ReservationVO> majorresList(String major) {
		return reservationMapper.majorresList(major);
	}

	//예약 내역 찾기
	@Override
	public ReservationVO findres(String rsvtNo) {
		return reservationMapper.findres(rsvtNo);
	}

	//예약 수정
	@Override
	public int modireservation(ReservationVO reservationVo) {
		return reservationMapper.modireservation(reservationVo);
	}

	//예약된 시간 찾아오기(수정)
	@Override
	public List<ReservationVO> restime(Map<String, Object> map) {
		return reservationMapper.restime(map);
	}

	//예약 삭제
	@Override
	public int resdelete(String rsvtNo) {
		return reservationMapper.resdelete(rsvtNo);
	}
	
	@Override
	public List<ReservationVO> rsvToday(String empCd) {
		return reservationMapper.rsvToday(empCd);
	}

	//예약 취소 시 상태코드 변경
	@Override
	public int cancelreservation(String pntCd) {
		return reservationMapper.cancelreservation(pntCd);
	}

	//예약 상태 변경(접수완료 후 대기)
	@Override
	public int waiting(String pntCd) {
		return reservationMapper.waiting(pntCd);
	}
	
	//접수 테이블 인서트
	@Override
	public int insertRecept(ReceptVO vo) {
		return reservationMapper.insertRecept(vo);
	}

	//예약 상태 변경(접수상태)
	@Override
	public int rsvcheck(ReceptVO vo) {
		return reservationMapper.rsvcheck(vo);
	}

}

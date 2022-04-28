package kr.or.ddit.reservation.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.patients.vo.PatientsEmpVO;
import kr.or.ddit.patients.vo.PatientsVO;
import kr.or.ddit.reservation.vo.ReceptVO;
import kr.or.ddit.reservation.vo.ReservationVO;

public interface ReservationMapper {

	//특정 환자 예약정보 확인
	public List<ReservationVO> reservlist(String pntCd);
	
	//전체 예약목록 출력
	public List<ReservationVO> allList();

	//의사별 예약목록 출력
	public List<ReservationVO> docList(String empCd);
	
	//의사 목록
	public List<PatientsEmpVO> doctor(String empCd);

	//신규 예약
	public int addreservation(ReservationVO reservationVo);
	
	//신규 예약하면 환자상태 변경 
	public int compreservation(String pntCd);
	
	//진료과목 리스트
	public List<PatientsEmpVO> majorList();

	//진료과목 별 의사 리스트
	public List<PatientsEmpVO> doctorList(String major);
	
	//진료과목 별 의사 리스트
	public List<ReservationVO> resdoctorList(String major);
	
	//진료부서 별 예약목록 리스트
	public List<ReservationVO> majorresList(String major);
	
	//환자 목록
	public List<PatientsVO> patientsList();
	
	//예약 내역 찾기
	public ReservationVO findres(String rsvtNo);
	
	//예약 수정
	public int modireservation(ReservationVO reservationVo);
	
	//예약된 시간 찾아오기(수정)
	public List<ReservationVO> restime(Map<String, Object> map);
	
	//예약 삭제
	public int resdelete(String rsvtNo);

	//예약 취소 시 상태코드 변경
	public int cancelreservation(String pntCd);

	//예약 상태 변경(접수완료 후 대기)
	public int waiting(String pntCd);
	
	//예약 상태 변경(접수상태)
	public int rsvcheck(ReceptVO vo);
	
	//접수 테이블 인서트
	public int insertRecept(ReceptVO vo);

	
	public List<ReservationVO> rsvToday(String empCd);
}




	




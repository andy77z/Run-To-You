package kr.or.ddit.reservation.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.patients.vo.PatientsEmpVO;
import kr.or.ddit.patients.vo.PatientsVO;
import kr.or.ddit.reservation.service.ReservationService;
import kr.or.ddit.reservation.vo.ReceptVO;
import kr.or.ddit.reservation.vo.ReservationVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	ReservationService reservationservice;
	
	private static final Logger logger = LoggerFactory.getLogger(ReservationController.class);

	//예약페이지로 이동
	@GetMapping("/main")
	public String reservlist(Model model, @ModelAttribute("patientsVo")PatientsVO patientsVo) {
		List<PatientsEmpVO> majorlist = this.reservationservice.majorList();
		logger.info("majorList : "+ majorlist.toString());
		model.addAttribute("majorlist", majorlist);
		return"reservation/main";
	}
	
	//진료과목 별 의사 출력
	@PostMapping("/doctorList")
	@ResponseBody
	public List<PatientsEmpVO> doctorList(Model model, @RequestParam String major){
		List<PatientsEmpVO> doctorlist = this.reservationservice.doctorList(major);
		//logger.info(major);
		//logger.info("doctorlist:" + doctorlist.toString());
		return doctorlist;
	}
	
	//의사목록
	@PostMapping("/doctor")
	@ResponseBody
	public List<PatientsEmpVO> doctor(Model model, @RequestParam String empCd){
		List<PatientsEmpVO> doctor = this.reservationservice.doctor(empCd);
		logger.info("doctor:" + doctor.toString());
		return doctor;
	}
	
	//진료과목 별 의사 출력
	@PostMapping("/resdoctorList")
	public String resdoctorList(Model model, @RequestParam(required = false) String major){
		List<ReservationVO> resdoctorList = this.reservationservice.resdoctorList(major);
		logger.info("resdoctorListdfd : " + resdoctorList.toString());
		logger.info("rmajor: "+ major);
		model.addAttribute("resdoctorList",resdoctorList);
		return "/reservation/doctorInfo";
	}
		
	//진료부서 별 예약목록 출력
	@GetMapping("/majorresList")
	@ResponseBody
	public List<ReservationVO> majorresList(Model model, @RequestParam String major){
		List<ReservationVO> majorresList = this.reservationservice.majorresList(major);
		logger.info("major : " + major);
		logger.info("majorresList : " + majorresList);
		//model.addAttribute("majorresList", majorresList);
		return majorresList;
	}
	
	//전체 예약목록 출력
	@GetMapping("/allList")
	@ResponseBody
	public List<ReservationVO> allList(Model model){
		List<ReservationVO> allList = this.reservationservice.allList();
		//logger.info("allList" + allList.toString());
		return allList;
	}
	
	//의사별 예약목록 출력
	@PostMapping("/docList")
	@ResponseBody
	public List<ReservationVO> docList(Model model, @RequestParam(value="empCd") String empCd){
		List<ReservationVO> docList = this.reservationservice.docList(empCd);
		logger.info("docList" + docList.toString());
		return docList;
	}
	
	//신규예약
	@PostMapping("/addreservation")
	public String addreservation(Model model, @ModelAttribute("reservationVo")ReservationVO reservationVo){
		//logger.info("reservationVo" + reservationVo);
		int result = this.reservationservice.addreservation(reservationVo);
		if(result > 0) {
			reservationservice.compreservation(reservationVo.getPntCd());
		}
		return "redirect:/reservation/main";
	}
	
	
	//예약 수정
	@PostMapping("/modireservation")
	public String modireservation(Model model, @ModelAttribute("ReservationVO")ReservationVO reservationVo) {
		logger.info("edite reservationVo : "+ reservationVo);
		int result = this.reservationservice.modireservation(reservationVo);
		if(0<result) {//성공
			return "redirect:main";
		}else {//실패
			return "redirect:main";
		}
	}
		
	//예약 삭제
	@PostMapping("/resdelete")
	@ResponseBody
	public int resdelete(Model model, @RequestParam Map<String, String> map) {
		logger.info("map"+map.toString());
		int result = reservationservice.resdelete(map.get("rsvtNo"));
		if(result>0) {
			reservationservice.cancelreservation(map.get("pntCd"));
		}
		return result;
	};
	
	//환자 목록
	@GetMapping("/patientsList")
	@ResponseBody
	public List<PatientsVO> patientsList(Model model) {
		List<PatientsVO> list = this.reservationservice.patientsList();
		//logger.info("patientsList" + list.toString());
		return list;
	}
	
	//예약 내역 찾기
	@PostMapping("/findres")
	@ResponseBody
	public ReservationVO findres(Model model, @RequestParam String rsvtNo) {
		ReservationVO find = reservationservice.findres(rsvtNo);
		logger.info("find", find.toString());
		return find;
	}
	
	//예약된 시간 찾아오기(수정)
	@PostMapping("/restime")
	@ResponseBody
	public List<ReservationVO> restime(Model model, @RequestParam Map<String, Object> map) {
		List<ReservationVO> res = reservationservice.restime(map);
		logger.info("resvo", res.toString());
		return res;
	}
	
	//예약 상태 변경(접수완료 후 대기)
	@PostMapping("/waiting")
	@ResponseBody
	public int waiting(Model model,ReceptVO vo) {
		logger.info("vo>>>>>>>>>", vo.getRsvtNo());
		int res = reservationservice.waiting(vo.getPntCd());
		res += reservationservice.insertRecept(vo);
		res += reservationservice.rsvcheck(vo);
		return res;
	}
	
}

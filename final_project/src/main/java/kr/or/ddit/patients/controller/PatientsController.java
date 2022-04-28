package kr.or.ddit.patients.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kr.or.ddit.patients.service.PatientsService;
import kr.or.ddit.patients.vo.PatientsVO;
import kr.or.ddit.reservation.service.ReservationService;
import kr.or.ddit.reservation.vo.ReservationVO;

@Controller
public class PatientsController {
	
	private static final Logger logger = LoggerFactory.getLogger(PatientsController.class);
	
	@Autowired
	PatientsService patientsService;
	
	@Autowired
	ReservationService reservationService;
	
	//환자 목록
	@GetMapping("/patients/patientsList")
	public String patientsList(Model model, @RequestParam(required = false) String keyWord,
			HttpSession session){
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("keyWord", keyWord);
		//logger.info(map.toString());
//		logger.info(keyWord);
		List<PatientsVO> list = this.patientsService.patientsList(keyWord);
//		logger.info(list.toString());
		model.addAttribute("list", list);
		session.setAttribute("excelData", list);
		
		model.addAttribute("keyword", keyWord);
			
		return "patients/patientsHome";
	}
	
	//환자 상세 정보
	@PostMapping("/patients/detail")
	@ResponseBody
	public PatientsVO detail(Model model, @RequestParam String pntCd) {
		
		logger.info("pntCd : " );
		logger.info("pntCd : " + pntCd);
		PatientsVO vo = this.patientsService.detail(pntCd);
		
		logger.info("PatientsVO : " + vo.toString());
		return vo;
	}
	
	//환자 삭제
	@PostMapping("/patients/deletePatients")
	@ResponseBody
	public int deletePatients(Model model, @RequestParam String pntCd) {
		
		logger.info("pntCd : " + pntCd);
		int res = this.patientsService.deletePatients(pntCd);
		
		return res;
	} 
	
	//예약 목록
	@PostMapping("/reservation/reservlist")
	@ResponseBody
	public List<ReservationVO> reservlist(Model model, @RequestParam String pntCd) {
		
		List<ReservationVO> rslist = this.reservationService.reservlist(pntCd);
		logger.info("rslist" + rslist.toString());

		return rslist;
	}
	
	//진료내역 출력
	@PostMapping("/patients/treatlist")
	@ResponseBody
	public List<PatientsVO> treatlist(Model model, @RequestParam String pntCd){
		List<PatientsVO> treatList = this.patientsService.treatlist(pntCd);
		
		return treatList;
	}
	
	//바이탈사인 리스트
	@PostMapping("/patients/vslist")
	public String vslist(Model model, @RequestParam String pntCd) {
		
		List<PatientsVO> vslist = this.patientsService.vslist(pntCd);
		logger.info("vslist" + vslist.toString());
		model.addAttribute("vslist", vslist);
		return "patients/vital";
	}
	
	//바이탈 등록
	@PostMapping("/patients/insertVital")
	public String insertVital(Model model, @ModelAttribute("patientsVo")PatientsVO patientsVo) {
		logger.info("invital PatientsVO : "+ patientsVo);
		int result = patientsService.insertVital(patientsVo);
		
		if(result > 0) {//고객등록 성공
			// 목록으로 돌아오기
			return "redirect:patientsList";
		}else {
			return "patients/insertPage";
		}
	}
	
	//바이탈 삭제
	@PostMapping("/patients/deleteVital")
	@ResponseBody
	public int deleteVital(Model model, @RequestBody List<Map<String, String>> list) {
		int dresult = 0;
		logger.info(list.toString());
		for(Map<String, String> map : list) {
			logger.info(map.toString());
			dresult += this.patientsService.deleteVital(map);
		}
		return dresult;
	}
	
	//환자 등록 페이지로 이동 
	@GetMapping("/patients/insertPage")
	public String insertPage(Model model,  @ModelAttribute("patientsVo")PatientsVO patientsVo) {
		return	"patients/insertPage";
	}
	
	//환자 등록
	@PostMapping("/patients/patientsInsert")
	public String insertPatients(Model model, @ModelAttribute("patientsVo")PatientsVO patientsVo) {
		logger.info("insert vo :" + patientsVo.toString());
		
		int insertResult = patientsService.insertPatients(patientsVo);
		
		if(insertResult > 0) {//고객등록 성공
			// 목록으로 돌아오기
			return "redirect:patientsList";
		}else {
			return "patients/insertPage";
		}
		
	}
	
	//환자 수정 
	@PostMapping("/patients/updateInfo")
	public String updateInfo(Model model, @ModelAttribute("patientsVo")PatientsVO patientsVo) {
		logger.info("edite PatientsVO : "+ patientsVo);
		
		int updateresult = patientsService.updateInfo(patientsVo);
		if(updateresult>0) {//수정 성공
			return "redirect:patientsList";
		}else {//수정 실패 
			return "redirect:patientsList";
		}
	}


}

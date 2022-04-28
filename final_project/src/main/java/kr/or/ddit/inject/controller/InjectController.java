package kr.or.ddit.inject.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.util.ArticlePageSoobo;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.inject.service.InjectService;
import kr.or.ddit.inject.vo.InjectVO;
import kr.or.ddit.operation.vo.PatientVO;
import kr.or.ddit.utils.UserUtil;

/**
 * @FileName : InjectController.java
 * @Project : final_project
 * @Date : 2022. 4. 12.
 * @작성자 : LSW
 * @변경이력 :
 * @프로그램 설명 : 투약 컨트롤러
 */
@Controller
@RequestMapping("/inject")
public class InjectController {

	private static final Logger log = LoggerFactory.getLogger(InjectController.class);

	@Autowired
	InjectService injectService;
	
	@GetMapping("/home")
	public String injectMain(Model model,
			@RequestParam (required = false) String keyword){
		List<PatientVO> vo =  injectService.selectPatient(keyword);
		Gson gson = new GsonBuilder().create();
		model.addAttribute("patientVO", gson.toJson(vo));
		
		return "inject/home";
	}
	
	// 환자 검색
	@GetMapping("/searchPatient")
	@ResponseBody
	public List<PatientVO> searchPatient(Model model,
			@RequestParam (required = false) String keyword) {
			List<PatientVO> vo =  injectService.selectPatient(keyword);
		return vo;
	}
	
	// 환자 투약 내역 조회
	@GetMapping("/injectDetail")
	@ResponseBody
	public String injectDetail(Model model,
			@RequestParam (required = false) String pntCd,
			@RequestParam (required = false) String injCd,
			@RequestParam (required = false) String startDate,
			@RequestParam (required = false) String endDate,
			@RequestParam (required = false) Map<String, String> date) {
			
			Map<String, String> map = new HashMap<String, String>();
			if(pntCd != null) {
				map.put("pntCd", pntCd);
			}
			if(injCd != null) {
				map.put("injCd", injCd);
			}
			if(startDate != null) {
				String sDate = startDate;
				map.put("sDate", sDate);
			}
			if(endDate != null) {
				String eDate = endDate;
				map.put("eDate", eDate);
			}
			if(date.get("sDate") != null) {
				String sDate = date.get("sDate");
				map.put("sDate", sDate);
			}
			if(date.get("eDate") != null) {
				String eDate = date.get("eDate");
				map.put("eDate", eDate);
			}
			List<InjectVO> vo =  injectService.injectDetail(map);
			Gson gson = new GsonBuilder().create();
		return gson.toJson(vo);
	}
	
}
package kr.or.ddit.stats.controller;

import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.sec.service.impl.SecService;
import kr.or.ddit.sec.vo.SecVO;
import kr.or.ddit.stats.service.impl.StatsService;
import kr.or.ddit.stats.vo.StatsVO;

/**
 * @FileName : StatsController.java
 * @Project : final_project
 * @Date : 2022. 3. 31.
 * @작성자 : LSW
 * @변경이력 :
 * @프로그램 설명 : 통계 컨트롤러
 */
@Controller
@RequestMapping("/stats")
public class StatsController {

	private static final Logger log = LoggerFactory.getLogger(StatsController.class);

	@Autowired
	StatsService statsService;
	@Autowired
	EmpService empService;
	

	/**
	 * @param 
	 * @return List<statsVO>
	 * 통계 홈화면 출력
	 */
	
	@GetMapping("/home")
	public String statsMain(Model model,@RequestParam(required = false) String selectDate){
		StatsVO statsVO = statsService.selectWeekPnt();
		statsVO.setTodayAmount(statsService.todayAmount());
		statsVO.setPntCnt(statsService.todayPatient());
		
		StatsVO todaydeptVO = statsService.todayDeptPatient();
		
//		log.debug("vo : {}", vo);
		String[] week = new String[6];
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Calendar day = Calendar.getInstance();
		day.add(Calendar.DATE, 0);
    	String today = df.format(day.getTime());
    	if(selectDate == null) {
    		selectDate = today.replaceAll("-", "").substring(0, 6); 	
    	}
    	StatsVO monthVO = statsService.selectMonthPnt(selectDate);
	    for(int i = 0; i < 6; i++) {
	    	day.add(Calendar.DATE, -1);
	    	week[i] = df.format(day.getTime());
	    }
	    Gson gson = new GsonBuilder().create();
		String data = gson.toJson(week);
		
		List<Map<String,String>> yearMap = statsService.selectYearPnt();
		String yearData = gson.toJson(yearMap);
		
	    model.addAttribute("statsVO", statsVO);
	    model.addAttribute("monthVO", monthVO);
	    model.addAttribute("today", today);
	    model.addAttribute("week", data);
	    model.addAttribute("yearMap", yearData);
	    model.addAttribute("todaydeptVO", todaydeptVO);
	    
		return "stats/home";
	}
	
	// 월별 환자 수 컨트롤러
	@GetMapping("/month")
	@ResponseBody
	public StatsVO selectMonth(Model model,@RequestParam(required = false) String selectDate){
		StatsVO statsVO = statsService.selectMonthPnt(selectDate);
		return statsVO;
	}
	
	// 년별 환자 수 컨트롤러
	@GetMapping("/year")
	@ResponseBody
	public Map<String, String> selectYear(Model model,@RequestParam(required = false) String selectYear){
		List<Map<String, String>> yearList = statsService.selectYear(selectYear);
		return yearList.get(0);
	}
		
	// 부서별 매출액 컨트롤러
		@GetMapping("/deptAmount")
		@ResponseBody
		public String deptAmount(@RequestParam(required = false) Map<String, String> selectDate){
			if(selectDate.size() < 2) {
				SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
				Calendar day = Calendar.getInstance();
				day.add(Calendar.DATE, 0);
				String today = df.format(day.getTime());
				
				String startDate = today.replaceAll("-", "").substring(0, 8); 
				String endDate = today.replaceAll("-", "").substring(0, 8);
				selectDate.put("startDate", startDate);
				selectDate.put("endDate", endDate);
			}
			
			Map<String, String> map = statsService.deptAmount(selectDate);
			Gson gson = new GsonBuilder().create();
			
		  	String jsonData = gson.toJson(map);
			return jsonData;
		}
		
	// 주간 매출액 컨트롤러
		@GetMapping("/weekAmount")
		@ResponseBody
		public StatsVO weekAmount(){
			StatsVO statsVO = statsService.selectWeekAmount();
			return statsVO;
		}
		
		// 월간 매출액 컨트롤러
		@GetMapping("/monthAmount")
		@ResponseBody
		public StatsVO monthAmount(Model model,@RequestParam(required = false) String selectDate){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar day = Calendar.getInstance();
			day.add(Calendar.DATE, 0);
	    	String today = df.format(day.getTime());
	    	if(selectDate == null) {
	    		selectDate = today.replaceAll("-", "").substring(0, 6); 	
	    	}
			StatsVO statsVO = statsService.selectMonthAmount(selectDate);
			return statsVO;
		}
		
		// 년별 매출액 컨트롤러
		@GetMapping("/yearAmount")
		@ResponseBody
		public Map<String, String> yearAmount(Model model,@RequestParam(required = false) String selectYear){
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar day = Calendar.getInstance();
			day.add(Calendar.DATE, 0);
	    	String today = df.format(day.getTime());
	    	if(selectYear == null) {
	    		selectYear = today.replaceAll("-", "").substring(0, 4); 	
	    	}
			List<Map<String, String>> yearList = statsService.selectYearAmount(selectYear);
			return yearList.get(0);
		}
	
		// 최근 매출액 컨트롤러
		@GetMapping("/selectYearSales")
		@ResponseBody
		public String selectYearSales(Model model){
			 Gson gson = new GsonBuilder().create();
				
		  	 List<Map<String,String>> yearMap = statsService.selectYearSales();
		  	 String jsonData = gson.toJson(yearMap);
			 return jsonData;
		}
		
	@GetMapping("/patient")
	public String statsPatient(@RequestParam(required = false) String selectDate, Model model){
		
		StatsVO statsVO = new StatsVO();
		statsVO.setTodayAmount(statsService.todayAmount());
		statsVO.setPntCnt(statsService.todayPatient());
		statsService.selectWeekPnt();
		
		model.addAttribute("statsVO", statsVO);
		
		return "stats/patient";
	}
	
	@ResponseBody
	@GetMapping("/jsonData")
	public String jsonData(@RequestParam Map<String, String> map) {
//		Gson gson = new GsonBuilder().create();
//		String data = gson.toJson()
		String jsonData = "{'cols':[{'id' :'', 'label' : '상품명', 'pattern':'','type':'string'},{'id' :'', 'label' : '금액', 'pattern':'','type':'number'}],'rows':[{'c':[{'v':'딸기'},{'v':88000}]},{'c':[{'v':'레몬'},{'v':16500}]},{'c':[{'v':'포도'},{'v':15000}]}]}";
		JsonObject json = new JsonParser().parse(jsonData).getAsJsonObject();
		return json.toString();
	}
	
	//기간별 환자 수 컨트롤러
	@ResponseBody
	@GetMapping("/selectDatePatient")
	public String selectDatePatient(
			@RequestParam(required = false) Map<String, String> selectDate, Model model) {
		if(selectDate.size() < 2) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar day = Calendar.getInstance();
			day.add(Calendar.DATE, 0);
			String today = df.format(day.getTime());
			
			String startDate = today.replaceAll("-", "").substring(0, 8); 
			String endDate = today.replaceAll("-", "").substring(0, 8);
			selectDate.put("startDate", startDate);
			selectDate.put("endDate", endDate);
		}
		
		Map<String, String> map = statsService.selectDatePatient(selectDate);
		Gson gson = new GsonBuilder().create();
		
	  	String jsonData = gson.toJson(map);
		return jsonData;
	}
	
	//과별 의사 조회
	@ResponseBody
	@GetMapping("/selectSec")
	public List<EmpVO> selectSec(
			@RequestParam(required = false) String secCd, Model model) {
			EmpVO vo = new EmpVO();
			vo.setSecCd(secCd);
		
			List<EmpVO> empVO = empService.mySecEmpInfo(vo);
			
			return empVO;
	}	
	//의사 기간별 매출액 조회
	@ResponseBody
	@GetMapping("/selectDoctorSales")
	public String selectDiseaseRank(
			@RequestParam(required = false) Map<String, String> selectDate, Model model) {
			
			Map<String, String> map = statsService.selectDoctorSales(selectDate);
			
			Gson gson = new GsonBuilder().create();
			
		  	String jsonData = gson.toJson(map);
			
		return jsonData;
	}
	
	//기간별 질병
	@ResponseBody
	@GetMapping("/selectDiseaseRank")
	public String selectDiseaseRank(
			@RequestParam(required = false) String selectRank
			,@RequestParam(required = false) Map<String, String> selectDate, Model model) {
    	
		if(selectDate.size() < 2) {
			SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Calendar day = Calendar.getInstance();
			day.add(Calendar.DATE, 0);
			String today = df.format(day.getTime());
			day.add(Calendar.DAY_OF_MONTH, -8);
			String weekAgo = df.format(day.getTime());
			
			String startDate = weekAgo.replaceAll("-", "").substring(0, 8); 
			String endDate = today.replaceAll("-", "").substring(0, 8);
			selectDate.put("startDate", startDate);
			selectDate.put("endDate", endDate);
		}
		if(selectRank == null) {
			selectRank = "5";
			selectDate.put("selectRank", selectRank);
		}
		
		List<Map<String, String>> diseaseList = statsService.selectDiseaseRank(selectDate);
		
		Gson gson = new GsonBuilder().create();
		
	  	String jsonData = gson.toJson(diseaseList);
		
		return jsonData;
	}
	
		
}	
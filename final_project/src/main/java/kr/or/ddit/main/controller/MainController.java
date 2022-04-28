package kr.or.ddit.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.main.service.MainService;
import kr.or.ddit.main.vo.SearchDataVO;
import kr.or.ddit.reservation.service.ReservationService;
import kr.or.ddit.reservation.vo.ReservationVO;

@Controller
public class MainController {

	private static final Logger log = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	EmpService empService;
	
	@Autowired
	MainService mainService;
	
	@Autowired
	ReservationService reservationService;

	@GetMapping("/")
	public String home(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.FULL);
		String formattedDate = dateFormat.format(date);
		model.addAttribute("serverTime", formattedDate);

		return "main/home";
	}
	
	@PostMapping("/main/secEmpList")
	public String secEmpList(@RequestParam Map<String, String> map, Model model) {
//		log.info(map.toString());
		EmpVO empVO = new EmpVO();
		empVO.setEmpCd(map.get("empCd"));
		empVO.setSecCd(map.get("secCd"));
		
		model.addAttribute("secEmpList", empService.mySecEmpInfo(empVO));
		return "main/secEmpList";
	}
	
	//produces="text/plain;charset=UTF-8"
	@RequestMapping(value = "/main/searchData", method = RequestMethod.GET)
	@ResponseBody
	public List<SearchDataVO> searchData(@RequestParam String data) {	
		List<SearchDataVO> list = mainService.searchEpr(data);
		return list;
	}
	
	@ResponseBody
	@GetMapping("/checkSession")
	public boolean checkSession(HttpSession session) {
		if(session.getAttribute("loginId") == null) {
			log.info("asdasdasdsad");
			return false;
		}else if(session.getAttribute("loginId").equals("")) {
			log.info("!!!!!!!!!!!!");
			return false;
		}
		log.info((String) session.getAttribute("loginId"));
		return true;
	}
	
	@PostMapping("/rsvToday")
	public String rsvToday(Model model,String empCd) {
		List<ReservationVO> list = reservationService.rsvToday(empCd);
		model.addAttribute("list", list);
		return "main/rsvToday";
	}

}

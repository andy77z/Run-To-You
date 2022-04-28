package kr.or.ddit.receive.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.ent.util.ArticlePage;
import kr.or.ddit.receive.service.ReceiveService;
import kr.or.ddit.receive.vo.ReceiveVO;

@RequestMapping("/receive")
@Controller
public class ReceiveController {
	
	@Autowired
	ReceiveService rcService;
	
	@GetMapping("/receiveHome")
	private String receiveHome(Model model, @RequestParam(required = false) String keyword,
											@RequestParam(defaultValue = "1") int currentPage, 
											@RequestParam(required = false, defaultValue = "8") int size,
											@RequestParam(defaultValue = "0") int color) {
		
		try {
		    int start = currentPage * size - (size - 1);
		    int end = currentPage * size;
		    
		    Map<String, Object> map = new HashMap<String, Object>();
		    map.put("start", start);
		    map.put("end", end);
		    map.put("keyword", keyword);
		    
		    List<ReceiveVO> list = rcService.getReceivePatient(map);
		    int cnt = rcService.getReceivePatientCount(keyword);
			
		    model.addAttribute("color" , color);
		    model.addAttribute("list", list);
		    model.addAttribute("page", new ArticlePage(cnt, currentPage, size, 5));
		} catch (Exception e) {
			e.printStackTrace();
			return "accessError";
		}
		return "receive/receiveHome";
	}

	@GetMapping("/receiveMemoryHome")
	private String receiveMemoryHome(Model model, @RequestParam(required = false) String keyword,
												  @RequestParam(defaultValue = "1") int currentPage, 
												  @RequestParam(required = false, defaultValue = "8") int size,
												  @RequestParam(defaultValue = "0") int color) {
		
		try {
			int start = currentPage * size - (size - 1);
			int end = currentPage * size;
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("start", start);
			map.put("end", end);
			map.put("keyword", keyword);
			
			List<ReceiveVO> list = rcService.getReceiveCommitPatient(map);
			int cnt = rcService.getReceiveCommitPatientCount(keyword);
			
			model.addAttribute("color" , color);
			model.addAttribute("list", list);
			model.addAttribute("page", new ArticlePage(cnt, currentPage, size, 5));
		} catch (Exception e) {
			e.printStackTrace();
			return "accessError";
		}
		return "receive/receiveMemoryHome";
	}
	
	@GetMapping("/receiveing")
	private String receiveing(@RequestParam String pntCd, Model model) {
		ReceiveVO vo;
		try {
			vo = rcService.getPatientRCV(pntCd);
		} catch (Exception e) {
			vo = null;
			e.printStackTrace();
			return "accessError";
		}
		model.addAttribute("vo1", vo);
		return "receive/notiles/receiveing";
	}
	
	@PostMapping("/getDigRCV")
	@ResponseBody
	private List<ReceiveVO> getDigRCV(@RequestParam String treatCd){
		List<ReceiveVO> vo = new ArrayList<>();
		
		try {
			vo = rcService.getDigRCV(treatCd);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return vo;
	}
	@PostMapping("/getInjectRCV")
	@ResponseBody
	private List<ReceiveVO> getInjectRCV(@RequestParam String treatCd){
		List<ReceiveVO> vo = new ArrayList<>();
		
		try {
			vo = rcService.getInjectRCV(treatCd);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return vo;
	}
	@PostMapping("/getOperRCV")
	@ResponseBody
	private List<ReceiveVO> getOperRCV(@RequestParam String treatCd){
		List<ReceiveVO> vo = new ArrayList<>();
		
		try {
			vo = rcService.getOperRCV(treatCd);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return vo;
	}
	@PostMapping("/getInspecRCV")
	@ResponseBody
	private List<ReceiveVO> getInspecRCV(@RequestParam String treatCd){
		List<ReceiveVO> vo = new ArrayList<>();
		
		try {
			vo = rcService.getInspecRCV(treatCd);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return vo;
	}
	
	
	@GetMapping("/receiveed")
	private String receiveed(@RequestParam String pntCd) {
		return "receive/notiles/receiveed";
	}
	
	
	@ResponseBody
	@GetMapping("/minusRCV")
	private int minusRCV(@RequestParam Map<String, Object> map) {
		int res = 0;
		
		try {
			res = rcService.minusRCV(map);
		} catch (Exception e) {
			e.printStackTrace();
			res = 0;
			return res;
		}
		return res;
	}
}

package kr.or.ddit.ent.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.drug.vo.DrugVO;
import kr.or.ddit.email.service.EmailService;
import kr.or.ddit.email.vo.EmailVO;
import kr.or.ddit.ent.service.EntService;
import kr.or.ddit.ent.util.ArticlePage;
import kr.or.ddit.ent.vo.EntNotiVO;
import kr.or.ddit.ent.vo.EntVO;
import kr.or.ddit.ent.vo.WardVO;

@RequestMapping("/ent")
@Controller
public class EntController {
	
	private static final Logger logger = LoggerFactory.getLogger(EntController.class);
	
	@Autowired 
	EntService entService;
	
	@Autowired
	EmailService emailService;
	
	// 입원 대기중인 환자 페이지로 가는 ------ 입원 대기중인 환자 정보, 병동의 조직도, 입원 중인 환자의 정보를 가져감    입원에서는 우선 대기중인 환자를 입원 시켜줘야하기 때문에 main으로 잡음
	@GetMapping("/entHome")
	private String entMain(Model model, @RequestParam(required = false) String keyword) throws Exception {
		
		List<EntVO> waitEtVO = entService.entPatientList(keyword); // 입원 대기 중
		int waitPntCnt = entService.entPatientCount();
		model.addAttribute("waitPnt", waitEtVO);
		model.addAttribute("waitPntCnt", waitPntCnt);
		
		int entVOCnt = entService.entWardPntCount(); // 입원 중인 환자 리스트
		model.addAttribute("entVOCnt", entVOCnt);
		
		int entEmp = entService.getNoPagingWorkerCount();  // 병동 근무 직원 수 
		model.addAttribute("entEmpCnt", entEmp);
		
		List<WardVO> wardVOList = entService.getWard(); // 병동 정보  자리 배치도
		model.addAttribute("wardVOList", wardVOList);   // resultMap 을 이용하여 병동1 : 호실N 의 관계로 가져옴

		return "ent/entHome";
	}
	
	@GetMapping("/enting")
	private String enting(Model model, @RequestParam(required = false) String keyword
			,@RequestParam(required = false) String lkCd
			,HttpSession session) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("liskCd", lkCd);
		
		List<EntVO> entVO = entService.entWardPntList(map); // 입원 중
		int entVOCnt = entService.entWardPntCount();
		model.addAttribute("entVO", entVO);
		model.addAttribute("entVOCnt", entVOCnt);
		session.setAttribute("excelData", entVO);
		
		int waitPntCnt = entService.entPatientCount(); // 입원 대기 중
		model.addAttribute("waitPntCnt", waitPntCnt);

		List<WardVO> wardVOList = entService.getWard(); // 병동 정보 자리 배치도 
		model.addAttribute("wardVOList", wardVOList);   // resultMap 을 이용하여 병동1 : 호실N 의 관계로 가져옴
		
		int entEmp = entService.getNoPagingWorkerCount();  // 병동 근무 직원 수 
		model.addAttribute("entEmpCnt", entEmp);
		
		return "ent/enting";
	}

	@GetMapping("/entEmp")
	private String entEmp(Model model,
						  @RequestParam(defaultValue = "1") int currentPage, 
						  @RequestParam(required = false, defaultValue = "8") int size,
						  @RequestParam(required = false) String keyword) throws Exception {

		int entVOCnt = entService.entWardPntCount();
		model.addAttribute("entVOCnt", entVOCnt);

		int waitPntCnt = entService.entPatientCount();
		model.addAttribute("waitPntCnt", waitPntCnt);
		
		int entEmp = entService.getNoPagingWorkerCount();  // 병동 근무 직원 수 
		model.addAttribute("entEmpCnt", entEmp);
		
	    int start = currentPage * size - (size - 1);
	    int end = currentPage * size;

	    Map<String, Object> map = new HashMap<String, Object>();
	    map.put("start", start);
	    map.put("end", end);
	    map.put("keyword", keyword);
		
		List<EntVO> entWorker = entService.getEntWorker(map);
		// 병동 근무 직원 전부를 세는게 아니라 페이징에 필요한 개수만 셈  이유 : 총 개수에 따라 페이징 이되는데 검색을 하게 되면 페이징이 되지 않음 때문에 만들어줌
		int entWorkerCount = entService.getEntWorkerCount(keyword);  
		
	    model.addAttribute("page", new ArticlePage(entWorkerCount, currentPage, size, 5));
	    model.addAttribute("total", entWorkerCount);
		model.addAttribute("entWorker", entWorker);
		
		return "ent/entEmp";
	}
	
	// Modal에 환자 상세 정보를 출력하는 메서드
	@PostMapping("/pntModal")
	@ResponseBody
	private EntVO pntModal(Model model, @RequestParam String pntCd) throws Exception {
		EntVO waitPntDetail = entService.patientDetail(pntCd);
		
		return waitPntDetail;
	}
	
	@PostMapping("/getDiet")
	@ResponseBody
	private List<EntVO> getDietList() throws Exception {
		return entService.getDietList();
	}
	
	@GetMapping("/getRoom")
	@ResponseBody
	private List<EntVO> getRoom(@RequestParam String roomCls)throws Exception {
		List<EntVO> liEntVO = entService.getRoom(roomCls);

		return  liEntVO;
	}
	
	@GetMapping("/saveRoom")
	@ResponseBody
	private int saveRoom(@RequestParam Map<String, Object> map) throws Exception {
		logger.info(map.toString());
		int saveRst = entService.saveRoom(map);
		logger.info("saveRst : " + saveRst);
		
		return saveRst;
	}
	
	// 등록 버튼을 누르면 테두리 있는 애가 선택되어 입원 환자로 상태코드 및 ent테이블에 추가되는 코드	
	@PostMapping("/updateEnt")
	@ResponseBody
	public int uppdateEnt(@RequestParam Map<String, Object> map)throws Exception  {
		logger.info(map.toString());
		int res = entService.updateEnts(map);
		
		return res;
	}
	
	@PostMapping("/getEntDetail")
	@ResponseBody
	private EntVO getEntDetail(@RequestParam String pntCd){
		logger.info("getEntDetail : " + pntCd);
		EntVO entVO = new EntVO();
		EntVO vs = new EntVO();
		
		try {
			entVO = entService.getEntDetail(pntCd);
			vs = entService.getCurrentVital(pntCd);
			
			logger.info("sdfsdf : " + entVO.getEntAmt());
			
			if(vs != null) {
				entVO.setVsBpMax(vs.getVsBpMax());
				entVO.setVsBpMin(vs.getVsBpMin());
				entVO.setVsTmp(vs.getVsTmp());
				entVO.setVsBs(vs.getVsBs());
				entVO.setVsDt(vs.getVsDt());
			}
		} catch (Exception e) {
			e.printStackTrace();
			entVO = null;
		}
		
		return entVO;
	}
	
	@GetMapping("/getCareNote")
	@ResponseBody
	private List<EntVO> getCareNote(@RequestParam String entCd)throws Exception {
		List<EntVO> careNote = entService.getCareNote(entCd);
		return careNote;
	}
	
	@GetMapping("/getVital")
	@ResponseBody
	private List<EntVO> getVital(@RequestParam String pntCd)throws Exception {
		List<EntVO> vital = entService.getVital(pntCd);
		return vital;
	}
	
	@GetMapping("/insertVital")
	@ResponseBody
	private int insertVital(@RequestParam Map<String, Object> entVO)throws Exception  {
		logger.info("entVO" + entVO);
		return entService.insertVital(entVO);
	}

	@GetMapping("/insertCareNote")
	@ResponseBody
	private int insertCareNote(@RequestParam Map<String, Object> entVO)throws Exception  {
		logger.info("entVO" + entVO);
		return entService.insertCareNote(entVO);
	}

	@PostMapping("/getEntEmpDetail")
	@ResponseBody
	private EntVO getEntEmpDetail(@RequestParam String empCd)throws Exception  {
		logger.info("entVO" + empCd);
		return entService.getEntEmpDetail(empCd);
	}
	
	@PostMapping("/leaving")
	@ResponseBody
	private int entLeavingPnt(@RequestParam Map<String, Object> map) {
		int result = 0;
		try {
			result = entService.insertTreatItemAmt(map);
		} catch (Exception e) {
			logger.info("error  :  " + e );
			return 0;
		}
		return result;
	}
	
	@GetMapping("updateLevDt")
	@ResponseBody
	private int updateLevDt(@RequestParam Map<String, Object> map) {
		int result = 0;

		try {
			result = entService.updateLevDt(map);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	@GetMapping("drugList")
	private String getDrugList(Model model, String keyword, String search) {
		List<DrugVO> drugList = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		map.put("keyword", keyword);
		map.put("search", search);
		
		try {
			drugList = entService.getDrugList(map);
		} catch (Exception e) {
			e.printStackTrace();
			return "accessError";
		}
		
		model.addAttribute("list", drugList);
		return "ent/notiles/drugList";
	}
	
	@GetMapping("insertInject")
	@ResponseBody
	private int insertEntInject(@RequestParam Map<String, Object> map) {
		SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmm");

		int result = 0;
		
		try {
			String myDate = (String)map.get("injDt");
			Date date = format.parse(myDate);
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			
			for(int i = 0; i < Integer.parseInt(String.valueOf(map.get("drugRepeat"))); i++) {
				
				if(i == 0) {
					cal.add(Calendar.DATE, 0);
				}else {
					cal.add(Calendar.DATE, 1);
				}
				
				map.put("injDt", format.format(cal.getTime()));
				result += entService.insertEntInject(map);
			}
		} catch (Exception e) {
			logger.info(e.getMessage());
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	@PostMapping("/getDrugSchedule")
	@ResponseBody
	private List<EntVO> getDrugSchedule(String pntCd){
		List<EntVO> list = new ArrayList<>();
		
		try {
			list = entService.getDrugSchedule(pntCd);
			
			for(int i = 0; i < list.size(); i++) {
				String[] dt = list.get(i).getInjDt().split(" ");
				
				list.get(i).setInjDt1(dt[0]);
				list.get(i).setInjDt2(dt[1]);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			list = null;
		}
		return list;
	}
	
	@PostMapping("/getEntLevDt")
	@ResponseBody
	private EntVO getEntLevDt(String pntCd) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		EntVO vo = new EntVO();
		
		try {
			vo = entService.getEntLevDt(pntCd);
			Date date = format.parse(vo.getLevDt());
			
			Calendar cal = Calendar.getInstance();
			cal.setTime(date);
			cal.add(Calendar.DATE, 1);
			
			vo.setLevDt(format.format(cal.getTime()));
		} catch (Exception e) {
			e.printStackTrace();
			vo = null;
		}
		return vo;
	}
	
	@PostMapping("/deleteInjection")
	@ResponseBody
	private int deleteInjection(String injCd) {
		int result = 0;
		try {
			result = entService.deleteInjection(injCd);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	@GetMapping("/updateInject")
	private String updateInject(Model model ,@RequestParam String injCd, @RequestParam String admst
											,@RequestParam String entDt, @RequestParam String levDt) {
		EntVO entVO = new EntVO();
		Map<String, Object> map = new HashMap<>();
		
		try {
			entVO = entService.getOneInjection(injCd);
			model.addAttribute("entVO", entVO);
			
			map.put("keyword", admst);
			List<DrugVO> dgVO = entService.getDrugList(map);
			model.addAttribute("drug", dgVO);
		} catch (Exception e) {
			e.printStackTrace();
			return "accessError";
		}
		return "ent/notiles/updateInject";
	}
	
	@GetMapping("/updateInjection")
	@ResponseBody
	private int updateInjection(@RequestParam Map<String, Object> map) {
		int result = 0;
		try {
			result = entService.updateInjection(map);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return result;
	}
	
	
	@PostMapping("/getNotiCount")
	@ResponseBody
	private int getNotiCount(@RequestParam String empCd) {
		
		int res = 0;
		
		try {
			res = entService.getNotiCount(empCd);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return res;
	}

	@PostMapping("/getNotiContent")
	@ResponseBody
	private List<EntNotiVO> getNotiContent(@RequestParam String empCd) {
		
		List<EntNotiVO> noti = new ArrayList<>();
		
		try {
			 noti = entService.getNotiContent(empCd);
		} catch (Exception e) {
			e.printStackTrace();
			noti = null;
		}
		
		return noti;
	}
	
	@GetMapping("/confirmNoti")
	@ResponseBody
	private int confirmNoti(@RequestParam String notNo) {
		
		int res = 0;
		
		try {
			res = entService.confirmNoti(notNo);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return res;
	}
	
	
	@GetMapping("insertDrugNotiContent")
	@ResponseBody
	private int insertDrugNotiContent() {
		int res = 0;
		
		try {
			res = entService.insertDrugNotiContent();
		} catch (Exception e) {
			res = 0;
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	@GetMapping("goEmailForm")
	private String goEmailForm() {
		return "ent/notiles/goEmailForm";
	}
	
	@ResponseBody
	@GetMapping("/sendEmail")
	public boolean findPw(@RequestParam Map<String, String> map) {
		EmailVO vo = new EmailVO();
		vo.setReceiveMail(map.get("email"));
		
			try {
				vo.setSenderName("RunToYou");
				vo.setSenderMail("nny1130@gmail.com");
				vo.setSubject(map.get("title"));
				vo.setMessage(map.get("content"));
				
				emailService.sendMail(vo);
			}catch(Exception e){
				return false;
			}
		
		return true;
	}
	
	@GetMapping("/updateLiskCd")
	@ResponseBody
	private int updateLiskCd(@RequestParam Map<String, Object> map) {
		int res = 0;
		try {
			res = entService.updateLiskCd(map);
		} catch (Exception e) {
			res = 0;
			e.printStackTrace();
		}
		return res;
	}
	
	@GetMapping("/deleteCN")
	@ResponseBody
	private int deleteCN(@RequestParam Map<String, Object> map) {
		int res = 0;
		
		try {
			res = entService.deleteCN(map);
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		return res;
	}
	
}

package kr.or.ddit.sec.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.sec.service.impl.SecService;
import kr.or.ddit.sec.vo.SecVO;

/**
 * @FileName : EmpController.java
 * @Project : final_project
 * @Date : 2022. 3. 17.
 * @작성자 : LSW
 * @변경이력 :
 * @프로그램 설명 : 직원 컨트롤러
 */
@Controller
@RequestMapping("/sec")
public class SecController {

	private static final Logger log = LoggerFactory.getLogger(SecController.class);

	@Autowired
	SecService secService;
	
	/**
	 * @param 
	 * @return List<deptVO>
	 * 직원 부서 목록 출력
	 */
	
	@GetMapping("/home")
	public String secList(Model model){
		
		List<SecVO> list = secService.selectAll(); 
		
		String nextSecCd = "SEC"+secService.nextSecCd();
		
		model.addAttribute("list", list);
		model.addAttribute("nextSecCd", nextSecCd);
		
		return "sec/home";
	}
		
	/**
	 * @param model
	 * @param deptVO
	 * @return int
	 * 부서 등록
	 */
	@ResponseBody
	@PostMapping("/create")
	public int createSec(@Validated @ModelAttribute SecVO secVO,BindingResult result) {

		log.info(" :::: 부서 등록하기 호출 :::: ");
		
 				//검증 오류 발생
				if(result.hasErrors()) {
					
					List<ObjectError> allErrors = result.getAllErrors();
					List<ObjectError> globalErrors = result.getGlobalErrors();
					List<FieldError> fieldErrors = result.getFieldErrors();
					//validation 중에 어떤 오류가 나왔는지 확인..
					for(int i=0;i<allErrors.size();i++) {
						ObjectError objectError = allErrors.get(i);
						log.info("objectError : " + objectError);
					}
					
					for(ObjectError objectError : globalErrors) {
						log.info("objectError : " + objectError);
					}
					
					for(FieldError fieldError : fieldErrors) {
						log.info("fieldError : " + fieldError.getDefaultMessage());
					}
					
					//redirect(X) => 데이터를 보낼 수 없음
					//forwaridng(O)
					return 0;
					}
		
//					int res = secService.create(secVO);
//					log.info("res : "  + res);
					return 0;
			}	
	
	@GetMapping("/nextSec")
	@ResponseBody
	public int nextSec(@RequestParam (required=false)Map<String, String> map, Model model){
		SecVO secVO = new SecVO();
		String deptNm = map.get("deptNm");
		int result = 0;
		for(int i = 0; i < map.size()-1; i++) {
			String secCd = "SEC"+secService.nextSecCd();
			String secNm = map.get("secList["+i+"]");
			secVO.setDeptNm(deptNm);
			secVO.setSecNm(secNm);
			secVO.setSecCd(secCd);
			result = secService.insertSec(secVO);
			log.info("res : " + result);
		}
		return result;
	}
	
	@GetMapping("/addSec")
	@ResponseBody
	public int addSec(@Validated @RequestParam (required = false)Map<String, String>map, Model model) {
		SecVO secVO = new SecVO();
		secVO.setDeptNm(map.get("deptNm"));;
		secVO.setSecNm(map.get("secNm"));
		secVO.setSecCd("SEC"+secService.nextSecCd());
		int result = secService.insertSec(secVO);
		
		return result;
	}
	
	@GetMapping("/searchSec")
	@ResponseBody
	public List<SecVO> searchSec(@RequestParam (required = false)String deptNm, Model model){
		List<SecVO> secVO = secService.searchSec(deptNm);
		return secVO;
	}
	
	@PostMapping("/update")
	@ResponseBody
	public int updateSec(@RequestParam (required = false)Map<String, String> map, Model model){
		// 부서명 변경
		String newDeptNm = map.get("newDeptNm");
		String oldDeptNm = map.get("oldDeptNm");
		
		// 과명 변경
		String oldSecNms = map.get("oldSecNm");
		String newSecNms = map.get("newSecNm");
		
		log.info("!!!!!!!!!!!!!!!!!!!!"+oldSecNms);
		log.info("!!!!!!!!!!!!!!!!!!!!"+newSecNms);
		
		int oldLength = oldSecNms.length();
		String[] oldSecNm = oldSecNms.substring(1, oldLength-1).split(",");
		int newLength = newSecNms.length();
		String[] newSecNm = newSecNms.substring(1, newLength-1).split(",");
		
		
		int secSize = secService.searchSec(oldDeptNm).size();
		
		for(int i = 0; i < secSize; i++) {
			SecVO secVO = new SecVO();
			secVO.setDeptNm(oldDeptNm);
			secVO.setOldSecNm(oldSecNm[i].replaceAll("\"", ""));
			secVO.setNewSecNm(newSecNm[i].replaceAll("\"", ""));
			
			secService.updateSecNm(secVO);
		}
		
		SecVO secVO = new SecVO();
		secVO.setNewDeptNm(newDeptNm);
		secVO.setOldDeptNm(oldDeptNm);
		int result = secService.updateDeptNm(secVO);
		
		return result;
	}
}
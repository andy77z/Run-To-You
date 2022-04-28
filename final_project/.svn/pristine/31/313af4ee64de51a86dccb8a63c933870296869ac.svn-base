package kr.or.ddit.notice.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.notice.service.impl.NoticeServiceImpl;
import kr.or.ddit.notice.vo.NoticeVO;

/**
 * @FileName : NoticeController.java
 * @Project : final_project
 * @Date : 2022. 3. 14.
 * @작성자 : LSW
 * @변경이력 :
 * @프로그램 설명 : 공지사항 컨트롤러
 */
@Controller
@RequestMapping("/notice")
public class NoticeController {

	private static final Logger log = LoggerFactory.getLogger(NoticeController.class);

	@Autowired
	NoticeServiceImpl noticeService;

	@Autowired
	EmpService empService;
	
	/**
	 * @param 
	 * @return List<noticeVO>
	 * 공지사항 전체 목록 출력
	 */
	@GetMapping("/home")
	public String selectAll(Model model,@ModelAttribute NoticeVO noticeVO) {

		log.info(" :::: 공지사항 메인페이지 호출 :::: ");
		List<NoticeVO> list = noticeService.selectAll();
		
		model.addAttribute("list", list);
		log.info("list : " + list);
		// WEB-INF/views/*/*.jsp 패턴으로 정의
		return "notice/home";
	}
	
	
	/**
	 * @param model
	 * @return noticeVO
	 * 공지사항 상세조회
	 */
	@ResponseBody
	@GetMapping("/detail")
	public NoticeVO selectOne(Model model, @RequestParam String ntcNo) {
		
		log.info(" :::: 공지사항 상세보기 호출 :::: ");
		NoticeVO noticeVO = noticeService.selectOne(ntcNo);
		
		model.addAttribute("noticeVO", noticeVO);
		
		noticeVO.setViewFRegDt(noticeVO.viewFirstRegDt());
		noticeVO.setViewLMdfyDt(noticeVO.viewLastMdfyDt());
		
		return noticeVO;
	
	}
	
	
	/**
	 * @param model
	 * @param noticeVO
	 * @return if return 위치 정하기
	 * 공지사항 등록
	 */
	@ResponseBody
	@GetMapping("/create")
	public int createNotice(@Validated @ModelAttribute NoticeVO noticeVO,BindingResult result) {
		log.info("noticeVO : " + noticeVO);
		log.info(" :::: 공지사항 등록하기 호출 :::: ");
		
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
		
					int res = noticeService.create(noticeVO);
					log.info("res : "  + res);
					return res;
		
			}
	
	/**
	 * @param model
	 * @param ntcNo
	 * @return 삭제 성공 시 1
	 * 공지사항 삭제 
	 */
	@ResponseBody
	@GetMapping("/delNotice")
	public int deleteNotice(Model model, @RequestParam String ntcNo) {
		log.info("ntcNo :" + ntcNo);
		log.info(" :::: 공지사항 삭제하기 호출 :::: ");
		
		int result = noticeService.delete(ntcNo);
		
		return result; 
	}
	
	/**
	 * @param noticeVO
	 * @return 수정 성공 시 1
	 * 공지사항 수정
	 */
	@GetMapping("/update")
	@ResponseBody
	public int updateNotice(@RequestParam Map<String, String> noticeVO) {
		log.info("noticeVO :" + noticeVO);
		log.info(" :::: 공지사항 수정하기 호출 :::: ");
		
		int result = noticeService.update(noticeVO);
		
		return result;
	}

}
package kr.or.ddit.security;

import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.codec.digest.Sha2Crypt;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.email.service.EmailService;
import kr.or.ddit.email.vo.EmailVO;
import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.login.service.LoginService;

@Controller
public class CommonController {
	private static final Logger logger = 
			LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	LoginService loginService;
	
	@Autowired
	EmpService empSerivce;
	
	@Inject
    EmailService emailService;
	
	@Inject
	PasswordEncoder passwordEncoder;
	
	//Authentication : 인증(로그인)
	//Authorization  : 인가(접근 제어)
	//리턴타입이 void ->  /accessError에 해당되는 /accessError.jsp를 forwarding해줌
	//접근 거부 처리자가 보낸 요청과 메소드를 매핑
	//<security:access-denied-handler error-page="/accessError" />
	@RequestMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		logger.info("access Denied : " + auth);
		
		model.addAttribute("msg", "Access Denied");
		
//		return "accessError";
	}
	
	@ResponseBody
	@GetMapping("/first")
	public boolean FirstLogin(@RequestParam Map<String, String> map) {
//		map.put("password", Sha2Crypt.sha256Crypt(map.get("password").getBytes(), "$5$" + map.get("username")));
//		map.put("password", passwordEncoder.encode(map.get("password")));
		logger.info(passwordEncoder.encode(map.get("password")));
		int result = loginService.firstLogin(map);
		if(result > 0) {
			return true;
		}
		
		return false;
	}
	
	@ResponseBody
	@GetMapping("/findPw")
	public boolean findPw(@RequestParam Map<String, String> map) {
		EmailVO vo = new EmailVO();
		vo.setReceiveMail(map.get("email"));
		
		int result = loginService.findPw(map);
		if(result > 0) {
			try {
				UUID uuid = UUID.randomUUID();
				map.put("pwUuid", uuid.toString());
				result = loginService.setPwUuid(map);
				if(result > 0) {
					vo.setSenderName("RunToYou");
					vo.setSenderMail("nny1130@gmail.com");
					vo.setSubject("Run To You == 비밀번호 재설정");
					vo.setMessage("아래의 URL을 클릭하여 비밀번호를 재설정 하세요.\n"
							+ "http://localhost/settingPw/" + map.get("empCd") + "/" + uuid.toString());
					emailService.sendMail(vo);
				}
				
			}catch(Exception e){
				return false;
			}
		}
		
		return true;
	}
	
	@GetMapping("/settingPw/{empCd}/{uuid}")
	public String settingPw(@PathVariable("empCd") String empCd
				,Model model
				,@PathVariable("uuid") String uuid) {
		String pwUuid = loginService.getPwUuid(empCd);
		if(uuid.equals(pwUuid)) {
			model.addAttribute("empCd", empCd);
			model.addAttribute("uuid", uuid);
			model.addAttribute("match", true);
		}else {
			model.addAttribute("match", false);
		}
		return "login/settingPw";
	}
	
	@PostMapping("/settingPwDone")
	public String settingPwDone(@RequestParam Map<String, String> map,Model model) {
		EmpVO empVO = new EmpVO();
		empVO.setEmpCd(map.get("empCd"));
//		empVO.setEmpPw(Sha2Crypt.sha256Crypt(map.get("empPw").getBytes(), "$5$" + map.get("empCd")));
//		empVO.setEmpPw(passwordEncoder.encode(map.get("empPw")));
		empVO.setEmpPw(map.get("empPw"));
		int result = empSerivce.pwModify(empVO);
		if(result > 0) {
			return "login/settingPwDone";
		}else {
			model.addAttribute("match", false);
			return "login/settingPw/0/0";
		}
	}
	
	@ResponseBody
	@GetMapping("/first/infoReg")
	public boolean infoReg(@RequestParam Map<String, String> map) {
//		map.put("empPw", passwordEncoder.encode(map.get("empPw")));
//		map.put("empPw", Sha2Crypt.sha256Crypt(map.get("empPw").getBytes(), "$5$" + map.get("empCd")));
		int result = loginService.infoReg(map);
		if(result > 0) {
			result = loginService.addAuth(map.get("empCd"));
			if(result > 0) {
				return true;
			}
		}
		return false;
	}
	
	
}









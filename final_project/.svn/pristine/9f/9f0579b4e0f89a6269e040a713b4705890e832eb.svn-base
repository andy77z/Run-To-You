package kr.or.ddit.profile.controller;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.login.mapper.LoginMapper;
import kr.or.ddit.security.CustomUser;
import kr.or.ddit.utils.UserUtil;

@Controller
@RequestMapping("/profile")
public class ProfileController {
	private static final Logger logger = 
			LoggerFactory.getLogger(ProfileController.class);
	
	@Autowired
	LoginMapper loginMapper;
	
	@Autowired
	EmpService empService;
	
	@Inject
	PasswordEncoder passwordEncoder;
	
	@GetMapping("/{empCd}")
	public String profile(@PathVariable("empCd") String empCd,Model model) {
		EmpVO empVO = empService.selectOne(empCd);
		model.addAttribute("empVO", empVO);
		
		return "profile/profile";
	}
	
	@PostMapping("/basicModify")
	public String basicModify(EmpVO empVO) {
		if(empVO.getUploadFile().getSize() > 0) {
			MultipartFile uploadFile = empVO.getUploadFile();
			
			String uploadFolder = "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\final_project\\src\\main\\webapp\\resources\\upload\\empPic\\";
			
			File uploadPath = new File(uploadFolder, UserUtil.getFolder());
			
			if(!uploadPath.exists()) { // 해당 경로가 없으면
				uploadPath.mkdirs();
			}
			
			UUID uuid = UUID.randomUUID();
			String uploadFileName = uuid.toString() + "_" + uploadFile.getOriginalFilename();
			empVO.setEmpPic("/resources/upload/empPic/" + UserUtil.getFolder() + "/" + uploadFileName);
			
			File saveFile = new File(uploadPath,uploadFileName);
			
			try {
				uploadFile.transferTo(saveFile);
			}catch(Exception e) {
				logger.info(e.getMessage());
			}
		}
		
		int result = empService.basicModify(empVO);
		if(result > 0) {
			return "redirect:/profile/" + empVO.getEmpCd();
		}
		return "profile/profile?" + empVO.getEmpCd();
	}
	
	@PostMapping("/pwModify")
	public String pwModify(@RequestParam Map<String, String> map) {
		logger.info(map.toString());
		EmpVO empVO = new EmpVO();
		empVO.setEmpCd(map.get("empCdPw"));
//		map.put("empPw", passwordEncoder.encode(map.get("empPw")));
		empVO.setEmpPw(passwordEncoder.encode(map.get("pw1")));
		
		int result = empService.pwModify(empVO);
		if(result > 0) {
			return "redirect:/profile/" + empVO.getEmpCd();
		}
		return "profile/profile?" + empVO.getEmpCd();
	}
	
	@ResponseBody
	@PostMapping("/pwMatches")
	public boolean pwMatches(@RequestParam Map<String, String> map) {
		EmpVO empVO = empService.selectOne(map.get("empCd"));
		return passwordEncoder.matches(map.get("empPw"), empVO.getEmpPw());
	}
	
}

package kr.or.ddit.notification.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.notification.service.NotificationService;
import kr.or.ddit.notification.vo.NotificationVO;

@RequestMapping("/notification")
@Controller
public class NotificationController {
	private static final Logger logger = 
			LoggerFactory.getLogger(NotificationController.class);
	
	@Autowired
	NotificationService notificationService;
	
	@ResponseBody
	@PostMapping("/toast")
	public List<NotificationVO> checkNotification(Model model,@RequestParam String empCd) {
		List<NotificationVO> list = this.getNotDt(notificationService.checkNotification(empCd));
		logger.info(list.toString());
		notificationService.updateNotYn();
		return list;
	}
	
	@PostMapping("/list")
	public String printNotification(Model model,@RequestParam String empCd) {
		List<NotificationVO> notificationVO = this.getNotDt(notificationService.printNotification(empCd));
		model.addAttribute("notificationVO", notificationVO);
		logger.info(notificationVO.toString());
		return "notification/list";
	}
	
	@ResponseBody
	@PostMapping("/click")
	public boolean clickNotification(Model model,@RequestParam int notNo) {
		notificationService.updateChkYn(notNo);
		return true;
	}
	
	@ResponseBody
	@PostMapping("/allRead")
	public boolean allRead(String empCd) {
		int result = notificationService.allRead(empCd);
		if(result > 0) {
			return true;
		}
		return false;
	}
	
	private List<NotificationVO> getNotDt(List<NotificationVO> list){
		for(NotificationVO vo : list) {
			int time = Integer.parseInt(vo.getNotDt());
			String hms = "초 전";
			if(time >= 60){
				time = time / 60;
				hms = "분 전";
				if(time >= 60){
					time = time / 60;
					hms = "시간 전";
					if(time >= 24){
						time = time / 24;
						hms = "일 전";
					}
				}
			}
			vo.setNotDt(time + hms);
		}
		return list;
	}
}

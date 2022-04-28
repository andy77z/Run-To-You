package kr.or.ddit.schedule.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.schedule.service.ScheduleService;
import kr.or.ddit.schedule.vo.ScheduleVO;

@RequestMapping("/schedule")
@Controller
public class ScheduleController {

	private static final Logger logger = 
			LoggerFactory.getLogger(ScheduleController.class);
	
	@Autowired
	ScheduleService scheduleService;
	
	@GetMapping("/main")
	public String main() {
		
		return "schedule/main";
	}
	
	@ResponseBody
	@PostMapping("/insertSchedule")
	public int insertSchedule(ScheduleVO scheduleVO) {
		int result = scheduleService.insertSchedule(scheduleVO);
		
		return result;
	}
	
	@ResponseBody
	@PostMapping("/viewSchedule")
	public List<ScheduleVO> viewSchedule(String empCd) {
		List<ScheduleVO> list = scheduleService.viewSchedule(empCd);
		return list;
	}
	
	@ResponseBody
	@PostMapping("/modifySchedule")
	public int modifySchedule(ScheduleVO scheduleVO) {
		int result = scheduleService.modifySchedule(scheduleVO);
		return result;
	}
	
	@ResponseBody
	@PostMapping("/deleteSchedule")
	public int deleteSchedule(ScheduleVO scheduleVO) {
		int result = scheduleService.deleteSchedule(scheduleVO);
		return result;
	}
	
}

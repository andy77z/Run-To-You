package kr.or.ddit.schedule.service;

import java.util.List;

import kr.or.ddit.schedule.vo.ScheduleVO;

public interface ScheduleService {

	public int insertSchedule(ScheduleVO vo);
	
	public List<ScheduleVO> viewSchedule(String empCd);
	
	public int modifySchedule(ScheduleVO vo);
	
	public int deleteSchedule(ScheduleVO vo);
}

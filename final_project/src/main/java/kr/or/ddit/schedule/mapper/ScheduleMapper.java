package kr.or.ddit.schedule.mapper;

import java.util.List;

import kr.or.ddit.schedule.vo.ScheduleVO;

public interface ScheduleMapper {

	public int insertSchedule(ScheduleVO vo);
	
	public List<ScheduleVO> viewSchedule(String empCd);
	
	public int modifySchedule(ScheduleVO vo);
	
	public int deleteSchedule(ScheduleVO vo);
}

package kr.or.ddit.schedule.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.schedule.mapper.ScheduleMapper;
import kr.or.ddit.schedule.service.ScheduleService;
import kr.or.ddit.schedule.vo.ScheduleVO;

@Service
public class ScheduleServiceImpl implements ScheduleService{

	@Autowired
	ScheduleMapper scheduleMapper;
	
	@Override
	public int insertSchedule(ScheduleVO vo) {
		return scheduleMapper.insertSchedule(vo);
	}

	@Override
	public List<ScheduleVO> viewSchedule(String empCd) {
		return scheduleMapper.viewSchedule(empCd);
	}

	@Override
	public int modifySchedule(ScheduleVO vo) {
		return scheduleMapper.modifySchedule(vo);
	}

	@Override
	public int deleteSchedule(ScheduleVO vo) {
		return scheduleMapper.deleteSchedule(vo);
	}


}

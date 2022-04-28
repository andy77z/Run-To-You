package kr.or.ddit.main.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.main.mapper.MainMapper;
import kr.or.ddit.main.service.MainService;
import kr.or.ddit.main.vo.SearchDataVO;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	MainMapper mainMapper;
	
	@Override
	public List<SearchDataVO> searchEpr(String data) {
		return mainMapper.searchEpr(data);
	}

}

package kr.or.ddit.main.service;

import java.util.List;

import kr.or.ddit.main.vo.SearchDataVO;

public interface MainService {
	public List<SearchDataVO> searchEpr(String data);
}

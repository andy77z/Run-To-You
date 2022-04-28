package kr.or.ddit.webcam.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.webcam.mapper.SnapImgMapper;
import kr.or.ddit.webcam.service.SnapImgService;
import kr.or.ddit.webcam.vo.SnapImgVO;

@Service
public class SnapImgServiceImpl implements SnapImgService {
	
	@Autowired
	SnapImgMapper snapImgMapper;
	
	@Override
	public int insertSnapImg(SnapImgVO vo) {
		return snapImgMapper.insertSnapImg(vo);
	}

	@Override
	public List<SnapImgVO> snapLog(Map<String, String> map) {
		return snapImgMapper.snapLog(map);
	}

}

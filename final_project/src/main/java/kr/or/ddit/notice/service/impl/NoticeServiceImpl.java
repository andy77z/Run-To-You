package kr.or.ddit.notice.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.notice.mapper.NoticeMapper;
import kr.or.ddit.notice.service.NoticeService;
import kr.or.ddit.notice.vo.NoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	NoticeMapper noticeMapper;
	
	// 전체 공지사항 조회
	@Override
	public List<NoticeVO> selectAll() {
		return noticeMapper.selectAll();
	}
	
	// 공지사항 상세조회
	@Override
	public NoticeVO selectOne(String ntcNo) {
		
		int result = noticeMapper.increaseHits(ntcNo);
		
		if(result > 0) {
			return noticeMapper.selectOne(ntcNo);
		}
		return null;
	}

	// 공지사항 조회수 증가
	@Override
	public int increaseHits(String ntcNo) {
		return noticeMapper.increaseHits(ntcNo);
	}

	// 공지사항 등록
	@Override
	public int create(NoticeVO noticeVO) {
		return noticeMapper.create(noticeVO);
	}

	// 공지사항 삭제
	@Override
	public int delete(String ntcNo) {
		return noticeMapper.delete(ntcNo);
	}

	//공지사항 수정
	@Override
	public int update(Map<String, String> noticeVO) {
		return noticeMapper.update(noticeVO);
	}
	
	
}

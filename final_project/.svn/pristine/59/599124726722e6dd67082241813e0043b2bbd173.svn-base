package kr.or.ddit.notice.mapper;

import java.util.List;
import java.util.Map;

import kr.or.ddit.notice.vo.NoticeVO;

public interface NoticeMapper {
	
	// 전체 공지사항 조회
	public List<NoticeVO> selectAll();
	
	// 공지사항 상세조회 
	public NoticeVO selectOne(String ntcNo); 
	
	// 공지사항 조회수 증가
	public int increaseHits(String ntcNo);
	
	// 공지사항 등록
	public int create(NoticeVO noticeVO);
	
	// 공지사항 삭제
	public int delete(String ntcNo);
	
	// 공지사항 수정
	public int update(Map<String, String> noticeVO);
}

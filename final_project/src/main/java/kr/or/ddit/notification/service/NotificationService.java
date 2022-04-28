package kr.or.ddit.notification.service;

import java.util.List;

import kr.or.ddit.notification.vo.NotificationVO;

public interface NotificationService {
	public List<NotificationVO> checkNotification(String empCd);
	
	public List<NotificationVO> printNotification(String empCd);
	
	public void updateNotYn();
	
	public void updateChkYn(int notNo);
	
	public int allRead(String empCd);
}

package kr.or.ddit.notification.mapper;

import java.util.List;

import kr.or.ddit.notification.vo.NotificationVO;

public interface NotificationMapper {
	/**
	 * 직원코드로 받은 알림 있나 확인 후 toast
	 * @param empCd
	 * @return 알림VO
	 */
	public List<NotificationVO> checkNotification(String empCd);
	
	/**
	 * 확인 안한 알림 리스트
	 * @param empCd
	 * @return 알림VO
	 */
	public List<NotificationVO> printNotification(String empCd);
	
	public void updateNotYn();
	
	public void updateChkYn(int notNo);
	
	public int allRead(String empCd);
}

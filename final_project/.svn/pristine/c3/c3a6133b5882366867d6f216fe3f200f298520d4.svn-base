package kr.or.ddit.notification.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.ddit.notification.mapper.NotificationMapper;
import kr.or.ddit.notification.service.NotificationService;
import kr.or.ddit.notification.vo.NotificationVO;

@Service
public class NotificationServiceImpl implements NotificationService {
	@Autowired
	NotificationMapper notificationMapper;
	
	@Override
	public List<NotificationVO> checkNotification(String empCd) {
		return notificationMapper.checkNotification(empCd);
	}

	@Override
	public List<NotificationVO> printNotification(String empCd) {
		return notificationMapper.printNotification(empCd);
	}

	@Override
	public void updateNotYn() {
		notificationMapper.updateNotYn();
	}

	@Override
	public void updateChkYn(int notNo) {
		notificationMapper.updateChkYn(notNo);
	}

	@Override
	public int allRead(String empCd) {
		return notificationMapper.allRead(empCd);
	}

}

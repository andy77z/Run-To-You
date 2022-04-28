package kr.or.ddit.email.service;

import kr.or.ddit.email.vo.EmailVO;

public interface EmailService {
	public void sendMail(EmailVO vo);
}

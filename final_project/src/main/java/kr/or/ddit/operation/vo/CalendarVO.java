package kr.or.ddit.operation.vo;

import java.util.Date;

import org.springframework.stereotype.Repository;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@Repository
@Getter
@Setter
@ToString
public class CalendarVO {
	
	//patient
	private String pntCd;
	private String pntNm;
	private String chrDr;
	
	//operation
	private String operCd;
	private String opRoomNo;
	private String operYmd;
	private String operIng;
	private String operBgnTm;
	private String operEndTm;
	
	//EMP
	private String empNm;
	
	//oper_proc
	private String opcNm;
	
}

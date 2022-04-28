package kr.or.ddit.sec.vo;

import java.util.List;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Setter
@Getter
@Data
public class SecVO {
	
	private String deptNm;
	
	private String secCd;
	
	private String secNm;
	
	private int empCnt;
	
	private String newDeptNm;
	
	private String oldDeptNm;
	
	private String oldSecNm;
	
	private String newSecNm;
}

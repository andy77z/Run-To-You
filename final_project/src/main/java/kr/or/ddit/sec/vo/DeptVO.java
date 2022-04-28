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
public class DeptVO {
	
	private String deptNm;
	
	private List<SecVO> secVO;
	
}

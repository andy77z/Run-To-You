package kr.or.ddit.ent.vo;

import java.util.List;

import lombok.Data;

@Data
public class WardVO {
	private int wardCls;
	//1대N의 관계
	private List<RoomVO> roomVO;
}

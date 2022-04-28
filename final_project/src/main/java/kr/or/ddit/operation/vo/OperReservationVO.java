package kr.or.ddit.operation.vo;

import lombok.Data;

@Data
public class OperReservationVO {
	
	//OPERATION_ROOMVO
	private int opRoomNo;
	private String OpRoomState;
	
	//SG_CDVO
	private String sgCd;
	private String sgNm;
	private String sgAmt;
	private String jCls;
	private String zCls;
	private String sgOp1;
	private String sgOp2;
}

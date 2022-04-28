package kr.or.ddit.drug.vo;

import org.springframework.stereotype.Repository;

import lombok.Data;

@Data
@Repository
public class DrugVO {
	
	private String drugCd;
	private String baisCd;
	private String drugNm;
	private String admst;
	private int clsCd;
	private String drugStnd;
	private String drugUnit;
	private int drugAmt;
	private int drugStock;
	
}

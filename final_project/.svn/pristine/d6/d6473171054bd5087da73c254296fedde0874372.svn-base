package kr.or.ddit.receive.vo;

import java.text.DecimalFormat;


import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class ReceiveVO {
	
	private String rcvCd;
	private String empCd;
	private int rcvAmt;
	
	public void setRcvAmt(String rcvAmt) {
		rcvAmt.replaceAll("\\,", "");
		this.rcvAmt = Integer.parseInt(rcvAmt);
	}
	public String getRcvAmt() {
		DecimalFormat df = new DecimalFormat("###,###");
		return String.valueOf(df.format(this.rcvAmt));
	}
	
	private String rcvDt;
	private int nRcvAmt;
	
	private int saveMoney;
	
	public String getSaveMoney() {
		this.setSaveMoney(this.rcvAmt - this.nRcvAmt);
		
		DecimalFormat df = new DecimalFormat("###,###");
		return String.valueOf(df.format(this.saveMoney));
	}
	
	public void setnRcvAmt(String nRcvAmt) {
		nRcvAmt.replaceAll("\\,", "");
		this.nRcvAmt = Integer.parseInt(nRcvAmt);
	}
	public String getnRcvAmt() {
		DecimalFormat df = new DecimalFormat("###,###");
		return String.valueOf(df.format(this.nRcvAmt));
	}
	
	private String treatCd;
	private String itemsCd;
	private int itemsAmt;
	
	public void setItemsAmt(String itemsAmt) {
		itemsAmt.replaceAll("\\,", "");
		this.itemsAmt = Integer.parseInt(itemsAmt);
	}
	public String getItemsAmt() {
		DecimalFormat df = new DecimalFormat("###,###");
		return String.valueOf(df.format(this.itemsAmt));
	}
	
	private String itemsDt;
	
	
	private String pntCd;
	private String pntNm;
	private String pntPrno;
	private String pntSex;
	private String pntAddr;
	private String pntHp;
	private String chrDr;
	private int height;
	private int weight;
	private int smkYn;
	private int drkYn;
	private int prgntYn;
	private String stateCd;
	private String prtcrNm;
	private String prtcrTel;
	private String pntRegDt;
	private int delYn;
	private String enabled;
	private String locCd;
	private int entYn;
	private int entOnedayAmt;
	
	public void setEntOnedayAmt(String entOnedayAmt) {
		entOnedayAmt.replaceAll("\\,", "");
		this.entOnedayAmt = Integer.parseInt(entOnedayAmt);
	}
	public String getEntOnedayAmt() {
		DecimalFormat df = new DecimalFormat("###,###");
		return String.valueOf(df.format(this.entOnedayAmt));
	}
	
	
	private int dietAmt;
	public void setDietAmt(String dietAmt) {
		dietAmt.replaceAll("\\,", "");
		this.dietAmt = Integer.parseInt(dietAmt);
	}
	public String getDietAmt() {
		DecimalFormat df = new DecimalFormat("###,###");
		return String.valueOf(df.format(this.dietAmt));
	}
	
	
	private String secNm;
	private String rcptNo;
	private String treatOp;
	private String treatDt;
	private String dietNm;
	private String entCd;
	private int bedNo;
	private String dietCd;
	private int entAmt;
	private String entDt;
	private String levDt;
	private String liskCd;
	
	private String disCd;
	private String disNm;
	
	private String sgNm;
	private int sgAmt;
	

	public void setSgAmt(String sgAmt) {
		sgAmt.replaceAll("\\,", "");
		this.sgAmt = Integer.parseInt(sgAmt);
	}
	public String getSgAmt() {
		DecimalFormat df = new DecimalFormat("###,###");
		return String.valueOf(df.format(this.sgAmt));
	}
	
	private int injAmt;
	private String drugNm;
	

	public void setInjAmt(String injAmt) {
		injAmt.replaceAll("\\,", "");
		this.injAmt = Integer.parseInt(injAmt);
	}
	public String getInjAmt() {
		DecimalFormat df = new DecimalFormat("###,###");
		return String.valueOf(df.format(this.injAmt));
	}
	
	private String opcNm;
	private int opcAmt;

	public void setOpcAmt(String opcAmt) {
		opcAmt.replaceAll("\\,", "");
		this.opcAmt = Integer.parseInt(opcAmt);
	}
	public String getOpcAmt() {
		DecimalFormat df = new DecimalFormat("###,###");
		return String.valueOf(df.format(this.opcAmt));
	}
	
}

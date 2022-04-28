package kr.or.ddit.excel.service;

import java.util.List;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;

import kr.or.ddit.ent.vo.EntVO;
import kr.or.ddit.patients.vo.PatientsVO;

public interface ExcelService {

	public SXSSFWorkbook makePatientsExcelWorkbook(List<PatientsVO> list,String sheetName);
	
	public SXSSFWorkbook patientsExcelFileDownloadProcess(List<PatientsVO> list,String sheetName);
	
	public SXSSFWorkbook makeEntingExcelWorkbook(List<EntVO> list,String sheetName);
	
	public SXSSFWorkbook entingExcelFileDownloadProcess(List<EntVO> list,String sheetName);
}

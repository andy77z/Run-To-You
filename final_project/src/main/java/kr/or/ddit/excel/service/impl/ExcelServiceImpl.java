package kr.or.ddit.excel.service.impl;

import java.util.List;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.stereotype.Service;

import kr.or.ddit.ent.vo.EntVO;
import kr.or.ddit.excel.service.ExcelService;
import kr.or.ddit.patients.vo.PatientsVO;

@Service
public class ExcelServiceImpl implements ExcelService{

	@Override
	public SXSSFWorkbook makePatientsExcelWorkbook(List<PatientsVO> list,String sheetName) {
		SXSSFWorkbook workbook = new SXSSFWorkbook();
        
        // 시트 생성
        SXSSFSheet sheet = workbook.createSheet(sheetName);
        
        //시트 열 너비 설정
        for(int i = 0; i < list.size(); i++) {
        	sheet.setColumnWidth(0, 3000);
        }
        
        // 헤더 행 생
        Row headerRow = sheet.createRow(0);
        
//      해당 행의 첫번째 열 셀 생성
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("환자 코드");
//      해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("환자 이름");
//      해당 행의 세번째 열 셀 생성
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("성별");
//      해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("주민번호");
//      해당 행의 다섯번째 열 셀 생성
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("환자 연락처");
//      해당 행의 여섯번째 열 셀 생성
        headerCell = headerRow.createCell(5);
        headerCell.setCellValue("주소");
//      해당 행의 일곱번째 열 셀 생성
        headerCell = headerRow.createCell(6);
        headerCell.setCellValue("보호자 이름");
//      해당 행의 여덞번째 열 셀 생성
        headerCell = headerRow.createCell(7);
        headerCell.setCellValue("보호자 연락처");
        
        // 내용 행 및 셀 생성
        Row bodyRow = null;
        Cell bodyCell = null;
        for(int i=0; i<list.size(); i++) {
            PatientsVO vo = list.get(i);
            
            // 행 생성
            bodyRow = sheet.createRow(i+1);
            // 환자 코드 표시
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(vo.getPntCd());
            // 환자 이름 표시
            bodyCell = bodyRow.createCell(1);
            bodyCell.setCellValue(vo.getPntNm());
            // 성별 표시
            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(vo.getPntSex());
            // 주민번호 표시
            bodyCell = bodyRow.createCell(3);
            bodyCell.setCellValue(vo.getPntPrno());
            // 환자연락처 표시
            bodyCell = bodyRow.createCell(4);
            bodyCell.setCellValue(vo.getPntHp());
            // 주소 표시
            bodyCell = bodyRow.createCell(5);
            bodyCell.setCellValue(vo.getPntAddr());
            // 보호자이름 표시
            bodyCell = bodyRow.createCell(6);
            bodyCell.setCellValue(vo.getPrtcrNm());
            // 보호자 연락처 표시
            bodyCell = bodyRow.createCell(7);
            bodyCell.setCellValue(vo.getPrtcrTel());
        }
        
        return workbook;
	}

	@Override
	public SXSSFWorkbook patientsExcelFileDownloadProcess(List<PatientsVO> list,String sheetName) {
		return this.makePatientsExcelWorkbook(list,sheetName);
	}

	@Override
	public SXSSFWorkbook makeEntingExcelWorkbook(List<EntVO> list, String sheetName) {
SXSSFWorkbook workbook = new SXSSFWorkbook();
        
        // 시트 생성
        SXSSFSheet sheet = workbook.createSheet(sheetName);
        
        //시트 열 너비 설정
        for(int i = 0; i < list.size(); i++) {
        	sheet.setColumnWidth(0, 3000);
        }
        
        // 헤더 행 생
        Row headerRow = sheet.createRow(0);
        
//      해당 행의 첫번째 열 셀 생성
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("환자 코드");
//      해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("환자 이름");
//      해당 행의 세번째 열 셀 생성
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("환자 연락처");
//      해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("주민번호");
//      해당 행의 다섯번째 열 셀 생성
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("중증도");
//      해당 행의 여섯번째 열 셀 생성
        headerCell = headerRow.createCell(5);
        headerCell.setCellValue("담당의");
//      해당 행의 일곱번째 열 셀 생성
        headerCell = headerRow.createCell(6);
        headerCell.setCellValue("입원일");
//      해당 행의 여덞번째 열 셀 생성
        headerCell = headerRow.createCell(7);
        headerCell.setCellValue("퇴원일");
        
        headerCell = headerRow.createCell(8);
        headerCell.setCellValue("자리");
        
        // 내용 행 및 셀 생성
        Row bodyRow = null;
        Cell bodyCell = null;
        for(int i=0; i<list.size(); i++) {
            EntVO vo = list.get(i);
            
            // 행 생성
            bodyRow = sheet.createRow(i+1);
            // 환자 코드 표시
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(vo.getPntCd());
            // 환자 이름 표시
            bodyCell = bodyRow.createCell(1);
            bodyCell.setCellValue(vo.getPntNm());
            // 연락처 표시
            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(vo.getPntHp());
            // 주민번호 표시
            bodyCell = bodyRow.createCell(3);
            bodyCell.setCellValue(vo.getPntPrno());
            // 중증도 표시
            bodyCell = bodyRow.createCell(4);
            bodyCell.setCellValue(vo.getLiskCd());
            // 담당의 표시
            bodyCell = bodyRow.createCell(5);
            bodyCell.setCellValue(vo.getChrDr());
            // 입원일 표시
            bodyCell = bodyRow.createCell(6);
            bodyCell.setCellValue(vo.getEntDt());
            // 퇴원일 표시
            bodyCell = bodyRow.createCell(7);
            bodyCell.setCellValue(vo.getLevDt());
            // 자리 표시
            bodyCell = bodyRow.createCell(8);
            bodyCell.setCellValue(vo.getBed());
        }
        
        return workbook;
	}

	@Override
	public SXSSFWorkbook entingExcelFileDownloadProcess(List<EntVO> list, String sheetName) {
		return this.makeEntingExcelWorkbook(list,sheetName);
	}

}

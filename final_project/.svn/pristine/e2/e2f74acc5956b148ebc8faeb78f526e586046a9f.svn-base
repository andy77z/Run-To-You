package kr.or.ddit.excel.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.ent.vo.EntVO;
import kr.or.ddit.excel.service.ExcelService;
import kr.or.ddit.patients.vo.PatientsVO;

@Controller
public class ExcelController {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(ExcelController.class);
	
	@Autowired
	ExcelService service;

	@RequestMapping(value = "/downloadExcelFile", method = RequestMethod.GET)
    public String downloadExcelFile(Model model,HttpSession session,@RequestParam String where) {
		
		SXSSFWorkbook workbook = null;
		if(where.equals("patients")) {
			List<PatientsVO> list = (List<PatientsVO>) session.getAttribute("excelData");
			workbook = service.patientsExcelFileDownloadProcess(list,"환자 목록");
			model.addAttribute("workbookName", "환자 목록");
		}else if(where.equals("enting")) {
			List<EntVO> list = (List<EntVO>) session.getAttribute("excelData");
			workbook = service.entingExcelFileDownloadProcess(list,"입원 환자 목록");
			model.addAttribute("workbookName", "입원 환자 목록");
		}
        model.addAttribute("locale", Locale.KOREA);
        model.addAttribute("workbook", workbook);
        
        return "excelDownloadView";
    }

}

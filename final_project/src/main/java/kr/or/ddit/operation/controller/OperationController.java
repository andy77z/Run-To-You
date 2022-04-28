package kr.or.ddit.operation.controller;

import java.awt.Desktop;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.JDBCType;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.type.JdbcType;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.emp.service.EmpService;
import kr.or.ddit.emp.vo.EmpVO;
import kr.or.ddit.operation.service.OperationService;
import kr.or.ddit.operation.vo.ChartVO;
import kr.or.ddit.operation.vo.OperDetailVO;
import kr.or.ddit.operation.vo.OperReservationVO;
import kr.or.ddit.operation.vo.OperTeamVO;
import kr.or.ddit.operation.vo.OperationVO;
import kr.or.ddit.operation.vo.PatientVO;
import kr.or.ddit.operation.vo.PntVSVO;
import kr.or.ddit.operation.vo.SgCodeVO;
import kr.or.ddit.operation.vo.TreatVO;
import kr.or.ddit.operation.vo.operationRoomVO;
import kr.or.ddit.patients.vo.PatientsVO;
import kr.or.ddit.security.CustomUser;




@Controller
@RequestMapping(value="/operation")
public class OperationController {
	
	@Autowired
	OperationService operationService;
	
	@Autowired
	EmpService empService;
	
	private static final Logger logger = LoggerFactory.getLogger(OperationController.class);
	
	@GetMapping("/main")
	public String main(Model model,Authentication auth) {
		List<OperationVO> operationList = this.operationService.selectOperList();
		CustomUser user = (CustomUser) auth.getPrincipal();
		EmpVO empVO = user.getUser();
				
		model.addAttribute("loginUser", empVO);
		model.addAttribute("secSelectBox", empService.secSelectBox());
		
		logger.info(operationList.toString());
		model.addAttribute("list", operationList);
		return "operation/main";
	}
	
	
//	@PostMapping("/selectOperList")
//	@ResponseBody
//	public String selectOperList(Model model ){
//		return "operation/main";
//	}
	
	@PostMapping("/chart")
	@ResponseBody
	public List<ChartVO> OperChart(Model model, ChartVO chartVO){
		
		ArrayList<ChartVO> operChart = this.operationService.operChart();
		
		logger.info(operChart.toString());
		
		return operChart;
	}
	
	@GetMapping("/detail")
	public String OperDetail(Model model, @RequestParam String operCd,@RequestParam String pntCd,Authentication auth) {
		logger.info("sasdaadsdsasda");
		logger.info(operCd);
		logger.info(pntCd);
		OperDetailVO pntInfo = this.operationService.pntInfo(pntCd);
//		OperDetailVO operPntInfo = this.operationService.operPntInfo(operCd);
		List<OperDetailVO> operPntVS = this.operationService.operPntVS(pntCd);
		List<OperDetailVO> operPntInj = this.operationService.operPntInj(pntCd);
		List<OperDetailVO> operIns = this.operationService.operIns(pntCd);
		List<OperDetailVO> operTeam = this.operationService.operTeam(operCd);
		
//		model.addAttribute("operPntInfo", operPntInfo);
//		model.addAttribute("operCd", operCd);
		CustomUser user = (CustomUser) auth.getPrincipal();
		EmpVO empVO = user.getUser();
				
		model.addAttribute("loginUser", empVO);
		model.addAttribute("secSelectBox", empService.secSelectBox());
		model.addAttribute("pntInfo", pntInfo);
		model.addAttribute("operPntVS", operPntVS);
		model.addAttribute("operPntInj", operPntInj);
		model.addAttribute("operIns", operIns);
		model.addAttribute("operTeam", operTeam);
//		logger.info(pntInfo.toString());
//		logger.info(operPntVS.toString());
		logger.info(operIns.toString());
		return "operation/detail";
		
	}
	
	@PostMapping("/graph")
	@ResponseBody
	public List<PntVSVO> PntGraph(Model model, @RequestParam String pntCd){
		
		List<PatientsVO> ddd = new ArrayList<PatientsVO>();
		
		List<PntVSVO> pntVS = this.operationService.pntVS(pntCd);
		
		logger.info(pntVS.toString());
		
		return pntVS;
	}
	@PostMapping("/search")
	@ResponseBody
	public List<PatientVO> pntSearch(Model model, @RequestParam String pntNm){
		
		List<PatientVO>pntSearch = this.operationService.pntSearch(pntNm);
		
		logger.info(pntSearch.toString());
		return pntSearch;
	}
	
	@PostMapping("/operCd")
	@ResponseBody
	public OperationVO operCd(Model model) {
		OperationVO operCd = this.operationService.operCd();
		
		logger.info(operCd.toString());
		
		return operCd;
	}
	
	@PostMapping("/writeOperPnt")
	@ResponseBody
	public PatientVO writeOperPnt(Model model, @RequestParam String pntCd) {
		
		PatientVO writeOperPnt = this.operationService.writeOperPnt(pntCd);
		
		logger.info(writeOperPnt.toString());
		
		return writeOperPnt;
	}
	
	@PostMapping("/operTeam2")
	@ResponseBody
	public List<OperTeamVO> operTeam2(Model model
									 ,@RequestParam(defaultValue="1", required=false) int currentPage
									 ,@RequestParam(defaultValue="6", required=false) int size
									 ,@RequestParam(required=false) String keyWord){
		Map<String,Object>map = new HashMap<String, Object>();
		map.put("keyWord",keyWord);
		map.put("currentPage", currentPage);
		map.put("size",size);
		System.out.println("operTeam >> ");
		System.out.println(map);
		List<OperTeamVO> operTeam2 = this.operationService.operTeam2(map);
		
		logger.info(operTeam2.toString());
		
		return operTeam2;
	}
	
	@PostMapping("/writeOperTeam")
	@ResponseBody
	public OperTeamVO writeOperTeam(Model model, @RequestParam String empCd) {
		
		OperTeamVO writeOperTeam = this.operationService.writeOperTeam(empCd);
		
		return writeOperTeam;
		
	}
	
	@PostMapping("/selectOperRoom")
	@ResponseBody
	public List<OperationVO> selectOperRoom(Model model){
		
		List<OperationVO> selectOperRoom = this.operationService.selectOperRoom();
		logger.info("selectOperRoom>>" + selectOperRoom.toString());
		return selectOperRoom;
	}
	@PostMapping("/selectSgCode")
	@ResponseBody
	public List<SgCodeVO>selectSgCode(){
		List<SgCodeVO>selectSgCode = this.operationService.selectSgCode();
		logger.info("selectSgCode>>" + selectSgCode.toString());
		return selectSgCode;
	}
	
	@PostMapping("/selectTreatCode")
	@ResponseBody
	public List<TreatVO> selectTreatCode(String pntCd) {
		System.out.println(pntCd);
		System.out.println("PNTCD>>>>>>>>>>"+ pntCd);
		List<TreatVO> selectTreatCode = this.operationService.selectTreatCode(pntCd);
		logger.info("selectTreatCode>>>>>>>" + selectTreatCode.toString());
		
		return selectTreatCode;
	}
	
	@PostMapping("/selectDis")
	@ResponseBody
	public List<TreatVO> selectDis(String treatCd) {
		List<TreatVO> list = this.operationService.selectDis(treatCd);
		
		return list;
	}
	
	@PostMapping("/writeSgCode")
	@ResponseBody
	public SgCodeVO writeSgCode(String sgNm) {
		SgCodeVO writeSgCode = this.operationService.writeSgCode(sgNm);
		
		return writeSgCode;
	}
	@PostMapping("/writeOpRoomNo")
	@ResponseBody
	public operationRoomVO writeOpRoomNo(int opRoomNo) {
		operationRoomVO writeOpRoomNo = this.operationService.writeOpRoomNo(opRoomNo);
		
		return writeOpRoomNo;
	}
	
	@PostMapping("/writeReservation")
	@ResponseBody
	public OperReservationVO writeResevation(Model model, @RequestParam Map<String, Object>map) {
		OperReservationVO writeResevation = this.operationService.writeReservation(map);
		
		return writeResevation;
	}
	
//	@RequestMapping(value="/insertOperation",method = RequestMethod.POST, headers = {"Accept=application/json"})
	@PostMapping("/insertOperation")
	@ResponseBody
	public int insertOperation(@RequestParam Map<String, Object>map) {
		System.out.println("컨트롤러 왔니????????????????????????????");
		System.out.println(map.toString());
//		int result = 0;
//		List<Map<String, Object>> list = (List<Map<String, Object>>) param.get("param");
//		Map<String,Object>map = new HashMap<String, Object>();
//		System.out.println(list.get(0).get("operCd"));
//		System.out.println(list.get(0).get("treatCd"));
//		System.out.println(list.get(0));
//		System.out.println(list.get(0).get("empNm"));
//		System.out.println(list.get(0).get("pntNm"));
//		System.out.println(list.get(0).get("opRoomNo"));
//		System.out.println(list.get(0).get("operYmd"));
//		System.out.println(list.get(0).get("operBgnTm"));
//		System.out.println(list.get(0).get("operEndTm"));
//		System.out.println(list.get(0).get("digCls"));
//		for(int i = 0; i<list.size();i++ ) {
//			String operCd = (String) list.get(i).get("operCd");
//			String treatCd = (String)list.get(i).get("treatCd");
//			String empCd = (String)list.get(i).get("empCd");
//			String pntCd = (String)list.get(i).get("pntCd");
//			int opRoomNo = Integer.parseInt((String)list.get(i).get("opRoomNo"));
//			String operYmd = (String)list.get(i).get("operYmd");
//			String operBgnTm = (String)list.get(i).get("operBgnTm");
//			String operEndTm = (String)list.get(i).get("operEndTm");
//			int digCls = (int)list.get(i).get("digCls");
//			map.put("operCd", operCd);
//			map.put("treatCd", treatCd);
//			map.put("empCd", empCd);
//			map.put("pntCd", pntCd);
//			map.put("opRoomNo", opRoomNo);
//			map.put("operYmd", operYmd);
//			map.put("operBgnTm", operBgnTm);
//			map.put("operEndTm", operEndTm);
//			map.put("digCls", digCls);
//			System.out.println(map);
//			result+= this.operationService.insertOperation(map);
//			
//		}
//		System.out.println(map.toString());
//		return result;
		return this.operationService.insertOperation(map);
	}
	
	@RequestMapping(value="/insertOperProc",method = RequestMethod.POST, headers = {"Accept=application/json"})
	@ResponseBody
	public int insertOperProc(@RequestBody Map<String,Object>param2) {
		int result = 0;
		List<Map<String, Object>> list = (List<Map<String, Object>>) param2.get("param2");
		Map<String,Object>map = new HashMap<String, Object>();
		for(int i=0; i<list.size();i++) {
			String operCd = (String)list.get(i).get("operCd");
			String opcNm = (String)list.get(i).get("opcNm");
			map.put("operCd",operCd);
			map.put("opcNm",opcNm);
			System.out.println(map.toString());
			result += this.operationService.insertOperProc(map);
		}
		return result;
	}
	@RequestMapping(value="/insertOperTeam",method = RequestMethod.POST, headers = {"Accept=application/json"})
	@ResponseBody
	public int insertOperTeam(@RequestBody Map<String,Object>param3) {
		int result = 0;
		List<Map<String, Object>> list = (List<Map<String, Object>>) param3.get("param3");
		Map<String,Object>map = new HashMap<String, Object>();
		for(int i=0; i<list.size();i++) {
			String operCd = (String)list.get(i).get("operCd");
			String empCd = (String)list.get(i).get("empCd");
			map.put("operCd",operCd);
			map.put("empCd",empCd);
			System.out.println(map.toString());
			result += this.operationService.insertOperTeam(map);
		}
		return result;
	}
	@PostMapping("/operationList")
	@ResponseBody
	public List<OperationVO>operationList(Model model, @RequestParam String empNm){
		
		return this.operationService.operationList(empNm);
	}
	
	@PostMapping("/updateOperation")
	@ResponseBody
	public int updateOperation(@RequestParam Map<String, Object>map) {
		return this.operationService.updateOperation(map);
	}
	@PostMapping("/deleteOperation")
	@ResponseBody
	public int deleteOperation(String operCd) {
		return this.operationService.deleteOperation(operCd);
	}
	
	@GetMapping("/operationRecord")
	public String recordPntList(Model model,Authentication auth) {
		CustomUser user = (CustomUser) auth.getPrincipal();
		EmpVO empVO = user.getUser();
		logger.info("empCd>>>>"+empVO.getEmpCd());
		List<OperationVO>recordPntList = this.operationService.recordPntList(empVO.getEmpCd());
		model.addAttribute("recordPntList", recordPntList);
		model.addAttribute("loginUser", empVO);
		model.addAttribute("secSelectBox", empService.secSelectBox());
		logger.info("recordPntList>>>>>>",recordPntList);
		
		return "operation/operationRecord";
	
	}
	@PostMapping("/loadRecord")
	@ResponseBody
	public List<OperationVO> loadRecord(Model model,@RequestParam Map<String,String>map){
		
		return this.operationService.loadRecord(map);
	}
	@RequestMapping(value="/loadRecordProc",method = RequestMethod.POST, headers = {"Accept=application/json"})
	@ResponseBody
	public List<OperationVO> loadRecordProc(@RequestParam String operCd){
		
		return this.operationService.loadRecordProc(operCd);
		
	}
//	@PostMapping("/submitRecord")
	@RequestMapping(value="/submitRecord",method = RequestMethod.POST, headers = {"Accept=application/json"})
	@ResponseBody
	private int wordDown(@RequestBody Map<String, Object> data) {
	      System.out.println("컨트롤러 왔니????");
	      System.out.println("컨트롤러 왔니????");
	      System.out.println("컨트롤러 왔니????");
	      System.out.println("컨트롤러 왔니????");
//	      Map<String, Object> list = (Map<String, Object>) data.get("array");
	      System.out.println(data);
//	      System.out.println(data.get("data"));
//	      System.out.println(list);
//	      List<Map<String,Object>>list = (List<Map<String,Object>>)list 
	    		  
	      System.out.println(data.get("recordParam"));
	      Map<String,Object>map = (Map<String,Object>)data.get("recordParam");
	      System.out.println("map>>" + map);
	      List<Map<String,Object>>list = (List<Map<String,Object>>)map.get("array");
	      List<Map<String,Object>>list2 = (List<Map<String,Object>>)map.get("array2");
	      List<Map<String,Object>>list3 = (List<Map<String,Object>>)map.get("array3");
	      System.out.println("list>>" + list);
	      System.out.println("list2>>" + list2);
	      System.out.println("list3>>" + list3);
	      System.out.println("첫번째 OPCCD"+list.get(0).get("opcCd"));
	      System.out.println("컨트롤러 왔니????");
	      System.out.println("컨트롤러 왔니????");
	      System.out.println("컨트롤러 왔니????");
	      System.out.println("컨트롤러 왔니????");
	      System.out.println("컨트롤러 왔니????");
	      System.out.println("컨트롤러 왔니????");
	      
	      File f = new File(
	            "D:\\A_TeachingMaterial\\7.LastProject\\workspace\\final_project\\src\\main\\webapp\\resources\\upload",
	            "수술기록지.docx");

	      if (!f.isDirectory()) {
	         try (FileInputStream fis = new FileInputStream(f.getAbsolutePath());
	             XWPFDocument document = new XWPFDocument(fis);) {
	            
	            System.out.println(f.getAbsolutePath());
	            
	            XWPFTable tbl = document.getTables().get(0);

	            for (int i = 0; i <= tbl.getRows().size() - 1; i++) {
	               for (int ii = 0; ii < tbl.getRow(i).getTableCells().size(); ii++) {

	                  XWPFTableCell cell = tbl.getRow(i).getCell(ii);

	                  if ("secNm".equals(cell.getText())) {
	                     cell.removeParagraph(0);
	                     cell.setText((String)map.get("secNm"));
	                  }
	                  if ("operCd".equals(cell.getText())) {
	                     cell.removeParagraph(0);
	                     cell.setText((String)map.get("operCd"));
	                  }
	                  if ("empNm".equals(cell.getText())) {
	                     cell.removeParagraph(0);
	                     cell.setText((String)map.get("empNm"));
	                  }
	                  if ("pntNm".equals(cell.getText())) {
	                     cell.removeParagraph(0);
	                     cell.setText((String)map.get("pntNm"));
	                  }
	                  if ("pntAge".equals(cell.getText())) {
	                     cell.removeParagraph(0);
	                     cell.setText((String)map.get("pntAge"));
	                  }
	                  if ("pntSex".equals(cell.getText())) {
	                	  cell.removeParagraph(0);
	                	  cell.setText((String)map.get("pntSex"));
	                  }
	                  if ("opRoomNo".equals(cell.getText())) {
	                	  cell.removeParagraph(0);
	                	  cell.setText((String)map.get("opRoomNo"));
	                  }
	                  if ("operYmd".equals(cell.getText())) {
	                	  cell.removeParagraph(0);
	                	  cell.setText((String)map.get("operYmd"));
	                  }
	                  if ("prtcrNm".equals(cell.getText())) {
	                	  cell.removeParagraph(0);
	                	  cell.setText((String)map.get("prtcrNm"));
	                  }
	                  if ("disNm".equals(cell.getText())) {
	                	  cell.removeParagraph(0);
	                	  cell.setText((String)map.get("disNm"));
	                  }
	                  if ("anesthesiaTime".equals(cell.getText())) {
	                	  cell.removeParagraph(0);
	                	  cell.setText((String)map.get("anesthesiaTime"));
	                  }
	                  if ("anesthesiaMaterials".equals(cell.getText())){
	                	  cell.removeParagraph(0);
	                	  cell.setText((String)map.get("anesthesiaMaterials"));
	                  }
	                  if ("injectionPrescription".equals(cell.getText())) {
	                	  cell.removeParagraph(0);
	                	  cell.setText((String)map.get("injectionPrescription"));
	                  }
	                  for(int j=0; j<list.size(); j++) {
	                	  if(("opcCd"+j).contentEquals(cell.getText())) {
	                		  cell.removeParagraph(0);
	                		  cell.setText((String)list.get(j).get("opcCd"));
	                	  }
	                	  if(("opcNm"+j).contentEquals(cell.getText())) {
	                		  cell.removeParagraph(0);
	                		  cell.setText((String)list.get(j).get("opcNm"));
	                	  }
	                	  if(("main"+j).contentEquals(cell.getText())) {
	                		  cell.removeParagraph(0);
	                		  cell.setText((String)list.get(j).get("mainOpc"));
	                	  }
	                	  if(("sub"+j).contentEquals(cell.getText())){
	                		  cell.removeParagraph(0);
	                		  cell.setText((String)list.get(j).get("subOpc"));
	                	  }
	                  }
	                  for(int k=0; k<list2.size(); k++) {
	                	  if(("materials"+k).contentEquals(cell.getText())) {
	                		  cell.removeParagraph(0);
	                		  cell.setText((String)list2.get(k).get("opcMat"));
	                	  }
	                	  if(("cnt"+k).contentEquals(cell.getText())){
	                		  cell.removeParagraph(0);
	                		  cell.setText((String)list2.get(k).get("opcMatCnt"));
	                	  }
	                  }
	                  for(int m=0; m<list3.size(); m++) {
	                	  if(("anesthesia"+m).contentEquals(cell.getText())){
	                		  cell.removeParagraph(0);
	                		  cell.setText((String)list3.get(m).get("Anesthesia"));
	                	  }
	                  }
	                 
	                  System.out.println(cell.getText());
	               }
	            }
	            
	            System.out.println(tbl.getText());
	            

	            document.write(new FileOutputStream("C:\\Users\\PC-13\\Downloads\\" + (String)map.get("pntNm") + "환자 수술기록지.docx"));

	            document.close();
	            fis.close();
	         } catch (FileNotFoundException e) {
	            System.err.println(f.getName() + " 파일이 없습니다");
	         } catch (IOException e1) {
	            System.err.println(e1);
	         } 

	         System.out.println(f.getName() + " 처리 완료");
	      }
		return 1;
	}
	@PostMapping("/updateRecordYN")
	@ResponseBody
	public int updateRecordYN(@RequestParam String operCd) {
		
		return this.operationService.updateRecordYN(operCd);
	}
	@PostMapping("/openDocx")
	@ResponseBody
	public int openDocx(@RequestParam Map<String,String>map) {
		System.out.println("map>>>>>>>>>>>>>>>>"+map);
		System.out.println("map>>>>>>>>>>>>>>>>"+map);
		System.out.println("map>>>>>>>>>>>>>>>>"+map);
		System.out.println("map>>>>>>>>>>>>>>>>"+map);
		System.out.println("map>>>>>>>>>>>>>>>>"+map);
		System.out.println("map>>>>>>>>>>>>>>>>"+map);
		System.out.println("map>>>>>>>>>>>>>>>>"+map);
		 try
	        {
	            File file = new File("C:\\Users\\PC-13\\Downloads\\"+(String)map.get("pntNm") + "환자 수술기록지.docx");
	            if(!Desktop.isDesktopSupported())
	            {
	                System.out.println("not supported");
	                return 0;
	            }
	            Desktop desktop = Desktop.getDesktop();
	            if(file.exists())
	                desktop.open(file);
	        }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	        }
		 return 1;
	}
	@PostMapping("/insertOperRec")
	@ResponseBody
	public int insertOperRec(@RequestParam Map<String, Object>map) {
		System.out.println("");
		return this.operationService.insertOperRec(map);
	}
	@PostMapping("/completeLoadRecord")
	@ResponseBody
	public OperationVO completeLoadRecord(@RequestParam String operCd) {
		
		return this.operationService.completeLoadRecord(operCd);
	}
	@PostMapping("/myOperation")
	@ResponseBody
	public List<OperationVO> myOperation(@RequestParam String empCd) {
		
		return this.operationService.myOperation(empCd);
	}
}

package kr.or.ddit.webcam.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Base64;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.webcam.service.SnapImgService;
import kr.or.ddit.webcam.vo.SnapImgVO;

@Controller
public class WebCamController {
	private static final Logger logger = 
			LoggerFactory.getLogger(WebCamController.class);
	
	private static final String BASE_64_PREFIX = "data:image/jpeg;base64,";
	
	@Autowired
	SnapImgService snapImgService;

	@GetMapping("/webcam")
	public String test() {
		return "webcam/webcam";
	}
	
	//사진 저장
	@ResponseBody
	@PostMapping("/downloadSnapImg")
	public boolean downloadSnapImg(@RequestBody List<SnapImgVO> list) {
		if(!list.toString().equals("[]")) {
			Path uploadFolder = Paths.get("D:\\A_TeachingMaterial\\7.LastProject\\"
					+ "workspace\\final_project\\src\\main\\webapp\\"
					+ "resources\\upload\\pntPic\\" + list.get(0).getPntCd());
			
			if(!Files.exists(uploadFolder)) { // 해당 경로가 없으면
				try {
					Files.createDirectories(uploadFolder);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
			int result = 0;
			
			for(SnapImgVO vo : list) {
				try {
					vo.setFilePath("/resources/upload/pntPic/" + vo.getPntCd() + "/" + vo.getFileNm());
					Files.copy(new ByteArrayInputStream(decodeBase64ToBytes(vo.getUri())), uploadFolder.resolve(vo.getFileNm()));
					result += snapImgService.insertSnapImg(vo);
				}catch(IOException e) {
					e.printStackTrace();
				}
			}
			
			if(result >= list.size()) {
				return true;
			}
		}
		return false;
	}
	
	//사진 불러오기
	@GetMapping("/snapLog")
	public String snapLog(@RequestParam Map<String, String> map, Model model) {
		model.addAttribute("list", snapImgService.snapLog(map));
		return "webcam/snapLog";
	}
	
	public static byte[] decodeBase64ToBytes(String imageString) {
        if (imageString.startsWith(BASE_64_PREFIX))
            return Base64.getDecoder().decode(imageString.substring(BASE_64_PREFIX.length()));
        else
            throw new IllegalStateException("it is not base 64 string");
    }

}

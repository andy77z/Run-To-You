package kr.or.ddit.dis.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class DisController {
	private static final Logger logger = 
			LoggerFactory.getLogger(DisController.class);
	
	@GetMapping("/dis/main")
	public String disMain() {
		return "dis/dis";
	}
	
	@ResponseBody
	@GetMapping("/dis/{searchWrd}")
	public List<Map<String, String>> URLLoad(@PathVariable("searchWrd")String searchWrd) throws UnsupportedEncodingException {
		String URL = "https://www.kcdcode.kr/browse/contents/99?keyword=" + searchWrd;
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		try {
			Document document = Jsoup.connect(URL).get();
			
			Elements ul = document.select("ul[class=\"kcdf_cname\"]");
			Elements li = ul.select("li");
			for(int i = 0; i < li.size(); i++) {
				Map<String, String> map = new HashMap<String, String>();
				String disCd = li.get(i).text().substring(0, li.get(i).text().indexOf("]"));
				String disNm = li.get(i).text().substring(li.get(i).text().indexOf(" ") + 1);
				map.put("disCd", disCd.replace("[", ""));
				map.put("disNm", disNm);
				list.add(map);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	
	
	
	
}

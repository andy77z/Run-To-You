package kr.or.ddit.word;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;



public class WordDown {
	
	public static final String WORDFILE = "C:\\Users\\PC-07\\Desktop\\proceedings\\w24_proceedings.docx";

	public static void main(String[] args) {
		
		File directory = new File(WORDFILE);

				
			try {
				FileInputStream fis = new FileInputStream(directory.getAbsolutePath());
				
				System.out.println(fis);
				
			} catch (FileNotFoundException e) {
				System.err.println(directory.getName()+" 파일이 없습니다");;
			} catch (IOException e1) {
				System.err.println(e1);
			}
			System.out.println(directory.getName()+" 처리 완료");
		
	}
}
	
	

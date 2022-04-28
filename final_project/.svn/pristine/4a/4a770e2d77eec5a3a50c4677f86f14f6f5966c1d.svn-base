package kr.or.ddit;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;

public class WordTest {

	public static void main(String[] args) {

		File f = new File(
				"D:\\A_TeachingMaterial\\7.LastProject\\workspace\\final_project\\src\\main\\webapp\\resources\\upload",
				"입원수속서.docx");

		if (!f.isDirectory()) {
			try (FileInputStream fis = new FileInputStream(f.getAbsolutePath());
				 XWPFDocument document = new XWPFDocument(fis);) {
				
				System.out.println(f.getAbsolutePath());
				
				XWPFTable tbl = document.getTables().get(0);

				for (int i = 0; i <= tbl.getRows().size() - 1; i++) {
					for (int ii = 0; ii < tbl.getRow(i).getTableCells().size(); ii++) {

						XWPFTableCell cell = tbl.getRow(i).getCell(ii);

						if ("demo1".equals(cell.getText())) {
							cell.removeParagraph(0);
							cell.setText("이수보");
						}
						if ("demo2".equals(cell.getText())) {
							cell.removeParagraph(0);
							cell.setText("960934-342342");
						}
						if ("demo3".equals(cell.getText())) {
							cell.removeParagraph(0);
							cell.setText("010-3434-2322");
						}
						if ("demo4".equals(cell.getText())) {
							cell.removeParagraph(0);
							cell.setText("대전");
						}
						if ("demo5".equals(cell.getText())) {
							cell.removeParagraph(0);
							cell.setText("227");
						}
						System.out.println(cell.getText());
					}
				}
				
				System.out.println(tbl.getText());

				document.write(new FileOutputStream("C:\\Users\\PC-07\\Downloads\\성공.docx"));
			} catch (FileNotFoundException e) {
				System.err.println(f.getName() + " 파일이 없습니다");
			} catch (IOException e1) {
				System.err.println(e1);
			} finally {

			}

			System.out.println(f.getName() + " 처리 완료");
		}

	}
}

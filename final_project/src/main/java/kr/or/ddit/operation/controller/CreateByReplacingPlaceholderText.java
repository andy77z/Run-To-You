/*package kr.or.ddit.operation.controller;

import java.util.HashMap;
import java.util.Map;

import com.spire.doc.Document;
import com.spire.doc.FileFormat;
import com.spire.doc.HeaderFooter;
import com.spire.doc.Section;
import com.spire.doc.Table;
import com.spire.doc.TableCell;
import com.spire.doc.TableRow;
import com.spire.doc.documents.Paragraph;
import com.spire.doc.documents.TextSelection;
import com.spire.doc.fields.DocPicture;
import com.spire.doc.fields.TextRange;

public class CreateByReplacingPlaceholderText {  
    public static void main(String []args){  
        //Load the template document  
        Document document = new Document("C://Users//PC-19//OneDrive//바탕 화면//수술기록지.docx");  
        //Get the first section  
        Section section = document.getSections().get(0);  
        //Get the first table in the section  
        Table table = section.getTables().get(0);  
  
        //Create a map of values for the template  
        Map<String, String> map = new HashMap<String, String>();  
        map.put("firstName","Alex");  
//        map.put("lastName","Anderson");  
//        map.put("gender","Male");  
//        map.put("mobilePhone","+0044 85430000");  
//        map.put("email","alex.anderson@myemail.com");  
//        map.put("homeAddress","123 High Street");  
//        map.put("dateOfBirth","6th June, 1986");  
//        map.put("education","University of South Florida, September 2013 - June 2017");  
//        map.put("employmentHistory","Automation Inc. November 2013 - Present");  
  
        //Call the replaceTextinTable method to replace text in table  
        replaceTextinTable(map, table);  
        // Call the replaceTextWithImage method to replace text with image  
//        replaceTextWithImage(document, "photo", "Avatar.jpg");  
  
        //Save the result document  
        document.saveToFile("CreateByReplacingPlaceholder.docx", FileFormat.Docx_2013);  
    }  
  
    //Replace text in table  
    static void replaceTextinTable(Map<String, String> map, Table table){  
        for(TableRow row:(Iterable<TableRow>)table.getRows()){  
            for(TableCell cell : (Iterable<TableCell>)row.getCells()){  
                for(Paragraph para : (Iterable<Paragraph>)cell.getParagraphs()){  
                    for (Map.Entry<String, String> entry : map.entrySet()) {  
                        para.replace("${" + entry.getKey() + "}", entry.getValue(), false, true);  
                    }  
                }  
            }  
        }  
    }  
  
    //Replace text with image  
    static  void replaceTextWithImage(Document document, String stringToReplace, String imagePath){  
        TextSelection[] selections = document.findAllString("${" + stringToReplace + "}", false, true);  
        int index = 0;  
        TextRange range = null;  
        for (Object obj : selections) {  
            TextSelection textSelection = (TextSelection)obj;  
            DocPicture pic = new DocPicture(document);  
            pic.loadImage(imagePath);  
            range = textSelection.getAsOneRange();  
            index = range.getOwnerParagraph().getChildObjects().indexOf(range);  
            range.getOwnerParagraph().getChildObjects().insert(index,pic);  
            range.getOwnerParagraph().getChildObjects().remove(range);  
        }  
    }  
  
    //Replace text in document body  
    static void replaceTextinDocumentBody(Map<String, String> map, Document document){  
        for(Section section : (Iterable<Section>)document.getSections()) {  
            for (Paragraph para : (Iterable<Paragraph>) section.getParagraphs()) {  
                for (Map.Entry<String, String> entry : map.entrySet()) {  
                    para.replace("${" + entry.getKey() + "}", entry.getValue(), false, true);  
                }  
            }  
        }  
    }  
  
    //Replace text in header or footer  
    static  void replaceTextinHeaderorFooter(Map<String, String> map, HeaderFooter headerFooter){  
        for(Paragraph para : (Iterable<Paragraph>)headerFooter.getParagraphs()){  
            for (Map.Entry<String, String> entry : map.entrySet()) {  
                para.replace("${" + entry.getKey() + "}", entry.getValue(), false, true);  
            }  
        }  
    }  
}  */
package kr.pe.infoshop.web;

import java.io.File;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;


import org.w3c.dom.Node;
import org.w3c.dom.NodeList;


import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import kr.pe.infoshop.service.people.PeopleService;
import kr.pe.infoshop.util.*;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xml.sax.InputSource;



@Controller
@RequestMapping("/people")
public class PlayerController {
	//private static final Logger logger = LoggerFactory.getLogger(PlayerController.class);

	private static final int DEFAULT_PAGE_NO = 0;
	private static final int DEFAULT_PAGE_SIZE = 15;

	@Autowired
	private PeopleService peopleService;


	@RequestMapping("")
	public String index(Integer page, Model model) {
		//page = revisedPage(page);
		//model.addAttribute("questions", playerService.findsPlayer(DEFAULT_PAGE_NO));
		//model.addAttribute("tags", tagService.findPooledTags());
		return "player/list";
	}

	@RequestMapping("/form")
	public String createForm(HttpServletRequest request) {
		//model.addAttribute("question", new QuestionDto());
		//model.addAttribute("tags", tagService.findPooledTags());
			//File dirFile = new File("F:/players");
			//File[] fileList = dirFile.listFiles();
			//HashMap<String, String> map = new HashMap<String, String>();
			//ArrayList documentList = new ArrayList<>();
			/*
		    for (File file : fileList) {		    
				System.out.println("==========================================");
	            // 인터넷 상의 XML 문서는 요렇게 생성하면 편리함.
				if(file.exists()) {
					System.out.println("111111111111111111111111111111111");
				}
	            Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(file);            
	            // xpath 생성
	            XPath xpath = XPathFactory.newInstance().newXPath();

	            // NodeList 가져오기 : row 아래에 있는 모든 col1 을 선택
	            NodeList cols = (NodeList)xpath.evaluate("//General/*", document, XPathConstants.NODESET);
	            for( int idx=0; idx<cols.getLength(); idx++ ){
	                String key = cols.item(idx).getNodeName();
	                String value = cols.item(idx).getAttributes().getNamedItem("Value").getTextContent(); 
	                System.out.println("KEY : "+key+"\n VALUE : "+value);
	                map.put(key, value);

	            }
	            //peopleService.createPeople(map);
		    }
			 */
			HashMap<String, String> map = new HashMap<String, String>();
		
			File dirFile = new File("C:/Temp/player1.html");
			try {
				//Document doc = Jsoup.connect(html).get();
				Document doc = Jsoup.parse(dirFile, "ISO-8859-1");
				Elements tableElements = doc.select("table");			
				//Elements tableHeaderEles = tableElements.select("thead tr th");
				Elements tableHeaderEles = tableElements.select("tr th");				
				Elements tableRowElements = tableElements.select(":not(thead) tr");			
				Element row = null;
				Elements rowItems = null;
				String key = "";
				String value = "";
				String dateFormat = "";
				java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("dd.mm.yyyy");
				java.text.SimpleDateFormat format1 = new java.text.SimpleDateFormat("yyyy-mm-dd");
				java.util.Date date;
				System.out.println("row length : "+tableRowElements.size());
				for (int i = 1; i < tableRowElements.size(); i++) {
					
					row = tableRowElements.get(i);
					
					rowItems = row.select("td");
					for (int j = 0; j < rowItems.size(); j++) {
						key = tableHeaderEles.get(j).text().replaceAll("[ ,\n\t\r]", "");
						value = rowItems.get(j).text().replaceAll("[,,%]" , "");
						if(("DateOfBirth").equals(key) || ("JoinedClub").equals(key)) {							
							date = format.parse(value);
							value = format1.format(date);
						}
						//System.out.println(rowItems.get(j).text());
						//System.out.println("KEY : "+key+"\n VALUE : "+value);
						map.put(key, value);
					}				
					System.out.println(map.toString());	
					peopleService.createPeople(map);
				}			
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return "index";
	}

	@RequestMapping("/club")
	public String createClub(HttpServletRequest request) {

		//String html = "http://publib.boulder.ibm.com/infocenter/iadthelp/v7r1/topic/" +
		//        "com.ibm.etools.iseries.toolbox.doc/htmtblex.htm";
		HashMap<String, String> map = new HashMap<String, String>();
		String html = "C:/Temp/clube.html";
		System.out.println("12");
		File dirFile = new File("C:/Temp/club.html");
		try {
			System.out.println("12123123");
			//Document doc = Jsoup.connect(html).get();
			Document doc = Jsoup.parse(dirFile, "ISO-8859-1");
			System.out.println("2");
			Elements tableElements = doc.select("table");
			System.out.println("3");
			//Elements tableHeaderEles = tableElements.select("thead tr th");
			Elements tableHeaderEles = tableElements.select("tr th");
			System.out.println("4");
			Elements tableRowElements = tableElements.select(":not(thead) tr");
			System.out.println("5");
			Element row = null;
			Elements rowItems = null;
			String key = "";
			String value = ""; 		
			System.out.println("row length : "+tableRowElements.size());
			for (int i = 1; i < tableRowElements.size(); i++) {
				
				row = tableRowElements.get(i);
				
				rowItems = row.select("td");
				for (int j = 0; j < rowItems.size(); j++) {
					key = tableHeaderEles.get(j).text().replaceAll("[ ,\n\t\r]", "");
					value = rowItems.get(j).text().replaceAll("[,,%]" , "");					
					//System.out.println(rowItems.get(j).text());
					//System.out.println("KEY : "+key+"\n VALUE : "+value);
					map.put(key, value);
				}				
				System.out.println(map.toString());	
				peopleService.createPeople(map);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}		

		return "index";
	}

	@RequestMapping("/update")
	public String updateForm(String jsonData) {

		return "player/form";
	}	
}

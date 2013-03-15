package kr.pe.infoshop.web;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import kr.pe.infoshop.service.people.PeopleService;
import kr.pe.infoshop.util.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.xml.sax.InputSource;



@Controller
@RequestMapping("/people")
public class PlayerController {
	private static final Logger logger = LoggerFactory.getLogger(PlayerController.class);

	private static final int DEFAULT_PAGE_NO = 0;
	private static final int DEFAULT_PAGE_SIZE = 15;
	
	@Autowired
	private PeopleService peopleService;

	
	@RequestMapping("")
	public String index(Integer page, Model model) {
		//page = revisedPage(page);
		logger.debug("currentPage : {}", page);
		//model.addAttribute("questions", playerService.findsPlayer(DEFAULT_PAGE_NO));
		//model.addAttribute("tags", tagService.findPooledTags());
		return "player/list";
	}
	
	@RequestMapping("/form")
	public String createForm(HttpServletRequest request) {
		//model.addAttribute("question", new QuestionDto());
		//model.addAttribute("tags", tagService.findPooledTags());
		try {
		    File dirFile = new File("F:/players");
		    File[] fileList = dirFile.listFiles();
		    HashMap<String, String> map = new HashMap<String, String>();
		    ArrayList documentList = new ArrayList<>();
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
		} catch (Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return "player/form";
	}
	
	@RequestMapping("/update")
	public String updateForm(String jsonData) {

		return "player/form";
	}	
}

package kr.pe.infoshop.web;

import kr.pe.infoshop.board.service.ArticleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;

@Controller
public class HomeController {
	
	@Autowired
	ArticleService articleService;
	
	@RequestMapping("/")
	public String home(Model model) {				
		model.addAttribute("getBoardList", articleService.getArticleList());		
		return "index";
	}
	
	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public String index(@PathVariable String id, Model model) {				
		model.addAttribute("m_id", id);
		model.addAttribute("getNewsList", articleService.getArticleList());
		return id+"/index";
		
	}

}

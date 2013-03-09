package kr.pe.infoshop.web;

import kr.pe.infoshop.board.service.ArticleService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

@Controller
public class HomeController {
	
	@Autowired
	ArticleService articleService;
	
	@RequestMapping("/")
	public String home(Model model) {				
		Gson gson = new Gson();
	
		model.addAttribute("getBoardList", articleService.getArticleList());
		model.addAttribute("getJSON", gson.toJson(articleService.getArticleList()));
		return "index";
	}

}

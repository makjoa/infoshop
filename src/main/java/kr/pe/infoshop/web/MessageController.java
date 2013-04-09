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
@RequestMapping("message")
public class MessageController {
	
	@Autowired
	ArticleService articleService;
	
	@RequestMapping("")
	public String home(Model model) {
		model.addAttribute("getBoardList", articleService.getArticleList());
		
		return "index";
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String wrtie(@PathVariable String fromId, String toId, Model model) {				
		return "index";
	}
}

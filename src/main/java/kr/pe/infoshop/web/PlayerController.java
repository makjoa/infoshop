package kr.pe.infoshop.web;

import java.io.PrintWriter;



import kr.pe.infoshop.user.model.User;
import kr.pe.infoshop.service.player.PlayerService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


import javax.annotation.Resource;




@Controller
@RequestMapping("/players")
public class PlayerController {
	private static final Logger logger = LoggerFactory.getLogger(PlayerController.class);

	private static final int DEFAULT_PAGE_NO = 0;
	private static final int DEFAULT_PAGE_SIZE = 15;
	
	//@Resource(name = "playerService")
	private PlayerService playerService;

	/**
	 * 로그인 인증을 위한 처리.
	 * @param request request
	 * @param response response
	 * @return view
	 */		
	@RequestMapping("")
	public String index(Integer page, Model model) {
		//page = revisedPage(page);
		logger.debug("currentPage : {}", page);
		model.addAttribute("questions", playerService.findsPlayer(DEFAULT_PAGE_NO));
		//model.addAttribute("tags", tagService.findPooledTags());
		return "player/list";
	}
	
	@RequestMapping("/form")
	public String createForm() {
		//model.addAttribute("question", new QuestionDto());
		//model.addAttribute("tags", tagService.findPooledTags());
		return "player/form";
	}
}

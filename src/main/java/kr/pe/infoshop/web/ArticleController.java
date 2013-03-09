package kr.pe.infoshop.web;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.pe.infoshop.board.model.Article;
import kr.pe.infoshop.board.service.ArticleService;
import kr.pe.infoshop.page.model.Paging;
import kr.pe.infoshop.page.service.PagingService;
import kr.pe.infoshop.util.PagingUtil;

import org.apache.log4j.Logger;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


/**
 * Handles requests for the application home page.
 */
@Controller
public class ArticleController {

	private int currentPage = 1;			// 현재페이지
	private int showArticleLimit = 10;	// 화면에 보여줄 리스트 개 change value if want to show more articles by one page
	private int showPageLimit = 10; 	// 화면에 페이지 수 change value if want to show more page links
	private int startArticleNum = 0;		// 시작
	private int endArticleNum = 0;		// 마지막
	private int totalNum = 0;				// 총페이지 수

	@Autowired
	ArticleService articleService;
	PagingService pagingService;
	protected final Logger logger = Logger.getLogger(getClass());

	/**
	 * URL매핑 테스트
	 * @param jsonData
	 * @param nickName
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */

	@RequestMapping(value = { "/{m_id}/form" } , method = RequestMethod.GET)
	public String form(@PathVariable("m_id") String m_id, Model model){		

		model.addAttribute("m_id", m_id);

		return "bbs/write2";

	}

	@RequestMapping(value = "/{m_id}", method = RequestMethod.POST)
	public String create(@PathVariable("m_id") String m_id, @ModelAttribute("Article") Article article){		

		System.out.println(article.getMb_id());
		System.out.println(article.getContent());
		//	String content =  article.getContent().replaceAll("\r\n", "<br />");	
		//	article.setContent(content);
		//	article.setBbsId(bbsid);
		article.setCat_id(m_id);
		int b = articleService.insertArticle(article);	
		System.out.println(b);
		return "redirect:/"+m_id;
	}	


	@RequestMapping(value = "/bbs/temp", method = RequestMethod.GET)
	public ModelAndView getList(@PathVariable("bbsid") String bbsid) {
		ModelAndView mv = new ModelAndView();
		//PagingUtil pageUtil = new PagingUtil();

		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit + 1;
		endArticleNum = startArticleNum + showArticleLimit -1;

		System.out.println("--------------------------------------------------");

		//List<Article> list = articleService.list(bbsid);
		//System.out.println(list);
		//StringBuffer pageHtml =  pageUtil.getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, null, null);
		//mv.addObject("getList", list);
		//mv.addObject("pageHtml", pageHtml);
		mv.setViewName("/bbs/list");
		return mv;
	}

	/**
	 * URL매핑 테스트
	 * @param jsonData
	 * @param nickName
	 * @param model
	 * @param request
	 * @param response
	 * @return
	 */

	@RequestMapping(value = { "/v={idx}" } , method = RequestMethod.GET)
	public ModelAndView view(@PathVariable int idx) {

		ModelAndView mav = new ModelAndView();		
		Article article = articleService.getArticle(idx);
		System.out.println(article.getDataNum());
		mav.addObject("getArticle", article);
		mav.addObject("getArticleIDX", article.getDataNum());
		mav.setViewName("/bbs/view");

		return mav;
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.GET)
	public ModelAndView list(@PathVariable String id,
			@RequestParam(value="page", required=false) String page, 
			@RequestParam(value="type", required=false) String type, 
			@RequestParam(value="keyword", required=false) String keyword, HttpServletRequest request,
			HttpServletResponse response) {

		ModelAndView mav = new ModelAndView();
		PagingUtil pageUtil = new PagingUtil();
		List articleList;

		Paging paging = new Paging();
		String ip = request.getRemoteAddr();

		System.out.println("요청 필드= "+id);
		System.out.println("요청 페이지= "+page);
		System.out.println("요청 타입= "+type);
		System.out.println("요청 키워드= "+keyword);
		System.out.println("요청 아이피= "+ip);


		// set variables from request parameter
		if(page == null || page.trim().isEmpty() || page.equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(page);
		}		

		// expression article variables value
		startArticleNum = (currentPage - 1) * showArticleLimit;		
		endArticleNum = startArticleNum + showArticleLimit;
		//endArticleNum = startArticleNum + showArticleLimit -1;

		//전체 글의 수
		totalNum = articleService.getTotalNum(type, keyword);

		if(totalNum > 0) {

			if(endArticleNum > totalNum) 				
				endArticleNum = totalNum;
		}
		articleList = articleService.getArticleList(startArticleNum, showArticleLimit, type, keyword);

		System.out.println("startArticleNum" + startArticleNum + "\nendArticleNum" + endArticleNum + "\nshowArticleLimit"+ showArticleLimit + "\nshowPageLimit" +showPageLimit);
		//StringBuffer pageHtml =  pageUtil.getPageHtml(currentPage, totalNum, showArticleLimit, showPageLimit, type, keyword);
		paging = getPagingList(currentPage, totalNum, showArticleLimit, showPageLimit);

		mav.addObject("getArticleList", articleList);
		//mav.addObject("pageHtml", pageHtml);
		mav.addObject("pagingList", paging);
		mav.setViewName(id+"/article");

		return mav;
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String update(@RequestParam(value = "grpid", required = false) int grpid,
			RedirectAttributes redirectAttributes) {
		int a = articleService.deleteArticle(grpid);
		redirectAttributes.addFlashAttribute("message", "삭제되었습니다.");

		return "redirect:table";
	}	

	public Paging getPagingList(int nCurrentPage,int nTotalRecordSize,int nRecordSize, int nBlockSize) {
		System.out.println("PAGE =============================");
		//nTotalRecordSize;     //전체 record size
		//nCurrentPage;        //현재 페이지
		//nRecordSize;          //한 페이지당 보여줄 record size
		//nBlockSize;         //한블록당 보여줄 블록 size 한블록당 보여줄 페이지수 [1][2][3][4][5][6][7][8][9][10] [다음]클릭시 [11][12][13]...

		Paging paging = new Paging();

		int nBlockGrpSize;        //블록 그룹 size
		int nTotalPageSize;        //전체 페이지수
		int nCurrentGrp;        //현재 페이지의 블록 그룹번호

		int nStartPage     = 0;    //페이징의 시작 페이지 번호
		int nEndPage    = 0;    //페이징의 끝 페이지 번호

		String strLowNo = "";    //한페이지 보여줄 레코드 시작 번호_쿼리문의 파라메터로 사용
		String strHighNo = "";    //한페이지 보여줄 레코드 끝 번호_쿼리문의 파라메터로 사용

		nBlockGrpSize  = (int)Math.ceil((float)nTotalRecordSize / (float)(nRecordSize * nBlockSize))  ;    //블록 그룹 size
		nTotalPageSize = (int)Math.ceil( (float)nTotalRecordSize / (float)nRecordSize );    //전체 페이지수 
		nCurrentGrp = (int)Math.ceil( (float)nCurrentPage/(float)nBlockSize );    //현재 페이지가 속한 블록그룹번호

		//페이징의 시작페이지와  끝페이지 정의
		//만약 현재 페이지가 속한 그룹이 마지막 그룹이라면 .._10개짜리 페이지블록에서 [11][12][13] 요렇게  3개만 나와야 할경우
		if( nCurrentGrp == nBlockGrpSize ){
			nStartPage = (nCurrentGrp * nBlockSize) - (nBlockSize - 1);
			//마지막을 전체 페이지 번호까지
			nEndPage = nTotalPageSize;
		}
		//만약 현재 페이지가 속한 블록 그룹이 마지막블록그룹보다 작다면
		else if(nCurrentGrp < nBlockGrpSize){
			nStartPage = (nCurrentGrp * nBlockSize) - (nBlockSize - 1);
			nEndPage = nCurrentGrp * nBlockSize;
		}
		//레코드 범위  정의
		strLowNo = Integer.toString((nCurrentPage*nRecordSize)-(nRecordSize-1));
		strHighNo = Integer.toString((nCurrentPage*nRecordSize));

		paging.setnBlockGrpSize(nBlockGrpSize);
		paging.setnBlockSize(nBlockSize);
		paging.setnCurrentGrp(nCurrentGrp);
		paging.setnCurrentPage(nCurrentPage);
		paging.setnEndPage(nEndPage);
		paging.setnRecordSize(nRecordSize);
		paging.setnStartPage(nStartPage);
		paging.setnTotalPageSize(nTotalPageSize);
		paging.setnTotalRecordSize(nTotalRecordSize);
		paging.setStrHighNo(strHighNo);
		paging.setStrLowNo(strLowNo);

		return paging;
	}
}

package kr.pe.infoshop.util;

public class PagingUtil {
	

	
	// A method for Creating page html code
	public StringBuffer getPageHtml(int currentPage, int totalNum, int showArticleLimit, int showPageLimit, String type, String keyword) {
		StringBuffer pageHtml = new StringBuffer();
		int startPage = 0;
		int lastPage = 0;
		
		// expression page variables
		startPage = ((currentPage-1) / showPageLimit) * showPageLimit + 1;
		lastPage = startPage + showPageLimit - 1;
		
		if(lastPage > totalNum / showArticleLimit) {
			lastPage = (totalNum / showArticleLimit) + 1;
		}
		//
		
		// create page html code
		// if: when no search	
		if(type == null && keyword == null){			
			if(currentPage == 1){
			       				
				pageHtml.append("<span class=\"num_prev\">");
				pageHtml.append("<span class=\"arrow txt_sub\">◀</span><span class=\"txt_sub\">이전</span>");
				pageHtml.append("</span>");
				//pageHtml.append("<span>");
			} else {
				pageHtml.append("<span class=\"num_prev\">");
				pageHtml.append("<span class=\"arrow\">◀</span><a href=\"javascript:goPage(" + (currentPage-1) + ")\" class=\"num_box\">이전</a>");
				pageHtml.append("</span>");
				
				//pageHtml.append("<span><a href=\"list.do?page=" + (currentPage-1) + "\"><이전></a>&nbsp;&nbsp;");
			}
			
			for(int i = startPage ; i <= lastPage ; i++) {
				if(i == currentPage){
					//pageHtml.append(".&nbsp;<strong>");
					pageHtml.append("<a href=\"javascript:;\" class=\"num_box txt_point u b\">"+i+"</a>");
					//pageHtml.append("&nbsp;</strong>");
				} else {
					//pageHtml.append(".&nbsp;<a href=\"list.do?page=" +i + "\" class=\"page\">" + i + "</a>&nbsp;");
					pageHtml.append("<a href=\"javascript:goPage("+i+");\" class=\"num_box\">"+i+"</a>");
				}
				
			}

			if(currentPage == lastPage){
				pageHtml.append("<span class=\"num_next\">");
				pageHtml.append("</span>");
			} else {
				pageHtml.append("<span class=\"num_next\">");
				pageHtml.append("<span class=\"txt_sub\">다음</span><span class=\"arrow txt_sub\">▶</span>");
				pageHtml.append("</span>");
			}
		//
		// else: when search
		} else {			
			if(currentPage == 1){
				pageHtml.append("<span>");
			} else {
				pageHtml.append("<span><a href=\"list.do?page=" + (currentPage-1) + "&type=" + type + "&keyword=" + keyword + "\"><이전></a>&nbsp;&nbsp;");
			}
			
			for(int i = startPage ; i <= lastPage ; i++) {
				if(i == currentPage){
					pageHtml.append(".&nbsp;<strong>");
					pageHtml.append("<a href=\"list.do?page=" +i + "&type=" + type + "&keyword=" + keyword + "\" class=\"page\">" + i + "</a>&nbsp;");
					pageHtml.append("&nbsp;</strong>");
				} else {
					pageHtml.append(".&nbsp;<a href=\"list.do?page=" +i + "&type=" + type + "&keyword=" + keyword + "\" class=\"page\">" + i + "</a>&nbsp;");
				}
				
			}
			if(currentPage == lastPage){
				pageHtml.append("</span>");
			} else {
				pageHtml.append(".&nbsp;&nbsp;<a href=\"list.do?page=" + (currentPage+1) + "&type=" + type + "&keyword=" + keyword + "\"><다음></a></span>");
			}
		}
		//		
		return pageHtml;
	}
}

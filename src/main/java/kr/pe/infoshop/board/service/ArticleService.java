package kr.pe.infoshop.board.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.springframework.ui.ModelMap;

import kr.pe.infoshop.board.model.Article;

public interface ArticleService {
			
	Article select(int idx);
	
	int insertArticle(Article article);
	
	int deleteArticle(int idx);
	
	Article getArticle(int idx);
	
	List<Article> getArticleList(int startArticleNum, int showArticleLimit, String type, String keyword);
	
	List<Article> getArticleList();
		
	int getTotalNum(String type, String keyword);
	
	int getSearchTotalNum(String type, String keyword);
	
}

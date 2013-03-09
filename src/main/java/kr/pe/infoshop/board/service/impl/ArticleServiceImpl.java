package kr.pe.infoshop.board.service.impl;


import java.util.HashMap;
import java.util.List;

import kr.pe.infoshop.board.model.Article;
import kr.pe.infoshop.board.service.ArticleService;


import org.apache.log4j.Logger;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Service 
@Transactional
public class ArticleServiceImpl extends SqlSessionDaoSupport implements ArticleService {

	protected final Logger logger = Logger.getLogger(getClass());
	private HashMap<String, Object> valueMap = new HashMap<String, Object>();

	public Article select(int idx) { 
		return (Article)getSqlSession().selectOne("tables", idx);
	}

	public Article getArticle(int idx) {
		return (Article)getSqlSession().selectOne("article.getArticle", idx);
	}

	public List<Article> getArticleList(int startArticleNum, int endArticleNum, String type, String keyword) {
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		if(logger.isDebugEnabled()) {

			logger.debug("action Write, method");
		}
		try {
			return (List)getSqlSession().selectList("article.getArticleList", valueMap);
		} catch(Exception e) {
			e.printStackTrace();
			return null;	
		}
	}
	
	public List<Article> getArticleList() {
		return (List)getSqlSession().selectList("article.getArticleList", valueMap);
	}
		
	@Override
	public int getTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);		
		return (Integer) getSqlSession().selectOne("article.getTotalNum", valueMap);
	}

	@Override
	public int getSearchTotalNum(String type, String keyword) {
		valueMap.put("type", type);
		valueMap.put("keyword", keyword);
		return (Integer) getSqlSession().selectOne("getSearchTotalNum", valueMap);
	}
	
	public int insertArticle(Article article) {

		int b = getSqlSession().insert("insertArticle", article);
		return b;
	}
	
	public int deleteArticle(int idx) {
		int b = getSqlSession().delete("deleteArticle", idx);
		return b;
	}
}

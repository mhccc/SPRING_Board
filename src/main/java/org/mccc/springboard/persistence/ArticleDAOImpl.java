package org.mccc.springboard.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.mccc.springboard.domain.ArticleVO;
import org.mccc.springboard.domain.Criteria;
import org.springframework.stereotype.Repository;

@Repository
public class ArticleDAOImpl implements ArticleDAO {
	
	private static final String NAMESPACE = "org.mccc.mapper.ArticleMapper";
	@Inject
	private SqlSession sqlSession;

	@Override
	public void createArticle(ArticleVO articleVO) throws Exception {
		sqlSession.insert(NAMESPACE + ".createArticle", articleVO);
	}

	@Override
	public ArticleVO readArticle(int articleNo) throws Exception {
		return sqlSession.selectOne(NAMESPACE + ".readArticle", articleNo);
	}

	@Override
	public void updateArticle(ArticleVO articleVO) throws Exception {
		sqlSession.update(NAMESPACE + ".updateArticle", articleVO);
	}

	@Override
	public void deleteArticle(int articleNo) throws Exception {
		sqlSession.delete(NAMESPACE + ".deleteArticle", articleNo);
	}

	@Override
	public List<ArticleVO> listCriteria(Criteria criteria) throws Exception {
		return sqlSession.selectList(NAMESPACE + ".listCriteria", criteria);
	}

}

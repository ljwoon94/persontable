package spring.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.web.vo.IngReplyListVO;
import spring.web.vo.IngReplyVO;
import spring.web.vo.IngredientVO;
import spring.web.vo.SearchCriteria;

@Repository
public class IngredientDAOImpl implements IngredientDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void ingRegister(IngredientVO vo) {
		// TODO Auto-generated method stub
		sqlSession.insert("ingredientMapper.ingRegister", vo);
	}

	@Override
	public List<IngredientVO> ingList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ingredientMapper.ingList",scri);
	}

	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ingredientMapper.listCount",scri);
	}

	@Override
	public IngredientVO ingView(int ingNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ingredientMapper.ingredientView", ingNum);
	}

	@Override
	public void ingredientModify(IngredientVO vo) {
		// TODO Auto-generated method stub
		sqlSession.update("ingredientMapper.ingredientModify", vo);
	}

	@Override
	public void ingredientDelete(int ingNum) {
		// TODO Auto-generated method stub
		sqlSession.delete("ingredientMapper.ingredientDelete", ingNum);
	}

	@Override
	public List<IngredientVO> sellIngList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ingredientMapper.sellIngList",scri);
	}
	@Override
	public List<IngredientVO> sellIngCateList(String ingCateCode) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ingredientMapper.sellIngCateList", ingCateCode);
	}
	@Override
	public IngredientVO sellIngView(int ingNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ingredientMapper.sellIngView", ingNum);
	}
	@Override
	public void registIngReply(IngReplyVO replyVO) {
		// TODO Auto-generated method stub
		sqlSession.insert("ingredientMapper.registIngReply", replyVO);
	}
	@Override
	public List<IngReplyListVO> ingReplyList(int ingNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("ingredientMapper.ingReplyList", ingNum);
	}
	@Override
	public void deleteIngReply(IngReplyVO replyVO) {
		// TODO Auto-generated method stub
		sqlSession.delete("ingredientMapper.deleteIngReply", replyVO);
	}
	@Override
	public String idCheck(int reqNum) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("ingredientMapper.replyUserIdCheck", reqNum);
	}
	@Override
	public void modifyIngReply(IngReplyVO replyVO) {
		// TODO Auto-generated method stub
		sqlSession.update("ingredientMapper.modifyIngReply", replyVO);
	}
}

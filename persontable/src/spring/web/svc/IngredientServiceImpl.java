package spring.web.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.web.dao.IngredientDAO;
import spring.web.vo.IngReplyListVO;
import spring.web.vo.IngReplyVO;
import spring.web.vo.IngredientVO;
import spring.web.vo.SearchCriteria;


@Service
public class IngredientServiceImpl implements IngredientService {
	
	@Autowired
	private IngredientDAO dao;
	
	/*
	 * @Override public List<IngCateVO> ingCate() { // TODO Auto-generated method
	 * stub return dao.ingCate(); }
	 */
	@Override
	public void ingRegister(IngredientVO vo) {
		// TODO Auto-generated method stub
		dao.ingRegister(vo);
	}
	@Override
	public List<IngredientVO> ingList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.ingList(scri);
	}
	@Override
	public int listCount(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
	@Override
	public IngredientVO ingView(int ingNum) {
		// TODO Auto-generated method stub
		return dao.ingView(ingNum);
	}
	@Override
	public void ingredientModify(IngredientVO vo) {
		// TODO Auto-generated method stub
		dao.ingredientModify(vo);
	}
	@Override
	public void ingredientDelete(int ingNum) {
		// TODO Auto-generated method stub
		dao.ingredientDelete(ingNum);
	}
	
	@Override
	public List<IngredientVO> sellIngList(SearchCriteria scri) {
		// TODO Auto-generated method stub
		return dao.sellIngList(scri);
	}
	@Override
	public List<IngredientVO> sellIngCateList(String ingCateCode) {
		// TODO Auto-generated method stub
		return dao.sellIngCateList(ingCateCode);
	}
	@Override
	public IngredientVO sellIngView(int ingNum) {
		// TODO Auto-generated method stub
		return dao.sellIngView(ingNum);
	}
	@Override
	public void registIngReply(IngReplyVO replyVO) {
		// TODO Auto-generated method stub
		dao.registIngReply(replyVO);
	}
	@Override
	public List<IngReplyListVO> ingReplyList(int ingNum) {
		// TODO Auto-generated method stub
		return dao.ingReplyList(ingNum);
	}
	@Override
	public void deleteIngReply(IngReplyVO replyVO) {
		// TODO Auto-generated method stub
		dao.deleteIngReply(replyVO);
	}
	@Override
	public String idCheck(int reqNum) {
		// TODO Auto-generated method stub
		return dao.idCheck(reqNum);
	}
	@Override
	public void modifyIngReply(IngReplyVO replyVO) {
		// TODO Auto-generated method stub
		dao.modifyIngReply(replyVO);
	}
}

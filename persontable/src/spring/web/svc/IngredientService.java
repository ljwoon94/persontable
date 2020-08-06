package spring.web.svc;

import java.util.List;

import spring.web.vo.IngReplyListVO;
import spring.web.vo.IngReplyVO;
import spring.web.vo.IngredientVO;
import spring.web.vo.SearchCriteria;

public interface IngredientService {
	
	/* public List<IngCateVO> ingCate(); */
	public void ingRegister(IngredientVO vo);
	public List<IngredientVO> ingList(SearchCriteria scri);
	public int listCount(SearchCriteria scri);
	public IngredientVO ingView(int ingNum);
	public void ingredientModify(IngredientVO vo);
	public void ingredientDelete(int ingNum);
	public List<IngredientVO> sellIngList(SearchCriteria scri);
	public List<IngredientVO> sellIngCateList(String ingCateCode);
	public IngredientVO sellIngView(int ingNum);
	public void registIngReply(IngReplyVO replyVO);
	public List<IngReplyListVO> ingReplyList(int ingNum);
	public void deleteIngReply(IngReplyVO replyVO);
	public String idCheck(int reqNum);
	public void modifyIngReply(IngReplyVO replyVO);
}
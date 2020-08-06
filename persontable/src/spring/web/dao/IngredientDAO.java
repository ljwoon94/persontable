package spring.web.dao;


import java.util.List;


import spring.web.vo.IngReplyListVO;
import spring.web.vo.IngReplyVO;
import spring.web.vo.IngredientVO;
import spring.web.vo.SearchCriteria;


public interface IngredientDAO {
	
	/*
	 * //카테고리 public List<IngCateVO> ingCate();
	 */
	//상품 등록
	public void ingRegister(IngredientVO vo);
	//상품 목록
	public List<IngredientVO> ingList(SearchCriteria scri);
	//상품 검색
	public int listCount(SearchCriteria scri);
	//상품 조회 + 카테고리 조회
	public IngredientVO ingView(int ingNum);
	//상품 수정
	public void ingredientModify(IngredientVO vo);
	//상품 삭제
	public void ingredientDelete(int ingNum);
	//판매 상품 목록
	public List<IngredientVO> sellIngList(SearchCriteria scri);
	//판매 상품 카테고리 목록
	public List<IngredientVO> sellIngCateList(String ingCateCode);
	//핀매 상품 조회
	public IngredientVO sellIngView(int ingNum);
	//판매 상품 댓글 작성
	public void registIngReply(IngReplyVO replyVO);
	//판매 상품 댓글 목록
	public List<IngReplyListVO> ingReplyList(int ingNum);
	//판매 상품 댓들 삭제
	public void deleteIngReply(IngReplyVO replyVO);
	// 아이디 체크
	public String idCheck(int reqNum);
	//판매 상품 댓들 수정
	public void modifyIngReply(IngReplyVO replyVO);
}
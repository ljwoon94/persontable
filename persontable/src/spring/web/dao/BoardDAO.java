package spring.web.dao;


import java.util.List;

import spring.web.vo.BoardVO;
import spring.web.vo.SearchCriteria;

public interface BoardDAO {
	

	public void write(BoardVO boardVO) throws Exception;
	
	public List<BoardVO> list(SearchCriteria cri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public BoardVO read(int bno) throws Exception;
	
	public void update(BoardVO boardVO) throws Exception;
		
	public void delete(int bno) throws Exception;

	public void boardHit(int bno) throws Exception;
	
}
package spring.web.svc;


import java.util.List;

import spring.web.vo.BoardVO;
import spring.web.vo.SearchCriteria;

public interface BoardService {
	
		public void write(BoardVO boardVO) throws Exception;
		
		public List<BoardVO> list(SearchCriteria scri) throws Exception;
		
		public int listCount(SearchCriteria scri) throws Exception;
		
		public BoardVO read(int bno) throws Exception;
		
		public void update(BoardVO boardVO) throws Exception;
		
		public void delete(int bno) throws Exception;
		
}
package spring.web.svc;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;
import spring.web.dao.BoardDAO;
import spring.web.util.FileUtils;
import spring.web.vo.BoardVO;
import spring.web.vo.SearchCriteria;

@Service("boardServiceImpl")
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	@Override
	public void write(BoardVO boardVO) throws Exception {
		dao.write(boardVO);
	}

	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardVO read(int bno) throws Exception {
		dao.boardHit(bno);
		return dao.read(bno);
	}

	@Override
	public void delete(int bno) throws Exception {
		dao.delete(bno);
	}

	@Override
	public void update(BoardVO boardVO) throws Exception {
		dao.update(boardVO);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}

}
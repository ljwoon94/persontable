package spring.web.svc;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import spring.web.dao.NoticeDAO;
import spring.web.vo.NoticeVO;
import spring.web.vo.SearchCriteria;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDAO dao;
	
	@Override
	public void write(NoticeVO noticeVO) throws Exception {
		dao.write(noticeVO);
	}

	@Override
	public List<NoticeVO> list(SearchCriteria scri) throws Exception {

		return dao.list(scri);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public NoticeVO read(int nno) throws Exception {
		dao.noticeHit(nno);
		return dao.read(nno);
	}

	@Override
	public void delete(int nno) throws Exception {
		dao.delete(nno);
	}

	@Override
	public void update(NoticeVO noticeVO) throws Exception {
		dao.update(noticeVO);
	}
	
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}
}

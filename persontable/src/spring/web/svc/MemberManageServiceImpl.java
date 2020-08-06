package spring.web.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.web.dao.MemberManageDAO;
import spring.web.vo.MemberManageVO;
import spring.web.vo.SearchCriteria;

@Service
public class MemberManageServiceImpl implements MemberManageService {
	
	@Autowired
	MemberManageDAO dao;
	@Override
	public List<MemberManageVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.list(scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return dao.listCount(scri);
	}

	@Override
	public MemberManageVO read(String userId) throws Exception {
		// TODO Auto-generated method stub
		return dao.read(userId);
	}

	@Override
	public void delete(String userId) throws Exception {
		// TODO Auto-generated method stub
		dao.delete(userId);
	}
}

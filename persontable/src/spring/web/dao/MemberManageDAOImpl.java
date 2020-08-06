package spring.web.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.web.vo.MemberManageVO;
import spring.web.vo.SearchCriteria;

@Repository
public class MemberManageDAOImpl implements MemberManageDAO {
	@Autowired
	SqlSession sql;

	@Override
	public List<MemberManageVO> list(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return 	sql.selectList("memberManageMapper.listPage", scri);
	}

	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("memberManageMapper.listCount", scri);
	}

	@Override
	public MemberManageVO read(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sql.selectOne("memberManageMapper.read", userId);
	}

	@Override
	public void delete(String userId) throws Exception {
		// TODO Auto-generated method stub
		sql.delete("memberManageMapper.delete", userId);
	}

}

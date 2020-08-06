package spring.web.dao;

import java.util.List;

import spring.web.vo.MemberManageVO;
import spring.web.vo.SearchCriteria;

public interface MemberManageDAO {
	
	public List<MemberManageVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public MemberManageVO read(String userId) throws Exception;
	
	public void delete(String userId) throws Exception;

}

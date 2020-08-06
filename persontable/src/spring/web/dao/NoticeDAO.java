package spring.web.dao;

import java.util.List;
import java.util.Map;

import spring.web.vo.NoticeVO;
import spring.web.vo.SearchCriteria;

public interface NoticeDAO {

	public void write(NoticeVO noticeVO) throws Exception;
	
	public List<NoticeVO> list(SearchCriteria cri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public NoticeVO read(int nno) throws Exception;
	
	public void update(NoticeVO noticeVO) throws Exception;
		
	public void delete(int nno) throws Exception;

	public void insertFile(Map<String, Object> map) throws Exception;
	
	public void noticeHit(int nno) throws Exception;
	
}

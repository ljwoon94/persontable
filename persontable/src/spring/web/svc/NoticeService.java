package spring.web.svc;

import java.util.List;

import spring.web.vo.NoticeVO;
import spring.web.vo.SearchCriteria;

public interface NoticeService {
	public void write(NoticeVO noticeVO) throws Exception;
	
	public List<NoticeVO> list(SearchCriteria scri) throws Exception;
	
	public int listCount(SearchCriteria scri) throws Exception;
	
	public NoticeVO read(int nno) throws Exception;
	
	public void update(NoticeVO NoticeVO) throws Exception;
	
	public void delete(int nno) throws Exception;
}

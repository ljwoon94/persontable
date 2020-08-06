package spring.web.dao;

import java.util.List;

import spring.web.vo.AdvertiseVO;
import spring.web.vo.SearchCriteria;

public interface AdvertiseDAO {

	public List<AdvertiseVO> list(SearchCriteria scri) throws Exception;

	public int listCount(SearchCriteria scri) throws Exception;

	public void regist(AdvertiseVO vo) throws Exception;

	public AdvertiseVO read(int adNum) throws Exception;

	public void update(AdvertiseVO vo) throws Exception;

	public void delete(int adNum) throws Exception;

}

package spring.web.svc;

import java.util.List;

import spring.web.vo.AdvertiseVO;
import spring.web.vo.SearchCriteria;

public interface AdvertiseService {

	public List<AdvertiseVO> adList(SearchCriteria scri) throws Exception;

	public int listCount(SearchCriteria scri) throws Exception;

	public void adRegist(AdvertiseVO vo) throws Exception;

	public AdvertiseVO adRead(int adNum) throws Exception;

	public void update(AdvertiseVO vo) throws Exception;

	public void delete(int adNum) throws Exception;

}

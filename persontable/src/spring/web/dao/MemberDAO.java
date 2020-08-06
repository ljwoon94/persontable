package spring.web.dao;



import spring.web.vo.MemberVO;

public interface MemberDAO {
	
	
	public void insertMember(MemberVO memberVO);
	public MemberVO login(MemberVO memberVO);
	public void updateMember(MemberVO memberVO);
	public void memberDelete(MemberVO memberVO);
	public int passChk(MemberVO memberVO);
	public int idChk(MemberVO memberVO);
	public String find_id(String email) throws Exception;
	public int update_pw(MemberVO memberVO);

}

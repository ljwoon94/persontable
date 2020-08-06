package spring.web.svc;


import javax.servlet.http.HttpServletResponse;

import spring.web.vo.MemberVO;

public interface MemberService {

	public void addMember(MemberVO memberVO);
	public MemberVO login(MemberVO memberVO);
	public void updateMember(MemberVO memberVO);
	public void memberDelete(MemberVO memberVO);
	public int passChk(MemberVO memberVO);
	public int idChk(MemberVO memberVO);
	public String find_id(HttpServletResponse response, String email) throws Exception;
	public String create_key();
	public void send_mail(MemberVO memberVO,String div);
	public void find_pw(HttpServletResponse response, MemberVO memberVO) throws Exception;
}
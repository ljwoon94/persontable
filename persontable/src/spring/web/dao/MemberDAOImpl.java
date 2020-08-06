package spring.web.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import spring.web.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	

	@Override
	public void insertMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		 sqlSession.insert("memberMapper.insertMember",memberVO);
	}
	@Override
	public MemberVO login(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("memberMapper.login",memberVO);
	}
	@Override
	public void updateMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		sqlSession.update("memberMapper.updateMember",memberVO);
	}
	@Override
	public void memberDelete(MemberVO memberVO) {
		// TODO Auto-generated method stub
		sqlSession.delete("memberMapper.memberDelete", memberVO);
	}
	
	@Override
	public int passChk(MemberVO memberVO) {
		// TODO Auto-generated method stub
		int result = sqlSession.selectOne("memberMapper.passChk", memberVO);
		return result;
	}
	
	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO memberVO) {
		int result = sqlSession.selectOne("memberMapper.idChk", memberVO);
		return result;
	}
	
	@Override
	public String find_id(String email) throws Exception {
		return sqlSession.selectOne("memberMapper.find_id", email);
	}

	@Override
	public int update_pw(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return sqlSession.update("memberMapper.update_pw",memberVO);
	}
}

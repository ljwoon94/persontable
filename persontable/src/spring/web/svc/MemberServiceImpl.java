package spring.web.svc;

import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.web.dao.MemberDAO;
import spring.web.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public void addMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		memberDAO.insertMember(memberVO);
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.login(memberVO);
	}

	@Override
	public void updateMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		memberDAO.updateMember(memberVO);
	}

	@Override
	public void memberDelete(MemberVO memberVO) {
		// TODO Auto-generated method stub
		memberDAO.memberDelete(memberVO);
	}
	
	@Override
	public int passChk(MemberVO memberVO) {
		// TODO Auto-generated method stub
		int result = memberDAO.passChk(memberVO);
		return result;
	}

	@Override
	public int idChk(MemberVO memberVO) {
		// TODO Auto-generated method stub
		int result = memberDAO.idChk(memberVO);
		return result;
	}
	
	@Override
	public String find_id(HttpServletResponse response, String email) throws Exception {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String userId = memberDAO.find_id(email);
		
		if (userId == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return userId;
		}
	}
	
	@Override
	public String create_key() {
		// TODO Auto-generated method stub
		String key = "";
		Random random = new Random();
		
		for (int i = 0; i < 8; i++) {
			key+=random.nextInt(10);
		}
		return key;
	}
	
	@Override
	public void send_mail(MemberVO memberVO,String div) {
		// TODO Auto-generated method stub
		String charSet = "UTF-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "cys779988";
		String hostSMTPpwd = "rkwhr12";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "cys779988@naver.com";
		String fromName = "1인식탁";
		String subject = "";
		String msg = "";

			subject ="Spring Homepage 임시비밀번호입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += memberVO.getUserId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += memberVO.getUserPasswd() + "</p></div>";
			
		// 받는 사람 E-Mail 주소
		String mail = memberVO.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465);
			
			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			//email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}
	@Override
	public void find_pw(HttpServletResponse response, MemberVO memberVO) throws Exception{
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		// 아이디가 없으면
		if(memberDAO.idChk(memberVO)==0) {
			out.print("아이디가 없습니다.");
			out.close();
		}
		else {
			// 임시 비밀번호 생성
			String userPasswd = "";
			for (int i = 0; i < 12; i++) {
				userPasswd += (char) ((Math.random() * 26) + 97);
			}
			memberVO.setUserPasswd(userPasswd);
			// 비밀번호 변경
			memberDAO.update_pw(memberVO);
			// 비밀번호 변경 메일 발송
			send_mail(memberVO, "find_pw");
			
			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
}	

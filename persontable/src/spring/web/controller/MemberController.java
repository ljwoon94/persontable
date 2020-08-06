package spring.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.web.svc.MemberService;
import spring.web.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

   @Autowired
   private MemberService memberService;

   @RequestMapping(value = "/registForm")
   public String registForm() {
      return "/member/registForm";
   }

   @RequestMapping(value = "/insert")
   public String addMember(MemberVO memberVO) {

      int result = memberService.idChk(memberVO);
      try {
         if (result == 1) {
            return "member/registForm";
         } else if (result == 0) {
            memberService.addMember(memberVO);
         }
      } catch (Exception e) {
         throw new RuntimeException();
      }
      return "redirect:/";

   }

   @RequestMapping(value = "/loginForm")
   public String loginPage() {

      return "/member/loginForm";
   }

   @RequestMapping(value = "/login")
   public String login(MemberVO memberVO, HttpServletRequest req, RedirectAttributes rttr) {

      HttpSession session = req.getSession();
      MemberVO login = memberService.login(memberVO);

      if (login == null) {
         session.setAttribute("member", null);
         rttr.addFlashAttribute("msg", false);
         return "redirect:/member/loginForm";
      } else {
         session.setAttribute("member", login);
      }

      return "redirect:/";
   }

   @RequestMapping(value = "/logout")
   public String logout(HttpSession session) {
      session.invalidate();

      return "redirect:/";
   }

   @RequestMapping(value = "/modifyForm")
   public String modifyForm(MemberVO memberVO, HttpSession session) {

      return "/member/modifyForm";
   }

   @RequestMapping("/modify")
   public String modifyMember(MemberVO memberVO, HttpSession session) {
      memberService.updateMember(memberVO);

      return "redirect:/";
   }

   @RequestMapping(value = "/deleteForm")
   public String memberDeleteView() {
      return "member/deleteForm";
   }

   @RequestMapping(value = "/memberDelete")
   public String memberDelete(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception {

      MemberVO member = (MemberVO) session.getAttribute("member");
      String sessionPass = member.getUserPasswd();
      String voPass = memberVO.getUserPasswd();

      if (!(sessionPass.equals(voPass))) {
         rttr.addFlashAttribute("msg", false);
         return "redirect:/member/deleteForm";
      }
      memberService.memberDelete(memberVO);
      session.invalidate();
      return "redirect:/";
   }

   @ResponseBody
   @RequestMapping(value = "/idChk", method = RequestMethod.POST)
   public int idChk(MemberVO vo) throws Exception {
      int result = memberService.idChk(vo);
      return result;
   }

   @ResponseBody
   @RequestMapping(value = "/passChk", method = RequestMethod.POST)
   public int passChk(MemberVO memberVO) throws Exception {
      int result = memberService.passChk(memberVO);
      return result;
   }

   @RequestMapping("/myPageView")
   public String myPageView() {
      return "member/myPageView";
   }
   
   @RequestMapping(value = "/find_id_form")
	public String find_id_form() throws Exception {
		return "/member/find_id_form";
	}
   @RequestMapping(value = "/find_id", method = RequestMethod.POST)
	public String find_id(HttpServletResponse response, @RequestParam("email") String email, Model model)
			throws Exception {
		model.addAttribute("userId", memberService.find_id(response, email));
		return "/member/find_id";
	}

   
   @RequestMapping(value = "/find_pw_form")
	public String find_pw_form() throws Exception{
		return "/member/find_pw_form";
	}
   
	@RequestMapping(value = "/find_pw", method = RequestMethod.POST)
	public String find_pw(@ModelAttribute MemberVO memberVO, HttpServletResponse response) throws Exception{
		memberService.find_pw(response, memberVO);
		return "redirect:/member/loginForm";
	}

}
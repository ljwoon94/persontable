package spring.web.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.web.svc.NoticeService;
import spring.web.svc.ReplyService;
import spring.web.util.FileUtils;
import spring.web.vo.NoticeVO;
import spring.web.vo.MemberVO;
import spring.web.vo.NoticeReplyVO;
import spring.web.vo.PageMaker;
import spring.web.vo.SearchCriteria;


@Controller
@RequestMapping("/notice/*")
public class NoticeController {

	private static final Logger logger = LoggerFactory.getLogger(NoticeController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	NoticeService service;
	
	@Autowired
	ReplyService replyService;
	
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView(HttpSession session, Model model) throws Exception{
		logger.info("noticeWriteView");
		Object loginInfo = session.getAttribute("member");
		if(loginInfo==null) {
			model.addAttribute("msg",false);
		}
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(NoticeVO vo, HttpSession session, MultipartFile file) throws Exception{
		logger.info("noticeWrite");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String writer = memberVO.getUserId();
		vo.setWriter(writer);
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = FileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = FileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setnImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setnThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png파일을 대신 출력함

			vo.setnImg(fileName);
			vo.setnThumbImg(fileName);
		}

		vo.setnImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setnThumbImg(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		
		service.write(vo);
		return "redirect:/notice/list";
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("noticeList");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "notice/noticeList";
		
	}
	
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(NoticeVO NoticeVO,MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, Model model,HttpSession session) throws Exception{
		logger.info("noticeRead");
		
		model.addAttribute("read", service.read(NoticeVO.getNno()));
		model.addAttribute("scri", scri);
		
		List<NoticeReplyVO> replyList = replyService.readNoticeReply(NoticeVO.getNno());
		model.addAttribute("replyList", replyList);
		
		return "notice/readView";
	}
	
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(NoticeVO NoticeVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("noticeUpdateView");
		
		model.addAttribute("update", service.read(NoticeVO.getNno()));
		model.addAttribute("scri", scri);
		
		return "notice/updateView";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(NoticeVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, MultipartFile file) throws Exception{
		logger.info("noticeUpdate");
		
		
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = FileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = FileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setnImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setnThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png파일을 대신 출력함

			vo.setnImg(fileName);
			vo.setnThumbImg(fileName);
		}

		vo.setnImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setnThumbImg(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		service.update(vo);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(NoticeVO NoticeVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("noticeDelete");
		
		service.delete(NoticeVO.getNno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/list";
	}
	
	
	@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
	public String replyWrite(NoticeReplyVO vo, SearchCriteria scri, RedirectAttributes rttr, HttpSession session) throws Exception {
		logger.info("replyWrite");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String writer = memberVO.getUserId();
		vo.setWriter(writer);
		
		replyService.writeReply(vo);
		
		rttr.addAttribute("nno", vo.getNno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/readView";
	}
	
	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(NoticeReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("replyWrite");
		
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "notice/replyUpdateView";
	}
	
	@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(NoticeReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("replyWrite");
		
		replyService.updateReply(vo);
		
		rttr.addAttribute("nno", vo.getNno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/readView";
	}
	
	@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(NoticeReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("replyWrite");
		
		model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		

		return "notice/replyDeleteView";
	}
	
	@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
	public String replyDelete(NoticeReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("replyWrite");
		
		replyService.deleteReply(vo);
		
		rttr.addAttribute("nno", vo.getNno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/notice/readView";
	}
	

}



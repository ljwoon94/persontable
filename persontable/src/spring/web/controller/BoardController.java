package spring.web.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.web.svc.BoardService;
import spring.web.svc.ReplyService;
import spring.web.util.FileUtils;
import spring.web.vo.BoardVO;
import spring.web.vo.MemberVO;
import spring.web.vo.PageMaker;
import spring.web.vo.ReplyVO;
import spring.web.vo.SearchCriteria;


@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	

	@Resource(name = "uploadPath")
	private String uploadPath;

	@Autowired
	BoardService service;
	
	@Autowired
	ReplyService replyService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception{
		logger.info("boardList");
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/boardList";
		
	}
	
	@RequestMapping(value = "/writeView", method = RequestMethod.GET)
	public void writeView(HttpSession session, Model model) throws Exception{
		logger.info("boardWriteView");
		Object loginInfo = session.getAttribute("member");
		if(loginInfo==null) {
			model.addAttribute("msg",false);
		}
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String write(BoardVO vo, HttpSession session, MultipartFile file) throws Exception{
		logger.info("boardWrite");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String writer = memberVO.getUserId();
		vo.setWriter(writer);
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = FileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = FileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setbImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setbThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png파일을 대신 출력함

			vo.setbImg(fileName);
			vo.setbThumbImg(fileName);
		}

		vo.setbImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setbThumbImg(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		service.write(vo);
		return "redirect:/board/list";
	}
	
	// ck 에디터에서 파일 업로드
		@RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
		public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res, @RequestParam MultipartFile upload) throws Exception {
		 // 랜덤 문자 생성
		 UUID uid = UUID.randomUUID();
		 
		 OutputStream out = null;
		 PrintWriter printWriter = null;
		   
		 // 인코딩
		 res.setCharacterEncoding("UTF-8");
		 res.setContentType("text/html;charset=UTF-8");
		 
		 try {
		  
		  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
		  byte[] bytes = upload.getBytes();
		  
		  // 업로드 경로
		  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
		  
		  out = new FileOutputStream(new File(ckUploadPath));
		  out.write(bytes);
		  out.flush();  // out에 저장된 데이터를 전송하고 초기화
		  
		  String callback = req.getParameter("CKEditorFuncNum");
		  printWriter = res.getWriter();
		  String fileUrl = "/ckUpload/" + uid + "_" + fileName;  // 작성화면
		  
		  // 업로드시 메시지 출력
		  printWriter.println("<script type='text/javascript'>"
		     + "window.parent.CKEDITOR.tools.callFunction("
		     + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
		     +"</script>");
		  
		  printWriter.flush();
		  
		 } catch (IOException e) { e.printStackTrace();
		 } finally {
		  try {
		   if(out != null) { out.close(); }
		   if(printWriter != null) { printWriter.close(); }
		  } catch(IOException e) { e.printStackTrace(); }
		 }
		 
		 return; 
		}
		
	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String read(BoardVO boardVO,MemberVO memberVO, @ModelAttribute("scri") SearchCriteria scri, Model model,HttpSession session) throws Exception{
		logger.info("boardRead");
		
		model.addAttribute("read", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		List<ReplyVO> replyList = replyService.readReply(boardVO.getBno());
		model.addAttribute("replyList", replyList);
		
		return "board/readView";
	}
	
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String updateView(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception{
		logger.info("boardUpdateView");
		
		model.addAttribute("update", service.read(boardVO.getBno()));
		model.addAttribute("scri", scri);
		
		return "board/updateView";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String update(BoardVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr, MultipartFile file) throws Exception{
		logger.info("boardUpdate");
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = FileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = FileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setbImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setbThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png파일을 대신 출력함

			vo.setbImg(fileName);
			vo.setbThumbImg(fileName);
		}

		vo.setbImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setbThumbImg(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		service.update(vo);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(BoardVO boardVO, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception{
		logger.info("boardDelete");
		
		service.delete(boardVO.getBno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}
	
	
	@RequestMapping(value="/replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr, HttpSession session) throws Exception {
		logger.info("replyWrite");
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String writer = memberVO.getUserId();
		vo.setWriter(writer);
		
		replyService.writeReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	
	@RequestMapping(value="/replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("replyWrite");
		
		model.addAttribute("replyUpdate", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "board/replyUpdateView";
	}
	
	@RequestMapping(value="/replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("replyWrite");
		
		replyService.updateReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	
	@RequestMapping(value="/replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		logger.info("replyDelete");
		
		model.addAttribute("replyDelete", replyService.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		

		return "board/replyDeleteView";
	}
	
	@RequestMapping(value="/replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		logger.info("replyDelete");
		
		replyService.deleteReply(vo);
		
		rttr.addAttribute("bno", vo.getBno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	

}



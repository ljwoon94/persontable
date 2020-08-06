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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.web.svc.IngredientService;
import spring.web.svc.ReplyService;
import spring.web.util.FileUtils;
import spring.web.vo.IngReplyListVO;
import spring.web.vo.IngReplyVO;
import spring.web.vo.IngredientVO;
import spring.web.vo.MemberVO;
import spring.web.vo.PageMaker;
import spring.web.vo.SearchCriteria;

@Controller
@RequestMapping("/ingredient/*")
public class IngredientController {
	@Autowired
	private IngredientService ingredientService;

	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@Autowired
	ReplyService replyService;

	/* 관리자 식재료 목록페이지로 이동 */
	@RequestMapping("/ingredient/admin_ing_list")
	public String adminIngList(Model model, IngredientVO vo, @ModelAttribute("scri") SearchCriteria scri) {
		List<IngredientVO> ingList = ingredientService.ingList(scri);
		model.addAttribute("ingList", ingList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(ingredientService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "ingredient/admin_ing_list";
	}

	/* 관리자 식재료 등록페이지로 이동 */
	@RequestMapping("/ingredient/admin_ing_regist")
	public void adminIngWriteView(Model model) {

	}

	/* 식재료 등록 */

	@RequestMapping("/ingredient/ingRegister")
	public String adminIngRegister(IngredientVO vo, MultipartFile file) throws Exception {

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = FileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = FileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setIngImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setIngThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png파일을 대신 출력함

			vo.setIngImg(fileName);
			vo.setIngThumbImg(fileName);
		}

		vo.setIngImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setIngThumbImg(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		ingredientService.ingRegister(vo);
		return "redirect:/ingredient/admin_ing_list";
	}

	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req, HttpServletResponse res,
			@RequestParam MultipartFile upload) throws Exception {
		// 랜덤 문자 생성
		UUID uid = UUID.randomUUID();

		OutputStream out = null;
		PrintWriter printWriter = null;

		// 인코딩
		res.setCharacterEncoding("UTF-8");
		res.setContentType("text/html;charset=UTF-8");

		try {

			String fileName = upload.getOriginalFilename(); // 파일 이름 가져오기
			byte[] bytes = upload.getBytes();

			// 업로드 경로
			String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;

			out = new FileOutputStream(new File(ckUploadPath));
			out.write(bytes);
			out.flush(); // out에 저장된 데이터를 전송하고 초기화

			String callback = req.getParameter("CKEditorFuncNum");
			printWriter = res.getWriter();
			String fileUrl = "/ckUpload/" + uid + "_" + fileName; // 작성화면

			// 업로드시 메시지 출력
			printWriter.println("<script type='text/javascript'>" + "window.parent.CKEDITOR.tools.callFunction("
					+ callback + ",'" + fileUrl + "','이미지를 업로드하였습니다.')" + "</script>");

			printWriter.flush();

		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (out != null) {
					out.close();
				}
				if (printWriter != null) {
					printWriter.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return;
	}
	/* 관리자 식재료 조회 페이지로 이동 */

	@RequestMapping(value = "/ingredient/admin_ing_view")
	public String read(@RequestParam("n") int ingNum, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		IngredientVO ingredient = ingredientService.ingView(ingNum);
		model.addAttribute("ingredient", ingredient);
		model.addAttribute("scri", scri);
		return "ingredient/admin_ing_view";
	}

	/* 관리자 식재료 수정 페이지로 이동 */
	@RequestMapping(value = "/ingredient/ingModify")
	public String updateView(@RequestParam("n") int ingNum, @ModelAttribute("scri") SearchCriteria scri, Model model) {

		IngredientVO ingredient = ingredientService.ingView(ingNum);
		model.addAttribute("ingredient", ingredient);
		model.addAttribute("scri", scri);

		return "ingredient/admin_ing_update";
	}

	// 식재료 수정
	@RequestMapping(value = "/ingredient/modify")
	public String update(IngredientVO vo, MultipartFile file, HttpServletRequest req,
			@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {

		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("ingImg")).delete();
			new File(uploadPath + req.getParameter("ingThumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = FileUtils.calcPath(imgUploadPath);
			String fileName = FileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setIngImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setIngThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setIngImg(req.getParameter("ingImg"));
			vo.setIngThumbImg(req.getParameter("ingThumbImg"));

		}

		ingredientService.ingredientModify(vo);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/ingredient/admin_ing_list";
	}

	@RequestMapping(value = "/ingredient/delete")
	public String delete(@RequestParam("n") int ingNum, @ModelAttribute("scri") SearchCriteria scri,
			RedirectAttributes rttr) throws Exception {

		ingredientService.ingredientDelete(ingNum);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		return "redirect:/ingredient/admin_ing_list";
	}

	/* 판매 식재료 목록 페이지로 이동 */
	@RequestMapping("/ingredient/sell_ing_list")
	public String sellIngList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		List<IngredientVO> sellIngList = null;
		sellIngList = ingredientService.sellIngList(scri);

		model.addAttribute("sellIngList", sellIngList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(ingredientService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "ingredient/sell_ing_list";
	}

	/* 판매 식재료 목록 카테고리별 이동 */
	@RequestMapping("/ingredient/sellIngCateList")
	public String sellIngList(@RequestParam("c") String ingCateCode, Model model,
			@ModelAttribute("scri") SearchCriteria scri) {
		List<IngredientVO> sellIngList = null;
		sellIngList = ingredientService.sellIngCateList(ingCateCode);

		model.addAttribute("sellIngList", sellIngList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(ingredientService.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "ingredient/sell_ing_list";
	}

	// 식재료 내용
	@RequestMapping("/ingredient/sellIngView")
	public String sellIngView(@RequestParam("n") int ingNum, Model model, @ModelAttribute("scri") SearchCriteria scri) {
		IngredientVO sellIngView = ingredientService.sellIngView(ingNum);
		model.addAttribute("sellIngView", sellIngView);
		model.addAttribute("scri", scri);
		return "ingredient/sell_ing_view";
	}

	// 상품 소감(댓글) 작성
	@ResponseBody
	@RequestMapping(value = "/ingredient/ing_reply_write")
	public void writeReply(IngReplyVO replyVO, HttpSession session) throws Exception {

		MemberVO member = (MemberVO) session.getAttribute("member");
		replyVO.setUserId(member.getUserId());

		ingredientService.registIngReply(replyVO);
	}

	// 상품 후기(댓글) 목록
	@ResponseBody
	@RequestMapping(value = "/ingredient/ing_reply_List")
	public List<IngReplyListVO> getReplyList(@RequestParam("n") int ingNum) {

		List<IngReplyListVO> ingReplyList = ingredientService.ingReplyList(ingNum);

		return ingReplyList;
	}

	// 상품 후기(댓글) 삭제
	@ResponseBody
	@RequestMapping(value = "/ingredient/deleteIngReply")
	public int deleteReplyList(IngReplyVO replyVO, HttpSession session) {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = ingredientService.idCheck(replyVO.getRepNum());

		if (member.getUserId().equals(userId)) {

			replyVO.setUserId(member.getUserId());
			ingredientService.deleteIngReply(replyVO);

			result = 1;
		}

		return result;

	}

	// 상품 소감(댓글) 수정
	@ResponseBody
	@RequestMapping(value = "/ingredient/modifyIngReply")
	public int updateReply(IngReplyVO replyVO, HttpSession session) {

		int result = 0;

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = ingredientService.idCheck(replyVO.getRepNum());

		if (member.getUserId().equals(userId)) {

			replyVO.setUserId(member.getUserId());
			ingredientService.modifyIngReply(replyVO);
			result = 1;
		}

		return result;
	}
}

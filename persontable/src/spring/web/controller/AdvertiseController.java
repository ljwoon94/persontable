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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import spring.web.svc.AdvertiseService;
import spring.web.util.FileUtils;
import spring.web.vo.AdvertiseVO;
import spring.web.vo.PageMaker;
import spring.web.vo.SearchCriteria;

@Controller
@RequestMapping("/advertise/*")
public class AdvertiseController {

	@Autowired
	AdvertiseService service;

	@Resource(name = "uploadPath")
	private String uploadPath;

	/* 관리자 식재료 목록페이지로 이동 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String adList(Model model, AdvertiseVO vo, @ModelAttribute("scri") SearchCriteria scri) throws Exception {
		List<AdvertiseVO> adList = service.adList(scri);
		model.addAttribute("adList", adList);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));

		model.addAttribute("pageMaker", pageMaker);
		return "advertise/advertiseList";
	}

	/* 관리자 식재료 등록페이지로 이동 */
	@RequestMapping(value = "/registView", method = RequestMethod.GET)
	public String adRegistView(Model model) {

		return "advertise/registView";
	}

	@RequestMapping(value = "/regist", method = RequestMethod.POST)
	public String adRegist(AdvertiseVO vo, MultipartFile file) throws Exception {

		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = FileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			fileName = FileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setAdImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setAdThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		} else {
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png파일을 대신 출력함

			vo.setAdImg(fileName);
			vo.setAdThumbImg(fileName);
		}

		vo.setAdImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		vo.setAdThumbImg(
				File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		service.adRegist(vo);
		return "redirect:/advertise/list";
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

	@RequestMapping(value = "/readView", method = RequestMethod.GET)
	public String adRead(AdvertiseVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model) throws Exception {
		AdvertiseVO advertise = service.adRead(vo.getAdNum());
		model.addAttribute("advertise", advertise);
		model.addAttribute("scri", scri);

		return "advertise/readView";
	}

	/* 관리자 식재료 수정 페이지로 이동 */
	@RequestMapping(value = "/updateView", method = RequestMethod.GET)
	public String adUpdateView(AdvertiseVO vo, @ModelAttribute("scri") SearchCriteria scri, Model model)
			throws Exception {

		AdvertiseVO advertise = service.adRead(vo.getAdNum());
		model.addAttribute("advertise", advertise);

		return "advertise/updateView";
	}

	// 식재료 수정
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String adUpdate(AdvertiseVO vo, MultipartFile file, HttpServletRequest req,
			@ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr) throws Exception {

		// 새로운 파일이 등록되었는지 확인
		if (file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 기존 파일을 삭제
			new File(uploadPath + req.getParameter("adImg")).delete();
			new File(uploadPath + req.getParameter("adThumbImg")).delete();

			// 새로 첨부한 파일을 등록
			String imgUploadPath = uploadPath + File.separator + "imgUpload";
			String ymdPath = FileUtils.calcPath(imgUploadPath);
			String fileName = FileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);

			vo.setAdImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			vo.setAdThumbImg(
					File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

		} else { // 새로운 파일이 등록되지 않았다면
			// 기존 이미지를 그대로 사용
			vo.setAdImg(req.getParameter("adImg"));
			vo.setAdThumbImg(req.getParameter("adThumbImg"));

		}

		service.update(vo);

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/advertise/list";
	}

	@RequestMapping(value = "/delete")
	public String adDelete(AdvertiseVO vo, @ModelAttribute("scri") SearchCriteria scri, RedirectAttributes rttr)
			throws Exception {

		service.delete(vo.getAdNum());

		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());

		return "redirect:/advertise/list";
	}
}

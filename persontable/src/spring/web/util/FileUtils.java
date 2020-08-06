package spring.web.util;

import java.io.File;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import net.coobird.thumbnailator.Thumbnails;
import spring.web.vo.BoardVO;

@Component("fileUtils")
public class FileUtils {
	 static final int THUMB_WIDTH = 300;
	 static final int THUMB_HEIGHT = 300;
	
private static final String filePath = "c:\\persontable\\file\\"; // 파일이 저장될 위치
	
	public List<Map<String, Object>> parseInsertFileInfo(BoardVO boardVO, 
			MultipartHttpServletRequest mpRequest) throws Exception{
		
		/*
			Iterator은 데이터들의 집합체? 에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스입니다.
			List나 배열은 순차적으로 데이터의 접근이 가능하지만, Map등의 클래스들은 순차적으로 접근할 수가 없습니다.
			Iterator을 이용하여 Map에 있는 데이터들을 while문을 이용하여 순차적으로 접근합니다.
		*/
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int bno = boardVO.getBno();
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		}
		
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("BNO", bno);
				listMap.put("ORG_FILE_NAME", originalFileName);
				listMap.put("STORED_FILE_NAME", storedFileName);
				listMap.put("FILE_SIZE", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}
	
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	public static String fileUpload(String uploadPath,
	         String fileName,
	         byte[] fileData, String ymdPath) throws Exception {

	  UUID uid = UUID.randomUUID();
	  
	  String newFileName = uid + "_" + fileName;
	  String imgPath = uploadPath + ymdPath;

	  File target = new File(imgPath, newFileName);
	  FileCopyUtils.copy(fileData, target);
	  
	  String thumbFileName = "s_" + newFileName;
	  File image = new File(imgPath + File.separator + newFileName);

	  File thumbnail = new File(imgPath + File.separator + "s" + File.separator + thumbFileName);

	  if (image.exists()) {
	   thumbnail.getParentFile().mkdirs();
	   Thumbnails.of(image).size(THUMB_WIDTH, THUMB_HEIGHT).toFile(thumbnail);
	  }
	  return newFileName;
	 }

	 public static String calcPath(String uploadPath) {
	  Calendar cal = Calendar.getInstance();
	  String yearPath = File.separator + cal.get(Calendar.YEAR);
	  String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	  String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));

	  makeDir(uploadPath, yearPath, monthPath, datePath);
	  makeDir(uploadPath, yearPath, monthPath, datePath + "\\s");

	  return datePath;
	 }

	 private static void makeDir(String uploadPath, String... paths) {

	  if (new File(paths[paths.length - 1]).exists()) { return; }

	  for (String path : paths) {
	   File dirPath = new File(uploadPath + path);

	   if (!dirPath.exists()) {
	    dirPath.mkdir();
	   }
	  }
	 }
	
}
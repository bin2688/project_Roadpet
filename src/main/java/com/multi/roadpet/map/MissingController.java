package com.multi.roadpet.map;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class MissingController {

	@Autowired
	MissingService missingService;
	
	@RequestMapping(value = "map/all", produces = "application/json") // all 검색
	@ResponseBody
	public List<MissingVO> all() {
		return missingService.all();
	}

	@RequestMapping("map/insert")
	public void insert(MissingVO missingVO, MultipartFile file, HttpServletRequest request, Model model) throws Exception {

		System.out.println(missingVO);
		String savedName = file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(uploadPath + "/" + savedName);

		// 2. File객체(폴더/디렉토리 + 파일명)를 생성 ==> 파일을 인식(램에 저장)
		File target = new File(uploadPath + "/" + savedName);

		// 3. 서버 컴퓨터에 파일을 저장시켜야한다. ==> resources아래에 저장!
		file.transferTo(target);

		model.addAttribute("savedName", savedName);
		missingVO.setPet_img(savedName);

		missingService.insert(missingVO);
		model.addAttribute("MissingVO", missingVO);
		
	}

}

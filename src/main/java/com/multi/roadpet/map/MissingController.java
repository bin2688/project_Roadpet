package com.multi.roadpet.map;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public void insert(MissingVO missingVO, @RequestParam("files") List<MultipartFile> files, HttpServletRequest request, Model model) throws Exception {

		System.out.println(missingVO);// test
		String saveToDataBaseFileName = ""; // DB에 보낼 이름 저장변수
		String id = UUID.randomUUID().toString(); // 사진 파일 변환할 ID
		int fileNameCount = 0;
		System.out.println(id);// test
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(uploadPath);

		for (MultipartFile file : files) {
			String orginalFileName = file.getOriginalFilename();
			String savedName = Integer.toString(fileNameCount++) + id + orginalFileName.substring(orginalFileName.lastIndexOf("."));
			File target = new File(uploadPath + "/" + savedName);
			try {
				file.transferTo(target);
			} catch (IOException e) {
				e.printStackTrace();
			}

			if (saveToDataBaseFileName == "") {
				saveToDataBaseFileName = savedName;
			} else {
				saveToDataBaseFileName = saveToDataBaseFileName + "," + savedName;
			}
			System.out.println(saveToDataBaseFileName);
		}
		model.addAttribute("saveToDataBaseFileName", saveToDataBaseFileName);
		missingVO.setPet_img(saveToDataBaseFileName);

		missingService.insert(missingVO);
		model.addAttribute("MissingVO", missingVO);

	}

}

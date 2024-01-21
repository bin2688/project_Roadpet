package com.multi.roadpet.map;

import java.io.IOException;
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
	
<<<<<<< HEAD
	@RequestMapping(value="map",produces = "application/json") //all 寃��깋 
=======
	@RequestMapping(value="map",produces = "application/json") //all 검색 
>>>>>>> parent of 58559d6 (2024-01-21 <마커 등록까지 구현 완료>)
	@ResponseBody
	public List<MissingVO> all() {
		return missingService.all();
	}

<<<<<<< HEAD
=======
	@RequestMapping(value = "map", produces = "application/json")
	public void insert(MissingVO missingVO, HttpServletRequest request, MultipartFile file, Model model) throws IllegalStateException, IOException {

	}
>>>>>>> parent of 58559d6 (2024-01-21 <마커 등록까지 구현 완료>)
}

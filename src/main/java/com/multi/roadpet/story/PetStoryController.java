package com.multi.roadpet.story;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

@Controller // 싱글톤 + 컨트롤러 등록
public class PetStoryController {

	@Autowired
	PetStoryService petstoryService;
	
	@RequestMapping("story/PetStory_insert")
	public void insert2(PetStoryVO petstoryVO, 
						HttpServletRequest request, 
						MultipartFile file, Model model) throws Exception {

		//1. 파일의 이름 + 파일 저장 위치를 알아와야한다. ==> String!
		String savedName = file.getOriginalFilename();
		String uploadPath= request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(uploadPath + "/" + savedName);
		
		//2. File객체(폴더/디렉토리 + 파일명)를 생성 ==> 파일을 인식(램에 저장)
		File target = new File(uploadPath + "/" + savedName);
		
		//3. 서버 컴퓨터에 파일을 저장시켜야한다. ==> resources아래에 저장! 
		file.transferTo(target);
		
		model.addAttribute("savedName",savedName);
		petstoryVO.setStory_photo(savedName);
		
		System.out.println(petstoryVO);
		petstoryService.insert(petstoryVO);
		model.addAttribute("petstoryVO", petstoryVO);
	}
	

	@RequestMapping("story/PetStory_list")
	public void list(PetStoryPageVO petstoryPageVO, Model model) throws Exception {
		//dao를 이용해서 여러개를 받아서 가지고 와주세요.
		petstoryPageVO.setStartEnd();
		System.out.println(petstoryPageVO);
		List<PetStoryVO> list = petstoryService.list(petstoryPageVO);
		
		System.out.println(list.size());
		//전체 페이지수 구하기
		int count = petstoryService.pageCount();
		System.out.println("게시물 개수>>" + count);
		int pages = count / 6;
		if (count%6 !=0) {
			pages = count / 6 + 1;
		}
	
		//views/list.jsp까지 넘어가야 함.==>Model
		//model을이용해서 검색결과인 list를 list.jsp까지 넘기자.!
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
	}
	
	@RequestMapping("story/PetStory_one")
	public void one(PetStoryVO petstoryVO, Model model) {
		PetStoryVO bag = petstoryService.one(petstoryVO);
		model.addAttribute("bag",bag);
	}
}

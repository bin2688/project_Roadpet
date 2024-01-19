package com.multi.roadpet.story;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.multi.roadpet.pet.PetInfoVO;

@Controller // �떛湲��넠 + 而⑦듃濡ㅻ윭 �벑濡�
public class PetStoryController {

	@Autowired
	PetStoryService petstoryService;
	
	@Autowired
	ReplyService replyService;
	
	@RequestMapping("story/PetStory_insert")
	public void insert2(PetStoryVO petstoryVO, 
						HttpServletRequest request, 
						MultipartFile file, Model model) throws Exception {

		//1. �뙆�씪�쓽 �씠由� + �뙆�씪 ���옣 �쐞移섎�� �븣�븘���빞�븳�떎. ==> String!
		String savedName = file.getOriginalFilename();
		String uploadPath= request.getSession().getServletContext().getRealPath("/resources/upload");
		System.out.println(uploadPath + "/" + savedName);
		
		//2. File媛앹껜(�뤃�뜑/�뵒�젆�넗由� + �뙆�씪紐�)瑜� �깮�꽦 ==> �뙆�씪�쓣 �씤�떇(�옩�뿉 ���옣)
		File target = new File(uploadPath + "/" + savedName);
		
		//3. �꽌踰� 而댄벂�꽣�뿉 �뙆�씪�쓣 ���옣�떆耳쒖빞�븳�떎. ==> resources�븘�옒�뿉 ���옣! 
		file.transferTo(target);
		
		model.addAttribute("savedName",savedName);
		petstoryVO.setStory_photo(savedName);
		
		System.out.println(petstoryVO);
		petstoryService.insert(petstoryVO);
		model.addAttribute("petstoryVO", petstoryVO);
	}
	

	@RequestMapping("story/PetStory_list")
	public void list(PetStoryPageVO petstoryPageVO, Model model) throws Exception {
		//dao瑜� �씠�슜�빐�꽌 �뿬�윭媛쒕�� 諛쏆븘�꽌 媛�吏�怨� ��二쇱꽭�슂.
		petstoryPageVO.setStartEnd();
		System.out.println(petstoryPageVO);
		List<PetStoryVO> list = petstoryService.list(petstoryPageVO);
		
		System.out.println(list.size());
		//�쟾泥� �럹�씠吏��닔 援ы븯湲�
		int count = petstoryService.pageCount();
		System.out.println("寃뚯떆臾� 媛쒖닔>>" + count);
		int pages = count / 6;
		if (count%6 !=0) {
			pages = count / 6 + 1;
		}
	
		//views/list.jsp源뚯� �꽆�뼱媛��빞 �븿.==>Model
		//model�쓣�씠�슜�빐�꽌 寃��깋寃곌낵�씤 list瑜� list.jsp源뚯� �꽆湲곗옄.!
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
	}
	
	@RequestMapping("story/PetStory_one")
	public void one(PetStoryVO petstoryVO, Model model) {
		PetStoryVO bag = petstoryService.one(petstoryVO);//�긽�꽭�젙蹂� 
		//�뙎湲�由ъ뒪�듃 
		System.out.println(bag.getStory_id());
		List<ReplyVO> list = replyService.list(petstoryVO.getStory_id());
		System.out.println(list.size());
		model.addAttribute("bag",bag);
		model.addAttribute("list", list);
	}
	@RequestMapping("story/PetStory_delete")
	public void delete(PetStoryVO petstoryVO, Model model) {
		System.out.println(petstoryVO);
		petstoryService.delete(petstoryVO);
		model.addAttribute("petstoryVO", petstoryVO);
	}
	@RequestMapping("story/PetStory_update")
	public void update(PetStoryVO petstoryVO, Model model) {
		System.out.println(petstoryVO);
		petstoryService.update(petstoryVO);
		model.addAttribute("petstoryVO", petstoryVO);
	}
	@RequestMapping("pet/PetStory_list2")
	public void list2(Model model) throws Exception {
		List<PetStoryVO> list2 = petstoryService.list2();
		System.out.println(list2.size());
		model.addAttribute("list2", list2);
	}
}

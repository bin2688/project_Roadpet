package com.multi.roadpet.story;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
		System.out.println("게시물 개수>>" + count);
		int pages = count / 6;
		if (count%6 !=0) {
			pages += 1;
		}
	
		//views/list.jsp源뚯� �꽆�뼱媛��빞 �븿.==>Model
		//model�쓣�씠�슜�빐�꽌 寃��깋寃곌낵�씤 list瑜� list.jsp源뚯� �꽆湲곗옄.!
		model.addAttribute("list", list);
		model.addAttribute("pages", pages);
		model.addAttribute("count", count);
	}
	
	@RequestMapping("story/PetStory_one")
	public void one(PetStoryVO petstoryVO, Model model) {

		System.out.println("상세검색 --->" + petstoryVO);
		PetStoryVO bag = petstoryService.one(petstoryVO);//상세정보 
		//댓글리스트 
		System.out.println(bag);
		System.out.println("bag.getStory_id() : " + bag.getStory_id());
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
		//정보가져오기
		PetStoryVO bag = petstoryService.one(petstoryVO);
		//model저장
		model.addAttribute("bag", bag);
	}
	@RequestMapping("story/update2")
	public String update2(PetStoryVO petstoryVO, Model model ) {
		System.out.println("수정내용 받음. ---- " + petstoryVO);
		petstoryService.update(petstoryVO);
		return "redirect:PetStory_one?story_id=" + petstoryVO.getStory_id();
	}

	@RequestMapping("pet/PetStory_list2")
	public void list2(PetStoryVO petstoryVO, Model model, HttpSession session) throws Exception {
		int user_id = (int) session.getAttribute("user_id");
		System.out.println(user_id);		
		petstoryVO.setUser_id((user_id));
		
		List<PetStoryVO> list2 = petstoryService.mystorylist(petstoryVO);
		System.out.println(list2.size());
		model.addAttribute("list2", list2);
	}
}

package com.multi.roadpet.pet;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PetWalkController {

	@Autowired
	PetWalkService petwalkService;
	
	@RequestMapping("pet/pet_walk_insert")
	public void insert(PetWalkVO petwalkVO,	Model model) throws IllegalStateException, IOException {
		petwalkService.insert(petwalkVO);
		model.addAttribute("petWalkVO",petwalkVO);
	
	}
	
	@RequestMapping("pet/pet_walk_one")
	public void one(int pet_id, Model model) {
		PetInfoVO dto = petwalkService.one2(pet_id);
		System.out.println(dto);
		model.addAttribute("dto",dto);
	}
	
	@RequestMapping("pet/pet_walk_today")
	public void list( PetWalkVO petwalkVO, Model model , HttpSession session) throws Exception {
		int user_id = (int) session.getAttribute("user_id");
		petwalkVO.setUser_id(user_id);
		List<PetWalkVO> list= petwalkService.list(petwalkVO);
		System.out.println("¿À´Ã »êÃ¥ "+list.size());
		model.addAttribute("list",list);
	}
	
	@RequestMapping("pet/pet_walk_week")
	public void list2(PetWalkVO petwalkVO, Model model , HttpSession session) throws Exception {
		int user_id = (int) session.getAttribute("user_id");
		petwalkVO.setUser_id(user_id);
		List<PetWalkVO> list2= petwalkService.list2(petwalkVO);
		System.out.println(list2.size());
		model.addAttribute("list2",list2);
	}
	
	@RequestMapping("pet/all_walk_week")
	public void list3(PetWalkVO petwalkVO, Model model) throws Exception {
		List<PetWalkVO> list3= petwalkService.list3(petwalkVO);
		System.out.println("¸ðµç »êÃ¥·©Å·"+list3.size());
		model.addAttribute("list3",list3);
	}
	
}

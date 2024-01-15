package com.multi.roadpet.pet;

import java.io.IOException;
import java.util.List;

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
	public void list(Model model) throws Exception {
		List<PetWalkVO> list= petwalkService.list();
		System.out.println("ø¿¥√ ªÍ√• "+list.size());
		model.addAttribute("list",list);
	}
	
	@RequestMapping("pet/pet_walk_week")
	public void list2(Model model) throws Exception {
		List<PetWalkVO> list2= petwalkService.list2();
		System.out.println(list2.size());
		model.addAttribute("list2",list2);
	}
	
}

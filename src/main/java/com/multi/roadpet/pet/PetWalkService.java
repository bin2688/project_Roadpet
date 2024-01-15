package com.multi.roadpet.pet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetWalkService {

	@Autowired
	PetWalkDAO dao;
	
	
	public void insert(PetWalkVO petwalkVO) {
		dao.insert(petwalkVO);
	}
	public PetWalkVO one(int pet_id) { //id=4
		return dao.one(pet_id);
	}
	public PetInfoVO one2(int pet_id) { //id=4
		return dao.one2(pet_id);
	}
	public List<PetWalkVO> list() throws Exception{ //id=4
		List<PetWalkVO> list =dao.list();
		return list;
	}
	public List<PetWalkVO> list2() throws Exception{ //id=4
		List<PetWalkVO> list =dao.list2();
		return list;
	}
	
}

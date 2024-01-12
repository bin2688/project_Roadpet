package com.multi.roadpet.pet;

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
	public PetWalkVO one3(String walk_date ) { //id=4
		return dao.one3(walk_date);
	}
}

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
	public List<PetWalkVO> list(PetWalkVO petwalkVO) throws Exception{ //id=4
		List<PetWalkVO> list =dao.list(petwalkVO);
		return list;
	}
	public List<PetWalkVO> list2(PetWalkVO petwalkVO) throws Exception{ //id=4
		List<PetWalkVO> list2 =dao.list2(petwalkVO);
		return list2;
	}
	public List<PetWalkVO> list3(PetWalkVO petwalkVO) throws Exception{ //id=4
		List<PetWalkVO> list3 =dao.list3(petwalkVO);
		return list3;
	}
	
}

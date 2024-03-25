package com.multi.roadpet.pet;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;





@Service
public class PetInfoService {

	@Autowired
	PetInfoDAO dao;
	
	public void insert(PetInfoVO petInfoVO) {
		dao.insert(petInfoVO);
	}
	
	public int update(PetInfoVO petInfoVO) {
		int result = dao.update(petInfoVO);
		return result;
	}
	public PetInfoVO one(int pet_id) { //id=4
		return dao.one(pet_id);
	}
	public int delete(PetInfoVO petInfoVO) {
		int result = dao.delete(petInfoVO);
		
		return result;
	}
	public List<PetInfoVO> list(PetInfoVO petinfoVO) throws Exception {
		List<PetInfoVO> list = dao.list(petinfoVO);
		
		return list;
	}
	public List<PetInfoVO> all_list() throws Exception {
		List<PetInfoVO> all_list = dao.all_list();
		
		return all_list;
	}

	
	
}
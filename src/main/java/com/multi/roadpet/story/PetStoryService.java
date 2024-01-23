package com.multi.roadpet.story;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PetStoryService {
	
	@Autowired
	PetStoryDAO dao;
	
	public void insert(PetStoryVO petstoryVO) {
		dao.insert(petstoryVO);
	}
	public List<PetStoryVO> list(PetStoryPageVO petstoryPageVO) throws Exception {
		List<PetStoryVO> list = dao.list(petstoryPageVO);
		
		return list;
	}
	public PetStoryVO one(PetStoryVO petstoryVO) {
		return dao.one(petstoryVO);
	}
	public int pageCount() {
		return dao.count();
	}
	public void delete(PetStoryVO petstoryVO) {
		dao.delete(petstoryVO);
	}
	public void update(PetStoryVO petstoryVO) {
		dao.update(petstoryVO);
	}
	//������ view �κ�
	public List<PetStoryVO> list2() throws Exception {
		List<PetStoryVO> list2 = dao.list2();
		return list2;
	}
}

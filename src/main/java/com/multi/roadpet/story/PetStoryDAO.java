package com.multi.roadpet.story;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.roadpet.pet.PetInfoVO;


@Repository
public class PetStoryDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(PetStoryVO petstoryVO) {
		my.insert("petstory.insert", petstoryVO);
	}
	
	
	public List<PetStoryVO> list(PetStoryPageVO petstoryPageVO) throws Exception {
		List<PetStoryVO> list = my.selectList("petstory.list", petstoryPageVO);
		return list;
	}
	public PetStoryVO one(PetStoryVO petstoryVO) {
		return my.selectOne("petstory.one", petstoryVO);
	}
	
	public int count() {
		return my.selectOne("petstory.count");
	}
	public void delete(PetStoryVO petstoryVO) {
		my.delete("petstory.delete", petstoryVO);
	}
	public void update(PetStoryVO petstoryVO) {
		my.update("petstory.update", petstoryVO);
	}
	//∏∂¿Ã∆Í view ∫Œ∫–
	public List<PetStoryVO> mystorylist(PetStoryVO petstoryVO) throws Exception {
		List<PetStoryVO> list2=my.selectList("petstory.mystorylist",petstoryVO);
		return list2;
	}
}

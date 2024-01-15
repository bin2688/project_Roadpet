package com.multi.roadpet.story;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class PetStoryDAO {
	
	@Autowired
	SqlSessionTemplate my;
	
	public void insert(PetStoryVO petstoryVO) {
		my.insert("petstory.insert", petstoryVO);
	}
	// 리스트 전체 보기
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
	
}

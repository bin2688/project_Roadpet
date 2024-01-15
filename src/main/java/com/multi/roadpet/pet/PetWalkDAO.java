package com.multi.roadpet.pet;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PetWalkDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(PetWalkVO petwalkVO) {
		my.insert("petWalk.insert",petwalkVO);
	}
	public PetWalkVO one(int pet_id) { //id=4
		return my.selectOne("petWalk.one", pet_id);	
	}
	public PetInfoVO one2(int pet_id) { //id=4
		return my.selectOne("petInfo.one", pet_id);	
	} //산책페이지에서 사진, 이름 가져오기
	
	public List<PetWalkVO> list() throws Exception { 
		List<PetWalkVO> list = my.selectList("petWalk.today_list");	
		return list;
	} // 날짜에 따른 산책 정보 가져오기
	
	public List<PetWalkVO> list2() throws Exception { 
		List<PetWalkVO> list = my.selectList("petWalk.week_list");	
		return list;
	} // 날짜에 따른 산책 정보 가져오기
}

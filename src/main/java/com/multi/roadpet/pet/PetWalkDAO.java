package com.multi.roadpet.pet;

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
	
	public PetWalkVO one3(String walk_date) { 
		return my.selectOne("petWalk.today", walk_date);	
	} // 날짜에 따른 산책 정보 가져오기
}

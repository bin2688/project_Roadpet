package com.multi.roadpet.pet;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.multi.roadpet.pet.PetInfoVO;




@Repository
public class PetInfoDAO {

	@Autowired
	SqlSessionTemplate my;
	
	public void insert(PetInfoVO petInfoVO) {
		my.insert("petInfo.insert",petInfoVO);
	}
	
	public int update(PetInfoVO petInfoVO) {
		int result = my.update("petInfo.update", petInfoVO);
		return result;
	}
	public PetInfoVO one(int pet_id) { //id=4
		return my.selectOne("petInfo.one", pet_id);	
	}
	
	public int delete(PetInfoVO petInfoVO) {
		int result = my.delete("petInfo.delete", petInfoVO);
		
		return result;
	}
	public List<PetInfoVO> list(PetInfoVO petinfoVO) throws Exception {
		List<PetInfoVO> list=my.selectList("petInfo.list",petinfoVO);
		return list;
	}
	public List<PetInfoVO> all_list() throws Exception {
		List<PetInfoVO> list=my.selectList("petInfo.all_list");
		return list;
	}
	
}
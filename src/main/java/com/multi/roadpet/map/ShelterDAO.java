package com.multi.roadpet.map;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShelterDAO {

	@Autowired
	SqlSessionTemplate my;

	public List<ShelterVO> sheltermark() {
		// TODO Auto-generated method stub
		System.out.println("shelter->sheltermark");
		return my.selectList("shelter.sheltermark");
	}
}

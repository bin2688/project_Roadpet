package com.multi.roadpet.map;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MissingDAO {

	@Autowired
	SqlSessionTemplate my;
	
	//전체리스트 가지고 오는 기능 
	public List<MissingVO> all() {
		System.out.println("missing->all");
		return my.selectList("missing.all");
	}

	public void insert(MissingVO missingVO) {
		System.out.println("missing->insert");
		my.insert("missing.insert", missingVO);
	}

	public List<MissingVO> missingmark() {
		// TODO Auto-generated method stub
		System.out.println("missing->missingmark");
		return my.selectList("missing.missingmark");
	}

}

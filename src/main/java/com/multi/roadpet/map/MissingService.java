package com.multi.roadpet.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MissingService {

	@Autowired
	MissingDAO mdao;

	@Autowired
	ShelterDAO sdao;
	
	//전체리스트 가지고 오는 기능 
	public List<MissingVO> all() {
		return mdao.all();
	}

	@Transactional
	public void insert(MissingVO missingVO) {
		// TODO Auto-generated method stub
		mdao.insert(missingVO);
	}

	public List<MissingVO> missingmark() {
		// TODO Auto-generated method stub
		return mdao.missingmark();
	}

	public List<ShelterVO> sheltermark() {
		// TODO Auto-generated method stub
		return sdao.sheltermark();
	}

	public MissingVO getMissingForm(String missingId) {
		// TODO Auto-generated method stub
		return mdao.getMissingForm(missingId);
	}
}

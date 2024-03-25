package com.multi.roadpet.lounge;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoungeServicelmpl implements LoungeService {
	
	@Autowired
	LoungeDAO loungeDAO;
	
	@Override
	public void insert(LoungeVO loungeVO) {
		loungeDAO.insert(loungeVO);
	}
	
	@Override
	public void updateSend(LoungeVO loungeVO) {
		loungeDAO.updateSend(loungeVO);
	}
	
	@Override
	public void delete(LoungeVO loungeVO) {
		loungeDAO.delete(loungeVO);
	}
	
	@Override
	public List<LoungeVO> list(HashMap<String, Object> loungeMap) {		
		return loungeDAO.list(loungeMap);
	}
	
	@Override
	public LoungeVO detail(LoungeVO loungeVO) {
		return loungeDAO.detail(loungeVO);
	}
	
	@Override
	public int pageCount(String keyWord, String searchType) {
		if (keyWord == null || keyWord.trim().equals("") && searchType == null) {
		 return loungeDAO.countAll();
		}else {
		 return loungeDAO.countSearch(keyWord, searchType);
		}
	}
	
	@Override
	public List<LoungeVO> bestList(LoungeVO loungeVO) {
		return loungeDAO.bestList(loungeVO);
	}
}

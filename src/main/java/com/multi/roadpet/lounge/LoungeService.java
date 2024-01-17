package com.multi.roadpet.lounge;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class LoungeService implements LoungeServiceInterface {
	
	@Autowired
	LoungeDAOInterface loungeDAO;
	
	@Override
	public void insert(LoungeVO loungeVO) {
		loungeDAO.insert(loungeVO);
	}
	
	@Override
	public void update(LoungeVO loungeVO) {
		loungeDAO.update(loungeVO);
	}
	
	@Override
	public void delete(LoungeVO loungeVO) {
		loungeDAO.delete(loungeVO);
	}
	
	@Override
	public List<LoungeVO> list(LoungePageVO loungePageVO) {	
		return loungeDAO.list(loungePageVO);
	}
	
	@Override
	public LoungeVO one(LoungeVO loungeVO) {
		return loungeDAO.one(loungeVO);
	}
	
	@Override
	public int pageCount(String keyWord, String searchType) {
		if (keyWord == null || keyWord.trim().equals("") && searchType == null) {
		 return loungeDAO.countAll();
		}else {
		 return loungeDAO.countSearch(keyWord, searchType);
		}
	}
}

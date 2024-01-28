
package com.multi.roadpet.lounge;


import java.util.HashMap;
import java.util.List;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;


import java.io.File;

@Controller
public class LoungeController {
	
	@Autowired
	LoungeService loungeService;	
	@Autowired
	LoungeReplyService lngRpService;
	@Autowired
	LoungeLikeService loungeLikeService;
	
	@RequestMapping("lounge/insert")
	public String insert(LoungeVO loungeVO,
			HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
	        String savedName = file.getOriginalFilename();
	        String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
	        File target = new File(uploadPath, savedName);
	        // 이미지 파일이 존재하면 업로드
	        file.transferTo(target);
	        loungeVO.setLounge_img(savedName);
	    } else {
	        // 이미지 파일이 없으면 null로 처리
	        loungeVO.setLounge_img(null);
	    }
		loungeService.insert(loungeVO);		
		return "redirect:detail?lounge_id=" + loungeVO.getLounge_id();	
	}

	
	@RequestMapping("lounge/update")
	public void update(LoungeVO loungeVO,Model model) {
		LoungeVO bag = loungeService.detail(loungeVO);
		model.addAttribute("bag", bag);
	}
	
	
	@RequestMapping("lounge/updateSend")
	public String updateSend(LoungeVO loungeVO,
			HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {
		if (!file.isEmpty()) {
	        String savedName = file.getOriginalFilename();
	        String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
	        File target = new File(uploadPath, savedName);
	        // 이미지 파일이 존재하면 업로드
	        file.transferTo(target);
	        loungeVO.setLounge_img(savedName);
	    } else {
	        // 이미지 파일이 없으면 null로 처리
	        loungeVO.setLounge_img(null);
	    }
		loungeService.updateSend(loungeVO);
		return "redirect:detail?lounge_id=" + loungeVO.getLounge_id();	
	}
	
	
	@RequestMapping("lounge/delete")
	public String delete(LoungeVO loungeVO) {
		loungeService.delete(loungeVO);
		return "redirect:list?page=1";
	}
	
	
	@RequestMapping("lounge/list")
	public void list(@RequestParam(value = "searchType", required = false) String searchType, HttpSession session,
					 @RequestParam(value = "keyWord", required = false) String keyWord, LoungePageVO loungePageVO, Model model) throws Exception {	
		loungePageVO.setSearchType(searchType);
		loungePageVO.setKeyWord(keyWord);
		loungePageVO.setStartEnd();
		LoungeVO loungeVO = new LoungeVO();	
		if(session.getAttribute("user_id") != null) {
			loungeVO.setUser_id((int)session.getAttribute("user_id"));
		}else {
			loungeVO.setUser_id(0);
		}		
		List<LoungeVO> bestList = loungeService.bestList(loungeVO);
		HashMap<String, Object> loungeMap = new HashMap<String, Object>();		
		loungeMap.put("loungePageVO", loungePageVO);
		loungeMap.put("loungeVO", loungeVO);		

		List<LoungeVO> list = loungeService.list(loungeMap);

		int count = loungeService.pageCount(keyWord, searchType);
		int pages = count/5;
		if (count%5 != 0) {
			pages += 1;
		}	

		model.addAttribute("bestList", bestList);	
		model.addAttribute("list", list);	
		model.addAttribute("pages", pages);	
		model.addAttribute("searchType", searchType);	
		model.addAttribute("keyWord", keyWord);

		}
	
	
	@RequestMapping("lounge/pageList")
	public void pageList(@RequestParam(value = "searchType", required = false) String searchType, HttpSession session,
						 @RequestParam(value = "keyWord", required = false) String keyWord, LoungePageVO loungePageVO, Model model) throws Exception {
		loungePageVO.setSearchType(searchType);
		loungePageVO.setKeyWord(keyWord);
		loungePageVO.setStartEnd();
		LoungeVO loungeVO = new LoungeVO();
		
		if(session.getAttribute("user_id") != null) {
			loungeVO.setUser_id((int)session.getAttribute("user_id"));
		}else {
			loungeVO.setUser_id(0);
		}		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("loungePageVO", loungePageVO);
		map.put("loungeVO", loungeVO);		
		List<LoungeVO> list = loungeService.list(map);
		System.out.println("페이지 VO>>>" + loungePageVO);
		model.addAttribute("list", list);
		model.addAttribute("searchType", searchType);	
		model.addAttribute("keyWord", keyWord);	
		}

	
	@RequestMapping("lounge/detail")
	public void detail(LoungeVO loungeVO, HttpSession session, Model model) throws Exception {
		LoungeVO details = loungeService.detail(loungeVO);
		List<LoungeReplyVO> rpList = lngRpService.list(loungeVO.getLounge_id());
		if(session.getAttribute("user_id") != null) {
			int sessionUserId = (int)session.getAttribute("user_id");
			model.addAttribute("likeCheck", loungeLikeService.likeCheck(sessionUserId, loungeVO.getLounge_id()));
		}


		model.addAttribute("details", details);
		model.addAttribute("rpList", rpList);
	}
	
	
	@RequestMapping("lounge/bestList")
	public void bestList(LoungeVO loungeVO, HttpSession session, Model model) throws Exception {		
		if(session.getAttribute("user_id") != null) {
			loungeVO.setUser_id((int)session.getAttribute("user_id"));
		}else {
			loungeVO.setUser_id(0);
		}		
		List<LoungeVO> bestList = loungeService.bestList(loungeVO);

		model.addAttribute("bestList", bestList);	
		
	}
	
	
}
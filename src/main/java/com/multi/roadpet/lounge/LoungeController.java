
package com.multi.roadpet.lounge;


import java.util.HashMap;
import java.util.List;
import java.util.UUID;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
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
			String savedName = file.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
			savedName = uuid + "_" + savedName;			
			File target = new File(uploadPath, savedName);
			try {		        
		        File thumnailImg = new File(uploadPath,"s_" + savedName);
		        
				BufferedImage bufferedOriginalImage = ImageIO.read(target);
				BufferedImage bufferedTypeImage = new BufferedImage(300, 500, BufferedImage.TYPE_3BYTE_BGR);

				Graphics2D graphic = bufferedTypeImage.createGraphics();
				graphic.drawImage(bufferedOriginalImage, 0, 0, 300, 500, null);

				ImageIO.write(bufferedTypeImage, "jpg", thumnailImg);

		        
		        file.transferTo(target);
		        loungeVO.setLounge_img(savedName);
			} catch (Exception e) {
				e.printStackTrace();
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
		String savedName = file.getOriginalFilename();
		String uuid = UUID.randomUUID().toString();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		savedName = uuid + "_" + savedName;			
		File target = new File(uploadPath, savedName);
		try {		        
	        File thumnailImg = new File(uploadPath,"s_" + savedName);
	        
			BufferedImage bufferedOriginalImage = ImageIO.read(target);
			BufferedImage bufferedTypeImage = new BufferedImage(300, 500, BufferedImage.TYPE_3BYTE_BGR);

			Graphics2D graphic = bufferedTypeImage.createGraphics();
			graphic.drawImage(bufferedOriginalImage, 0, 0, 300, 500, null);

			ImageIO.write(bufferedTypeImage, "jpg", thumnailImg);

	        
	        file.transferTo(target);
	        loungeVO.setLounge_img(savedName);
		} catch (Exception e) {
			e.printStackTrace();
		}  loungeVO.setLounge_img(null);	    
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

		List<LoungeVO> loungeList = loungeService.list(loungeMap);
		int count = loungeService.pageCount(keyWord, searchType);
		int pages = count/5;
		if (count%5 != 0) {
			pages += 1;
		}	
		model.addAttribute("bestList", bestList);	
		model.addAttribute("loungeList", loungeList);	
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
		
		HashMap<String, Object> loungeMap = new HashMap<String, Object>();		
		loungeMap.put("loungePageVO", loungePageVO);
		loungeMap.put("loungeVO", loungeVO);		
		List<LoungeVO> loungeList = loungeService.list(loungeMap);
		model.addAttribute("loungeList", loungeList);
		model.addAttribute("searchType", searchType);	
		model.addAttribute("keyWord", keyWord);	
		}

	
	@RequestMapping("lounge/detail")
	public void detail(LoungeVO loungeVO, HttpSession session, Model model) throws Exception {
		LoungeVO details = loungeService.detail(loungeVO);
		List<LoungeReplyVO> replyList = lngRpService.list(loungeVO.getLounge_id());
		if(session.getAttribute("user_id") != null) {
			int sessionUserId = (int)session.getAttribute("user_id");
			model.addAttribute("likeCheck", loungeLikeService.likeCheck(sessionUserId, loungeVO.getLounge_id()));
		}
		model.addAttribute("details", details);
		model.addAttribute("replyList", replyList);
	}
	
	//메인페이지에서 호출하는 인기글 리스트
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
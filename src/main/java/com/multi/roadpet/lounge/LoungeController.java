
package com.multi.roadpet.lounge;


import java.util.List;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import org.springframework.web.multipart.MultipartFile;
import java.io.File;

@Controller
public class LoungeController {
	
	@Autowired
	LoungeServiceInterface loungeService;	
	@Autowired
	LoungeReplyServiceInterface lngRpService;
	
	@RequestMapping("lounge/insert")
	public String insert(LoungeVO loungeVO,
			HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {
		String savedName = file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		File target = new File(uploadPath + "/" +savedName);
		file.transferTo(target);
		loungeVO.setLounge_img(savedName);
		loungeService.insert(loungeVO);		
		return "redirect:one?lounge_id=" + loungeVO.getLounge_id();	
	}

	@RequestMapping("lounge/update")
	public void update(LoungeVO loungeVO,Model model) {
		LoungeVO bag = loungeService.one(loungeVO);
		model.addAttribute("bag", bag);
	}
	
	@RequestMapping("lounge/updateTr")
	public String updateTr(LoungeVO loungeVO,
			HttpServletRequest request, MultipartFile file) throws IllegalStateException, IOException {
		String savedName = file.getOriginalFilename();
		String uploadPath = request.getSession().getServletContext().getRealPath("/resources/upload");
		File target = new File(uploadPath + "/" +savedName);
		file.transferTo(target);
		loungeVO.setLounge_img(savedName);
		loungeService.update(loungeVO);
		return "redirect:one?lounge_id=" + loungeVO.getLounge_id();	
	}
	
	@RequestMapping("lounge/delete")
	public String delete(LoungeVO loungeVO) {
		loungeService.delete(loungeVO);
		return "redirect:list?page=1";
	}
	
	@RequestMapping("lounge/list")
	public void list(@RequestParam(value = "searchType", required = false) String searchType,
					 @RequestParam(value = "keyWord", required = false) String keyWord, LoungePageVO loungePageVO, Model model) throws Exception {	
		loungePageVO.setSearchType(searchType);
		loungePageVO.setKeyWord(keyWord);
		loungePageVO.setStartEnd();
		LoungeVO loungeVO = new LoungeVO();
		List<LoungeVO> bestList = loungeService.bestList(loungeVO);
		
		List<LoungeVO> list = loungeService.list(loungePageVO);
		int count = loungeService.pageCount(keyWord, searchType);
		int pages = count/5;
		if (count%5 != 0) {
			pages += 1;
		}
		System.out.println(list);
		model.addAttribute("bestList", bestList);	
		model.addAttribute("list", list);	
		model.addAttribute("pages", pages);	
		model.addAttribute("searchType", searchType);	
		model.addAttribute("keyWord", keyWord);

		}
	
	@RequestMapping("lounge/pageList")
	public void pageList(@RequestParam(value = "searchType", required = false) String searchType,
						 @RequestParam(value = "keyWord", required = false) String keyWord, LoungePageVO loungePageVO, Model model) throws Exception {
		loungePageVO.setSearchType(searchType);
		loungePageVO.setKeyWord(keyWord);
		loungePageVO.setStartEnd();
		List<LoungeVO> list = loungeService.list(loungePageVO);
		model.addAttribute("list", list);	
		model.addAttribute("searchType", searchType);	
		model.addAttribute("keyWord", keyWord);	
		}
	
	@RequestMapping("lounge/one")
	public void one(LoungeVO loungeVO, Model model) throws Exception {
		LoungeVO bag = loungeService.one(loungeVO);
		List<LoungeReplyVO> rpList = lngRpService.list(loungeVO.getLounge_id());

		model.addAttribute("bag", bag);
		model.addAttribute("rpList", rpList);
	}
	
	@RequestMapping("lounge/bestList")
	@ResponseBody
	public List<LoungeVO> bestList(LoungeVO loungeVO, Model model) throws Exception {
		List<LoungeVO> bestList = loungeService.bestList(loungeVO);
		System.out.println("메인인기글 호출>>" + bestList);
		model.addAttribute("bestList", bestList);	
		return bestList;
	}
	
	
}
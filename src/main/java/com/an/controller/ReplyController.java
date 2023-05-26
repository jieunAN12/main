package com.an.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.an.dto.ReplyDTO;
import com.an.service.ReplyService;

@RestController
//@RequestMapping("/relay/*")
public class ReplyController {

	@Inject
	ReplyService replyService;
	
	   //댓글 입력
	   @RequestMapping("rinsert.do")
	   public String rinsert(@ModelAttribute ReplyDTO dto, HttpSession session) {
		   String userId = (String) session.getAttribute("userId");
		   System.out.println("인서트 컨트롤"+dto);
		   dto.setReplyer(userId);
	       replyService.create(dto);
	       return "redirect:/view.do?bno="+dto.getBno();
	  }
	  
	   @RequestMapping("rlist.do") 
	   public ModelAndView rlist(@RequestParam int bno, ModelAndView mav) {
		   List<ReplyDTO> rlist = replyService.rlist(bno); //뷰 이름 지정
		   mav.setViewName("replyList.jsp"); //부에 전달할 데이터 지정 
		   mav.addObject("rlist", rlist); //replyList.jsp로 포워딩 
		   return mav;
	   }
	 
	   @RequestMapping("listJson.do") 
	   //@ResponseBody//리턴 데이터를 jsno으로 변환 (생략 가능)
	   public List<ReplyDTO> listJson(@RequestParam int bno){
		   List<ReplyDTO> rlist = replyService.rlist(bno);
		   return rlist;
	   }
	 

}

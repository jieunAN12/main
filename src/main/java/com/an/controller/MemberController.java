package com.an.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.an.dto.MemberVO;
import com.an.service.MemberService;

@Controller
public class MemberController {
	@Inject
	private MemberService memberservice;
	
	@RequestMapping(value="/login.do")
	public String login() {
		return "/member/login.jsp";
	}
	
	@RequestMapping(value="/index.do")
	public String index() {
		return "index.jsp";
	}
	
	@RequestMapping(value="/loginCheck.do",method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session) {
		boolean result = memberservice.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if(result == true) {
			mav.setViewName("/index.do");
			mav.addObject("msg", "success");
		}else {
			mav.setViewName("/login.do");
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	@RequestMapping(value="/logout.do",method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView logout(HttpSession session) {
		memberservice.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/index.do");
		mav.addObject("msg", "logout");
		return mav;
	}
	
	@RequestMapping(value="/memberForm.do",method={RequestMethod.GET, RequestMethod.POST})
	public String memberForm() {
		return "/member/member.jsp";
	}
	
	@RequestMapping(value="/member.do",method={RequestMethod.GET, RequestMethod.POST})
	public String member(@ModelAttribute MemberVO vo) {
		int memberresult = memberservice.member(vo);
		if(memberresult > 0) {
			return "redirect:/login.do";
		}else {
			System.out.println("없음");
			return "redirect:/memberForm.do";
		}
	}
	

}

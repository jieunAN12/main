package com.an.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@RequestMapping(value="/memberList.do")
	public String memberList(Model model) {
		List<MemberVO> mlist = memberservice.memberList();
		model.addAttribute("mlist", mlist);
		return "/member/memberList.jsp";
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
	
	@RequestMapping(value="/upmemberForm.do",method={RequestMethod.GET, RequestMethod.POST})
	public String upmemberForm(@RequestParam String userId, Model model) {
		System.out.println("아이디 들어가나 확인"+userId);
		model.addAttribute("vo", memberservice.upmemberForm(userId));
		return "/member/upmember.jsp";
	}
	
	@RequestMapping(value="/upmember.do",method={RequestMethod.GET, RequestMethod.POST})
	public String upmember(@ModelAttribute MemberVO vo) {
		memberservice.upmember(vo);
		return "redirect:/memberList.do";
	}
	
	@RequestMapping(value="/deletemember.do",method={RequestMethod.GET, RequestMethod.POST})
	public String deletemember(@RequestParam String userId, @RequestParam String userPw, Model model) {
		//비밀번호 체크
		boolean result = memberservice.checkPw(userId, userPw);
		if(result) {//비밀번호가 맞다면 삭제처리
			memberservice.deletemember(userId);
			return "redirect:/memberList.do";
		}else {//일치하지 않으면 불일치 문구 출력
			model.addAttribute("message", "비밀번호 불일치");
			model.addAttribute("vo", memberservice.upmemberForm(userId));
			return "redirect:/upmemberForm.do";
		}
	}

}

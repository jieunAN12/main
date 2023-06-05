package com.an.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.an.dto.MemberVO;
import com.an.service.AdminService;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;
	
	// 1. 관리자  로그인페이지 매핑
		@RequestMapping("/alogin.do")
		public String alogin(){
			return "/admin/adminLogin.jsp";
		}
		// 2. 관리자  로그인 체크 
		@RequestMapping("/aloginCheck.do")
		public ModelAndView aloginCheck(HttpSession session, MemberVO vo, ModelAndView mav){
			String name = adminService.aloginCheck(vo);
			// 로그인 성공
			if(name != null) {
				session.setAttribute("adminId", vo.getUserId());
				session.setAttribute("userId", vo.getUserId());
				session.setAttribute("adminName", name);
				session.setAttribute("userName", name);
				mav.setViewName("/admin/adminHome.jsp"); // 관리자 페이지 이동
				mav.addObject("msg", "success");
			// 로그인 실패
			} else { 
				mav.setViewName("/admin/adminLogin.jsp"); // 로그인 페이지 이동
				mav.addObject("msg", "failure");
			}
			return mav;
		}
		
		// 3. 관리자 로그아웃
		@RequestMapping("alogout.do")
		public ModelAndView alogout(HttpSession session){
			session.invalidate();
			ModelAndView mav = new ModelAndView();
			mav.setViewName("/admin/adminLogin.jsp");
			mav.addObject("msg", "logout");
			return mav;
		}
	
}

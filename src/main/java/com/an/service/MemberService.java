package com.an.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.an.dao.MemberDAO;
import com.an.dto.MemberVO;

@Service
public class MemberService {
	
	@Inject
	private MemberDAO dao;

	public int member(MemberVO vo) {
		return dao.member(vo);
	}

	public boolean loginCheck(MemberVO vo, HttpSession session) {
		boolean result = dao.loginCheck(vo);
		if(result) {
			MemberVO vo2 = viewMember(vo);
			session.setAttribute("userId", vo2.getUserId());
			session.setAttribute("userName", vo2.getUserName());
		}
		return result;
	}
	
	public MemberVO viewMember(MemberVO vo) {
		return dao.viewMember(vo);
	}
	
	public void logout(HttpSession session) {
		//세션 변수 개별 삭제
		//session.removeAttribute("userId")
		//세션 정보를 초기화 시킴
		session.invalidate();
	}

	public List<MemberVO> memberList() {
		return dao.memberList();
	}
	
	public MemberVO upmemberForm(String userId) {
		return dao.upmemberForm(userId);
	}

	public void upmember(MemberVO vo) {
		dao.upmember(vo);
	}

	public void deletemember(String userId) {
		dao.deletemember(userId);
	}

	public boolean checkPw(String userId, String userPw) {
		return dao.checkPw(userId, userPw);
	}


}

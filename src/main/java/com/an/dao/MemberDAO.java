package com.an.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.an.dto.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sql;

	public int member(MemberVO vo) {
		return sql.insert("member.join", vo);
	}
	
	public boolean loginCheck(MemberVO vo) {
		String name = sql.selectOne("member.loginCheck", vo);
		return (name == null) ? false : true;
	}
	
	public MemberVO viewMember(MemberVO vo) {
		return sql.selectOne("member.viewMember", vo);
	}
	
	public void logout(HttpSession session) {
		
	}

	public MemberVO upmemberForm(String userId) {
		return sql.selectOne("member.upmemberForm",userId);
	}

	public List<MemberVO> memberList() {
		return sql.selectList("member.memberList");
	}

	public void upmember(MemberVO vo) {
		sql.update("member.upmember", vo);
	}

	public void deletemember(String userId) {
		sql.delete("member.deletemember", userId);
	}

	public boolean checkPw(String userId, String userPw) {
		boolean result = false;
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("userPw", userPw);
		int count = sql.selectOne("member.checkPw", map);
		if(count == 1) {
			result = true;
		}
		return result;
	}

	public MemberVO idCheck(String userId) {
		MemberVO membervo = sql.selectOne("member.idCheck", userId);
		System.out.println(membervo);
		return membervo;
	}


}

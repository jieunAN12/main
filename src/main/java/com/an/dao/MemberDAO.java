package com.an.dao;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.an.dto.MemberVO;

@Repository
public class MemberDAO {
	
	@Inject
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

}

package com.an.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.an.dto.MemberVO;

@Repository
public class AdminDAO {

	@Inject
	SqlSession sql;

	public String aloginCheck(MemberVO vo) {
		return sql.selectOne("admin.loginCheck",vo);
	}
	
}

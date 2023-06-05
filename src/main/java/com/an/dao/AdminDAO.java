package com.an.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.an.dto.MemberVO;

@Repository
public class AdminDAO {

	@Autowired
	SqlSession sql;

	public String aloginCheck(MemberVO vo) {
		return sql.selectOne("admin.loginCheck",vo);
	}
	
}

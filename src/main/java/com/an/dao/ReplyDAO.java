package com.an.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.an.dto.ReplyDTO;

@Repository
public class ReplyDAO {
	
	@Autowired
	SqlSession sql;
	
	public void create(ReplyDTO dto) {
		System.out.println("dao 인서트"+dto);
		sql.insert("reply.insertReply", dto);
	}
	
	public List<ReplyDTO> rlist(int bno) { 
		return sql.selectList("reply.listReply", bno); 
	}
	
	public void update(ReplyDTO dto) { 
		sql.update("reply.update", dto); 
    }
	
	public void delete(int rno) {
		sql.delete("reply.delete", rno);
	}
	
}

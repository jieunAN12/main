package com.an.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.an.dao.ReplyDAO;
import com.an.dto.ReplyDTO;

@Service
public class ReplyService {
	
	@Inject
	ReplyDAO dao;

	  public void create(ReplyDTO dto) {
		  System.out.println("인서트 서비스"+dto);
		  dao.create(dto); 
	  }
	  
	  public List<ReplyDTO> rlist(int bno) {
		  return dao.rlist(bno); 
	  }
	  
	  public void update(ReplyDTO dto) { 
		  dao.update(dto);
	  }
	  
	  public void delete(int rno) {
		  dao.delete(rno);
	  }
	 
}

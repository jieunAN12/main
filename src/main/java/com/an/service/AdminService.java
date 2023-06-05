package com.an.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.an.dao.AdminDAO;
import com.an.dto.MemberVO;

@Service
public class AdminService {

	@Autowired
	AdminDAO dao;

	public String aloginCheck(MemberVO vo) {
		return dao.aloginCheck(vo);
	}
}

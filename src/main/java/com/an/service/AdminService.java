package com.an.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.an.dao.AdminDAO;
import com.an.dto.MemberVO;

@Service
public class AdminService {

	@Inject
	AdminDAO dao;

	public String aloginCheck(MemberVO vo) {
		return dao.aloginCheck(vo);
	}
}
